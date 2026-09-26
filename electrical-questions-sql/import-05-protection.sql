-- ============================================================
-- นำเข้าคำถามสาขาไฟฟ้า หมวดที่ 5: การป้องกันระบบไฟฟ้า (Protection & Relay)
-- ไฟล์นี้รันได้อิสระ ไม่ต้องพึ่งไฟล์อื่น (idempotent)
-- ============================================================

begin;

-- ---------- เพิ่มหมวดหมู่ ----------
insert into categories (branch_id, code, name_th, sort_order)
select '448937cf-58c5-4007-b57b-6a8bcf46c2fe', 'protection', 'การป้องกันระบบไฟฟ้า (Protection & Relay)', 5
where not exists (
  select 1 from categories where branch_id = '448937cf-58c5-4007-b57b-6a8bcf46c2fe' and code = 'protection'
);

-- ---------- เพิ่มคำถาม (33 ข้อ) ----------
insert into questions (category_id, question, answer, explanation, is_active, needs_review)
select c.id, 'รีเลย์กระแสเกิน (Overcurrent Relay) แบบเวลาผกผัน (Inverse Time) ทำงานแตกต่างจากแบบเวลาคงที่ (Definite Time) อย่างไร', 'รีเลย์แบบเวลาผกผันมีเวลาการทำงานที่ผกผันกับขนาดกระแส คือกระแสยิ่งสูง เวลาการตัดวงจรยิ่งสั้นลง ส่วนรีเลย์แบบเวลาคงที่จะตัดวงจรที่เวลาหน่วงคงที่ค่าเดียวไม่ว่ากระแสเกินจะมีขนาดเท่าใด (ตราบใดที่เกินค่าตั้ง)', 'รีเลย์แบบเวลาผกผันช่วยให้การประสานงานกับอุปกรณ์ป้องกันชั้นถัดไปทำได้ดีกว่า เพราะความผิดพร่องที่รุนแรงใกล้จุดติดตั้งรีเลย์มักถูกตัดออกเร็วกว่าความผิดพร่องที่อยู่ไกลออกไปหรือมีกระแสต่ำกว่า', true, true
from categories c
where c.branch_id = '448937cf-58c5-4007-b57b-6a8bcf46c2fe' and c.code = 'protection'
  and not exists (
    select 1 from questions q2
    where q2.category_id = c.id and q2.question = 'รีเลย์กระแสเกิน (Overcurrent Relay) แบบเวลาผกผัน (Inverse Time) ทำงานแตกต่างจากแบบเวลาคงที่ (Definite Time) อย่างไร'
  );
insert into questions (category_id, question, answer, explanation, is_active, needs_review)
select c.id, 'ค่า Pickup Current และ Time Multiplier Setting (TMS) ของรีเลย์กระแสเกินมีความหมายอย่างไร', 'Pickup Current คือระดับกระแสขั้นต่ำที่ทำให้รีเลย์เริ่มทำงาน หากกระแสต่ำกว่าค่านี้รีเลย์จะไม่ทำงาน ส่วน TMS เป็นตัวคูณที่ปรับความเร็วในการทำงานของรีเลย์แบบเวลาผกผัน ค่า TMS สูงจะทำให้รีเลย์ทำงานช้าลงที่กระแสเดียวกัน', 'การตั้งค่าทั้งสองพารามิเตอร์นี้อย่างเหมาะสมเป็นหัวใจสำคัญของการประสานงานอุปกรณ์ป้องกัน เพื่อให้รีเลย์ที่อยู่ใกล้จุดผิดพร่องที่สุดทำงานก่อนรีเลย์ต้นทาง', true, true
from categories c
where c.branch_id = '448937cf-58c5-4007-b57b-6a8bcf46c2fe' and c.code = 'protection'
  and not exists (
    select 1 from questions q2
    where q2.category_id = c.id and q2.question = 'ค่า Pickup Current และ Time Multiplier Setting (TMS) ของรีเลย์กระแสเกินมีความหมายอย่างไร'
  );
insert into questions (category_id, question, answer, explanation, is_active, needs_review)
select c.id, 'รีเลย์กระแสเกินแบบมีทิศทาง (Directional Overcurrent Relay) ใช้ในกรณีใด และแตกต่างจากรีเลย์กระแสเกินธรรมดาอย่างไร', 'ใช้ในระบบที่กระแสไฟฟ้าอาจไหลได้สองทิศทาง เช่น สายส่งวงแหวนหรือระบบที่มีแหล่งจ่ายไฟฟ้าหลายจุด รีเลย์ชนิดนี้จะตัดวงจรเฉพาะเมื่อกระแสไหลในทิศทางที่กำหนดไว้เท่านั้น ต่างจากรีเลย์กระแสเกินธรรมดาที่ทำงานตามขนาดกระแสโดยไม่สนใจทิศทาง', 'การกำหนดทิศทางอาศัยการเปรียบเทียบมุมเฟสระหว่างกระแสกับแรงดันอ้างอิง (Polarizing Voltage) เพื่อระบุว่ากระแสไหลเข้าหรือออกจากบริเวณที่ป้องกัน', true, true
from categories c
where c.branch_id = '448937cf-58c5-4007-b57b-6a8bcf46c2fe' and c.code = 'protection'
  and not exists (
    select 1 from questions q2
    where q2.category_id = c.id and q2.question = 'รีเลย์กระแสเกินแบบมีทิศทาง (Directional Overcurrent Relay) ใช้ในกรณีใด และแตกต่างจากรีเลย์กระแสเกินธรรมดาอย่างไร'
  );
insert into questions (category_id, question, answer, explanation, is_active, needs_review)
select c.id, 'การป้องกันแบบผลต่างกระแส (Differential Protection) สำหรับสายส่งไฟฟ้าแตกต่างจากที่ใช้กับหม้อแปลงในแง่ข้อกำหนดทางเทคนิคอย่างไร', 'การป้องกันสายส่งต้องอาศัยการสื่อสารข้อมูลกระแสจากปลายสายทั้งสองด้าน (ซึ่งอาจอยู่ห่างกันหลายสิบกิโลเมตร) มาเปรียบเทียบกันแบบเรียลไทม์ ต่างจากหม้อแปลงที่ทั้งสองด้านของโซนป้องกันอยู่ในสถานที่เดียวกัน จึงไม่ต้องอาศัยช่องสัญญาณสื่อสารระยะไกล', 'ความล่าช้าหรือความผิดพลาดของช่องสัญญาณสื่อสารเป็นปัจจัยสำคัญที่ต้องพิจารณาในการออกแบบระบบป้องกันผลต่างกระแสของสายส่งไฟฟ้าระยะไกล', true, true
from categories c
where c.branch_id = '448937cf-58c5-4007-b57b-6a8bcf46c2fe' and c.code = 'protection'
  and not exists (
    select 1 from questions q2
    where q2.category_id = c.id and q2.question = 'การป้องกันแบบผลต่างกระแส (Differential Protection) สำหรับสายส่งไฟฟ้าแตกต่างจากที่ใช้กับหม้อแปลงในแง่ข้อกำหนดทางเทคนิคอย่างไร'
  );
insert into questions (category_id, question, answer, explanation, is_active, needs_review)
select c.id, 'การป้องกันบัสบาร์ (Busbar Protection) มีความสำคัญเป็นพิเศษอย่างไรในสถานีไฟฟ้า', 'บัสบาร์เป็นจุดรวมของสายส่งและอุปกรณ์หลายเส้นทางในสถานีไฟฟ้า หากเกิดความผิดพร่องที่บัสบาร์และไม่ถูกตัดออกอย่างรวดเร็ว จะส่งผลกระทบเป็นวงกว้างต่อทุกวงจรที่เชื่อมต่อกับบัสบาร์นั้น จึงต้องมีระบบป้องกันที่รวดเร็วและเชื่อถือได้สูงเป็นพิเศษ', 'มักใช้หลักการป้องกันแบบผลต่างกระแสเปรียบเทียบผลรวมกระแสที่ไหลเข้าและออกจากบัสบาร์ทุกวงจร หากไม่สมดุลแสดงว่ามีความผิดพร่องเกิดขึ้นภายในโซนบัสบาร์', true, true
from categories c
where c.branch_id = '448937cf-58c5-4007-b57b-6a8bcf46c2fe' and c.code = 'protection'
  and not exists (
    select 1 from questions q2
    where q2.category_id = c.id and q2.question = 'การป้องกันบัสบาร์ (Busbar Protection) มีความสำคัญเป็นพิเศษอย่างไรในสถานีไฟฟ้า'
  );
insert into questions (category_id, question, answer, explanation, is_active, needs_review)
select c.id, 'การป้องกันเครื่องกำเนิดไฟฟ้า (Generator Protection) ต้องพิจารณาความผิดปกติประเภทใดบ้างที่แตกต่างจากการป้องกันอุปกรณ์ทั่วไป', 'นอกจากป้องกันกระแสเกินและลัดวงจรทั่วไปแล้ว ยังต้องป้องกันสภาวะเฉพาะของเครื่องกำเนิดไฟฟ้า เช่น การสูญเสียการกระตุ้นสนามแม่เหล็ก (Loss of Excitation), การทำงานเป็นมอเตอร์ย้อนกลับ (Reverse Power/Motoring), ความถี่ผิดปกติ และการเกิดกระแสไม่สมดุลระหว่างเฟส (Negative Sequence)', 'สภาวะเหล่านี้เกิดเฉพาะกับเครื่องจักรหมุนที่เชื่อมต่อกับระบบไฟฟ้า และหากไม่ป้องกันอย่างเหมาะสมอาจทำให้เครื่องกำเนิดไฟฟ้าเสียหายรุนแรงหรือกระทบเสถียรภาพของระบบโดยรวม', true, true
from categories c
where c.branch_id = '448937cf-58c5-4007-b57b-6a8bcf46c2fe' and c.code = 'protection'
  and not exists (
    select 1 from questions q2
    where q2.category_id = c.id and q2.question = 'การป้องกันเครื่องกำเนิดไฟฟ้า (Generator Protection) ต้องพิจารณาความผิดปกติประเภทใดบ้างที่แตกต่างจากการป้องกันอุปกรณ์ทั่วไป'
  );
insert into questions (category_id, question, answer, explanation, is_active, needs_review)
select c.id, 'สภาวะ Reverse Power หรือการที่เครื่องกำเนิดไฟฟ้าทำงานเป็นมอเตอร์ย้อนกลับ เกิดขึ้นได้อย่างไร และเป็นอันตรายอย่างไร', 'เกิดขึ้นเมื่อต้นกำลังขับ (เช่น กังหันไอน้ำ) หยุดจ่ายพลังงานกล แต่เครื่องกำเนิดไฟฟ้ายังเชื่อมต่อกับระบบไฟฟ้าอยู่ ทำให้ระบบไฟฟ้ากลับมาจ่ายกำลังไฟฟ้าขับเครื่องกำเนิดไฟฟ้าให้หมุนต่อเสมือนมอเตอร์แทน ซึ่งอาจสร้างความเสียหายทางกลไกแก่กังหันที่ไม่ได้ออกแบบให้รับแรงในทิศทางนี้', 'รีเลย์ป้องกัน Reverse Power จึงเป็นการป้องกันที่จำเป็นสำหรับเครื่องกำเนิดไฟฟ้าทุกเครื่องที่เชื่อมต่อกับระบบไฟฟ้า เพื่อตัดการเชื่อมต่อทันทีเมื่อตรวจพบทิศทางกำลังไฟฟ้าไหลกลับผิดปกติ', true, true
from categories c
where c.branch_id = '448937cf-58c5-4007-b57b-6a8bcf46c2fe' and c.code = 'protection'
  and not exists (
    select 1 from questions q2
    where q2.category_id = c.id and q2.question = 'สภาวะ Reverse Power หรือการที่เครื่องกำเนิดไฟฟ้าทำงานเป็นมอเตอร์ย้อนกลับ เกิดขึ้นได้อย่างไร และเป็นอันตรายอย่างไร'
  );
insert into questions (category_id, question, answer, explanation, is_active, needs_review)
select c.id, 'การป้องกันมอเตอร์ไฟฟ้าขนาดใหญ่ ต้องพิจารณาความผิดปกติเฉพาะประเภทใดบ้าง นอกเหนือจากกระแสเกินทั่วไป', 'ต้องพิจารณาสภาวะสตาร์ทนานเกินไป (Locked Rotor/Stalling), จำนวนครั้งการสตาร์ทที่มากเกินไปในช่วงเวลาสั้นๆ (Starts per Hour), อุณหภูมิขดลวดสูงเกิน (Thermal Overload) และแรงดันไม่สมดุลระหว่างเฟส ซึ่งล้วนส่งผลกระทบต่ออายุการใช้งานของมอเตอร์', 'การป้องกันมอเตอร์สมัยใหม่มักใช้รีเลย์ป้องกันมอเตอร์แบบดิจิทัล (Motor Protection Relay) ที่รวมฟังก์ชันป้องกันหลายประเภทไว้ในอุปกรณ์เดียว พร้อมโมเดลความร้อน (Thermal Model) จำลองอุณหภูมิขดลวดแบบเรียลไทม์', true, true
from categories c
where c.branch_id = '448937cf-58c5-4007-b57b-6a8bcf46c2fe' and c.code = 'protection'
  and not exists (
    select 1 from questions q2
    where q2.category_id = c.id and q2.question = 'การป้องกันมอเตอร์ไฟฟ้าขนาดใหญ่ ต้องพิจารณาความผิดปกติเฉพาะประเภทใดบ้าง นอกเหนือจากกระแสเกินทั่วไป'
  );
insert into questions (category_id, question, answer, explanation, is_active, needs_review)
select c.id, 'เซอร์กิตเบรกเกอร์ (Circuit Breaker) แตกต่างจากฟิวส์ (Fuse) ในหลักการทำงานพื้นฐานอย่างไร', 'เซอร์กิตเบรกเกอร์เป็นอุปกรณ์ตัดวงจรที่สามารถทำงานซ้ำได้หลายครั้งโดยไม่ต้องเปลี่ยนชิ้นส่วน ทำงานร่วมกับรีเลย์ป้องกันภายนอกที่สั่งการให้ตัดวงจร ส่วนฟิวส์เป็นอุปกรณ์ตัดวงจรแบบใช้ครั้งเดียว โดยตัวนำภายในฟิวส์จะหลอมละลายเมื่อกระแสเกินค่าที่กำหนด ต้องเปลี่ยนฟิวส์ตัวใหม่หลังทำงานทุกครั้ง', 'เซอร์กิตเบรกเกอร์เหมาะกับระบบที่ต้องการความยืดหยุ่นในการปรับตั้งค่าป้องกันและใช้งานซ้ำได้บ่อย ส่วนฟิวส์เหมาะกับงานที่ไม่ต้องการความซับซ้อนและมีต้นทุนต่ำ', true, true
from categories c
where c.branch_id = '448937cf-58c5-4007-b57b-6a8bcf46c2fe' and c.code = 'protection'
  and not exists (
    select 1 from questions q2
    where q2.category_id = c.id and q2.question = 'เซอร์กิตเบรกเกอร์ (Circuit Breaker) แตกต่างจากฟิวส์ (Fuse) ในหลักการทำงานพื้นฐานอย่างไร'
  );
insert into questions (category_id, question, answer, explanation, is_active, needs_review)
select c.id, 'พิกัดตัดกระแสลัดวงจร (Interrupting/Breaking Capacity) ของเซอร์กิตเบรกเกอร์คืออะไร และมีความสำคัญอย่างไรในการเลือกใช้งาน', 'คือค่ากระแสลัดวงจรสูงสุดที่เซอร์กิตเบรกเกอร์สามารถตัดออกได้อย่างปลอดภัยโดยไม่เกิดความเสียหาย การเลือกเซอร์กิตเบรกเกอร์ต้องเลือกพิกัดนี้ให้สูงกว่าค่ากระแสลัดวงจรสูงสุดที่อาจเกิดขึ้น ณ ตำแหน่งติดตั้งจริงที่ได้จากการวิเคราะห์กระแสลัดวงจร', 'หากเลือกพิกัดตัดกระแสต่ำเกินไป เซอร์กิตเบรกเกอร์อาจไม่สามารถตัดกระแสลัดวงจรได้สมบูรณ์ ก่อให้เกิดอาร์กไฟฟ้าค้างและความเสียหายรุนแรงตามมา', true, true
from categories c
where c.branch_id = '448937cf-58c5-4007-b57b-6a8bcf46c2fe' and c.code = 'protection'
  and not exists (
    select 1 from questions q2
    where q2.category_id = c.id and q2.question = 'พิกัดตัดกระแสลัดวงจร (Interrupting/Breaking Capacity) ของเซอร์กิตเบรกเกอร์คืออะไร และมีความสำคัญอย่างไรในการเลือกใช้งาน'
  );
insert into questions (category_id, question, answer, explanation, is_active, needs_review)
select c.id, 'เซอร์กิตเบรกเกอร์แบบ Vacuum, SF6 และ Air Blast แตกต่างกันในตัวกลางดับอาร์ก (Arc Quenching Medium) อย่างไร', 'แบบ Vacuum ใช้สุญญากาศเป็นตัวกลางดับอาร์ก แบบ SF6 ใช้แก๊สซัลเฟอร์เฮกซะฟลูออไรด์ซึ่งมีคุณสมบัติเป็นฉนวนและดับอาร์กได้ดีเยี่ยม ส่วนแบบ Air Blast ใช้อากาศอัดความดันสูงเป่าดับอาร์ก', 'แบบ Vacuum นิยมใช้กับแรงดันปานกลาง แบบ SF6 นิยมใช้กับแรงดันสูงถึงสูงมากเนื่องจากมีขนาดกะทัดรัดและประสิทธิภาพดับอาร์กสูง ส่วนแบบ Air Blast แม้เคยนิยมในอดีตแต่ปัจจุบันใช้งานน้อยลงเนื่องจากมีเสียงดังและซับซ้อนกว่า', true, true
from categories c
where c.branch_id = '448937cf-58c5-4007-b57b-6a8bcf46c2fe' and c.code = 'protection'
  and not exists (
    select 1 from questions q2
    where q2.category_id = c.id and q2.question = 'เซอร์กิตเบรกเกอร์แบบ Vacuum, SF6 และ Air Blast แตกต่างกันในตัวกลางดับอาร์ก (Arc Quenching Medium) อย่างไร'
  );
insert into questions (category_id, question, answer, explanation, is_active, needs_review)
select c.id, 'หม้อแปลงกระแส (CT) ที่ใช้เพื่อการวัด (Metering Class) และที่ใช้เพื่อการป้องกัน (Protection Class) มีข้อกำหนดทางเทคนิคแตกต่างกันอย่างไร', 'CT สำหรับการวัดต้องมีความแม่นยำสูงในช่วงกระแสปกติ แต่ยอมให้แกนเหล็กอิ่มตัวเร็วเมื่อเกิดกระแสลัดวงจรเพื่อป้องกันความเสียหายของอุปกรณ์วัด ส่วน CT สำหรับป้องกันต้องคงความแม่นยำและไม่อิ่มตัวแม้ที่กระแสลัดวงจรสูงมาก เพื่อให้รีเลย์ป้องกันได้รับสัญญาณกระแสที่ถูกต้องในสภาวะผิดปกติ', 'การเลือก CT ผิดประเภทอาจทำให้ระบบป้องกันทำงานผิดพลาดในสภาวะที่มีความผิดพร่องรุนแรง เนื่องจาก CT วัดอิ่มตัวเร็วเกินไปจนให้สัญญาณกระแสที่ไม่ถูกต้อง', true, true
from categories c
where c.branch_id = '448937cf-58c5-4007-b57b-6a8bcf46c2fe' and c.code = 'protection'
  and not exists (
    select 1 from questions q2
    where q2.category_id = c.id and q2.question = 'หม้อแปลงกระแส (CT) ที่ใช้เพื่อการวัด (Metering Class) และที่ใช้เพื่อการป้องกัน (Protection Class) มีข้อกำหนดทางเทคนิคแตกต่างกันอย่างไร'
  );
insert into questions (category_id, question, answer, explanation, is_active, needs_review)
select c.id, 'เหตุใดการตั้งค่ารีเลย์ป้องกัน (Relay Setting) จึงต้องมีการทบทวนและปรับปรุงเป็นระยะ ไม่ใช่ตั้งค่าเพียงครั้งเดียวตอนติดตั้ง', 'เพราะโครงสร้างระบบไฟฟ้ากำลังมีการเปลี่ยนแปลงตลอดเวลา เช่น มีการเพิ่มโหลด เปลี่ยนแปลงเส้นทางสายส่ง หรือเพิ่มแหล่งผลิตไฟฟ้าใหม่ ซึ่งส่งผลต่อขนาดกระแสลัดวงจรและทิศทางการไหลของกระแสในระบบ การตั้งค่าเดิมอาจไม่เหมาะสมกับสภาพระบบที่เปลี่ยนไป', 'การทบทวนค่าตั้งรีเลย์ควรทำเป็นส่วนหนึ่งของการศึกษาความสัมพันธ์การป้องกัน (Protection Coordination Study) ทุกครั้งที่มีการเปลี่ยนแปลงโครงสร้างระบบไฟฟ้าที่มีนัยสำคัญ', true, true
from categories c
where c.branch_id = '448937cf-58c5-4007-b57b-6a8bcf46c2fe' and c.code = 'protection'
  and not exists (
    select 1 from questions q2
    where q2.category_id = c.id and q2.question = 'เหตุใดการตั้งค่ารีเลย์ป้องกัน (Relay Setting) จึงต้องมีการทบทวนและปรับปรุงเป็นระยะ ไม่ใช่ตั้งค่าเพียงครั้งเดียวตอนติดตั้ง'
  );
insert into questions (category_id, question, answer, explanation, is_active, needs_review)
select c.id, 'กระแสไฟฟ้าลัดวงจรลงดินขนาดต่ำ (High Impedance Ground Fault) ตรวจจับได้ยากกว่าความผิดพร่องประเภทอื่นเพราะเหตุใด', 'เพราะกระแสที่เกิดขึ้นมีขนาดใกล้เคียงหรือต่ำกว่ากระแสโหลดปกติ ทำให้รีเลย์กระแสเกินทั่วไปที่ตั้งค่าตามระดับโหลดปกติไม่สามารถแยกแยะความผิดปกตินี้ออกจากสภาวะทำงานปกติได้', 'การตรวจจับความผิดพร่องประเภทนี้อาจต้องอาศัยเทคนิคเฉพาะ เช่น การตรวจวัดกระแสลำดับศูนย์ที่มีความไวสูง หรือการวิเคราะห์รูปคลื่นฮาร์มอนิกที่ผิดปกติ ซึ่งซับซ้อนกว่าการป้องกันกระแสเกินทั่วไปมาก', true, true
from categories c
where c.branch_id = '448937cf-58c5-4007-b57b-6a8bcf46c2fe' and c.code = 'protection'
  and not exists (
    select 1 from questions q2
    where q2.category_id = c.id and q2.question = 'กระแสไฟฟ้าลัดวงจรลงดินขนาดต่ำ (High Impedance Ground Fault) ตรวจจับได้ยากกว่าความผิดพร่องประเภทอื่นเพราะเหตุใด'
  );
insert into questions (category_id, question, answer, explanation, is_active, needs_review)
select c.id, 'การเชื่อมโยงข้อมูลระหว่างอุปกรณ์ป้องกันด้วยมาตรฐาน IEC 61850 มีข้อดีอย่างไรเมื่อเทียบกับระบบสายสัญญาณแบบดั้งเดิม', 'IEC 61850 เป็นมาตรฐานการสื่อสารดิจิทัลที่ช่วยลดปริมาณสายทองแดงที่ต้องเดินระหว่างอุปกรณ์ในสถานีไฟฟ้าได้อย่างมาก โดยส่งข้อมูลผ่านเครือข่ายอีเทอร์เน็ตแทน อีกทั้งยังรองรับการทำงานร่วมกัน (Interoperability) ระหว่างอุปกรณ์จากผู้ผลิตต่างรายได้ง่ายขึ้น', 'มาตรฐานนี้ยังรองรับฟังก์ชัน GOOSE (Generic Object Oriented Substation Event) ที่ช่วยให้อุปกรณ์ป้องกันสื่อสารและประสานงานกันได้อย่างรวดเร็วในระดับมิลลิวินาที ซึ่งสำคัญมากสำหรับการป้องกันบัสบาร์และการประสานงานแบบซับซ้อน', true, true
from categories c
where c.branch_id = '448937cf-58c5-4007-b57b-6a8bcf46c2fe' and c.code = 'protection'
  and not exists (
    select 1 from questions q2
    where q2.category_id = c.id and q2.question = 'การเชื่อมโยงข้อมูลระหว่างอุปกรณ์ป้องกันด้วยมาตรฐาน IEC 61850 มีข้อดีอย่างไรเมื่อเทียบกับระบบสายสัญญาณแบบดั้งเดิม'
  );
insert into questions (category_id, question, answer, explanation, is_active, needs_review)
select c.id, 'การทดสอบรีเลย์ป้องกันแบบ Secondary Injection Test มีวัตถุประสงค์และวิธีการอย่างไร', 'เป็นการทดสอบโดยป้อนกระแสหรือแรงดันจำลองเข้าที่ด้านทุติยภูมิของรีเลย์โดยตรง (ไม่ผ่านระบบไฟฟ้าจริง) เพื่อตรวจสอบว่ารีเลย์ทำงานถูกต้องตามค่าตั้งที่กำหนดไว้ เช่น ตรวจสอบเวลาการทำงานที่กระแสระดับต่างๆ', 'การทดสอบนี้ทำได้สะดวกและปลอดภัยกว่าการทดสอบแบบ Primary Injection ที่ต้องจ่ายกระแสจริงผ่านระบบไฟฟ้ากำลัง จึงนิยมใช้เป็นการทดสอบตามวาระเพื่อยืนยันความถูกต้องของรีเลย์ที่ติดตั้งใช้งานอยู่', true, true
from categories c
where c.branch_id = '448937cf-58c5-4007-b57b-6a8bcf46c2fe' and c.code = 'protection'
  and not exists (
    select 1 from questions q2
    where q2.category_id = c.id and q2.question = 'การทดสอบรีเลย์ป้องกันแบบ Secondary Injection Test มีวัตถุประสงค์และวิธีการอย่างไร'
  );
insert into questions (category_id, question, answer, explanation, is_active, needs_review)
select c.id, 'การเลือกขนาดฟิวส์แรงต่ำสำหรับป้องกันวงจรย่อยในระบบไฟฟ้าอาคาร ต้องคำนึงถึงข้อกำหนดพื้นฐานใด', 'ต้องเลือกขนาดฟิวส์ที่สูงพอที่จะไม่ตัดวงจรจากกระแสโหลดปกติหรือกระแสสตาร์ทของอุปกรณ์ที่มีมอเตอร์ แต่ต่ำพอที่จะตัดวงจรก่อนที่สายไฟจะได้รับความเสียหายจากความร้อนเมื่อเกิดกระแสเกินหรือลัดวงจร', 'หลักการนี้เรียกว่าการประสานงานระหว่างพิกัดกระแสของสายไฟ (Cable Ampacity) กับพิกัดของอุปกรณ์ป้องกัน ซึ่งเป็นพื้นฐานสำคัญของการออกแบบระบบไฟฟ้าภายในอาคารให้ปลอดภัย', true, true
from categories c
where c.branch_id = '448937cf-58c5-4007-b57b-6a8bcf46c2fe' and c.code = 'protection'
  and not exists (
    select 1 from questions q2
    where q2.category_id = c.id and q2.question = 'การเลือกขนาดฟิวส์แรงต่ำสำหรับป้องกันวงจรย่อยในระบบไฟฟ้าอาคาร ต้องคำนึงถึงข้อกำหนดพื้นฐานใด'
  );
insert into questions (category_id, question, answer, explanation, is_active, needs_review)
select c.id, 'การป้องกันแบบสำรอง (Backup Protection) คืออะไร และมีความสำคัญอย่างไรในระบบไฟฟ้ากำลัง', 'คือระบบป้องกันชั้นที่สองที่ทำงานเมื่อระบบป้องกันหลัก (Primary Protection) ล้มเหลวในการตัดวงจรความผิดพร่อง อาจเป็นรีเลย์ตัวเดียวกันที่มีฟังก์ชันสำรอง หรือรีเลย์อีกตัวที่ติดตั้งแยกต่างหาก ทำงานที่เวลาหน่วงนานกว่าระบบป้องกันหลัก', 'การมีระบบป้องกันสำรองช่วยเพิ่มความน่าเชื่อถือของระบบโดยรวม เพราะไม่มีระบบป้องกันใดที่รับประกันได้ 100% ว่าจะทำงานถูกต้องทุกครั้ง จึงจำเป็นต้องมีชั้นการป้องกันสำรองเผื่อไว้เสมอ', true, true
from categories c
where c.branch_id = '448937cf-58c5-4007-b57b-6a8bcf46c2fe' and c.code = 'protection'
  and not exists (
    select 1 from questions q2
    where q2.category_id = c.id and q2.question = 'การป้องกันแบบสำรอง (Backup Protection) คืออะไร และมีความสำคัญอย่างไรในระบบไฟฟ้ากำลัง'
  );
insert into questions (category_id, question, answer, explanation, is_active, needs_review)
select c.id, 'อาร์กแฟลช (Arc Flash) คืออะไร และเหตุใดจึงเป็นความเสี่ยงสำคัญที่ต้องพิจารณาในการออกแบบระบบป้องกัน', 'อาร์กแฟลชคือการระเบิดของพลังงานความร้อนและแสงที่เกิดขึ้นอย่างฉับพลันเมื่อเกิดอาร์กไฟฟ้าลัดวงจร ปลดปล่อยพลังงานมหาศาลในเวลาสั้นมาก ซึ่งเป็นอันตรายร้ายแรงต่อผู้ปฏิบัติงานที่อยู่ใกล้บริเวณนั้น แม้จะไม่ได้สัมผัสส่วนที่มีไฟฟ้าโดยตรงก็ตาม', 'การลดความเสี่ยงจากอาร์กแฟลชทำได้โดยการออกแบบระบบป้องกันให้ตัดวงจรเร็วที่สุดเท่าที่จะทำได้เมื่อเกิดความผิดพร่อง เนื่องจากพลังงานอาร์กแฟลชแปรผันตรงกับระยะเวลาที่อาร์กคงอยู่', true, true
from categories c
where c.branch_id = '448937cf-58c5-4007-b57b-6a8bcf46c2fe' and c.code = 'protection'
  and not exists (
    select 1 from questions q2
    where q2.category_id = c.id and q2.question = 'อาร์กแฟลช (Arc Flash) คืออะไร และเหตุใดจึงเป็นความเสี่ยงสำคัญที่ต้องพิจารณาในการออกแบบระบบป้องกัน'
  );
insert into questions (category_id, question, answer, explanation, is_active, needs_review)
select c.id, 'การป้องกันแบบ Under-Voltage และ Over-Voltage Protection มีวัตถุประสงค์ปกป้องระบบหรืออุปกรณ์จากสภาวะใด', 'Under-Voltage Protection ป้องกันความเสียหายที่อาจเกิดจากแรงดันต่ำผิดปกติ เช่น มอเตอร์ดึงกระแสสูงเกินพิกัด ส่วน Over-Voltage Protection ป้องกันความเสียหายจากแรงดันสูงผิดปกติที่อาจทำลายฉนวนของอุปกรณ์ไฟฟ้า', 'ทั้งสองฟังก์ชันนี้มักติดตั้งร่วมกับการป้องกันความถี่ผิดปกติ (Under/Over Frequency Protection) ในอุปกรณ์ป้องกันแบบดิจิทัลสมัยใหม่ เพื่อป้องกันสภาวะผิดปกติของระบบไฟฟ้าอย่างครอบคลุม', true, true
from categories c
where c.branch_id = '448937cf-58c5-4007-b57b-6a8bcf46c2fe' and c.code = 'protection'
  and not exists (
    select 1 from questions q2
    where q2.category_id = c.id and q2.question = 'การป้องกันแบบ Under-Voltage และ Over-Voltage Protection มีวัตถุประสงค์ปกป้องระบบหรืออุปกรณ์จากสภาวะใด'
  );
insert into questions (category_id, question, answer, explanation, is_active, needs_review)
select c.id, 'เหตุใดรีเลย์ป้องกันสมัยใหม่ (Numerical Relay) จึงมีข้อได้เปรียบเหนือรีเลย์แบบแม่เหล็กไฟฟ้า (Electromechanical Relay) แบบดั้งเดิม', 'รีเลย์ตัวเลขสามารถรวมฟังก์ชันป้องกันหลายประเภทไว้ในอุปกรณ์เดียว มีความแม่นยำสูงกว่า ปรับตั้งค่าได้ง่ายผ่านซอฟต์แวร์โดยไม่ต้องปรับกลไกเชิงกล และสามารถบันทึกข้อมูลเหตุการณ์ความผิดพร่อง (Event Recording) เพื่อการวิเคราะห์ภายหลังได้', 'อย่างไรก็ตาม รีเลย์ตัวเลขต้องอาศัยแหล่งจ่ายไฟเสริม (Auxiliary Power) ในการทำงาน ต่างจากรีเลย์แม่เหล็กไฟฟ้าบางชนิดที่ทำงานได้ด้วยพลังงานจากกระแสความผิดพร่องเอง ซึ่งเป็นข้อพิจารณาด้านความน่าเชื่อถือในบางกรณี', true, true
from categories c
where c.branch_id = '448937cf-58c5-4007-b57b-6a8bcf46c2fe' and c.code = 'protection'
  and not exists (
    select 1 from questions q2
    where q2.category_id = c.id and q2.question = 'เหตุใดรีเลย์ป้องกันสมัยใหม่ (Numerical Relay) จึงมีข้อได้เปรียบเหนือรีเลย์แบบแม่เหล็กไฟฟ้า (Electromechanical Relay) แบบดั้งเดิม'
  );
insert into questions (category_id, question, answer, explanation, is_active, needs_review)
select c.id, 'การป้องกันแบบ Restricted Earth Fault (REF) สำหรับหม้อแปลงไฟฟ้ามีความไวต่อความผิดพร่องประเภทใดเป็นพิเศษ', 'มีความไวสูงเป็นพิเศษต่อความผิดพร่องลงดินที่เกิดขึ้นภายในขดลวดของหม้อแปลง โดยเฉพาะที่ตำแหน่งใกล้จุดนิวทรัลซึ่งการป้องกันแบบผลต่างกระแสทั่วไปอาจตรวจจับได้ไม่ไวพอ เนื่องจากกระแสความผิดพร่องที่ตำแหน่งนั้นมีขนาดต่ำ', 'REF อาศัยการเปรียบเทียบกระแสจากขั้วเฟสทั้งหมดของขดลวดกับกระแสที่ไหลผ่านจุดต่อนิวทรัลลงดิน ทำให้ตรวจจับความผิดพร่องลงดินภายในขดลวดได้แม่นยำกว่าการป้องกันแบบทั่วไป', true, true
from categories c
where c.branch_id = '448937cf-58c5-4007-b57b-6a8bcf46c2fe' and c.code = 'protection'
  and not exists (
    select 1 from questions q2
    where q2.category_id = c.id and q2.question = 'การป้องกันแบบ Restricted Earth Fault (REF) สำหรับหม้อแปลงไฟฟ้ามีความไวต่อความผิดพร่องประเภทใดเป็นพิเศษ'
  );
insert into questions (category_id, question, answer, explanation, is_active, needs_review)
select c.id, 'สวิตช์ตัดตอนอัตโนมัติ (Automatic Circuit Recloser) และสวิตช์ตัดตอน (Sectionalizer) ทำงานร่วมกันอย่างไรในระบบจำหน่ายไฟฟ้า', 'Recloser ทำหน้าที่ตัดและปิดวงจรอัตโนมัติเมื่อเกิดความผิดพร่อง ในขณะที่ Sectionalizer นับจำนวนครั้งที่ Recloser ต้นทางทำงาน แต่ไม่มีความสามารถตัดกระแสลัดวงจรด้วยตัวเอง เมื่อ Recloser ทำงานครบจำนวนครั้งที่กำหนด Sectionalizer จะเปิดวงจรของตนขณะที่ Recloser เปิดอยู่ชั่วขณะ เพื่อแยกส่วนที่เสียหายออกจากระบบ', 'การทำงานร่วมกันของอุปกรณ์ทั้งสองช่วยลดขนาดพื้นที่ที่ต้องไฟดับเมื่อเกิดความผิดพร่องถาวรในระบบจำหน่ายไฟฟ้า โดยไม่ต้องใช้อุปกรณ์ป้องกันราคาแพงติดตั้งทุกจุด', true, true
from categories c
where c.branch_id = '448937cf-58c5-4007-b57b-6a8bcf46c2fe' and c.code = 'protection'
  and not exists (
    select 1 from questions q2
    where q2.category_id = c.id and q2.question = 'สวิตช์ตัดตอนอัตโนมัติ (Automatic Circuit Recloser) และสวิตช์ตัดตอน (Sectionalizer) ทำงานร่วมกันอย่างไรในระบบจำหน่ายไฟฟ้า'
  );
insert into questions (category_id, question, answer, explanation, is_active, needs_review)
select c.id, 'การป้องกันมอเตอร์ด้วยรีเลย์ป้องกันความร้อน (Thermal Overload Relay) มีข้อจำกัดอย่างไรเมื่อเทียบกับโมเดลความร้อนแบบดิจิทัล', 'รีเลย์ความร้อนแบบดั้งเดิมที่ใช้แผ่นโลหะคู่ มักไม่สามารถจำลองพฤติกรรมความร้อนที่แท้จริงของขดลวดมอเตอร์ได้แม่นยำนัก โดยเฉพาะในกรณีที่มีการสตาร์ทซ้ำหลายครั้งติดต่อกัน ในขณะที่โมเดลความร้อนแบบดิจิทัลสามารถคำนวณอุณหภูมิสะสมของขดลวดตามประวัติกระแสจริงได้แม่นยำกว่ามาก', 'ความแม่นยำที่เพิ่มขึ้นนี้ช่วยให้สามารถใช้งานมอเตอร์ได้เต็มความสามารถโดยไม่ตัดวงจรก่อนเวลาอันควร ในขณะเดียวกันก็ยังคงป้องกันความเสียหายจากความร้อนสะสมได้อย่างมีประสิทธิภาพ', true, true
from categories c
where c.branch_id = '448937cf-58c5-4007-b57b-6a8bcf46c2fe' and c.code = 'protection'
  and not exists (
    select 1 from questions q2
    where q2.category_id = c.id and q2.question = 'การป้องกันมอเตอร์ด้วยรีเลย์ป้องกันความร้อน (Thermal Overload Relay) มีข้อจำกัดอย่างไรเมื่อเทียบกับโมเดลความร้อนแบบดิจิทัล'
  );
insert into questions (category_id, question, answer, explanation, is_active, needs_review)
select c.id, 'เหตุใดจึงต้องมีการประสานงานระหว่างรีเลย์ป้องกันกับอุปกรณ์กันเสิร์จ (Surge Arrester) ในระบบไฟฟ้าแรงสูง', 'อุปกรณ์กันเสิร์จทำหน้าที่ปกป้องอุปกรณ์จากแรงดันเกินชั่วครู่ (Transient Overvoltage) เช่น จากฟ้าผ่าหรือการสวิตชิ่ง ในขณะที่รีเลย์ป้องกันจัดการกับความผิดพร่องที่คงอยู่ต่อเนื่อง ทั้งสองระบบต้องทำงานประสานกันเพื่อให้อุปกรณ์ได้รับการปกป้องครบถ้วนทั้งจากแรงดันเกินชั่วครู่และกระแสลัดวงจรที่ตามมา', 'หากอุปกรณ์กันเสิร์จทำงานระบายพลังงานจากฟ้าผ่าแล้วนำไปสู่ความผิดพร่องถาวร รีเลย์ป้องกันจะต้องตัดวงจรตามมาเพื่อป้องกันความเสียหายเพิ่มเติมต่อระบบ', true, true
from categories c
where c.branch_id = '448937cf-58c5-4007-b57b-6a8bcf46c2fe' and c.code = 'protection'
  and not exists (
    select 1 from questions q2
    where q2.category_id = c.id and q2.question = 'เหตุใดจึงต้องมีการประสานงานระหว่างรีเลย์ป้องกันกับอุปกรณ์กันเสิร์จ (Surge Arrester) ในระบบไฟฟ้าแรงสูง'
  );
insert into questions (category_id, question, answer, explanation, is_active, needs_review)
select c.id, 'การเลือกใช้รีเลย์ป้องกันแบบ Solid State และแบบ Numerical ในปัจจุบัน มีข้อพิจารณาอะไรที่ทำให้นิยมใช้แบบ Numerical มากกว่า', 'รีเลย์ Numerical มีความสามารถในการประมวลผลสัญญาณดิจิทัลที่ซับซ้อนกว่า สามารถปรับเปลี่ยนฟังก์ชันและค่าตั้งได้ง่ายผ่านซอฟต์แวร์ รองรับการสื่อสารมาตรฐานสมัยใหม่ เช่น IEC 61850 และมีฟังก์ชันบันทึกข้อมูลเหตุการณ์ที่ละเอียดกว่ารีเลย์ Solid State รุ่นเก่า', 'แม้รีเลย์ Solid State ยังคงมีความเรียบง่ายและเชื่อถือได้ในบางแอปพลิเคชัน แต่แนวโน้มอุตสาหกรรมปัจจุบันหันมาใช้รีเลย์ Numerical เป็นมาตรฐานหลักในการติดตั้งใหม่เกือบทั้งหมด เนื่องจากความยืดหยุ่นและความสามารถที่เหนือกว่า', true, true
from categories c
where c.branch_id = '448937cf-58c5-4007-b57b-6a8bcf46c2fe' and c.code = 'protection'
  and not exists (
    select 1 from questions q2
    where q2.category_id = c.id and q2.question = 'การเลือกใช้รีเลย์ป้องกันแบบ Solid State และแบบ Numerical ในปัจจุบัน มีข้อพิจารณาอะไรที่ทำให้นิยมใช้แบบ Numerical มากกว่า'
  );
insert into questions (category_id, question, answer, explanation, is_active, needs_review)
select c.id, 'ในการออกแบบระบบป้องกันสำหรับสายป้อนไฟฟ้า (Feeder) ที่มีหลายระดับ (Main-Sub-Branch) เหตุใดจึงต้องมีระยะห่างเวลาที่เหมาะสม (Grading Margin) ระหว่างแต่ละระดับ', 'เพื่อให้แน่ใจว่าอุปกรณ์ป้องกันระดับล่างสุดที่ใกล้จุดผิดพร่องมีเวลาเพียงพอในการทำงานตัดวงจรให้เสร็จสมบูรณ์ก่อนที่อุปกรณ์ป้องกันระดับที่สูงกว่าจะเริ่มทำงาน ป้องกันไม่ให้เกิดการตัดวงจรพร้อมกันหรือผิดลำดับซึ่งจะทำให้พื้นที่ไฟดับกว้างเกินความจำเป็น', 'ค่า Grading Margin โดยทั่วไปต้องคำนึงถึงเวลาทำงานของเซอร์กิตเบรกเกอร์ ความคลาดเคลื่อนของรีเลย์ และเวลาดับอาร์ก รวมกันแล้วมักกำหนดไว้ประมาณ 0.3-0.5 วินาทีระหว่างแต่ละระดับในทางปฏิบัติทั่วไป', true, true
from categories c
where c.branch_id = '448937cf-58c5-4007-b57b-6a8bcf46c2fe' and c.code = 'protection'
  and not exists (
    select 1 from questions q2
    where q2.category_id = c.id and q2.question = 'ในการออกแบบระบบป้องกันสำหรับสายป้อนไฟฟ้า (Feeder) ที่มีหลายระดับ (Main-Sub-Branch) เหตุใดจึงต้องมีระยะห่างเวลาที่เหมาะสม (Grading Margin) ระหว่างแต่ละระดับ'
  );
insert into questions (category_id, question, answer, explanation, is_active, needs_review)
select c.id, 'เหตุใดการป้องกันวงจรที่มีตัวเก็บประจุแบงค์ (Capacitor Bank Protection) จึงต้องพิจารณาเป็นพิเศษแตกต่างจากวงจรทั่วไป', 'เพราะตัวเก็บประจุแบงค์อาจเกิดความผิดปกติเฉพาะ เช่น การลัดวงจรภายในตัวเก็บประจุแต่ละยูนิต (Unit Failure) ซึ่งทำให้แรงดันไม่สมดุลระหว่างกลุ่มตัวเก็บประจุที่เหลือ อีกทั้งกระแสสวิตชิ่งขณะเปิด-ปิดตัวเก็บประจุแบงค์ยังมีลักษณะเฉพาะที่แตกต่างจากโหลดทั่วไป', 'การป้องกันตัวเก็บประจุแบงค์มักใช้รีเลย์ตรวจจับแรงดันไม่สมดุล (Unbalance Protection) ร่วมกับรีเลย์กระแสเกินทั่วไป เพื่อตรวจจับความผิดปกติเฉพาะของตัวเก็บประจุได้อย่างครบถ้วน', true, true
from categories c
where c.branch_id = '448937cf-58c5-4007-b57b-6a8bcf46c2fe' and c.code = 'protection'
  and not exists (
    select 1 from questions q2
    where q2.category_id = c.id and q2.question = 'เหตุใดการป้องกันวงจรที่มีตัวเก็บประจุแบงค์ (Capacitor Bank Protection) จึงต้องพิจารณาเป็นพิเศษแตกต่างจากวงจรทั่วไป'
  );
insert into questions (category_id, question, answer, explanation, is_active, needs_review)
select c.id, 'การป้องกันแบบ Loss of Field หรือ Loss of Excitation สำหรับเครื่องกำเนิดไฟฟ้าซิงโครนัส เกิดจากสาเหตุใด และมีผลกระทบอย่างไร', 'เกิดขึ้นเมื่อระบบกระตุ้นสนามแม่เหล็ก (Excitation System) ของเครื่องกำเนิดไฟฟ้าเสียหายหรือขาดหาย ทำให้เครื่องกำเนิดไฟฟ้าไม่สามารถรักษาการซิงโครไนซ์กับระบบได้อีกต่อไป และเริ่มดึงกำลังไฟฟ้ารีแอคทีฟจากระบบแทนที่จะจ่ายออกไป ซึ่งอาจกระทบเสถียรภาพแรงดันของระบบโดยรวม', 'รีเลย์ป้องกันสภาวะนี้มักตรวจจับจากลักษณะการเปลี่ยนแปลงของอิมพีแดนซ์ที่วัดได้จากขั้วเครื่องกำเนิดไฟฟ้า ซึ่งจะเคลื่อนเข้าสู่บริเวณลักษณะเฉพาะของสภาวะขาดการกระตุ้นสนามแม่เหล็กบนกราฟอิมพีแดนซ์', true, true
from categories c
where c.branch_id = '448937cf-58c5-4007-b57b-6a8bcf46c2fe' and c.code = 'protection'
  and not exists (
    select 1 from questions q2
    where q2.category_id = c.id and q2.question = 'การป้องกันแบบ Loss of Field หรือ Loss of Excitation สำหรับเครื่องกำเนิดไฟฟ้าซิงโครนัส เกิดจากสาเหตุใด และมีผลกระทบอย่างไร'
  );
insert into questions (category_id, question, answer, explanation, is_active, needs_review)
select c.id, 'เหตุใดวงจรควบคุมของระบบป้องกัน (Protection DC Control Circuit) จึงมักใช้แหล่งจ่ายไฟฟ้ากระแสตรงจากแบตเตอรี่สำรอง แทนที่จะใช้ไฟฟ้ากระแสสลับจากระบบโดยตรง', 'เพราะระบบป้องกันต้องสามารถทำงานได้แม้ในขณะที่ระบบไฟฟ้ากระแสสลับหลักเกิดความผิดปกติหรือดับไป แบตเตอรี่สำรองจึงให้แหล่งพลังงานที่เชื่อถือได้และเป็นอิสระจากสภาวะของระบบไฟฟ้ากำลังหลักที่กำลังป้องกันอยู่', 'หากใช้ไฟฟ้ากระแสสลับจากระบบโดยตรง เมื่อเกิดความผิดพร่องรุนแรงจนไฟฟ้าในสถานีดับไปด้วย ระบบป้องกันก็จะไม่มีพลังงานทำงาน ซึ่งขัดกับวัตถุประสงค์หลักของการมีระบบป้องกันไว้ใช้งานในสภาวะฉุกเฉิน', true, true
from categories c
where c.branch_id = '448937cf-58c5-4007-b57b-6a8bcf46c2fe' and c.code = 'protection'
  and not exists (
    select 1 from questions q2
    where q2.category_id = c.id and q2.question = 'เหตุใดวงจรควบคุมของระบบป้องกัน (Protection DC Control Circuit) จึงมักใช้แหล่งจ่ายไฟฟ้ากระแสตรงจากแบตเตอรี่สำรอง แทนที่จะใช้ไฟฟ้ากระแสสลับจากระบบโดยตรง'
  );
insert into questions (category_id, question, answer, explanation, is_active, needs_review)
select c.id, 'การทดสอบ Primary Injection Test แตกต่างจาก Secondary Injection Test อย่างไร และให้ประโยชน์เพิ่มเติมอะไร', 'Primary Injection Test จ่ายกระแสทดสอบผ่านวงจรกำลังจริงทั้งระบบ (รวมถึง CT ที่ใช้งานจริง) ต่างจาก Secondary Injection ที่ป้อนสัญญาณเข้าที่รีเลย์โดยตรง Primary Injection จึงสามารถตรวจสอบความถูกต้องของทั้งระบบ ตั้งแต่ CT สายสัญญาณ ไปจนถึงตัวรีเลย์ในคราวเดียว', 'แม้ Primary Injection จะให้ความมั่นใจในความถูกต้องของทั้งระบบมากกว่า แต่ก็ทำได้ยากและมีความเสี่ยงมากกว่า เนื่องจากต้องจ่ายกระแสขนาดใหญ่ผ่านอุปกรณ์กำลังจริง จึงมักทำเฉพาะช่วงติดตั้งใหม่หรือตรวจสอบใหญ่เป็นระยะเวลานานเท่านั้น', true, true
from categories c
where c.branch_id = '448937cf-58c5-4007-b57b-6a8bcf46c2fe' and c.code = 'protection'
  and not exists (
    select 1 from questions q2
    where q2.category_id = c.id and q2.question = 'การทดสอบ Primary Injection Test แตกต่างจาก Secondary Injection Test อย่างไร และให้ประโยชน์เพิ่มเติมอะไร'
  );
insert into questions (category_id, question, answer, explanation, is_active, needs_review)
select c.id, 'เหตุใดการเลือกค่าตั้งกระแสรีเลย์ป้องกันหม้อแปลง (Overcurrent Setting) จึงต้องพิจารณากระแสพุ่งเข้า (Inrush Current) ควบคู่กับกระแสลัดวงจรด้านทุติยภูมิ', 'เพราะค่าตั้งกระแสต้องสูงเพียงพอที่จะไม่ทำให้รีเลย์ตัดวงจรผิดพลาดจากกระแสพุ่งเข้าปกติขณะสับสวิตช์ แต่ในขณะเดียวกันก็ต้องต่ำเพียงพอที่จะตรวจจับความผิดพร่องด้านทุติยภูมิที่อาจให้กระแสไม่สูงมากได้อย่างทันท่วงที', 'การหาจุดสมดุลระหว่างสองข้อกำหนดนี้เป็นความท้าทายสำคัญของวิศวกรออกแบบระบบป้องกัน ซึ่งบางกรณีอาจต้องอาศัยฟังก์ชัน Harmonic Restraint ร่วมด้วยเพื่อแยกแยะกระแสทั้งสองประเภทได้แม่นยำยิ่งขึ้น', true, true
from categories c
where c.branch_id = '448937cf-58c5-4007-b57b-6a8bcf46c2fe' and c.code = 'protection'
  and not exists (
    select 1 from questions q2
    where q2.category_id = c.id and q2.question = 'เหตุใดการเลือกค่าตั้งกระแสรีเลย์ป้องกันหม้อแปลง (Overcurrent Setting) จึงต้องพิจารณากระแสพุ่งเข้า (Inrush Current) ควบคู่กับกระแสลัดวงจรด้านทุติยภูมิ'
  );
insert into questions (category_id, question, answer, explanation, is_active, needs_review)
select c.id, 'เหตุใดมาตรฐานการออกแบบระบบป้องกันจึงเน้นหลักการ "Fail-Safe" คืออุปกรณ์ต้องมีแนวโน้มตัดวงจรมากกว่าไม่ตัดวงจรเมื่อเกิดความผิดปกติของระบบป้องกันเอง', 'เพราะการปล่อยให้ระบบไฟฟ้ายังคงจ่ายไฟฟ้าต่อไปทั้งที่ระบบป้องกันขัดข้อง มีความเสี่ยงสูงกว่าการตัดไฟฟ้าโดยไม่จำเป็นในบางครั้ง เนื่องจากความผิดพร่องที่ไม่ถูกตัดออกอาจลุกลามสร้างความเสียหายรุนแรงกว่าการไฟดับชั่วคราว', 'หลักการ Fail-Safe นี้สะท้อนอยู่ในการออกแบบวงจรควบคุมของเซอร์กิตเบรกเกอร์หลายระบบ เช่น การออกแบบให้คอยล์ทริป (Trip Coil) ทำงานเมื่อมีกระแสไหลผ่าน มากกว่าการออกแบบให้ต้องอาศัยกระแสไหลผ่านตลอดเวลาเพื่อไม่ให้ตัดวงจร', true, true
from categories c
where c.branch_id = '448937cf-58c5-4007-b57b-6a8bcf46c2fe' and c.code = 'protection'
  and not exists (
    select 1 from questions q2
    where q2.category_id = c.id and q2.question = 'เหตุใดมาตรฐานการออกแบบระบบป้องกันจึงเน้นหลักการ "Fail-Safe" คืออุปกรณ์ต้องมีแนวโน้มตัดวงจรมากกว่าไม่ตัดวงจรเมื่อเกิดความผิดปกติของระบบป้องกันเอง'
  );

commit;

-- ---------- ตรวจสอบผลลัพธ์ ----------
select c.name_th as category, count(q.id) as question_count
from categories c
left join questions q on q.category_id = c.id
where c.branch_id = '448937cf-58c5-4007-b57b-6a8bcf46c2fe' and c.code = 'protection'
group by c.name_th;
