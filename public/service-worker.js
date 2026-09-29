// ============================================================
// service-worker.js — v4
// v2: network-first สำหรับไฟล์หลัก
// v3: เพิ่มการรับสัญญาณ push notification และการคลิก notification
// v4: กด notification แล้วพาไปหน้าคำถามข้อนั้นพร้อมเฉลย (deep link /?q=<id>)
// ============================================================

const CACHE_NAME = "engineer-quiz-v4";
const CORE_ASSETS = [
  "/",
  "/index.html",
  "/style.css",
  "/app.js",
  "/manifest.json",
  "/icons/icon-192.png",
  "/icons/icon-512.png",
];

self.addEventListener("install", (event) => {
  event.waitUntil(
    caches.open(CACHE_NAME).then((cache) => cache.addAll(CORE_ASSETS))
  );
  self.skipWaiting();
});

self.addEventListener("activate", (event) => {
  event.waitUntil(
    caches.keys().then((keys) =>
      Promise.all(
        keys.filter((key) => key !== CACHE_NAME).map((key) => caches.delete(key))
      )
    )
  );
  self.clients.claim();
});

self.addEventListener("fetch", (event) => {
  const url = new URL(event.request.url);

  if (url.hostname.includes("supabase.co")) {
    return;
  }

  event.respondWith(
    fetch(event.request)
      .then((response) => {
        const responseClone = response.clone();
        caches.open(CACHE_NAME).then((cache) => cache.put(event.request, responseClone));
        return response;
      })
      .catch(() => caches.match(event.request))
  );
});

// ============================================================
// Push Notification: รับสัญญาณจาก Netlify Function แล้วแสดงผล
// ============================================================
self.addEventListener("push", (event) => {
  let data = {
    title: "คำถามประจำวัน 🔔",
    body: "แตะเพื่อทบทวนความรู้วันนี้",
  };

  if (event.data) {
    try {
      data = event.data.json();
    } catch (e) {
      data.body = event.data.text();
    }
  }

  // ถ้า payload แนบ questionId มา ให้สร้าง deep link ไปหน้าคำถามข้อนั้นโดยตรง
  const questionId = data.questionId || null;
  const targetUrl = data.url || (questionId ? `/?q=${encodeURIComponent(questionId)}` : "/");

  const options = {
    body: data.body,
    icon: "icons/icon-192.png",
    badge: "icons/icon-192.png",
    data: { url: targetUrl, questionId },
  };

  event.waitUntil(self.registration.showNotification(data.title, options));
});

self.addEventListener("notificationclick", (event) => {
  event.notification.close();

  const targetUrl = event.notification.data?.url || "/";
  const questionId = event.notification.data?.questionId || null;
  const absoluteUrl = new URL(targetUrl, self.location.origin).href;

  event.waitUntil(
    (async () => {
      const clientList = await clients.matchAll({ type: "window", includeUncontrolled: true });
      const existing = clientList.find((client) => client.url.startsWith(self.location.origin));

      if (existing) {
        // มีแท็บแอปเปิดอยู่แล้ว: พาแท็บนั้นไปยังคำถามข้อนี้ แทนที่จะแค่ focus เฉยๆ
        // ทางหลัก = navigate() (รีโหลดหน้าแล้วแอปอ่าน ?q= เอง)
        // ทางสำรอง = postMessage ให้ app.js เปิดหน้าคำถามโดยไม่ต้องรีโหลด
        //            (เผื่อเบราว์เซอร์ไม่รองรับ WindowClient.navigate)
        let navigated = false;
        if (typeof existing.navigate === "function") {
          try {
            await existing.navigate(absoluteUrl);
            navigated = true;
          } catch (err) {
            navigated = false;
          }
        }

        if (!navigated && questionId) {
          existing.postMessage({ type: "OPEN_QUESTION", questionId });
        }

        if ("focus" in existing) {
          try {
            await existing.focus();
          } catch (err) {
            /* บางเบราว์เซอร์ปฏิเสธ focus หลัง navigate — ไม่เป็นไร */
          }
        }
        return;
      }

      if (clients.openWindow) {
        await clients.openWindow(absoluteUrl);
      }
    })()
  );
});
