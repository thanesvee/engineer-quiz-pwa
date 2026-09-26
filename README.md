# Engineer Quiz Popup

**Live:** https://engineerpopup.netlify.app

PWA ทบทวนความรู้วิศวกรรมรายวัน สุ่มคำถามให้ทำแบบไม่ซ้ำ พร้อมระบบส่ง Push Notification คำถามประจำวันอัตโนมัติทุกเช้า 07:00 น. (เวลาไทย)

## Tech Stack

- Static frontend (HTML/CSS/JS ล้วน ไม่มี build step) — ใน `public/`
- Supabase (เก็บคลังคำถาม + ผู้สมัครรับ push notification)
- Netlify Functions (`web-push` + `@supabase/supabase-js`)
- Netlify Scheduled Functions (cron รายวัน)
- Web Push API (แจ้งเตือนคำถามประจำวัน)
- PWA (manifest + Service Worker)

## โครงสร้างโปรเจกต์

```
engineer-quiz-pwa/
├── public/
│   ├── index.html
│   ├── app.js              ← เชื่อม Supabase, สุ่มคำถามไม่ซ้ำ, สมัคร push
│   ├── style.css
│   ├── manifest.json
│   ├── service-worker.js
│   └── icons/
├── netlify/
│   └── functions/
│       └── send-daily-quiz.js   ← Scheduled Function ส่ง push รายวัน
├── electrical-questions/        ← คลังคำถามไฟฟ้า (Markdown ต้นฉบับ, 18 ไฟล์)
├── electrical-questions-sql/    ← สคริปต์ SQL import คำถามไฟฟ้าเข้า Supabase
├── add-preview-code-column.sql
├── netlify.toml
└── package.json
```

## ตัวแปรสภาพแวดล้อม (Netlify Environment Variables)

| ตัวแปร | ใช้ที่ |
|---|---|
| `SUPABASE_URL`, `SUPABASE_ANON_KEY` | ฝัง client-side ใน `app.js` (public key เปิดเผยได้ตามปกติ) |
| `VAPID_PUBLIC_KEY` / คู่ VAPID private key | Web Push (public key ฝัง client-side, private key ตั้งใน Netlify env) |
| `CRON_SECRET` | ป้องกันการยิง endpoint `send-daily-quiz` เอง (ยกเว้นเมื่อ Netlify Scheduler เป็นผู้เรียก) |

## Deploy

```bash
npm install
```

ลากโฟลเดอร์ทั้งหมดขึ้น Netlify หรือเชื่อม repo นี้กับ Netlify (ต้องตั้งค่า Scheduled Functions ตาม `netlify.toml`: cron `0 0 * * *` UTC = 07:00 น. เวลาไทย)
