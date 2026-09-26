// ============================================================
// netlify/functions/send-daily-quiz.js
// เรียกใช้อัตโนมัติโดย Netlify Scheduled Functions ทุกวัน 07:00 น. (เวลาไทย)
// ตั้งเวลาไว้ที่ netlify.toml (schedule = "0 0 * * *" เวลา UTC)
// หน้าที่: สุ่มคำถาม 1 ข้อต่อสาขา แล้วส่ง push ไปหาทุกเครื่องที่สมัครไว้
// ============================================================

const webpush = require("web-push");
const { createClient } = require("@supabase/supabase-js");

exports.handler = async (event) => {
  // ---------- ตรวจสอบว่าเป็นการเรียกจาก Netlify Scheduler หรือไม่ ----------
  // Netlify Scheduled Functions จะส่ง body เป็น JSON ที่มี next_run มาด้วยเสมอ
  // และไม่ส่ง query string ใดๆ มา จึงข้ามการตรวจรหัสลับในกรณีนี้
  let isScheduledInvocation = false;
  if (event.body) {
    try {
      isScheduledInvocation = Boolean(JSON.parse(event.body)?.next_run);
    } catch {
      isScheduledInvocation = false;
    }
  }

  // ---------- ตรวจสอบรหัสลับ ป้องกันคนอื่นมายิง endpoint นี้เล่น (เฉพาะกรณีเรียกเอง) ----------
  if (!isScheduledInvocation) {
    const providedSecret = event.queryStringParameters?.secret;
    if (providedSecret !== process.env.CRON_SECRET) {
      return { statusCode: 401, body: "Unauthorized" };
    }
  }

  const SUPABASE_URL = process.env.SUPABASE_URL;
  const SUPABASE_SERVICE_ROLE_KEY = process.env.SUPABASE_SERVICE_ROLE_KEY;
  const VAPID_PUBLIC_KEY = process.env.VAPID_PUBLIC_KEY;
  const VAPID_PRIVATE_KEY = process.env.VAPID_PRIVATE_KEY;
  const VAPID_SUBJECT = process.env.VAPID_SUBJECT || "mailto:admin@example.com";

  webpush.setVapidDetails(VAPID_SUBJECT, VAPID_PUBLIC_KEY, VAPID_PRIVATE_KEY);

  // ใช้ service_role key เพื่อให้อ่าน/เขียนได้ทุกแถว (ข้าม RLS)
  const supabase = createClient(SUPABASE_URL, SUPABASE_SERVICE_ROLE_KEY);

  let totalSent = 0;
  let totalFailed = 0;
  let totalRemoved = 0;

  try {
    // 1. ดึงสาขาที่เปิดใช้งานอยู่ทั้งหมด
    const { data: branches, error: branchError } = await supabase
      .from("branches")
      .select("id, name_th")
      .eq("is_active", true);

    if (branchError) throw branchError;

    for (const branch of branches) {
      // 2. หารายชื่อหมวดหมู่ทั้งหมดของสาขานี้
      const { data: categories } = await supabase
        .from("categories")
        .select("id")
        .eq("branch_id", branch.id);

      const categoryIds = (categories || []).map((c) => c.id);
      if (categoryIds.length === 0) continue;

      // 3. สุ่มคำถาม 1 ข้อจากสาขานี้
      const { count } = await supabase
        .from("questions")
        .select("id", { count: "exact", head: true })
        .eq("is_active", true)
        .in("category_id", categoryIds);

      if (!count || count === 0) continue;

      const randomOffset = Math.floor(Math.random() * count);
      const { data: questionRows } = await supabase
        .from("questions")
        .select("question, answer")
        .eq("is_active", true)
        .in("category_id", categoryIds)
        .range(randomOffset, randomOffset);

      const question = questionRows?.[0];
      if (!question) continue;

      // 4. หาผู้สมัครรับข่าวของสาขานี้
      const { data: subscriptions } = await supabase
        .from("push_subscriptions")
        .select("*")
        .eq("branch_id", branch.id);

      if (!subscriptions || subscriptions.length === 0) continue;

      // 5. ส่ง push ให้ทุกคน
      for (const sub of subscriptions) {
        const pushSubscription = {
          endpoint: sub.endpoint,
          keys: { p256dh: sub.p256dh_key, auth: sub.auth_key },
        };

        const payload = JSON.stringify({
          title: `คำถามประจำวัน — ${branch.name_th}`,
          body: question.question.slice(0, 120) + (question.question.length > 120 ? "..." : ""),
          url: "/",
        });

        try {
          await webpush.sendNotification(pushSubscription, payload);
          totalSent++;
        } catch (err) {
          totalFailed++;
          // ถ้า endpoint หมดอายุหรือถูกยกเลิกแล้ว ให้ลบทิ้งจากฐานข้อมูล
          if (err.statusCode === 404 || err.statusCode === 410) {
            await supabase.from("push_subscriptions").delete().eq("id", sub.id);
            totalRemoved++;
          }
        }
      }
    }

    return {
      statusCode: 200,
      body: JSON.stringify({ sent: totalSent, failed: totalFailed, removed: totalRemoved }),
    };
  } catch (err) {
    console.error(err);
    return { statusCode: 500, body: JSON.stringify({ error: err.message }) };
  }
};
