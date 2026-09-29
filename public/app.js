// ============================================================
// app.js — แอปทบทวนความรู้วิศวกร
// เชื่อมต่อ Supabase, จัดการหน้าจอ, สุ่มคำถามแบบไม่ซ้ำ
// ============================================================

// ---------- ตั้งค่า Supabase ----------
const SUPABASE_URL = "https://weociiacnymqsaxydkzc.supabase.co";
const SUPABASE_ANON_KEY = "sb_publishable_2rtZpDwamnQeVAqMdYVioQ_Sco8xz1_";

// ---------- ตั้งค่า Push Notification ----------
const VAPID_PUBLIC_KEY = "BJKXaP1qY2U8NConc8_SX1D-cHDJYhkGDTr1tFn2PYMdcrmFQtODcNN6bupTiyDWi4PAP3dOtMXLS0I1gLYjj3E";

const supabaseClient = supabase.createClient(SUPABASE_URL, SUPABASE_ANON_KEY);

// ---------- โหมดพรีวิว ----------
// เข้าด้วย URL ?preview=<รหัสเฉพาะสาขา> เพื่อเห็นสาขานั้นสาขาเดียวเพิ่มขึ้นมา แม้ is_active = false
// รหัสของแต่ละสาขาเก็บอยู่ในคอลัมน์ branches.preview_code (ตั้งค่าได้ผ่าน Supabase โดยตรง ไม่ต้องแก้โค้ด)
// เมื่อสาขาใดถูกเปลี่ยนเป็น is_active = true แล้ว จะกลายเป็นสาขาปกติที่ทุกคนเห็นทันที ไม่ต้องแก้โค้ดส่วนนี้อีก
const previewCode = new URLSearchParams(window.location.search).get("preview");

// ---------- Deep link จาก notification ----------
// ?q=<question id> = เปิดแอปแล้วกระโดดไปหน้าคำถามข้อนั้นพร้อมเฉลยทันที
// (ค่า id มาจาก payload ที่ netlify/functions/send-daily-quiz.js แนบมากับ push)
// ถ้าไม่มีพารามิเตอร์นี้ แอปจะทำงานตามเส้นทางปกติทุกประการ
const deepLinkQuestionId = new URLSearchParams(window.location.search).get("q");

// ---------- ตัวแปรสถานะแอป (เก็บใน localStorage เพื่อจำการตั้งค่า) ----------
const STORAGE_KEYS = {
  SELECTED_BRANCH: "eq_selected_branch_code",
  SEEN_QUESTIONS: "eq_seen_question_ids", // { [categoryId]: [questionId, ...] }
};

let state = {
  branches: [],
  categories: [],
  currentBranch: null,
  currentCategory: null,
  currentQuestions: [],
  currentIndex: 0,
  singleView: null, // { question, category, branch } ของหน้าคำถามเดี่ยว
};

// ============================================================
// Utility: localStorage helpers
// ============================================================
function getSeenMap() {
  try {
    return JSON.parse(localStorage.getItem(STORAGE_KEYS.SEEN_QUESTIONS)) || {};
  } catch {
    return {};
  }
}

function markSeen(categoryId, questionId) {
  const seenMap = getSeenMap();
  if (!seenMap[categoryId]) seenMap[categoryId] = [];
  if (!seenMap[categoryId].includes(questionId)) {
    seenMap[categoryId].push(questionId);
  }
  localStorage.setItem(STORAGE_KEYS.SEEN_QUESTIONS, JSON.stringify(seenMap));
}

function getSelectedBranchCode() {
  return localStorage.getItem(STORAGE_KEYS.SELECTED_BRANCH);
}

function setSelectedBranchCode(code) {
  localStorage.setItem(STORAGE_KEYS.SELECTED_BRANCH, code);
}

// ============================================================
// Screen navigation
// ============================================================
function showScreen(screenId) {
  document.querySelectorAll(".screen").forEach((el) => el.classList.remove("active"));
  document.getElementById(screenId).classList.add("active");
  window.scrollTo(0, 0);
}

function showToast(message) {
  const toast = document.getElementById("toast");
  toast.textContent = message;
  toast.classList.add("show");
  setTimeout(() => toast.classList.remove("show"), 2200);
}

// ============================================================
// โหลดข้อมูลสาขา
// ============================================================
async function loadBranches() {
  // โหลดเฉพาะสาขาที่เปิดใช้งานจริง — ไม่ดึงคอลัมน์ preview_code ของสาขาอื่นมาที่เครื่องผู้ใช้ทั่วไปเด็ดขาด
  const { data, error } = await supabaseClient
    .from("branches")
    .select("id, code, name_th, is_active, sort_order")
    .eq("is_active", true)
    .order("sort_order");

  if (error) {
    console.error(error);
    showToast("โหลดข้อมูลสาขาไม่สำเร็จ ลองใหม่อีกครั้ง");
    return;
  }

  let branches = data;

  // ถ้ามี ?preview=<รหัส> ให้ค้นหาสาขาเดียวที่ตรงกับรหัสนั้นเพิ่มเข้ามา
  // ใช้ eq ในฝั่งฐานข้อมูลโดยตรง จึงไม่มีการส่งรหัสพรีวิวของสาขาอื่นกลับมาที่เบราว์เซอร์
  if (previewCode) {
    const { data: previewBranch } = await supabaseClient
      .from("branches")
      .select("id, code, name_th, is_active, sort_order")
      .eq("is_active", false)
      .eq("preview_code", previewCode)
      .maybeSingle();

    if (previewBranch) {
      branches = [...branches, previewBranch].sort((a, b) => a.sort_order - b.sort_order);
    }
  }

  state.branches = branches;
  renderBranchList();
}

function renderBranchList() {
  const container = document.getElementById("branch-list");
  container.innerHTML = "";

  state.branches.forEach((branch) => {
    const isPreviewOnly = !branch.is_active;
    const card = document.createElement("div");
    card.className = "branch-card" + (isPreviewOnly ? " preview" : "");
    card.innerHTML = `
      <span class="branch-name">${branch.name_th}</span>
      ${isPreviewOnly ? `<span class="branch-tag preview">พรีวิว</span>` : ""}
    `;
    card.addEventListener("click", () => selectBranch(branch));
    container.appendChild(card);
  });
}

function selectBranch(branch) {
  setSelectedBranchCode(branch.code);
  enterHome(branch);
}

// ============================================================
// หน้าหลัก (Home)
// ============================================================
async function enterHome(branch) {
  state.currentBranch = branch;
  document.getElementById("home-branch-name").textContent = branch.name_th;
  showScreen("screen-home");
  updateDailyPopupButtonState();

  const { data, error } = await supabaseClient
    .from("categories")
    .select("*, questions(count)")
    .eq("branch_id", branch.id)
    .order("sort_order");

  if (error) {
    console.error(error);
    showToast("โหลดหมวดหมู่ไม่สำเร็จ");
    return;
  }

  state.categories = data;
}

async function tryAutoLogin() {
  const savedCode = getSelectedBranchCode();
  if (!savedCode) {
    showScreen("screen-branch");
    return;
  }

  const { data, error } = await supabaseClient
    .from("branches")
    .select("*")
    .eq("code", savedCode)
    .single();

  const allowed = data && (data.is_active || (previewCode && data.preview_code === previewCode));

  if (error || !allowed) {
    showScreen("screen-branch");
    return;
  }

  enterHome(data);
}

// ============================================================
// หน้าเลือกหมวดหมู่ (สำหรับโหมดไล่ดูต่อเนื่อง)
// ============================================================
function openCategoryScreen() {
  renderCategoryList();
  showScreen("screen-categories");
}

function renderCategoryList() {
  const container = document.getElementById("category-list");
  container.innerHTML = "";

  if (state.categories.length === 0) {
    container.innerHTML = `
      <div class="empty-state">
        <div class="emoji">📭</div>
        <div>ยังไม่มีหมวดหมู่ในสาขานี้</div>
      </div>`;
    return;
  }

  state.categories.forEach((cat) => {
    const count = cat.questions?.[0]?.count ?? 0;
    const card = document.createElement("div");
    card.className = "category-card";
    card.innerHTML = `
      <div>
        <div class="cat-name">${cat.name_th}</div>
        <div class="cat-count">${count} ข้อ</div>
      </div>
      <span class="cat-arrow">›</span>
    `;
    card.addEventListener("click", () => startBrowsing(cat));
    container.appendChild(card);
  });
}

// ============================================================
// โหมดไล่ดูคำถามต่อเนื่อง
// ============================================================
async function startBrowsing(category) {
  showScreen("screen-question");
  document.getElementById("question-category-name").textContent = category.name_th;
  document.getElementById("question-card-container").innerHTML =
    '<div class="loading-spinner"></div>';

  const { data, error } = await supabaseClient
    .from("questions")
    .select("*")
    .eq("category_id", category.id)
    .eq("is_active", true);

  if (error || !data || data.length === 0) {
    document.getElementById("question-card-container").innerHTML = `
      <div class="empty-state">
        <div class="emoji">📭</div>
        <div>ยังไม่มีคำถามในหมวดนี้</div>
      </div>`;
    return;
  }

  // จัดลำดับ: ข้อที่ยังไม่เคยเจอมาก่อน
  const seenMap = getSeenMap();
  const seenIds = seenMap[category.id] || [];
  const unseen = data.filter((q) => !seenIds.includes(q.id));
  const seen = data.filter((q) => seenIds.includes(q.id));

  // สุ่มลำดับในแต่ละกลุ่ม แล้วเอาข้อที่ยังไม่เคยเจอไว้ก่อน
  state.currentQuestions = [...shuffle(unseen), ...shuffle(seen)];
  state.currentCategory = category;
  state.currentIndex = 0;

  renderCurrentQuestion();
}

function shuffle(arr) {
  const copy = [...arr];
  for (let i = copy.length - 1; i > 0; i--) {
    const j = Math.floor(Math.random() * (i + 1));
    [copy[i], copy[j]] = [copy[j], copy[i]];
  }
  return copy;
}

function renderCurrentQuestion() {
  const q = state.currentQuestions[state.currentIndex];
  const total = state.currentQuestions.length;
  const progress = Math.round(((state.currentIndex + 1) / total) * 100);

  document.getElementById("progress-fill").style.width = progress + "%";
  document.getElementById("progress-text").textContent =
    `ข้อ ${state.currentIndex + 1} / ${total}`;

  document.getElementById("question-card-container").innerHTML = `
    <div class="question-card">
      <div class="question-label">คำถาม</div>
      <div class="question-text">${q.question}</div>

      <div class="answer-section" id="answer-section">
        <div class="answer-label">เฉลย</div>
        <div class="answer-text">${q.answer}</div>
        ${q.explanation ? `
          <div class="explanation-label">คำอธิบาย</div>
          <div class="explanation-text">${q.explanation}</div>
        ` : ""}
      </div>

      <div class="spacer"></div>

      <div class="button-row">
        <button class="btn btn-secondary" id="btn-show-answer">เฉลย</button>
        <button class="btn btn-primary" id="btn-next-question">ข้อถัดไป</button>
      </div>
    </div>
  `;

  document.getElementById("btn-show-answer").addEventListener("click", () => {
    document.getElementById("answer-section").classList.add("visible");
    markSeen(state.currentCategory.id, q.id);
  });

  document.getElementById("btn-next-question").addEventListener("click", () => {
    markSeen(state.currentCategory.id, q.id);
    state.currentIndex++;
    if (state.currentIndex >= state.currentQuestions.length) {
      showToast("ครบทุกข้อในหมวดนี้แล้ว 🎉 เริ่มใหม่อีกรอบ");
      state.currentIndex = 0;
      state.currentQuestions = shuffle(state.currentQuestions);
    }
    renderCurrentQuestion();
  });
}

// ============================================================
// หน้าคำถามเดี่ยว (เปิดจากการกด notification ผ่าน ?q=<id>)
// แสดงคำถาม + เฉลย + คำอธิบาย ให้ครบทันที ไม่ต้องเลือกสาขา/หมวดเอง
// ============================================================

// ล้าง ?q= ออกจาก URL หลังใช้งานแล้ว (คง ?preview= และพารามิเตอร์อื่นไว้)
// เพื่อให้การกด refresh กลับเข้าแอปตามปกติ ไม่ค้างอยู่ที่คำถามข้อเดิม
function clearDeepLinkParam() {
  try {
    const url = new URL(window.location.href);
    if (!url.searchParams.has("q")) return;
    url.searchParams.delete("q");
    window.history.replaceState({}, "", url.pathname + url.search + url.hash);
  } catch (err) {
    /* เบราว์เซอร์เก่าที่ไม่รองรับ history API — ข้ามไปได้ ไม่กระทบการแสดงผล */
  }
}

function renderSingleQuestionError(message) {
  document.getElementById("single-card-container").innerHTML = `
    <div class="empty-state">
      <div class="emoji">📭</div>
      <div>${message}</div>
    </div>
    <div class="spacer"></div>
    <div class="button-row">
      <button class="btn btn-primary" id="btn-single-home-fallback">ไปหน้าหลัก</button>
    </div>
  `;
  document
    .getElementById("btn-single-home-fallback")
    .addEventListener("click", leaveSingleQuestion);
}

async function openSingleQuestion(questionId) {
  showScreen("screen-single");
  document.getElementById("single-category-name").textContent = "คำถามประจำวัน";
  document.getElementById("single-branch-name").textContent = "กำลังโหลด...";
  document.getElementById("single-card-container").innerHTML =
    '<div class="loading-spinner"></div>';

  clearDeepLinkParam();

  const { data: question, error } = await supabaseClient
    .from("questions")
    .select("*")
    .eq("id", questionId)
    .maybeSingle();

  if (error || !question) {
    if (error) console.error(error);
    document.getElementById("single-branch-name").textContent = "";
    renderSingleQuestionError("ไม่พบคำถามข้อนี้แล้ว อาจถูกแก้ไขหรือปิดการใช้งานไป");
    return;
  }

  // ดึงหมวดหมู่และสาขาแยกเป็นคำสั่งย่อย แทนการ join ซ้อนของ Supabase
  // เพื่อไม่ต้องพึ่งชื่อ foreign key constraint ในฐานข้อมูล
  const { data: category } = await supabaseClient
    .from("categories")
    .select("*")
    .eq("id", question.category_id)
    .maybeSingle();

  let branch = null;
  if (category) {
    const { data: branchRow } = await supabaseClient
      .from("branches")
      .select("*")
      .eq("id", category.branch_id)
      .maybeSingle();
    branch = branchRow;
  }

  state.singleView = { question, category, branch };

  // ตั้ง currentBranch ไว้ในหน่วยความจำ เพื่อให้ปุ่ม "ไปหน้าหลัก" ใช้งานต่อได้
  // แต่ไม่เขียนทับสาขาที่ผู้ใช้เลือกไว้ใน localStorage
  if (branch) state.currentBranch = branch;

  document.getElementById("single-category-name").textContent =
    category?.name_th || "คำถามประจำวัน";
  document.getElementById("single-branch-name").textContent = branch?.name_th || "";

  document.getElementById("single-card-container").innerHTML = `
    <div class="question-card">
      <div class="question-label">คำถาม</div>
      <div class="question-text">${question.question}</div>

      <div class="answer-section visible">
        <div class="answer-label">เฉลย</div>
        <div class="answer-text">${question.answer}</div>
        ${question.explanation ? `
          <div class="explanation-label">คำอธิบาย</div>
          <div class="explanation-text">${question.explanation}</div>
        ` : ""}
      </div>

      <div class="spacer"></div>

      <div class="button-row">
        <button class="btn btn-secondary" id="btn-single-home">หน้าหลัก</button>
        <button class="btn btn-primary" id="btn-single-continue">ทบทวนหมวดนี้ต่อ</button>
      </div>
    </div>
  `;

  // นับว่าเคยเห็นข้อนี้แล้ว เพื่อให้โหมดไล่ดูต่อเนื่องไม่หยิบมาซ้ำก่อนข้ออื่น
  if (category) markSeen(category.id, question.id);

  document.getElementById("btn-single-home").addEventListener("click", leaveSingleQuestion);
  document.getElementById("btn-single-continue").addEventListener("click", async () => {
    const { category: cat, branch: br } = state.singleView || {};
    if (!cat) {
      showToast("ไม่พบหมวดหมู่ของคำถามข้อนี้");
      return;
    }
    // เข้าหน้าหลักของสาขาก่อน เพื่อโหลดรายการหมวดไว้ให้ปุ่มย้อนกลับใช้งานได้
    if (br) await enterHome(br);
    startBrowsing(cat);
  });
}

function leaveSingleQuestion() {
  const branch = state.singleView?.branch;
  if (branch) {
    enterHome(branch);
  } else {
    tryAutoLogin();
  }
}

// ============================================================
// Push Notification — สมัครรับ Popup คำถามรายเช้า
// ============================================================
const PUSH_ENABLED_KEY = "eq_push_enabled";

function urlBase64ToUint8Array(base64String) {
  const padding = "=".repeat((4 - (base64String.length % 4)) % 4);
  const base64 = (base64String + padding).replace(/-/g, "+").replace(/_/g, "/");
  const rawData = atob(base64);
  return Uint8Array.from([...rawData].map((char) => char.charCodeAt(0)));
}

function updateDailyPopupButtonState() {
  const enabled = localStorage.getItem(PUSH_ENABLED_KEY) === "true";
  const titleEl = document.getElementById("daily-popup-title");
  const descEl = document.getElementById("daily-popup-desc");
  if (!titleEl) return;

  if (enabled) {
    titleEl.textContent = "เปิดใช้งานแล้ว ✓";
    descEl.textContent = "จะได้รับคำถามสุ่ม 1 ข้อทุกเช้า 7 โมง";
  } else {
    titleEl.textContent = "เปิด Popup คำถามรายเช้า";
    descEl.textContent = "รับคำถามสุ่ม 1 ข้อทุกเช้า 7 โมง";
  }
}

async function enableDailyPopup() {
  if (!("Notification" in window) || !("serviceWorker" in navigator) || !("PushManager" in window)) {
    showToast("เบราว์เซอร์นี้ไม่รองรับการแจ้งเตือน");
    return;
  }

  if (!state.currentBranch) {
    showToast("กรุณาเลือกสาขาก่อน");
    return;
  }

  // ถ้าเปิดอยู่แล้ว แค่แจ้งเตือนเฉยๆ ไม่ต้องสมัครซ้ำ
  if (localStorage.getItem(PUSH_ENABLED_KEY) === "true") {
    showToast("เปิดใช้งานการแจ้งเตือนอยู่แล้ว");
    return;
  }

  const permission = await Notification.requestPermission();
  if (permission !== "granted") {
    showToast("คุณยังไม่ได้อนุญาตการแจ้งเตือน");
    return;
  }

  try {
    const registration = await navigator.serviceWorker.ready;
    const subscription = await registration.pushManager.subscribe({
      userVisibleOnly: true,
      applicationServerKey: urlBase64ToUint8Array(VAPID_PUBLIC_KEY),
    });

    const subJson = subscription.toJSON();

    const { error } = await supabaseClient.from("push_subscriptions").upsert(
      {
        endpoint: subJson.endpoint,
        p256dh_key: subJson.keys.p256dh,
        auth_key: subJson.keys.auth,
        branch_id: state.currentBranch.id,
      },
      { onConflict: "endpoint" }
    );

    if (error) {
      console.error(error);
      showToast("บันทึกการสมัครไม่สำเร็จ ลองใหม่อีกครั้ง");
      return;
    }

    localStorage.setItem(PUSH_ENABLED_KEY, "true");
    updateDailyPopupButtonState();
    showToast("เปิดใช้งานสำเร็จ! รอรับคำถามทุกเช้า 7 โมง 🔔");
  } catch (err) {
    console.error(err);
    showToast("เกิดข้อผิดพลาด ลองใหม่อีกครั้ง");
  }
}

// ============================================================
// Event bindings
// ============================================================
document.addEventListener("DOMContentLoaded", () => {
  loadBranches();

  // มี ?q= มาจาก notification -> ไปหน้าคำถามข้อนั้นเลย
  // ไม่มี -> เส้นทางเดิมทุกประการ
  if (deepLinkQuestionId) {
    openSingleQuestion(deepLinkQuestionId);
  } else {
    tryAutoLogin();
  }

  document.getElementById("btn-open-browse").addEventListener("click", openCategoryScreen);
  document.getElementById("btn-open-daily").addEventListener("click", enableDailyPopup);
  document.getElementById("btn-change-branch").addEventListener("click", () => {
    showScreen("screen-branch");
  });
  document.getElementById("back-from-categories").addEventListener("click", () => {
    showScreen("screen-home");
  });
  document.getElementById("back-from-question").addEventListener("click", () => {
    showScreen("screen-categories");
  });
  document.getElementById("back-from-single").addEventListener("click", leaveSingleQuestion);
});

// ============================================================
// ลงทะเบียน Service Worker (สำหรับติดตั้งเป็น PWA)
// ============================================================
if ("serviceWorker" in navigator) {
  window.addEventListener("load", () => {
    navigator.serviceWorker.register("service-worker.js").catch((err) => {
      console.warn("Service worker registration failed:", err);
    });
  });

  // ทางสำรองของ deep link: ถ้าเบราว์เซอร์ไม่รองรับ WindowClient.navigate
  // service worker จะส่งข้อความมาบอกให้เปิดหน้าคำถามเอง โดยไม่ต้องรีโหลดหน้า
  navigator.serviceWorker.addEventListener("message", (event) => {
    if (event.data?.type === "OPEN_QUESTION" && event.data.questionId) {
      openSingleQuestion(event.data.questionId);
    }
  });
}
