-- ============================================================
-- นำเข้าคำถามสาขาไฟฟ้า หมวดที่ 4: ระบบไฟฟ้ากำลัง (Power Systems)
-- ไฟล์นี้รันได้อิสระ ไม่ต้องพึ่งไฟล์อื่น (idempotent)
-- ============================================================

begin;

-- ---------- เพิ่มหมวดหมู่ ----------
insert into categories (branch_id, code, name_th, sort_order)
select '448937cf-58c5-4007-b57b-6a8bcf46c2fe', 'power_systems', 'ระบบไฟฟ้ากำลัง (Power Systems)', 4
where not exists (
  select 1 from categories where branch_id = '448937cf-58c5-4007-b57b-6a8bcf46c2fe' and code = 'power_systems'
);

-- ---------- เพิ่มคำถาม (33 ข้อ) ----------
insert into questions (category_id, question, answer, explanation, is_active, needs_review)
select c.id, 'ระบบไฟฟ้ากำลังแบ่งออกเป็นกี่ส่วนหลัก และแต่ละส่วนมีหน้าที่อะไร', 'แบ่งเป็น 3 ส่วนหลักคือ ระบบผลิตไฟฟ้า (Generation) ทำหน้าที่ผลิตพลังงานไฟฟ้าจากแหล่งพลังงานต่างๆ ระบบส่งไฟฟ้า (Transmission) ทำหน้าที่ลำเลียงพลังงานไฟฟ้าแรงดันสูงระยะไกลจากโรงไฟฟ้าสู่พื้นที่ใช้งาน และระบบจำหน่ายไฟฟ้า (Distribution) ทำหน้าที่กระจายไฟฟ้าแรงดันต่ำกว่าไปยังผู้ใช้ไฟฟ้าปลายทาง', 'การแบ่งระดับแรงดันในแต่ละส่วนช่วยลดการสูญเสียพลังงานระหว่างการส่งจ่ายระยะไกล เนื่องจากการส่งด้วยแรงดันสูงทำให้กระแสไหลต่ำลง ลดการสูญเสียแบบ I²R ในสายส่ง', true, true
from categories c
where c.branch_id = '448937cf-58c5-4007-b57b-6a8bcf46c2fe' and c.code = 'power_systems'
  and not exists (
    select 1 from questions q2
    where q2.category_id = c.id and q2.question = 'ระบบไฟฟ้ากำลังแบ่งออกเป็นกี่ส่วนหลัก และแต่ละส่วนมีหน้าที่อะไร'
  );
insert into questions (category_id, question, answer, explanation, is_active, needs_review)
select c.id, 'เหตุใดระบบส่งไฟฟ้าระยะไกลจึงนิยมใช้แรงดันไฟฟ้าสูงมาก แทนที่จะส่งด้วยแรงดันต่ำ', 'เพราะที่กำลังไฟฟ้าเท่ากัน การเพิ่มแรงดันจะทำให้กระแสไฟฟ้าลดลงตามสัดส่วน ซึ่งการสูญเสียพลังงานในสายส่งแปรผันตามกำลังสองของกระแส (I²R) การใช้แรงดันสูงจึงลดการสูญเสียพลังงานและขนาดสายไฟที่ต้องใช้ได้อย่างมีนัยสำคัญ', 'ด้วยเหตุนี้ระบบส่งไฟฟ้าหลักของไทยจึงใช้แรงดันระดับ 230 kV และ 500 kV ในขณะที่ระบบจำหน่ายลดระดับลงมาเหลือ 22 kV หรือ 33 kV ก่อนถึงผู้ใช้ไฟฟ้า', true, true
from categories c
where c.branch_id = '448937cf-58c5-4007-b57b-6a8bcf46c2fe' and c.code = 'power_systems'
  and not exists (
    select 1 from questions q2
    where q2.category_id = c.id and q2.question = 'เหตุใดระบบส่งไฟฟ้าระยะไกลจึงนิยมใช้แรงดันไฟฟ้าสูงมาก แทนที่จะส่งด้วยแรงดันต่ำ'
  );
insert into questions (category_id, question, answer, explanation, is_active, needs_review)
select c.id, 'ระบบต่อหน่วย (Per-Unit System) ในการวิเคราะห์ระบบไฟฟ้ากำลังคืออะไร และมีประโยชน์อย่างไร', 'เป็นระบบที่แสดงค่าปริมาณไฟฟ้า (แรงดัน กระแส กำลัง อิมพีแดนซ์) เป็นสัดส่วนเทียบกับค่าฐานอ้างอิง (Base Value) ที่กำหนดไว้ แทนการใช้หน่วยจริง ทำให้การคำนวณในระบบที่มีหม้อแปลงหลายระดับแรงดันง่ายขึ้นมาก', 'ข้อดีสำคัญคือค่าอิมพีแดนซ์ต่อหน่วยของหม้อแปลงจะไม่เปลี่ยนแปลงไม่ว่าจะมองจากด้านปฐมภูมิหรือทุติยภูมิ ทำให้ไม่ต้องแปลงค่าอิมพีแดนซ์ข้ามระดับแรงดันเหมือนการคำนวณด้วยหน่วยจริง', true, true
from categories c
where c.branch_id = '448937cf-58c5-4007-b57b-6a8bcf46c2fe' and c.code = 'power_systems'
  and not exists (
    select 1 from questions q2
    where q2.category_id = c.id and q2.question = 'ระบบต่อหน่วย (Per-Unit System) ในการวิเคราะห์ระบบไฟฟ้ากำลังคืออะไร และมีประโยชน์อย่างไร'
  );
insert into questions (category_id, question, answer, explanation, is_active, needs_review)
select c.id, 'การไหลของกำลังไฟฟ้า (Load Flow / Power Flow Analysis) มีวัตถุประสงค์หลักอะไรในการวางแผนระบบไฟฟ้ากำลัง', 'ใช้คำนวณขนาดแรงดัน มุมเฟส และการไหลของกำลังไฟฟ้าที่แต่ละจุดต่อ (Bus) ในระบบภายใต้สภาวะการทำงานปกติ เพื่อตรวจสอบว่าระบบทำงานอยู่ในเกณฑ์ที่ยอมรับได้ เช่น แรงดันไม่ต่ำหรือสูงเกินไป และสายส่งไม่มีกระแสไหลเกินพิกัด', 'ผลการวิเคราะห์ Load Flow ใช้เป็นพื้นฐานสำคัญในการวางแผนขยายระบบ การเลือกขนาดอุปกรณ์ และการวิเคราะห์เสถียรภาพของระบบไฟฟ้ากำลังต่อไป', true, true
from categories c
where c.branch_id = '448937cf-58c5-4007-b57b-6a8bcf46c2fe' and c.code = 'power_systems'
  and not exists (
    select 1 from questions q2
    where q2.category_id = c.id and q2.question = 'การไหลของกำลังไฟฟ้า (Load Flow / Power Flow Analysis) มีวัตถุประสงค์หลักอะไรในการวางแผนระบบไฟฟ้ากำลัง'
  );
insert into questions (category_id, question, answer, explanation, is_active, needs_review)
select c.id, 'เหตุใดสายส่งไฟฟ้าแรงสูงจึงมักออกแบบให้มีการสับเปลี่ยนตำแหน่งสาย (Transposition) ตลอดความยาวสาย', 'เพื่อให้ค่าอิมพีแดนซ์ของแต่ละเฟสมีความสมดุลใกล้เคียงกัน เนื่องจากในทางปฏิบัติสายไฟแต่ละเฟสมีระยะห่างจากพื้นดินและจากกันไม่เท่ากัน ทำให้ค่าความเหนี่ยวนำและความจุของแต่ละเฟสต่างกันหากไม่มีการสับเปลี่ยนตำแหน่ง', 'ความไม่สมดุลของอิมพีแดนซ์ระหว่างเฟสอาจทำให้เกิดแรงดันไม่สมดุล (Voltage Unbalance) ที่ปลายทาง ซึ่งเป็นอันตรายต่ออุปกรณ์ไฟฟ้าโดยเฉพาะมอเตอร์เหนี่ยวนำ', true, true
from categories c
where c.branch_id = '448937cf-58c5-4007-b57b-6a8bcf46c2fe' and c.code = 'power_systems'
  and not exists (
    select 1 from questions q2
    where q2.category_id = c.id and q2.question = 'เหตุใดสายส่งไฟฟ้าแรงสูงจึงมักออกแบบให้มีการสับเปลี่ยนตำแหน่งสาย (Transposition) ตลอดความยาวสาย'
  );
insert into questions (category_id, question, answer, explanation, is_active, needs_review)
select c.id, 'ตัวประกอบส่วนประกอบสมมาตร (Symmetrical Components) แบ่งกระแสหรือแรงดันไม่สมดุลออกเป็นกี่ลำดับ และแต่ละลำดับมีความหมายอย่างไร', 'แบ่งเป็น 3 ลำดับคือ ลำดับบวก (Positive Sequence) ที่หมุนตามลำดับเฟสปกติ ลำดับลบ (Negative Sequence) ที่หมุนย้อนลำดับเฟส และลำดับศูนย์ (Zero Sequence) ที่มีเฟสตรงกันทั้งสามเฟส', 'เทคนิคนี้ใช้แปลงระบบ 3 เฟสไม่สมดุลที่วิเคราะห์ยาก ให้เป็นวงจร 3 วงจรลำดับที่สมดุลและวิเคราะห์แยกจากกันได้ง่ายขึ้น เป็นพื้นฐานสำคัญในการวิเคราะห์ความผิดพร่องแบบไม่สมมาตร เช่น ลัดวงจรเฟสเดียวลงดิน', true, true
from categories c
where c.branch_id = '448937cf-58c5-4007-b57b-6a8bcf46c2fe' and c.code = 'power_systems'
  and not exists (
    select 1 from questions q2
    where q2.category_id = c.id and q2.question = 'ตัวประกอบส่วนประกอบสมมาตร (Symmetrical Components) แบ่งกระแสหรือแรงดันไม่สมดุลออกเป็นกี่ลำดับ และแต่ละลำดับมีความหมายอย่างไร'
  );
insert into questions (category_id, question, answer, explanation, is_active, needs_review)
select c.id, 'ความผิดพร่องแบบสมมาตร (Symmetrical Fault) และแบบไม่สมมาตร (Unsymmetrical Fault) แตกต่างกันอย่างไร พร้อมยกตัวอย่าง', 'ความผิดพร่องแบบสมมาตรส่งผลกระทบต่อทั้ง 3 เฟสเท่าๆ กัน เช่น ลัดวงจร 3 เฟสพร้อมกัน ส่วนความผิดพร่องแบบไม่สมมาตรส่งผลกระทบไม่เท่ากันในแต่ละเฟส เช่น ลัดวงจรเฟสเดียวลงดิน ลัดวงจรเฟสต่อเฟส หรือลัดวงจรสองเฟสลงดิน', 'ในทางปฏิบัติความผิดพร่องแบบเฟสเดียวลงดินเกิดขึ้นบ่อยที่สุด (ประมาณ 70-80% ของความผิดพร่องทั้งหมด) ขณะที่ความผิดพร่อง 3 เฟสแม้เกิดน้อยแต่มักให้กระแสลัดวงจรสูงสุด จึงมักใช้เป็นกรณีอ้างอิงในการเลือกพิกัดตัดกระแสของเซอร์กิตเบรกเกอร์', true, true
from categories c
where c.branch_id = '448937cf-58c5-4007-b57b-6a8bcf46c2fe' and c.code = 'power_systems'
  and not exists (
    select 1 from questions q2
    where q2.category_id = c.id and q2.question = 'ความผิดพร่องแบบสมมาตร (Symmetrical Fault) และแบบไม่สมมาตร (Unsymmetrical Fault) แตกต่างกันอย่างไร พร้อมยกตัวอย่าง'
  );
insert into questions (category_id, question, answer, explanation, is_active, needs_review)
select c.id, 'เสถียรภาพของระบบไฟฟ้ากำลัง (Power System Stability) หมายถึงอะไร และแบ่งเป็นกี่ประเภทหลัก', 'หมายถึงความสามารถของระบบไฟฟ้ากำลังในการกลับคืนสู่สภาวะสมดุลได้หลังจากถูกรบกวน แบ่งเป็น 3 ประเภทหลักคือ เสถียรภาพเชิงมุม (Angle Stability), เสถียรภาพเชิงแรงดัน (Voltage Stability) และเสถียรภาพเชิงความถี่ (Frequency Stability)', 'เสถียรภาพเชิงมุมเกี่ยวข้องกับความสามารถของเครื่องกำเนิดไฟฟ้าซิงโครนัสในการรักษาการซิงโครไนซ์กันหลังเกิดการรบกวน ซึ่งเป็นประเด็นสำคัญมากในระบบที่มีสายส่งยาวและโรงไฟฟ้ากระจายตัว', true, true
from categories c
where c.branch_id = '448937cf-58c5-4007-b57b-6a8bcf46c2fe' and c.code = 'power_systems'
  and not exists (
    select 1 from questions q2
    where q2.category_id = c.id and q2.question = 'เสถียรภาพของระบบไฟฟ้ากำลัง (Power System Stability) หมายถึงอะไร และแบ่งเป็นกี่ประเภทหลัก'
  );
insert into questions (category_id, question, answer, explanation, is_active, needs_review)
select c.id, 'การควบคุมความถี่ในระบบไฟฟ้ากำลังเกี่ยวข้องกับสมดุลระหว่างสิ่งใด', 'เกี่ยวข้องกับสมดุลระหว่างกำลังไฟฟ้าที่ผลิตได้กับกำลังไฟฟ้าที่ถูกใช้งาน (Load) หากกำลังผลิตมากกว่าโหลด ความถี่จะสูงขึ้น หากกำลังผลิตน้อยกว่าโหลด ความถี่จะลดลง', 'ระบบควบคุมอัตโนมัติ (Automatic Generation Control หรือ AGC) จะปรับกำลังผลิตของโรงไฟฟ้าอย่างต่อเนื่องเพื่อรักษาความถี่ให้อยู่ในเกณฑ์มาตรฐาน เช่น 50 Hz ± ค่าเบี่ยงเบนที่ยอมรับได้สำหรับระบบไฟฟ้าไทย', true, true
from categories c
where c.branch_id = '448937cf-58c5-4007-b57b-6a8bcf46c2fe' and c.code = 'power_systems'
  and not exists (
    select 1 from questions q2
    where q2.category_id = c.id and q2.question = 'การควบคุมความถี่ในระบบไฟฟ้ากำลังเกี่ยวข้องกับสมดุลระหว่างสิ่งใด'
  );
insert into questions (category_id, question, answer, explanation, is_active, needs_review)
select c.id, 'เหตุใดการควบคุมแรงดันในระบบไฟฟ้ากำลังจึงมีความสัมพันธ์ใกล้ชิดกับการควบคุมกำลังไฟฟ้ารีแอคทีฟมากกว่ากำลังไฟฟ้าจริง', 'เพราะในสายส่งไฟฟ้าแรงสูงที่มีค่ารีแอคแตนซ์สูงกว่าความต้านทานมาก การเปลี่ยนแปลงกำลังไฟฟ้ารีแอคทีฟจะมีผลกระทบต่อขนาดแรงดัน (Voltage Magnitude) มากกว่ามุมเฟส ในขณะที่กำลังไฟฟ้าจริงมีผลกระทบต่อมุมเฟสมากกว่าขนาดแรงดัน', 'หลักการนี้เป็นพื้นฐานของการควบคุมระบบไฟฟ้ากำลังแบบแยกส่วน (Decoupled Control) ที่ควบคุมแรงดันด้วยการปรับกำลังรีแอคทีฟ และควบคุมความถี่ด้วยการปรับกำลังไฟฟ้าจริงแยกจากกัน', true, true
from categories c
where c.branch_id = '448937cf-58c5-4007-b57b-6a8bcf46c2fe' and c.code = 'power_systems'
  and not exists (
    select 1 from questions q2
    where q2.category_id = c.id and q2.question = 'เหตุใดการควบคุมแรงดันในระบบไฟฟ้ากำลังจึงมีความสัมพันธ์ใกล้ชิดกับการควบคุมกำลังไฟฟ้ารีแอคทีฟมากกว่ากำลังไฟฟ้าจริง'
  );
insert into questions (category_id, question, answer, explanation, is_active, needs_review)
select c.id, 'อุปกรณ์ชดเชยกำลังไฟฟ้ารีแอคทีฟ เช่น Shunt Capacitor Bank มีบทบาทอย่างไรในระบบส่งและจำหน่ายไฟฟ้า', 'ช่วยจ่ายกำลังไฟฟ้ารีแอคทีฟให้กับระบบ ลดภาระที่แหล่งจ่ายต้นทางต้องส่งกำลังรีแอคทีฟผ่านสายส่งระยะไกล ทำให้ปรับปรุงระดับแรงดันและลดการสูญเสียพลังงานในสายส่ง', 'ในทางกลับกัน Shunt Reactor ใช้ดูดซับกำลังไฟฟ้ารีแอคทีฟส่วนเกิน ซึ่งมักติดตั้งในสายส่งระยะไกลที่มีค่าความจุสายสูง เพื่อป้องกันแรงดันเกินในช่วงที่โหลดต่ำ', true, true
from categories c
where c.branch_id = '448937cf-58c5-4007-b57b-6a8bcf46c2fe' and c.code = 'power_systems'
  and not exists (
    select 1 from questions q2
    where q2.category_id = c.id and q2.question = 'อุปกรณ์ชดเชยกำลังไฟฟ้ารีแอคทีฟ เช่น Shunt Capacitor Bank มีบทบาทอย่างไรในระบบส่งและจำหน่ายไฟฟ้า'
  );
insert into questions (category_id, question, answer, explanation, is_active, needs_review)
select c.id, 'เหตุใดระบบไฟฟ้ากำลังจึงต้องมีระบบสำรอง (Reserve Margin) ของกำลังผลิตไฟฟ้า', 'เพื่อรองรับสถานการณ์ที่โรงไฟฟ้าบางแห่งหยุดทำงานกะทันหันหรือหยุดซ่อมบำรุงตามแผน รวมถึงรองรับความต้องการใช้ไฟฟ้าที่อาจสูงกว่าที่คาดการณ์ไว้ในบางช่วงเวลา เพื่อรักษาความมั่นคงของระบบไฟฟ้าโดยรวม', 'การกำหนดปริมาณสำรองที่เหมาะสมต้องสมดุลระหว่างความมั่นคงของระบบกับต้นทุนการลงทุนก่อสร้างโรงไฟฟ้าสำรองที่อาจไม่ได้ใช้งานเต็มกำลังตลอดเวลา', true, true
from categories c
where c.branch_id = '448937cf-58c5-4007-b57b-6a8bcf46c2fe' and c.code = 'power_systems'
  and not exists (
    select 1 from questions q2
    where q2.category_id = c.id and q2.question = 'เหตุใดระบบไฟฟ้ากำลังจึงต้องมีระบบสำรอง (Reserve Margin) ของกำลังผลิตไฟฟ้า'
  );
insert into questions (category_id, question, answer, explanation, is_active, needs_review)
select c.id, 'การจ่ายไฟฟ้าแบบประหยัด (Economic Dispatch) มีหลักการพื้นฐานอย่างไรในการจัดสรรกำลังผลิตระหว่างโรงไฟฟ้าหลายแห่ง', 'จัดสรรกำลังผลิตให้แต่ละโรงไฟฟ้าในสัดส่วนที่ทำให้ต้นทุนการผลิตไฟฟ้ารวมของทั้งระบบต่ำที่สุด โดยพิจารณาจากต้นทุนเพิ่ม (Incremental Cost) ของแต่ละโรงไฟฟ้า ให้โรงไฟฟ้าที่มีต้นทุนเพิ่มต่ำกว่าเดินเครื่องผลิตมากกว่า', 'ในทางปฏิบัติการจัดสรรยังต้องพิจารณาข้อจำกัดด้านการส่งไฟฟ้า (Transmission Constraint) ควบคู่ไปด้วย ไม่ใช่พิจารณาต้นทุนเพียงอย่างเดียว เพื่อไม่ให้สายส่งบางเส้นทางรับภาระเกินพิกัด', true, true
from categories c
where c.branch_id = '448937cf-58c5-4007-b57b-6a8bcf46c2fe' and c.code = 'power_systems'
  and not exists (
    select 1 from questions q2
    where q2.category_id = c.id and q2.question = 'การจ่ายไฟฟ้าแบบประหยัด (Economic Dispatch) มีหลักการพื้นฐานอย่างไรในการจัดสรรกำลังผลิตระหว่างโรงไฟฟ้าหลายแห่ง'
  );
insert into questions (category_id, question, answer, explanation, is_active, needs_review)
select c.id, 'HVDC (High Voltage Direct Current) แตกต่างจากระบบส่งไฟฟ้ากระแสสลับทั่วไปอย่างไร และเหมาะกับการใช้งานลักษณะใด', 'HVDC ส่งไฟฟ้าด้วยกระแสตรงแรงดันสูง โดยแปลงจากกระแสสลับเป็นกระแสตรงที่ปลายทางหนึ่งด้วยสถานีแปลงผัน แล้วแปลงกลับเป็นกระแสสลับที่ปลายทางอีกฝั่งหนึ่ง เหมาะกับการส่งไฟฟ้าระยะไกลมากหรือการเชื่อมโยงระบบไฟฟ้าที่มีความถี่ต่างกัน', 'ข้อดีของ HVDC คือไม่มีปัญหาเรื่องมุมเฟสและความจุสายที่จำกัดระยะทางการส่งเหมือนระบบกระแสสลับ แต่ต้องแลกกับต้นทุนสถานีแปลงผันที่สูง จึงคุ้มค่าเฉพาะการส่งระยะไกลมากหรือการเชื่อมโยงใต้น้ำ', true, true
from categories c
where c.branch_id = '448937cf-58c5-4007-b57b-6a8bcf46c2fe' and c.code = 'power_systems'
  and not exists (
    select 1 from questions q2
    where q2.category_id = c.id and q2.question = 'HVDC (High Voltage Direct Current) แตกต่างจากระบบส่งไฟฟ้ากระแสสลับทั่วไปอย่างไร และเหมาะกับการใช้งานลักษณะใด'
  );
insert into questions (category_id, question, answer, explanation, is_active, needs_review)
select c.id, 'Ferranti Effect ในสายส่งไฟฟ้าระยะไกลคืออะไร และเกิดขึ้นในสภาวะใด', 'คือปรากฏการณ์ที่แรงดันไฟฟ้าปลายสายส่งสูงกว่าแรงดันต้นทาง เกิดขึ้นในสภาวะที่สายส่งมีโหลดต่ำหรือไม่มีโหลด (Light Load หรือ No Load) โดยเฉพาะในสายส่งที่มีความยาวมาก เนื่องจากผลของความจุกระจายในสายส่ง (Line Capacitance) มีนัยสำคัญมากกว่าความเหนี่ยวนำในสภาวะนี้', 'ปรากฏการณ์นี้เป็นสาเหตุหนึ่งที่ต้องติดตั้ง Shunt Reactor ในสายส่งระยะไกล เพื่อป้องกันแรงดันเกินที่ปลายสายในช่วงที่มีโหลดต่ำ', true, true
from categories c
where c.branch_id = '448937cf-58c5-4007-b57b-6a8bcf46c2fe' and c.code = 'power_systems'
  and not exists (
    select 1 from questions q2
    where q2.category_id = c.id and q2.question = 'Ferranti Effect ในสายส่งไฟฟ้าระยะไกลคืออะไร และเกิดขึ้นในสภาวะใด'
  );
insert into questions (category_id, question, answer, explanation, is_active, needs_review)
select c.id, 'เหตุใดในการวางแผนระบบไฟฟ้ากำลังจึงต้องพิจารณาการวิเคราะห์กระแสลัดวงจร (Short Circuit Analysis) ควบคู่กับ Load Flow Analysis', 'Load Flow Analysis ใช้ตรวจสอบสภาวะการทำงานปกติของระบบ ในขณะที่ Short Circuit Analysis ใช้คำนวณขนาดกระแสลัดวงจรที่อาจเกิดขึ้นในสภาวะผิดปกติ ซึ่งจำเป็นสำหรับการเลือกพิกัดตัดกระแส (Interrupting Capacity) ของเซอร์กิตเบรกเกอร์และการตั้งค่ารีเลย์ป้องกันให้เหมาะสม', 'หากเลือกพิกัดเซอร์กิตเบรกเกอร์โดยไม่ได้คำนวณกระแสลัดวงจรสูงสุดที่อาจเกิดขึ้นอย่างถูกต้อง อาจทำให้อุปกรณ์ไม่สามารถตัดกระแสลัดวงจรได้ทัน ก่อให้เกิดความเสียหายรุนแรงต่อระบบ', true, true
from categories c
where c.branch_id = '448937cf-58c5-4007-b57b-6a8bcf46c2fe' and c.code = 'power_systems'
  and not exists (
    select 1 from questions q2
    where q2.category_id = c.id and q2.question = 'เหตุใดในการวางแผนระบบไฟฟ้ากำลังจึงต้องพิจารณาการวิเคราะห์กระแสลัดวงจร (Short Circuit Analysis) ควบคู่กับ Load Flow Analysis'
  );
insert into questions (category_id, question, answer, explanation, is_active, needs_review)
select c.id, 'ระบบสายส่งไฟฟ้าแบบวงแหวน (Ring Main) แตกต่างจากระบบแบบสายเดี่ยว (Radial) อย่างไร ในแง่ความมั่นคงของระบบ', 'ระบบวงแหวนมีเส้นทางจ่ายไฟฟ้ามากกว่า 1 เส้นทางไปยังจุดโหลดเดียวกัน ทำให้เมื่อสายส่วนใดเกิดความผิดพร่อง ยังสามารถจ่ายไฟฟ้าต่อได้จากอีกเส้นทาง ต่างจากระบบสายเดี่ยวที่หากสายส่วนใดขัดข้อง โหลดปลายทางจากจุดนั้นจะไฟดับทันที', 'ระบบวงแหวนมีความมั่นคงสูงกว่าแต่ก็มีต้นทุนการติดตั้งสูงกว่าและซับซ้อนกว่าในการควบคุมป้องกัน จึงมักใช้ในพื้นที่ที่มีความสำคัญสูงหรือความหนาแน่นของโหลดมาก เช่น ใจกลางเมือง', true, true
from categories c
where c.branch_id = '448937cf-58c5-4007-b57b-6a8bcf46c2fe' and c.code = 'power_systems'
  and not exists (
    select 1 from questions q2
    where q2.category_id = c.id and q2.question = 'ระบบสายส่งไฟฟ้าแบบวงแหวน (Ring Main) แตกต่างจากระบบแบบสายเดี่ยว (Radial) อย่างไร ในแง่ความมั่นคงของระบบ'
  );
insert into questions (category_id, question, answer, explanation, is_active, needs_review)
select c.id, 'เหตุใดระบบจำหน่ายไฟฟ้าในเมืองใหญ่จึงมีแนวโน้มเปลี่ยนจากสายอากาศ (Overhead Line) เป็นสายใต้ดิน (Underground Cable) มากขึ้น', 'สายใต้ดินมีความมั่นคงสูงกว่าเพราะไม่ได้รับผลกระทบจากสภาพอากาศ ต้นไม้ล้มทับ หรืออุบัติเหตุยานพาหนะ อีกทั้งยังช่วยปรับปรุงทัศนียภาพของเมือง แม้จะมีต้นทุนการติดตั้งสูงกว่าสายอากาศมากก็ตาม', 'อย่างไรก็ตาม สายใต้ดินมีข้อจำกัดคือค้นหาและซ่อมแซมจุดความผิดพร่องได้ยากกว่าและใช้เวลานานกว่าสายอากาศ รวมถึงมีค่าความจุสายสูงกว่าซึ่งอาจต้องพิจารณาผลกระทบต่อกำลังไฟฟ้ารีแอคทีฟในระบบ', true, true
from categories c
where c.branch_id = '448937cf-58c5-4007-b57b-6a8bcf46c2fe' and c.code = 'power_systems'
  and not exists (
    select 1 from questions q2
    where q2.category_id = c.id and q2.question = 'เหตุใดระบบจำหน่ายไฟฟ้าในเมืองใหญ่จึงมีแนวโน้มเปลี่ยนจากสายอากาศ (Overhead Line) เป็นสายใต้ดิน (Underground Cable) มากขึ้น'
  );
insert into questions (category_id, question, answer, explanation, is_active, needs_review)
select c.id, 'การจัดโครงข่ายระบบจำหน่ายไฟฟ้าแบบ Loop ที่เปิดวงจร (Open Loop) มีข้อดีอย่างไรเมื่อเทียบกับระบบสายเดี่ยวธรรมดา', 'ระบบ Open Loop เดินสายเป็นวงแหวนทางกายภาพแต่เปิดสวิตช์ไว้จุดหนึ่งเพื่อให้ทำงานเสมือนระบบสายเดี่ยวในสภาวะปกติ เมื่อเกิดความผิดพร่องในส่วนใด สามารถแยกส่วนที่เสียหายออกแล้วปิดสวิตช์จุดที่เปิดไว้ เพื่อจ่ายไฟฟ้าให้โหลดที่เหลือได้จากอีกทิศทางหนึ่งอย่างรวดเร็ว', 'วิธีนี้ให้ความยืดหยุ่นในการจ่ายไฟฟ้าใกล้เคียงกับระบบวงแหวนเต็มรูปแบบ แต่ใช้อุปกรณ์ป้องกันที่ง่ายและราคาถูกกว่า เนื่องจากในสภาวะปกติกระแสไหลทิศทางเดียวเหมือนระบบสายเดี่ยว', true, true
from categories c
where c.branch_id = '448937cf-58c5-4007-b57b-6a8bcf46c2fe' and c.code = 'power_systems'
  and not exists (
    select 1 from questions q2
    where q2.category_id = c.id and q2.question = 'การจัดโครงข่ายระบบจำหน่ายไฟฟ้าแบบ Loop ที่เปิดวงจร (Open Loop) มีข้อดีอย่างไรเมื่อเทียบกับระบบสายเดี่ยวธรรมดา'
  );
insert into questions (category_id, question, answer, explanation, is_active, needs_review)
select c.id, 'การประสานงานอุปกรณ์ป้องกัน (Protection Coordination) ในระบบไฟฟ้ากำลังมีวัตถุประสงค์อะไร', 'เพื่อให้อุปกรณ์ป้องกันที่อยู่ใกล้จุดเกิดความผิดพร่องมากที่สุดทำงานตัดวงจรก่อน (Selectivity) โดยไม่ให้อุปกรณ์ป้องกันต้นทางที่ห่างออกไปตัดวงจรพร้อมกันหรือก่อน ซึ่งจะทำให้พื้นที่ไฟดับกว้างเกินความจำเป็น', 'การประสานงานที่ดีอาศัยการตั้งค่าระยะเวลาหน่วง (Time Delay) และขนาดกระแสตั้งค่า (Pickup Current) ของอุปกรณ์ป้องกันแต่ละชั้นให้มีลำดับความสัมพันธ์ที่เหมาะสมตลอดทั้งระบบ', true, true
from categories c
where c.branch_id = '448937cf-58c5-4007-b57b-6a8bcf46c2fe' and c.code = 'power_systems'
  and not exists (
    select 1 from questions q2
    where q2.category_id = c.id and q2.question = 'การประสานงานอุปกรณ์ป้องกัน (Protection Coordination) ในระบบไฟฟ้ากำลังมีวัตถุประสงค์อะไร'
  );
insert into questions (category_id, question, answer, explanation, is_active, needs_review)
select c.id, 'Recloser ในระบบจำหน่ายไฟฟ้าทำงานแตกต่างจากเซอร์กิตเบรกเกอร์ทั่วไปอย่างไร', 'Recloser มีความสามารถในการตัดวงจรแล้วสั่งปิดวงจรกลับอัตโนมัติ (Auto-reclose) หลังจากช่วงเวลาสั้นๆ เพื่อทดสอบว่าความผิดพร่องนั้นเป็นแบบชั่วคราว (Temporary Fault) หรือถาวร (Permanent Fault) หากยังพบความผิดพร่องซ้ำจึงจะตัดวงจรค้างไว้ถาวร', 'ความผิดพร่องในระบบจำหน่ายไฟฟ้าส่วนใหญ่มักเป็นแบบชั่วคราว เช่น กิ่งไม้แตะสายไฟชั่วขณะ Recloser จึงช่วยลดระยะเวลาไฟดับให้ผู้ใช้ไฟฟ้าได้มากโดยไม่ต้องรอเจ้าหน้าที่มาปิดสวิตช์ด้วยมือ', true, true
from categories c
where c.branch_id = '448937cf-58c5-4007-b57b-6a8bcf46c2fe' and c.code = 'power_systems'
  and not exists (
    select 1 from questions q2
    where q2.category_id = c.id and q2.question = 'Recloser ในระบบจำหน่ายไฟฟ้าทำงานแตกต่างจากเซอร์กิตเบรกเกอร์ทั่วไปอย่างไร'
  );
insert into questions (category_id, question, answer, explanation, is_active, needs_review)
select c.id, 'การแก้ไขปัญหาแรงดันตกในสายจำหน่ายไฟฟ้าระยะไกล สามารถทำได้ด้วยวิธีใดบ้าง', 'สามารถทำได้หลายวิธี เช่น เพิ่มขนาดหน้าตัดสายไฟเพื่อลดความต้านทาน ติดตั้งตัวเก็บประจุชดเชยกำลังไฟฟ้ารีแอคทีฟ ติดตั้งหม้อแปลงปรับแรงดัน (Voltage Regulator) หรือแบ่งจุดจ่ายไฟให้ใกล้กับโหลดมากขึ้นเพื่อลดระยะทางการส่ง', 'การเลือกวิธีที่เหมาะสมขึ้นอยู่กับความคุ้มค่าทางเศรษฐศาสตร์และลักษณะทางกายภาพของพื้นที่ เช่น หากโหลดกระจายตัวตลอดแนวสาย การเพิ่มขนาดสายอาจคุ้มค่ากว่าการติดตั้งอุปกรณ์ปรับแรงดันเพิ่มเติม', true, true
from categories c
where c.branch_id = '448937cf-58c5-4007-b57b-6a8bcf46c2fe' and c.code = 'power_systems'
  and not exists (
    select 1 from questions q2
    where q2.category_id = c.id and q2.question = 'การแก้ไขปัญหาแรงดันตกในสายจำหน่ายไฟฟ้าระยะไกล สามารถทำได้ด้วยวิธีใดบ้าง'
  );
insert into questions (category_id, question, answer, explanation, is_active, needs_review)
select c.id, 'Distributed Generation (DG) หรือการผลิตไฟฟ้าแบบกระจายตัว ส่งผลกระทบต่อการออกแบบระบบป้องกันของระบบจำหน่ายไฟฟ้าอย่างไร', 'ระบบจำหน่ายไฟฟ้าดั้งเดิมออกแบบมาสำหรับกระแสไหลทิศทางเดียวจากสถานีไฟฟ้าไปยังผู้ใช้ไฟฟ้า แต่เมื่อมี DG เชื่อมต่อ กระแสอาจไหลย้อนทิศทางได้ในบางสภาวะ ทำให้การตั้งค่าอุปกรณ์ป้องกันแบบเดิมที่พิจารณาทิศทางกระแสทางเดียวอาจไม่เหมาะสมอีกต่อไป', 'ปัญหานี้เป็นความท้าทายสำคัญของระบบไฟฟ้าสมัยใหม่ที่มีการติดตั้งพลังงานแสงอาทิตย์บนหลังคาจำนวนมาก ต้องมีการทบทวนออกแบบระบบป้องกันให้รองรับกระแสไหลสองทิศทางได้', true, true
from categories c
where c.branch_id = '448937cf-58c5-4007-b57b-6a8bcf46c2fe' and c.code = 'power_systems'
  and not exists (
    select 1 from questions q2
    where q2.category_id = c.id and q2.question = 'Distributed Generation (DG) หรือการผลิตไฟฟ้าแบบกระจายตัว ส่งผลกระทบต่อการออกแบบระบบป้องกันของระบบจำหน่ายไฟฟ้าอย่างไร'
  );
insert into questions (category_id, question, answer, explanation, is_active, needs_review)
select c.id, 'เหตุใดระบบไฟฟ้ากำลังจึงมีความจำเป็นต้องมีระบบตรวจติดตามสภาวะแบบ SCADA (Supervisory Control and Data Acquisition)', 'เพื่อให้ศูนย์ควบคุมสามารถตรวจสอบสถานะการทำงานของระบบไฟฟ้ากำลังทั้งหมดแบบเรียลไทม์ เช่น สถานะเปิด-ปิดของอุปกรณ์ ค่าแรงดัน กระแส และกำลังไฟฟ้าที่จุดต่างๆ และสามารถสั่งควบคุมอุปกรณ์บางส่วนจากระยะไกลได้ทันที เพื่อบริหารจัดการระบบให้มีความมั่นคงและตอบสนองต่อสถานการณ์ผิดปกติได้รวดเร็ว', 'ระบบ SCADA เป็นโครงสร้างพื้นฐานสำคัญของศูนย์ควบคุมระบบไฟฟ้ากำลังสมัยใหม่ทุกระดับ ตั้งแต่ศูนย์ควบคุมระบบส่งไปจนถึงศูนย์ควบคุมระบบจำหน่ายไฟฟ้า', true, true
from categories c
where c.branch_id = '448937cf-58c5-4007-b57b-6a8bcf46c2fe' and c.code = 'power_systems'
  and not exists (
    select 1 from questions q2
    where q2.category_id = c.id and q2.question = 'เหตุใดระบบไฟฟ้ากำลังจึงมีความจำเป็นต้องมีระบบตรวจติดตามสภาวะแบบ SCADA (Supervisory Control and Data Acquisition)'
  );
insert into questions (category_id, question, answer, explanation, is_active, needs_review)
select c.id, 'การชดเชยแรงดันตกในระบบไฟฟ้ากำลังด้วยอุปกรณ์ FACTS (Flexible AC Transmission System) มีหลักการทำงานโดยรวมอย่างไร', 'อุปกรณ์ FACTS ใช้อิเล็กทรอนิกส์กำลังควบคุมพารามิเตอร์ของระบบส่งไฟฟ้าแบบไดนามิกและรวดเร็ว เช่น ควบคุมแรงดัน มุมเฟส หรืออิมพีแดนซ์ของสายส่ง เพื่อเพิ่มความสามารถในการส่งกำลังไฟฟ้าและปรับปรุงเสถียรภาพของระบบโดยไม่ต้องก่อสร้างสายส่งใหม่', 'ตัวอย่างอุปกรณ์ FACTS ที่ใช้งานทั่วไป ได้แก่ SVC (Static VAR Compensator) และ STATCOM ซึ่งช่วยควบคุมกำลังไฟฟ้ารีแอคทีฟได้อย่างรวดเร็วกว่าตัวเก็บประจุแบบสวิตช์กลไกทั่วไปมาก', true, true
from categories c
where c.branch_id = '448937cf-58c5-4007-b57b-6a8bcf46c2fe' and c.code = 'power_systems'
  and not exists (
    select 1 from questions q2
    where q2.category_id = c.id and q2.question = 'การชดเชยแรงดันตกในระบบไฟฟ้ากำลังด้วยอุปกรณ์ FACTS (Flexible AC Transmission System) มีหลักการทำงานโดยรวมอย่างไร'
  );
insert into questions (category_id, question, answer, explanation, is_active, needs_review)
select c.id, 'เหตุใดค่าตัวประกอบโหลด (Load Factor) จึงมีความสำคัญต่อการวางแผนระบบไฟฟ้ากำลัง', 'Load Factor คืออัตราส่วนระหว่างโหลดเฉลี่ยกับโหลดสูงสุดในช่วงเวลาที่พิจารณา ค่าที่สูงแสดงว่าระบบมีการใช้งานสม่ำเสมอตลอดเวลา ทำให้ใช้ประโยชน์จากโครงสร้างพื้นฐานที่ลงทุนไว้ได้อย่างมีประสิทธิภาพมากกว่าระบบที่มี Load Factor ต่ำซึ่งมีช่วงเวลาการใช้งานสูงสุดเพียงสั้นๆ', 'หากระบบมี Load Factor ต่ำ หมายความว่าต้องลงทุนก่อสร้างโครงสร้างพื้นฐานให้รองรับโหลดสูงสุดที่เกิดขึ้นเพียงช่วงเวลาสั้นๆ แต่ส่วนใหญ่ของเวลาโครงสร้างพื้นฐานนั้นถูกใช้งานต่ำกว่าพิกัดมาก ทำให้ไม่คุ้มค่าการลงทุน', true, true
from categories c
where c.branch_id = '448937cf-58c5-4007-b57b-6a8bcf46c2fe' and c.code = 'power_systems'
  and not exists (
    select 1 from questions q2
    where q2.category_id = c.id and q2.question = 'เหตุใดค่าตัวประกอบโหลด (Load Factor) จึงมีความสำคัญต่อการวางแผนระบบไฟฟ้ากำลัง'
  );
insert into questions (category_id, question, answer, explanation, is_active, needs_review)
select c.id, 'การจัดการโหลดสูงสุด (Peak Load Management) มีวิธีการหลักอะไรบ้างในการลดผลกระทบต่อระบบไฟฟ้ากำลัง', 'มีหลายวิธี เช่น การกำหนดอัตราค่าไฟฟ้าตามช่วงเวลา (Time of Use Rate) เพื่อจูงใจให้ผู้ใช้ไฟฟ้าเลื่อนการใช้งานบางส่วนออกจากช่วงโหลดสูงสุด การควบคุมโหลดโดยตรง (Direct Load Control) กับอุปกรณ์บางประเภท หรือการใช้ระบบกักเก็บพลังงาน (Energy Storage) เพื่อจ่ายไฟฟ้าเสริมในช่วงโหลดสูงสุด', 'การบริหารจัดการโหลดสูงสุดอย่างมีประสิทธิภาพช่วยลดความจำเป็นในการลงทุนก่อสร้างโรงไฟฟ้าหรือระบบส่งใหม่เพื่อรองรับโหลดสูงสุดที่เกิดขึ้นเพียงช่วงเวลาสั้นๆ ในรอบปี', true, true
from categories c
where c.branch_id = '448937cf-58c5-4007-b57b-6a8bcf46c2fe' and c.code = 'power_systems'
  and not exists (
    select 1 from questions q2
    where q2.category_id = c.id and q2.question = 'การจัดการโหลดสูงสุด (Peak Load Management) มีวิธีการหลักอะไรบ้างในการลดผลกระทบต่อระบบไฟฟ้ากำลัง'
  );
insert into questions (category_id, question, answer, explanation, is_active, needs_review)
select c.id, 'เหตุใดกระแสลัดวงจร 3 เฟส (Three-Phase Fault) จึงมักถูกใช้เป็นกรณีอ้างอิงหลักในการคำนวณพิกัดตัดกระแสของเซอร์กิตเบรกเกอร์ แม้จะเกิดขึ้นไม่บ่อยเท่าความผิดพร่องแบบอื่น', 'เพราะโดยทั่วไปความผิดพร่องแบบ 3 เฟสให้ค่ากระแสลัดวงจรสูงที่สุดในบรรดาความผิดพร่องทุกประเภทที่จุดเดียวกัน การเลือกพิกัดเซอร์กิตเบรกเกอร์ให้ทนกระแสกรณีนี้ได้ จึงมั่นใจได้ว่าจะทนความผิดพร่องประเภทอื่นที่ให้กระแสต่ำกว่าได้เช่นกัน', 'อย่างไรก็ตาม ในบางกรณี เช่น ระบบที่มีการต่อกราวด์แบบ Solid Grounding ความผิดพร่องเฟสเดียวลงดินใกล้แหล่งกำเนิดอาจให้กระแสสูงกว่าความผิดพร่อง 3 เฟสได้เช่นกัน จึงต้องคำนวณเปรียบเทียบทุกกรณีในการออกแบบจริง', true, true
from categories c
where c.branch_id = '448937cf-58c5-4007-b57b-6a8bcf46c2fe' and c.code = 'power_systems'
  and not exists (
    select 1 from questions q2
    where q2.category_id = c.id and q2.question = 'เหตุใดกระแสลัดวงจร 3 เฟส (Three-Phase Fault) จึงมักถูกใช้เป็นกรณีอ้างอิงหลักในการคำนวณพิกัดตัดกระแสของเซอร์กิตเบรกเกอร์ แม้จะเกิดขึ้นไม่บ่อยเท่าความผิดพร่องแบบอื่น'
  );
insert into questions (category_id, question, answer, explanation, is_active, needs_review)
select c.id, 'เหตุใดการวางแผนระบบไฟฟ้ากำลังระยะยาวจึงต้องพิจารณาการพยากรณ์ความต้องการใช้ไฟฟ้า (Load Forecasting) อย่างรอบคอบ', 'เพราะการลงทุนก่อสร้างโรงไฟฟ้า สายส่ง และสถานีไฟฟ้าใช้เวลาหลายปีและเงินลงทุนสูงมาก หากพยากรณ์ความต้องการต่ำเกินไป อาจทำให้ระบบไฟฟ้าไม่เพียงพอต่อความต้องการในอนาคตจนเกิดปัญหาไฟฟ้าดับ แต่หากพยากรณ์สูงเกินไป จะทำให้ลงทุนเกินความจำเป็นและเป็นภาระต้นทุนต่อระบบโดยรวม', 'การพยากรณ์ที่แม่นยำต้องพิจารณาปัจจัยหลายด้าน เช่น การเติบโตทางเศรษฐกิจ การเปลี่ยนแปลงโครงสร้างประชากร และแนวโน้มเทคโนโลยีใหม่ เช่น ยานยนต์ไฟฟ้าที่อาจเพิ่มความต้องการใช้ไฟฟ้าอย่างมีนัยสำคัญในอนาคต', true, true
from categories c
where c.branch_id = '448937cf-58c5-4007-b57b-6a8bcf46c2fe' and c.code = 'power_systems'
  and not exists (
    select 1 from questions q2
    where q2.category_id = c.id and q2.question = 'เหตุใดการวางแผนระบบไฟฟ้ากำลังระยะยาวจึงต้องพิจารณาการพยากรณ์ความต้องการใช้ไฟฟ้า (Load Forecasting) อย่างรอบคอบ'
  );
insert into questions (category_id, question, answer, explanation, is_active, needs_review)
select c.id, 'การเชื่อมต่อระบบไฟฟ้าระหว่างประเทศ (Grid Interconnection) มีประโยชน์อะไรต่อความมั่นคงของระบบไฟฟ้ากำลัง', 'ช่วยให้สามารถแลกเปลี่ยนพลังงานไฟฟ้าระหว่างประเทศได้ในช่วงที่ระบบใดระบบหนึ่งมีความต้องการสูงหรือกำลังผลิตขาดแคลน อีกทั้งยังเพิ่มความมั่นคงโดยรวมของระบบ เพราะสามารถขอความช่วยเหลือจากระบบเพื่อนบ้านได้หากเกิดเหตุฉุกเฉิน', 'อย่างไรก็ตาม การเชื่อมต่อระบบก็เพิ่มความซับซ้อนในการประสานงานควบคุมและอาจทำให้ปัญหาความไม่เสถียรในระบบหนึ่งลุกลามไปยังอีกระบบหนึ่งได้หากไม่มีมาตรการป้องกันที่เหมาะสม', true, true
from categories c
where c.branch_id = '448937cf-58c5-4007-b57b-6a8bcf46c2fe' and c.code = 'power_systems'
  and not exists (
    select 1 from questions q2
    where q2.category_id = c.id and q2.question = 'การเชื่อมต่อระบบไฟฟ้าระหว่างประเทศ (Grid Interconnection) มีประโยชน์อะไรต่อความมั่นคงของระบบไฟฟ้ากำลัง'
  );
insert into questions (category_id, question, answer, explanation, is_active, needs_review)
select c.id, 'เหตุใดในการออกแบบระบบไฟฟ้ากำลังจึงต้องพิจารณาค่าตัวประกอบความหลากหลาย (Diversity Factor) ของโหลดหลายประเภทรวมกัน', 'เพราะโหลดแต่ละประเภทมักมีช่วงเวลาการใช้งานสูงสุดไม่ตรงกัน เมื่อรวมโหลดหลายประเภทเข้าด้วยกัน ผลรวมของโหลดสูงสุดของแต่ละประเภทจะมากกว่าโหลดสูงสุดจริงที่เกิดขึ้นพร้อมกันของระบบรวม การพิจารณาตัวประกอบนี้ช่วยให้ออกแบบขนาดอุปกรณ์ได้เหมาะสมกับความเป็นจริงมากขึ้น ไม่ใหญ่เกินความจำเป็น', 'ตัวอย่างเช่น โหลดที่พักอาศัยมักสูงสุดในช่วงเย็น ในขณะที่โหลดเชิงพาณิชย์มักสูงสุดในช่วงกลางวัน เมื่อรวมทั้งสองประเภทในระบบเดียวกัน โหลดสูงสุดรวมจึงมักต่ำกว่าผลรวมของโหลดสูงสุดแยกแต่ละประเภท', true, true
from categories c
where c.branch_id = '448937cf-58c5-4007-b57b-6a8bcf46c2fe' and c.code = 'power_systems'
  and not exists (
    select 1 from questions q2
    where q2.category_id = c.id and q2.question = 'เหตุใดในการออกแบบระบบไฟฟ้ากำลังจึงต้องพิจารณาค่าตัวประกอบความหลากหลาย (Diversity Factor) ของโหลดหลายประเภทรวมกัน'
  );
insert into questions (category_id, question, answer, explanation, is_active, needs_review)
select c.id, 'การป้องกันแบบระยะทาง (Distance Protection) ที่ใช้ในสายส่งไฟฟ้าแรงสูงทำงานตามหลักการใด', 'คำนวณค่าอิมพีแดนซ์ที่วัดได้จากตำแหน่งติดตั้งรีเลย์ไปยังจุดเกิดความผิดพร่อง โดยอาศัยความสัมพันธ์ที่ว่าอิมพีแดนซ์ของสายส่งแปรผันตรงกับระยะทาง หากอิมพีแดนซ์ที่วัดได้ต่ำกว่าค่าที่ตั้งไว้ (บ่งบอกว่าความผิดพร่องอยู่ในระยะที่กำหนด) รีเลย์จะสั่งตัดวงจร', 'การป้องกันแบบนี้นิยมใช้ในสายส่งไฟฟ้าแรงสูงระยะไกล เพราะสามารถทำงานได้อย่างรวดเร็วโดยไม่ต้องอาศัยการสื่อสารกับสถานีปลายทางอีกด้าน ต่างจากการป้องกันแบบผลต่างกระแสที่ต้องมีช่องสัญญาณสื่อสารระหว่างสองปลายสาย', true, true
from categories c
where c.branch_id = '448937cf-58c5-4007-b57b-6a8bcf46c2fe' and c.code = 'power_systems'
  and not exists (
    select 1 from questions q2
    where q2.category_id = c.id and q2.question = 'การป้องกันแบบระยะทาง (Distance Protection) ที่ใช้ในสายส่งไฟฟ้าแรงสูงทำงานตามหลักการใด'
  );
insert into questions (category_id, question, answer, explanation, is_active, needs_review)
select c.id, 'เหตุใดในสภาวะฉุกเฉินที่ระบบไฟฟ้ากำลังขาดแคลนกำลังผลิตอย่างรุนแรง จึงอาจต้องมีการตัดไฟฟ้าเป็นวงรอบ (Rotating Blackout หรือ Load Shedding) แทนที่จะปล่อยให้ระบบล่มทั้งหมด', 'การตัดไฟฟ้าบางส่วนอย่างมีการควบคุมช่วยลดโหลดรวมของระบบให้สมดุลกับกำลังผลิตที่มีอยู่ ป้องกันไม่ให้ความถี่ของระบบตกต่ำจนเครื่องกำเนิดไฟฟ้าหลุดออกจากระบบเป็นลูกโซ่ (Cascading Failure) ซึ่งอาจนำไปสู่ระบบไฟฟ้าล่มทั้งหมด (Total Blackout) ที่ใช้เวลาฟื้นฟูนานกว่ามาก', 'ระบบป้องกันความถี่ต่ำ (Under-Frequency Load Shedding หรือ UFLS) เป็นมาตรการป้องกันขั้นสุดท้ายที่ออกแบบให้ตัดโหลดออกเป็นขั้นบันไดตามระดับความถี่ที่ลดลง เพื่อรักษาเสถียรภาพของระบบส่วนที่เหลือไว้ให้ได้มากที่สุด', true, true
from categories c
where c.branch_id = '448937cf-58c5-4007-b57b-6a8bcf46c2fe' and c.code = 'power_systems'
  and not exists (
    select 1 from questions q2
    where q2.category_id = c.id and q2.question = 'เหตุใดในสภาวะฉุกเฉินที่ระบบไฟฟ้ากำลังขาดแคลนกำลังผลิตอย่างรุนแรง จึงอาจต้องมีการตัดไฟฟ้าเป็นวงรอบ (Rotating Blackout หรือ Load Shedding) แทนที่จะปล่อยให้ระบบล่มทั้งหมด'
  );

commit;

-- ---------- ตรวจสอบผลลัพธ์ ----------
select c.name_th as category, count(q.id) as question_count
from categories c
left join questions q on q.category_id = c.id
where c.branch_id = '448937cf-58c5-4007-b57b-6a8bcf46c2fe' and c.code = 'power_systems'
group by c.name_th;
