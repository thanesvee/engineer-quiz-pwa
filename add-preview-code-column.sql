-- ============================================================
-- เพิ่มระบบรหัสพรีวิวรายสาขา
-- รันสคริปต์นี้ใน Supabase SQL Editor ครั้งเดียว (idempotent รันซ้ำได้)
-- ============================================================

-- 1) เพิ่มคอลัมน์เก็บรหัสพรีวิวของแต่ละสาขา (ค่าว่าง = ไม่มีโหมดพรีวิวสำหรับสาขานั้น)
alter table branches add column if not exists preview_code text;

-- 2) กันรหัสซ้ำกันระหว่างสาขา (อนุญาตให้เป็น null ได้หลายแถว)
create unique index if not exists branches_preview_code_key
  on branches (preview_code)
  where preview_code is not null;

-- 3) ตั้งรหัสพรีวิวเดิมของสาขาไฟฟ้า (ลิงก์ที่ทีมไฟฟ้าใช้อยู่แล้วจะยังใช้ได้เหมือนเดิม)
update branches set preview_code = 'electrical2026' where code = 'electrical';

-- ---------- ตรวจสอบผลลัพธ์ ----------
select code, name_th, is_active, preview_code from branches order by sort_order;
