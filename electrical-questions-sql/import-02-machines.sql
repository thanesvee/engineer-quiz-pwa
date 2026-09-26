-- ============================================================
-- นำเข้าคำถามสาขาไฟฟ้า หมวดที่ 2: เครื่องจักรกลไฟฟ้า (Electrical Machines)
-- ไฟล์นี้รันได้อิสระ ไม่ต้องพึ่งไฟล์อื่น (idempotent)
-- ============================================================

begin;

-- ---------- เพิ่มหมวดหมู่ ----------
insert into categories (branch_id, code, name_th, sort_order)
select '448937cf-58c5-4007-b57b-6a8bcf46c2fe', 'machines', 'เครื่องจักรกลไฟฟ้า (Electrical Machines)', 2
where not exists (
  select 1 from categories where branch_id = '448937cf-58c5-4007-b57b-6a8bcf46c2fe' and code = 'machines'
);

-- ---------- เพิ่มคำถาม (33 ข้อ) ----------
insert into questions (category_id, question, answer, explanation, is_active, needs_review)
select c.id, 'มอเตอร์เหนี่ยวนำ (Induction Motor) ทำงานตามหลักการใดในการสร้างแรงบิด', 'อาศัยสนามแม่เหล็กหมุน (Rotating Magnetic Field) ที่เกิดจากขดลวดสเตเตอร์ 3 เฟส เหนี่ยวนำให้เกิดกระแสไฟฟ้าในตัวโรเตอร์ ซึ่งกระแสนี้ทำปฏิกิริยากับสนามแม่เหล็กหมุนจนเกิดแรงบิดขับให้โรเตอร์หมุนตาม', 'เนื่องจากโรเตอร์ต้องหมุนช้ากว่าสนามแม่เหล็กหมุนเสมอ (Slip) เพื่อให้ยังคงมีการเหนี่ยวนำเกิดขึ้น มอเตอร์ชนิดนี้จึงไม่สามารถหมุนด้วยความเร็วเท่าสนามแม่เหล็กหมุน (Synchronous Speed) ได้พอดี', true, true
from categories c
where c.branch_id = '448937cf-58c5-4007-b57b-6a8bcf46c2fe' and c.code = 'machines'
  and not exists (
    select 1 from questions q2
    where q2.category_id = c.id and q2.question = 'มอเตอร์เหนี่ยวนำ (Induction Motor) ทำงานตามหลักการใดในการสร้างแรงบิด'
  );
insert into questions (category_id, question, answer, explanation, is_active, needs_review)
select c.id, 'ค่า Slip ในมอเตอร์เหนี่ยวนำคืออะไร และมีความสำคัญต่อการทำงานของมอเตอร์อย่างไร', 'Slip คือความแตกต่างระหว่างความเร็วซิงโครนัส (Synchronous Speed) กับความเร็วโรเตอร์จริง คิดเป็นสัดส่วนของความเร็วซิงโครนัส หากไม่มี Slip จะไม่มีการเหนี่ยวนำกระแสในโรเตอร์และไม่เกิดแรงบิด', 'ค่า Slip จะเปลี่ยนแปลงตามภาระที่มอเตอร์รับ ยิ่งภาระมากขึ้น Slip จะเพิ่มขึ้นตามไปด้วยเพื่อสร้างแรงบิดที่มากขึ้นชดเชย', true, true
from categories c
where c.branch_id = '448937cf-58c5-4007-b57b-6a8bcf46c2fe' and c.code = 'machines'
  and not exists (
    select 1 from questions q2
    where q2.category_id = c.id and q2.question = 'ค่า Slip ในมอเตอร์เหนี่ยวนำคืออะไร และมีความสำคัญต่อการทำงานของมอเตอร์อย่างไร'
  );
insert into questions (category_id, question, answer, explanation, is_active, needs_review)
select c.id, 'ความเร็วซิงโครนัส (Synchronous Speed) ของมอเตอร์เหนี่ยวนำขึ้นอยู่กับตัวแปรใดบ้าง', 'ขึ้นอยู่กับความถี่ของแหล่งจ่ายไฟฟ้า (f) และจำนวนขั้วแม่เหล็ก (Poles) ของมอเตอร์ โดยความเร็วซิงโครนัสแปรผันตรงกับความถี่และแปรผกผันกับจำนวนคู่ขั้ว', 'การเปลี่ยนความเร็วมอเตอร์เหนี่ยวนำในทางปฏิบัติจึงมักทำผ่านการปรับความถี่ด้วยอุปกรณ์ Variable Frequency Drive (VFD) มากกว่าการเปลี่ยนจำนวนขั้ว', true, true
from categories c
where c.branch_id = '448937cf-58c5-4007-b57b-6a8bcf46c2fe' and c.code = 'machines'
  and not exists (
    select 1 from questions q2
    where q2.category_id = c.id and q2.question = 'ความเร็วซิงโครนัส (Synchronous Speed) ของมอเตอร์เหนี่ยวนำขึ้นอยู่กับตัวแปรใดบ้าง'
  );
insert into questions (category_id, question, answer, explanation, is_active, needs_review)
select c.id, 'มอเตอร์เหนี่ยวนำแบบโรเตอร์กรงกระรอก (Squirrel Cage) และแบบโรเตอร์พันขดลวด (Wound Rotor) แตกต่างกันอย่างไร', 'โรเตอร์กรงกระรอกมีแท่งตัวนำลัดวงจรอยู่ภายในถาวร โครงสร้างแข็งแรง ราคาถูก บำรุงรักษาง่าย ส่วนโรเตอร์พันขดลวดมีขดลวดต่อผ่านวงแหวนลื่นออกมาภายนอก ทำให้สามารถต่อความต้านทานภายนอกเพื่อควบคุมแรงบิดขณะสตาร์ทได้', 'โรเตอร์พันขดลวดนิยมใช้ในงานที่ต้องการแรงบิดสตาร์ทสูงและควบคุมความเร็วได้ในช่วงหนึ่ง แต่มีราคาสูงกว่าและต้องบำรุงรักษาแปรงถ่านกับวงแหวนลื่น', true, true
from categories c
where c.branch_id = '448937cf-58c5-4007-b57b-6a8bcf46c2fe' and c.code = 'machines'
  and not exists (
    select 1 from questions q2
    where q2.category_id = c.id and q2.question = 'มอเตอร์เหนี่ยวนำแบบโรเตอร์กรงกระรอก (Squirrel Cage) และแบบโรเตอร์พันขดลวด (Wound Rotor) แตกต่างกันอย่างไร'
  );
insert into questions (category_id, question, answer, explanation, is_active, needs_review)
select c.id, 'เหตุใดมอเตอร์เหนี่ยวนำขณะสตาร์ทจึงดึงกระแสสูงกว่ากระแสพิกัดขณะทำงานปกติมาก', 'ขณะสตาร์ท โรเตอร์ยังไม่หมุน ทำให้ค่า Slip เท่ากับ 1 (สูงสุด) ความถี่เหนี่ยวนำในโรเตอร์จึงสูงเท่าความถี่แหล่งจ่าย ทำให้ค่ารีแอคแตนซ์ของโรเตอร์สูง และอิมพีแดนซ์รวมของวงจรมอเตอร์มีค่าต่ำ ส่งผลให้กระแสไหลเข้าสูงมาก', 'กระแสสตาร์ทอาจสูงถึง 5-7 เท่าของกระแสพิกัด จึงจำเป็นต้องมีวิธีลดกระแสสตาร์ท เช่น Star-Delta Starter หรือ Soft Starter สำหรับมอเตอร์ขนาดใหญ่', true, true
from categories c
where c.branch_id = '448937cf-58c5-4007-b57b-6a8bcf46c2fe' and c.code = 'machines'
  and not exists (
    select 1 from questions q2
    where q2.category_id = c.id and q2.question = 'เหตุใดมอเตอร์เหนี่ยวนำขณะสตาร์ทจึงดึงกระแสสูงกว่ากระแสพิกัดขณะทำงานปกติมาก'
  );
insert into questions (category_id, question, answer, explanation, is_active, needs_review)
select c.id, 'วิธีการสตาร์ทมอเตอร์แบบ Star-Delta มีหลักการลดกระแสสตาร์ทอย่างไร', 'เริ่มสตาร์ทมอเตอร์ด้วยการต่อขดลวดแบบสตาร์ก่อน ซึ่งทำให้แรงดันตกคร่อมแต่ละขดลวดลดลงเหลือ 1/√3 เท่า ส่งผลให้กระแสสตาร์ทลดลงเหลือประมาณ 1/3 ของการสตาร์ทแบบเดลตาโดยตรง จากนั้นเมื่อมอเตอร์หมุนเกือบเข้าสู่ความเร็วปกติจึงสลับมาต่อแบบเดลตาเพื่อให้ทำงานที่แรงดันเต็มพิกัด', 'วิธีนี้ประหยัดและใช้งานง่าย แต่แรงบิดสตาร์ทก็ลดลงตามสัดส่วนเดียวกัน จึงเหมาะกับงานที่ไม่ต้องการแรงบิดสตาร์ทสูงมาก เช่น พัดลมหรือปั๊มน้ำที่ไม่มีภาระขณะเริ่มเดินเครื่อง', true, true
from categories c
where c.branch_id = '448937cf-58c5-4007-b57b-6a8bcf46c2fe' and c.code = 'machines'
  and not exists (
    select 1 from questions q2
    where q2.category_id = c.id and q2.question = 'วิธีการสตาร์ทมอเตอร์แบบ Star-Delta มีหลักการลดกระแสสตาร์ทอย่างไร'
  );
insert into questions (category_id, question, answer, explanation, is_active, needs_review)
select c.id, 'หม้อแปลงไฟฟ้าทำงานตามหลักการใด และเหตุใดจึงใช้ได้กับไฟฟ้ากระแสสลับเท่านั้น', 'หม้อแปลงทำงานตามหลักการเหนี่ยวนำแม่เหล็กไฟฟ้า โดยกระแสสลับที่ไหลผ่านขดลวดปฐมภูมิสร้างฟลักซ์แม่เหล็กที่เปลี่ยนแปลงตลอดเวลา ฟลักซ์นี้เหนี่ยวนำแรงเคลื่อนไฟฟ้าในขดลวดทุติยภูมิ ซึ่งต้องอาศัยการเปลี่ยนแปลงของฟลักซ์แม่เหล็กตามเวลา จึงใช้ไม่ได้กับไฟฟ้ากระแสตรงที่ฟลักซ์คงที่', 'หากจ่ายไฟกระแสตรงให้หม้อแปลง จะเกิดฟลักซ์คงที่เพียงชั่วครู่ตอนเริ่มต้นเท่านั้น ไม่มีแรงเคลื่อนไฟฟ้าเหนี่ยวนำต่อเนื่อง และกระแสที่ไหลผ่านขดลวดปฐมภูมิจะสูงมากจนอาจทำให้หม้อแปลงไหม้เสียหายได้', true, true
from categories c
where c.branch_id = '448937cf-58c5-4007-b57b-6a8bcf46c2fe' and c.code = 'machines'
  and not exists (
    select 1 from questions q2
    where q2.category_id = c.id and q2.question = 'หม้อแปลงไฟฟ้าทำงานตามหลักการใด และเหตุใดจึงใช้ได้กับไฟฟ้ากระแสสลับเท่านั้น'
  );
insert into questions (category_id, question, answer, explanation, is_active, needs_review)
select c.id, 'การสูญเสียในแกนเหล็กของหม้อแปลง (Core Loss) เกิดจากสาเหตุใดบ้าง', 'เกิดจาก 2 สาเหตุหลักคือ การสูญเสียฮิสเทอรีซิส (Hysteresis Loss) จากการกลับทิศทางแม่เหล็กในแกนเหล็กซ้ำๆ และการสูญเสียกระแสไหลวน (Eddy Current Loss) จากกระแสเหนี่ยวนำที่ไหลวนอยู่ภายในแกนเหล็กเอง', 'เพื่อลด Eddy Current Loss แกนเหล็กของหม้อแปลงจึงทำจากแผ่นเหล็กบางเคลือบฉนวนวางซ้อนกัน (Laminated Core) แทนที่จะเป็นแท่งเหล็กตันชิ้นเดียว', true, true
from categories c
where c.branch_id = '448937cf-58c5-4007-b57b-6a8bcf46c2fe' and c.code = 'machines'
  and not exists (
    select 1 from questions q2
    where q2.category_id = c.id and q2.question = 'การสูญเสียในแกนเหล็กของหม้อแปลง (Core Loss) เกิดจากสาเหตุใดบ้าง'
  );
insert into questions (category_id, question, answer, explanation, is_active, needs_review)
select c.id, 'ประสิทธิภาพของหม้อแปลงไฟฟ้าคำนวณจากอัตราส่วนใด และเหตุใดจึงมีค่าสูงกว่าเครื่องจักรกลไฟฟ้าหมุนทั่วไป', 'ประสิทธิภาพคำนวณจากอัตราส่วนกำลังไฟฟ้าขาออกต่อกำลังไฟฟ้าขาเข้า หม้อแปลงมีประสิทธิภาพสูงกว่าเครื่องจักรกลหมุนเพราะไม่มีชิ้นส่วนเคลื่อนที่ จึงไม่มีการสูญเสียจากแรงเสียดทานหรือความต้านทานลม (Friction and Windage Loss)', 'หม้อแปลงไฟฟ้ากำลังขนาดใหญ่ในระบบส่งไฟฟ้ามักมีประสิทธิภาพสูงกว่า 98% ขึ้นไป', true, true
from categories c
where c.branch_id = '448937cf-58c5-4007-b57b-6a8bcf46c2fe' and c.code = 'machines'
  and not exists (
    select 1 from questions q2
    where q2.category_id = c.id and q2.question = 'ประสิทธิภาพของหม้อแปลงไฟฟ้าคำนวณจากอัตราส่วนใด และเหตุใดจึงมีค่าสูงกว่าเครื่องจักรกลไฟฟ้าหมุนทั่วไป'
  );
insert into questions (category_id, question, answer, explanation, is_active, needs_review)
select c.id, 'เครื่องกำเนิดไฟฟ้าซิงโครนัส (Synchronous Generator) รักษาความถี่ไฟฟ้าขาออกให้คงที่ได้อย่างไร', 'ต้องควบคุมความเร็วรอบของต้นกำลังขับ (Prime Mover) ให้คงที่ เนื่องจากความถี่ไฟฟ้าที่ผลิตได้แปรผันตรงกับความเร็วรอบและจำนวนขั้วแม่เหล็กของเครื่องกำเนิดไฟฟ้าโดยตรง', 'ในโรงไฟฟ้าจริงจะมีระบบควบคุมความเร็วรอบ (Governor) ทำหน้าที่รักษาความเร็วรอบของกังหันให้คงที่ แม้ภาระไฟฟ้าจะเปลี่ยนแปลงตลอดเวลา', true, true
from categories c
where c.branch_id = '448937cf-58c5-4007-b57b-6a8bcf46c2fe' and c.code = 'machines'
  and not exists (
    select 1 from questions q2
    where q2.category_id = c.id and q2.question = 'เครื่องกำเนิดไฟฟ้าซิงโครนัส (Synchronous Generator) รักษาความถี่ไฟฟ้าขาออกให้คงที่ได้อย่างไร'
  );
insert into questions (category_id, question, answer, explanation, is_active, needs_review)
select c.id, 'การขนานเครื่องกำเนิดไฟฟ้าซิงโครนัสเข้ากับระบบไฟฟ้า (Synchronization) ต้องตรวจสอบเงื่อนไขใดบ้างก่อนเชื่อมต่อ', 'ต้องให้แรงดันไฟฟ้า ความถี่ ลำดับเฟส และมุมเฟส ของเครื่องกำเนิดไฟฟ้าที่จะขนานตรงกันกับระบบไฟฟ้าที่มีอยู่แล้วทุกประการ ก่อนปิดสวิตช์เชื่อมต่อ', 'หากเงื่อนไขไม่ตรงกันขณะเชื่อมต่อ จะเกิดกระแสไหลเวียนขนาดใหญ่ทันทีระหว่างเครื่องกำเนิดไฟฟ้ากับระบบ ซึ่งอาจสร้างความเสียหายรุนแรงต่ออุปกรณ์และระบบไฟฟ้า', true, true
from categories c
where c.branch_id = '448937cf-58c5-4007-b57b-6a8bcf46c2fe' and c.code = 'machines'
  and not exists (
    select 1 from questions q2
    where q2.category_id = c.id and q2.question = 'การขนานเครื่องกำเนิดไฟฟ้าซิงโครนัสเข้ากับระบบไฟฟ้า (Synchronization) ต้องตรวจสอบเงื่อนไขใดบ้างก่อนเชื่อมต่อ'
  );
insert into questions (category_id, question, answer, explanation, is_active, needs_review)
select c.id, 'มอเตอร์ไฟฟ้ากระแสตรง (DC Motor) แบบ Shunt, Series และ Compound แตกต่างกันในลักษณะการต่อขดลวดสนามแม่เหล็กอย่างไร', 'แบบ Shunt ต่อขดลวดสนามแม่เหล็กขนานกับขดลวดอาร์เมเจอร์ แบบ Series ต่ออนุกรมกับขดลวดอาร์เมเจอร์ ส่วนแบบ Compound เป็นการผสมทั้งสองแบบเข้าด้วยกัน', 'การต่อแต่ละแบบให้คุณลักษณะแรงบิดและความเร็วที่แตกต่างกัน ทำให้เหมาะกับงานที่ต้องการคุณสมบัติต่างกัน เช่น Series Motor ให้แรงบิดสตาร์ทสูงมาก เหมาะกับงานยกของหนัก', true, true
from categories c
where c.branch_id = '448937cf-58c5-4007-b57b-6a8bcf46c2fe' and c.code = 'machines'
  and not exists (
    select 1 from questions q2
    where q2.category_id = c.id and q2.question = 'มอเตอร์ไฟฟ้ากระแสตรง (DC Motor) แบบ Shunt, Series และ Compound แตกต่างกันในลักษณะการต่อขดลวดสนามแม่เหล็กอย่างไร'
  );
insert into questions (category_id, question, answer, explanation, is_active, needs_review)
select c.id, 'เหตุใดมอเตอร์ไฟฟ้ากระแสตรงแบบ Series จึงไม่ควรปล่อยให้ทำงานโดยไม่มีภาระ (No Load)', 'เพราะกระแสสนามแม่เหล็กของมอเตอร์แบบ Series ขึ้นอยู่กับกระแสอาร์เมเจอร์โดยตรง เมื่อไม่มีภาระ กระแสจะต่ำมากทำให้สนามแม่เหล็กอ่อน ส่งผลให้มอเตอร์หมุนด้วยความเร็วสูงมากจนอาจเกิดความเสียหายทางกลไก (Runaway Speed)', 'ด้วยเหตุนี้มอเตอร์แบบ Series จึงมักถูกต่อเชื่อมกับภาระโดยตรงถาวร เช่น ในระบบขับเคลื่อนรถไฟฟ้า ไม่ใช้สายพานหรือคลัตช์ที่อาจหลุดออกได้', true, true
from categories c
where c.branch_id = '448937cf-58c5-4007-b57b-6a8bcf46c2fe' and c.code = 'machines'
  and not exists (
    select 1 from questions q2
    where q2.category_id = c.id and q2.question = 'เหตุใดมอเตอร์ไฟฟ้ากระแสตรงแบบ Series จึงไม่ควรปล่อยให้ทำงานโดยไม่มีภาระ (No Load)'
  );
insert into questions (category_id, question, answer, explanation, is_active, needs_review)
select c.id, 'แปรงถ่านและคอมมิวเตเตอร์ (Brush and Commutator) ในมอเตอร์ไฟฟ้ากระแสตรงทำหน้าที่อะไร', 'คอมมิวเตเตอร์ทำหน้าที่สลับทิศทางกระแสในขดลวดอาร์เมเจอร์ให้สอดคล้องกับตำแหน่งการหมุน เพื่อรักษาทิศทางแรงบิดให้คงที่ตลอดการหมุน ส่วนแปรงถ่านทำหน้าที่นำกระแสไฟฟ้าจากแหล่งจ่ายภายนอกเข้าสู่คอมมิวเตเตอร์ที่หมุนอยู่', 'แปรงถ่านเป็นชิ้นส่วนที่สึกหรอตามการใช้งานและต้องมีการบำรุงรักษาเปลี่ยนเป็นระยะ ซึ่งเป็นข้อเสียเปรียบของมอเตอร์กระแสตรงเมื่อเทียบกับมอเตอร์เหนี่ยวนำที่ไม่มีชิ้นส่วนนี้', true, true
from categories c
where c.branch_id = '448937cf-58c5-4007-b57b-6a8bcf46c2fe' and c.code = 'machines'
  and not exists (
    select 1 from questions q2
    where q2.category_id = c.id and q2.question = 'แปรงถ่านและคอมมิวเตเตอร์ (Brush and Commutator) ในมอเตอร์ไฟฟ้ากระแสตรงทำหน้าที่อะไร'
  );
insert into questions (category_id, question, answer, explanation, is_active, needs_review)
select c.id, 'การควบคุมความเร็วมอเตอร์เหนี่ยวนำด้วยวิธี Variable Frequency Drive (VFD) มีหลักการทำงานอย่างไร', 'VFD ปรับเปลี่ยนความถี่ของแรงดันไฟฟ้าที่จ่ายให้มอเตอร์ ซึ่งความเร็วซิงโครนัสของมอเตอร์เหนี่ยวนำแปรผันตรงกับความถี่ เมื่อลดความถี่ลงความเร็วมอเตอร์ก็จะลดลงตามไปด้วย โดยมักปรับแรงดันควบคู่กันไปด้วยเพื่อรักษาอัตราส่วนแรงดันต่อความถี่ (V/f) ให้คงที่', 'การรักษาอัตราส่วน V/f คงที่ช่วยให้ฟลักซ์แม่เหล็กในมอเตอร์คงที่ตลอดช่วงความเร็ว ทำให้มอเตอร์สร้างแรงบิดได้สม่ำเสมอโดยไม่เกิดความอิ่มตัวของแกนเหล็กหรือแรงบิดตกที่ความเร็วต่ำ', true, true
from categories c
where c.branch_id = '448937cf-58c5-4007-b57b-6a8bcf46c2fe' and c.code = 'machines'
  and not exists (
    select 1 from questions q2
    where q2.category_id = c.id and q2.question = 'การควบคุมความเร็วมอเตอร์เหนี่ยวนำด้วยวิธี Variable Frequency Drive (VFD) มีหลักการทำงานอย่างไร'
  );
insert into questions (category_id, question, answer, explanation, is_active, needs_review)
select c.id, 'ตัวเก็บประจุสำหรับสตาร์ท (Starting Capacitor) ในมอเตอร์เหนี่ยวนำ 1 เฟส มีหน้าที่อะไร', 'ช่วยสร้างมุมเฟสต่างระหว่างขดลวดหลักและขดลวดสตาร์ท ทำให้เกิดสนามแม่เหล็กหมุนเทียม (Rotating Magnetic Field) ที่จำเป็นสำหรับการสตาร์ทมอเตอร์ 1 เฟส ซึ่งโดยธรรมชาติไม่สามารถสร้างสนามแม่เหล็กหมุนได้ด้วยขดลวดเดียว', 'มอเตอร์เหนี่ยวนำ 1 เฟสไม่สามารถสตาร์ทได้ด้วยตัวเอง (Self-Starting) จึงต้องอาศัยขดลวดช่วยสตาร์ทและตัวเก็บประจุ หรือวิธีอื่น เช่น Shaded Pole เพื่อสร้างแรงบิดเริ่มต้น', true, true
from categories c
where c.branch_id = '448937cf-58c5-4007-b57b-6a8bcf46c2fe' and c.code = 'machines'
  and not exists (
    select 1 from questions q2
    where q2.category_id = c.id and q2.question = 'ตัวเก็บประจุสำหรับสตาร์ท (Starting Capacitor) ในมอเตอร์เหนี่ยวนำ 1 เฟส มีหน้าที่อะไร'
  );
insert into questions (category_id, question, answer, explanation, is_active, needs_review)
select c.id, 'มอเตอร์แบบ Synchronous Motor แตกต่างจากมอเตอร์เหนี่ยวนำในแง่ของความเร็วรอบขณะทำงานอย่างไร', 'มอเตอร์ซิงโครนัสหมุนด้วยความเร็วเท่ากับความเร็วซิงโครนัสพอดีไม่ว่าภาระจะเปลี่ยนแปลงอย่างไร (ตราบใดที่ยังไม่หลุดจากการซิงโครไนซ์) ต่างจากมอเตอร์เหนี่ยวนำที่ความเร็วจะลดลงเล็กน้อยเมื่อภาระเพิ่มขึ้นเนื่องจากค่า Slip', 'มอเตอร์ซิงโครนัสจึงเหมาะกับงานที่ต้องการความเร็วคงที่แม่นยำ และยังสามารถใช้ปรับปรุงตัวประกอบกำลังของระบบไฟฟ้าได้เมื่อทำงานในสภาวะกระตุ้นสนามเกิน (Overexcited)', true, true
from categories c
where c.branch_id = '448937cf-58c5-4007-b57b-6a8bcf46c2fe' and c.code = 'machines'
  and not exists (
    select 1 from questions q2
    where q2.category_id = c.id and q2.question = 'มอเตอร์แบบ Synchronous Motor แตกต่างจากมอเตอร์เหนี่ยวนำในแง่ของความเร็วรอบขณะทำงานอย่างไร'
  );
insert into questions (category_id, question, answer, explanation, is_active, needs_review)
select c.id, 'เหตุใดมอเตอร์ซิงโครนัสจึงไม่สามารถสตาร์ทได้ด้วยตัวเองจากสภาวะหยุดนิ่ง', 'เพราะที่ความเร็วศูนย์ สนามแม่เหล็กหมุนของสเตเตอร์หมุนเร็วเกินกว่าที่โรเตอร์ (ซึ่งมีความเฉื่อยทางกล) จะตามทันได้ทันที แรงบิดเฉลี่ยที่เกิดขึ้นจึงมีค่าเป็นศูนย์ ทำให้ไม่สามารถสร้างแรงบิดสตาร์ทได้ด้วยกลไกปกติ', 'จึงต้องอาศัยวิธีช่วยสตาร์ท เช่น การใช้มอเตอร์เหนี่ยวนำขับก่อนแล้วซิงโครไนซ์เข้าระบบ หรือการติดตั้งแท่งตัวนำแบบกรงกระรอกในโรเตอร์เพื่อสตาร์ทแบบเหนี่ยวนำก่อน (Damper Winding)', true, true
from categories c
where c.branch_id = '448937cf-58c5-4007-b57b-6a8bcf46c2fe' and c.code = 'machines'
  and not exists (
    select 1 from questions q2
    where q2.category_id = c.id and q2.question = 'เหตุใดมอเตอร์ซิงโครนัสจึงไม่สามารถสตาร์ทได้ด้วยตัวเองจากสภาวะหยุดนิ่ง'
  );
insert into questions (category_id, question, answer, explanation, is_active, needs_review)
select c.id, 'การทดสอบวงจรเปิด (Open Circuit Test) และวงจรลัด (Short Circuit Test) ของหม้อแปลงไฟฟ้า ใช้หาค่าพารามิเตอร์ใดตามลำดับ', 'การทดสอบวงจรเปิดใช้หาค่าการสูญเสียในแกนเหล็ก (Core Loss) และพารามิเตอร์สาขาแม่เหล็ก ส่วนการทดสอบวงจรลัดใช้หาค่าการสูญเสียในขดลวด (Copper Loss) และค่าอิมพีแดนซ์สมมูลของหม้อแปลง', 'การทดสอบทั้งสองแบบทำที่แรงดันหรือกระแสต่ำกว่าพิกัดปกติมาก จึงใช้กำลังไฟฟ้าทดสอบน้อย แต่ให้ข้อมูลเพียงพอสำหรับสร้างวงจรสมมูลของหม้อแปลงเพื่อคำนวณประสิทธิภาพและ Voltage Regulation', true, true
from categories c
where c.branch_id = '448937cf-58c5-4007-b57b-6a8bcf46c2fe' and c.code = 'machines'
  and not exists (
    select 1 from questions q2
    where q2.category_id = c.id and q2.question = 'การทดสอบวงจรเปิด (Open Circuit Test) และวงจรลัด (Short Circuit Test) ของหม้อแปลงไฟฟ้า ใช้หาค่าพารามิเตอร์ใดตามลำดับ'
  );
insert into questions (category_id, question, answer, explanation, is_active, needs_review)
select c.id, 'หม้อแปลงไฟฟ้าแบบ Autotransformer แตกต่างจากหม้อแปลงแบบ 2 ขดลวดปกติอย่างไร', 'Autotransformer ใช้ขดลวดร่วมกันเพียงชุดเดียวระหว่างด้านปฐมภูมิและทุติยภูมิ โดยแยกจุดต่อ (Tap) ออกมาแทนที่จะแยกขดลวดเป็นสองชุดอิสระเหมือนหม้อแปลงปกติ', 'ข้อดีคือมีขนาดเล็ก น้ำหนักเบา ราคาถูกกว่าที่พิกัดกำลังเดียวกัน แต่ข้อเสียคือไม่มีการแยกทางไฟฟ้า (Electrical Isolation) ระหว่างด้านปฐมภูมิและทุติยภูมิ จึงไม่เหมาะกับงานที่ต้องการความปลอดภัยจากไฟฟ้าลัดวงจรข้ามด้าน', true, true
from categories c
where c.branch_id = '448937cf-58c5-4007-b57b-6a8bcf46c2fe' and c.code = 'machines'
  and not exists (
    select 1 from questions q2
    where q2.category_id = c.id and q2.question = 'หม้อแปลงไฟฟ้าแบบ Autotransformer แตกต่างจากหม้อแปลงแบบ 2 ขดลวดปกติอย่างไร'
  );
insert into questions (category_id, question, answer, explanation, is_active, needs_review)
select c.id, 'การต่อขดลวดหม้อแปลง 3 เฟส แบบ Delta-Wye (Δ-Y) มีข้อดีในการใช้งานอย่างไร', 'ด้าน Wye สามารถต่อสายนิวทรัลออกมาใช้งานได้ ทำให้มีทั้งแรงดันเฟสและแรงดันไลน์ให้เลือกใช้ ส่วนด้าน Delta ช่วยลดปัญหาฮาร์มอนิกลำดับที่ 3 (Third Harmonic) ที่อาจเกิดจากความไม่เป็นเชิงเส้นของแกนเหล็ก โดยฮาร์มอนิกนี้จะไหลวนอยู่ภายในขดลวด Delta ไม่ออกไปรบกวนระบบภายนอก', 'การต่อแบบ Delta-Wye จึงนิยมใช้ในหม้อแปลงจำหน่ายไฟฟ้าที่ต้องจ่ายทั้งไฟฟ้า 3 เฟสและ 1 เฟสให้ผู้ใช้ไฟฟ้าพร้อมกัน', true, true
from categories c
where c.branch_id = '448937cf-58c5-4007-b57b-6a8bcf46c2fe' and c.code = 'machines'
  and not exists (
    select 1 from questions q2
    where q2.category_id = c.id and q2.question = 'การต่อขดลวดหม้อแปลง 3 เฟส แบบ Delta-Wye (Δ-Y) มีข้อดีในการใช้งานอย่างไร'
  );
insert into questions (category_id, question, answer, explanation, is_active, needs_review)
select c.id, 'การระบายความร้อนของหม้อแปลงไฟฟ้าขนาดใหญ่มักใช้วิธีใด และเหตุใดจึงจำเป็น', 'มักใช้น้ำมันหม้อแปลง (Transformer Oil) หมุนเวียนระบายความร้อนออกจากขดลวดและแกนเหล็กไปยังหม้อน้ำระบายความร้อน (Radiator) เนื่องจากการสูญเสียพลังงานในรูปความร้อนของหม้อแปลงขนาดใหญ่มีปริมาณมาก หากไม่ระบายออกอย่างมีประสิทธิภาพจะทำให้อุณหภูมิสูงเกินกว่าฉนวนของขดลวดจะทนได้ ลดอายุการใช้งาน', 'น้ำมันหม้อแปลงยังทำหน้าที่เป็นฉนวนไฟฟ้าเพิ่มเติมนอกเหนือจากการระบายความร้อน จึงต้องมีการตรวจสอบคุณภาพน้ำมันเป็นระยะเพื่อป้องกันการเสื่อมสภาพ', true, true
from categories c
where c.branch_id = '448937cf-58c5-4007-b57b-6a8bcf46c2fe' and c.code = 'machines'
  and not exists (
    select 1 from questions q2
    where q2.category_id = c.id and q2.question = 'การระบายความร้อนของหม้อแปลงไฟฟ้าขนาดใหญ่มักใช้วิธีใด และเหตุใดจึงจำเป็น'
  );
insert into questions (category_id, question, answer, explanation, is_active, needs_review)
select c.id, 'เหตุใดเครื่องกำเนิดไฟฟ้าซิงโครนัสในโรงไฟฟ้าขนาดใหญ่จึงมักใช้ระบบกระตุ้นสนามแม่เหล็กแบบไร้แปรงถ่าน (Brushless Excitation)', 'เพื่อลดปัญหาการสึกหรอและการบำรุงรักษาแปรงถ่านกับวงแหวนลื่นที่ต้องสัมผัสกับกระแสกระตุ้นสนามแม่เหล็กขนาดใหญ่ ระบบไร้แปรงถ่านใช้เครื่องกำเนิดไฟฟ้ากระตุ้นขนาดเล็กติดตั้งบนเพลาเดียวกัน แล้วแปลงไฟฟ้ากระแสสลับเป็นกระแสตรงด้วยวงจรเรียงกระแสที่หมุนไปพร้อมกับเพลา', 'ระบบนี้เพิ่มความน่าเชื่อถือและลดความถี่ในการบำรุงรักษา เหมาะกับเครื่องกำเนิดไฟฟ้าขนาดใหญ่ที่ต้องทำงานต่อเนื่องเป็นเวลานานโดยไม่หยุดซ่อมบำรุงบ่อยครั้ง', true, true
from categories c
where c.branch_id = '448937cf-58c5-4007-b57b-6a8bcf46c2fe' and c.code = 'machines'
  and not exists (
    select 1 from questions q2
    where q2.category_id = c.id and q2.question = 'เหตุใดเครื่องกำเนิดไฟฟ้าซิงโครนัสในโรงไฟฟ้าขนาดใหญ่จึงมักใช้ระบบกระตุ้นสนามแม่เหล็กแบบไร้แปรงถ่าน (Brushless Excitation)'
  );
insert into questions (category_id, question, answer, explanation, is_active, needs_review)
select c.id, 'ความสัมพันธ์ระหว่างแรงบิด (Torque) และกำลังไฟฟ้าเชิงกล (Mechanical Power) ของมอเตอร์ไฟฟ้าเป็นอย่างไร', 'กำลังไฟฟ้าเชิงกลมีค่าเท่ากับผลคูณของแรงบิดกับความเร็วเชิงมุม (P = T×ω) ดังนั้นที่กำลังไฟฟ้าคงที่ หากความเร็วรอบต่ำ แรงบิดจะสูง และหากความเร็วรอบสูง แรงบิดจะต่ำ', 'ความสัมพันธ์นี้อธิบายได้ว่าเหตุใดมอเตอร์ที่ทำงานความเร็วต่ำแต่ต้องการแรงบิดสูง (เช่น งานยกของ) จึงมักต้องใช้มอเตอร์ขนาดใหญ่หรือระบบเกียร์ทดรอบช่วย', true, true
from categories c
where c.branch_id = '448937cf-58c5-4007-b57b-6a8bcf46c2fe' and c.code = 'machines'
  and not exists (
    select 1 from questions q2
    where q2.category_id = c.id and q2.question = 'ความสัมพันธ์ระหว่างแรงบิด (Torque) และกำลังไฟฟ้าเชิงกล (Mechanical Power) ของมอเตอร์ไฟฟ้าเป็นอย่างไร'
  );
insert into questions (category_id, question, answer, explanation, is_active, needs_review)
select c.id, 'เหตุใดการเดินเครื่องมอเตอร์ไฟฟ้าที่แรงดันต่ำกว่าพิกัด (Undervoltage) จึงเป็นอันตรายต่อมอเตอร์', 'เมื่อแรงดันต่ำกว่าพิกัด มอเตอร์จะดึงกระแสสูงขึ้นเพื่อรักษาระดับกำลังงานที่ต้องการตามภาระ (เนื่องจากกำลังไฟฟ้าคงที่ตามภาระ แต่กระแสแปรผกผันกับแรงดัน) กระแสที่สูงขึ้นนี้ทำให้เกิดความร้อนสะสมในขดลวดมากเกินไป อาจทำให้ฉนวนเสื่อมสภาพหรือไหม้ได้', 'จึงมักมีการติดตั้งอุปกรณ์ป้องกันแรงดันต่ำ (Undervoltage Protection) ร่วมกับอุปกรณ์ป้องกันกระแสเกิน เพื่อปกป้องมอเตอร์จากสภาวะแรงดันผิดปกติ', true, true
from categories c
where c.branch_id = '448937cf-58c5-4007-b57b-6a8bcf46c2fe' and c.code = 'machines'
  and not exists (
    select 1 from questions q2
    where q2.category_id = c.id and q2.question = 'เหตุใดการเดินเครื่องมอเตอร์ไฟฟ้าที่แรงดันต่ำกว่าพิกัด (Undervoltage) จึงเป็นอันตรายต่อมอเตอร์'
  );
insert into questions (category_id, question, answer, explanation, is_active, needs_review)
select c.id, 'การกลับทิศทางการหมุนของมอเตอร์เหนี่ยวนำ 3 เฟส ทำได้อย่างไร', 'ทำได้โดยการสลับสายไฟ 2 ใน 3 เส้นที่จ่ายให้มอเตอร์ ซึ่งจะทำให้ลำดับเฟส (Phase Sequence) ของสนามแม่เหล็กหมุนกลับทิศทาง ส่งผลให้ทิศทางการหมุนของมอเตอร์กลับด้านตามไปด้วย', 'วิธีนี้เป็นวิธีมาตรฐานที่ใช้ในวงจรควบคุมมอเตอร์แบบ Forward-Reverse ทั่วไป โดยใช้คอนแทคเตอร์สองตัวสลับการต่อสาย', true, true
from categories c
where c.branch_id = '448937cf-58c5-4007-b57b-6a8bcf46c2fe' and c.code = 'machines'
  and not exists (
    select 1 from questions q2
    where q2.category_id = c.id and q2.question = 'การกลับทิศทางการหมุนของมอเตอร์เหนี่ยวนำ 3 เฟส ทำได้อย่างไร'
  );
insert into questions (category_id, question, answer, explanation, is_active, needs_review)
select c.id, 'มอเตอร์แบบ Stepper Motor แตกต่างจากมอเตอร์ไฟฟ้าทั่วไปอย่างไรในแง่การควบคุมตำแหน่ง', 'Stepper Motor เคลื่อนที่หมุนเป็นมุมคงที่ต่อหนึ่งพัลส์ไฟฟ้าที่ป้อนเข้า (เช่น 1.8 องศาต่อสเต็ป) ทำให้สามารถควบคุมตำแหน่งการหมุนได้อย่างแม่นยำโดยการนับจำนวนพัลส์ ต่างจากมอเตอร์ทั่วไปที่หมุนต่อเนื่องตามแรงดันหรือความถี่ที่จ่ายให้', 'คุณสมบัตินี้ทำให้ Stepper Motor เหมาะกับงานที่ต้องการควบคุมตำแหน่งแบบวงเปิด (Open Loop Control) เช่น เครื่องพิมพ์ 3 มิติ หรือเครื่อง CNC ขนาดเล็ก โดยไม่จำเป็นต้องใช้ตัวตรวจจับตำแหน่งย้อนกลับ', true, true
from categories c
where c.branch_id = '448937cf-58c5-4007-b57b-6a8bcf46c2fe' and c.code = 'machines'
  and not exists (
    select 1 from questions q2
    where q2.category_id = c.id and q2.question = 'มอเตอร์แบบ Stepper Motor แตกต่างจากมอเตอร์ไฟฟ้าทั่วไปอย่างไรในแง่การควบคุมตำแหน่ง'
  );
insert into questions (category_id, question, answer, explanation, is_active, needs_review)
select c.id, 'การป้องกันมอเตอร์ไฟฟ้าด้วยอุปกรณ์ Overload Relay ทำงานตามหลักการใด', 'อาศัยหลักการความร้อนที่เกิดจากกระแสไหลผ่าน โดยมักใช้แผ่นโลหะคู่ (Bimetallic Strip) ที่โก่งงอเมื่อได้รับความร้อนจากกระแสเกินพิกัดเป็นเวลานาน จนไปกระตุ้นให้หน้าสัมผัสตัดวงจรควบคุมของมอเตอร์', 'อุปกรณ์นี้ออกแบบให้มีลักษณะการหน่วงเวลาสัมพันธ์กับขนาดกระแสเกิน (Inverse Time Characteristic) คือกระแสเกินมากจะตัดเร็ว กระแสเกินน้อยจะตัดช้ากว่า เพื่อให้มอเตอร์ทนกระแสสตาร์ทช่วงสั้นๆ ได้โดยไม่ตัดวงจรก่อนเวลาอันควร', true, true
from categories c
where c.branch_id = '448937cf-58c5-4007-b57b-6a8bcf46c2fe' and c.code = 'machines'
  and not exists (
    select 1 from questions q2
    where q2.category_id = c.id and q2.question = 'การป้องกันมอเตอร์ไฟฟ้าด้วยอุปกรณ์ Overload Relay ทำงานตามหลักการใด'
  );
insert into questions (category_id, question, answer, explanation, is_active, needs_review)
select c.id, 'ค่าประสิทธิภาพ (Efficiency) ของมอเตอร์ไฟฟ้าลดลงเนื่องจากการสูญเสียประเภทใดบ้าง', 'ประกอบด้วยการสูญเสียในขดลวด (Copper Loss หรือ I²R Loss), การสูญเสียในแกนเหล็ก (Core Loss หรือ Iron Loss), การสูญเสียจากแรงเสียดทานและความต้านทานลม (Friction and Windage Loss) และการสูญเสียจากฮาร์มอนิกหรือกระแสไหลวนอื่นๆ (Stray Loss)', 'มอเตอร์ประสิทธิภาพสูง (High Efficiency Motor หรือ IE Class ต่างๆ) ได้รับการออกแบบให้ลดการสูญเสียแต่ละประเภทเหล่านี้ เช่น ใช้ลวดทองแดงหน้าตัดใหญ่ขึ้นเพื่อลด Copper Loss หรือใช้แกนเหล็กคุณภาพสูงเพื่อลด Core Loss', true, true
from categories c
where c.branch_id = '448937cf-58c5-4007-b57b-6a8bcf46c2fe' and c.code = 'machines'
  and not exists (
    select 1 from questions q2
    where q2.category_id = c.id and q2.question = 'ค่าประสิทธิภาพ (Efficiency) ของมอเตอร์ไฟฟ้าลดลงเนื่องจากการสูญเสียประเภทใดบ้าง'
  );
insert into questions (category_id, question, answer, explanation, is_active, needs_review)
select c.id, 'การเลือกขนาดมอเตอร์ไฟฟ้าให้เหมาะสมกับภาระงาน ต้องพิจารณาปัจจัยใดบ้างนอกเหนือจากกำลังพิกัด', 'ต้องพิจารณาลักษณะการทำงาน (Duty Cycle) เช่น ทำงานต่อเนื่องหรือเป็นช่วงๆ, ลักษณะแรงบิดที่ภาระต้องการเทียบกับกราฟแรงบิด-ความเร็วของมอเตอร์, สภาพแวดล้อมการติดตั้ง (อุณหภูมิ ความชื้น ฝุ่นละออง) และตัวประกอบบริการ (Service Factor) ที่มอเตอร์รองรับได้', 'การเลือกมอเตอร์ที่มีกำลังพิกัดพอดีกับภาระโดยไม่พิจารณาปัจจัยอื่น อาจทำให้มอเตอร์ทำงานหนักเกินไปในสภาวะจริงและมีอายุการใช้งานสั้นกว่าที่ควร', true, true
from categories c
where c.branch_id = '448937cf-58c5-4007-b57b-6a8bcf46c2fe' and c.code = 'machines'
  and not exists (
    select 1 from questions q2
    where q2.category_id = c.id and q2.question = 'การเลือกขนาดมอเตอร์ไฟฟ้าให้เหมาะสมกับภาระงาน ต้องพิจารณาปัจจัยใดบ้างนอกเหนือจากกำลังพิกัด'
  );
insert into questions (category_id, question, answer, explanation, is_active, needs_review)
select c.id, 'เหตุใดมอเตอร์เหนี่ยวนำจึงจัดเป็นโหลดประเภท Lagging Power Factor (ตัวประกอบกำลังล้าหลัง) ของระบบไฟฟ้า', 'เพราะมอเตอร์เหนี่ยวนำต้องการกระแสแม่เหล็ก (Magnetizing Current) เพื่อสร้างสนามแม่เหล็กหมุนในแกนเหล็ก ซึ่งกระแสนี้มีลักษณะเป็นกระแสรีแอคทีฟที่ล้าหลังแรงดัน ทำให้กระแสรวมของมอเตอร์ล้าหลังแรงดันเสมอ', 'ในโรงงานอุตสาหกรรมที่มีมอเตอร์จำนวนมาก มักมีปัญหา Power Factor ต่ำจากผลรวมของกระแสแม่เหล็กเหล่านี้ จึงต้องติดตั้งตัวเก็บประจุปรับปรุงตัวประกอบกำลัง (Power Factor Correction Capacitor) เพื่อชดเชย', true, true
from categories c
where c.branch_id = '448937cf-58c5-4007-b57b-6a8bcf46c2fe' and c.code = 'machines'
  and not exists (
    select 1 from questions q2
    where q2.category_id = c.id and q2.question = 'เหตุใดมอเตอร์เหนี่ยวนำจึงจัดเป็นโหลดประเภท Lagging Power Factor (ตัวประกอบกำลังล้าหลัง) ของระบบไฟฟ้า'
  );
insert into questions (category_id, question, answer, explanation, is_active, needs_review)
select c.id, 'การทำ Vector Control ในการควบคุมมอเตอร์เหนี่ยวนำมีข้อดีเหนือกว่าการควบคุมแบบ V/f ทั่วไปอย่างไร', 'Vector Control สามารถควบคุมแรงบิดและฟลักซ์แม่เหล็กของมอเตอร์แยกจากกันได้อย่างอิสระและแม่นยำ คล้ายกับการควบคุมมอเตอร์ไฟฟ้ากระแสตรง ทำให้ตอบสนองต่อการเปลี่ยนแปลงภาระได้รวดเร็วและแม่นยำกว่าการควบคุมแบบ V/f ที่ควบคุมเพียงอัตราส่วนแรงดันต่อความถี่แบบภาพรวม', 'เทคนิคนี้นิยมใช้ในงานที่ต้องการความแม่นยำสูงในการควบคุมความเร็วหรือแรงบิด เช่น เครื่องจักร CNC หรือระบบขับเคลื่อนที่ต้องการตอบสนองเร็ว แม้จะมีความซับซ้อนของวงจรควบคุมมากกว่า', true, true
from categories c
where c.branch_id = '448937cf-58c5-4007-b57b-6a8bcf46c2fe' and c.code = 'machines'
  and not exists (
    select 1 from questions q2
    where q2.category_id = c.id and q2.question = 'การทำ Vector Control ในการควบคุมมอเตอร์เหนี่ยวนำมีข้อดีเหนือกว่าการควบคุมแบบ V/f ทั่วไปอย่างไร'
  );
insert into questions (category_id, question, answer, explanation, is_active, needs_review)
select c.id, 'เหตุใดจึงต้องมีช่องว่างอากาศ (Air Gap) ระหว่างสเตเตอร์และโรเตอร์ในเครื่องจักรกลไฟฟ้าหมุน และช่องว่างนี้มีผลต่อการออกแบบอย่างไร', 'ช่องว่างอากาศจำเป็นเพื่อให้โรเตอร์หมุนได้อย่างอิสระโดยไม่เสียดสีกับสเตเตอร์ แต่ช่องว่างนี้ก็เป็นแหล่งความต้านทานแม่เหล็ก (Reluctance) หลักในวงจรแม่เหล็กของเครื่องจักร ยิ่งช่องว่างกว้างยิ่งต้องการกระแสแม่เหล็กมากขึ้นเพื่อสร้างฟลักซ์เท่าเดิม', 'การออกแบบเครื่องจักรกลไฟฟ้าจึงพยายามให้ช่องว่างอากาศแคบที่สุดเท่าที่โครงสร้างเชิงกลจะรองรับได้อย่างปลอดภัย เพื่อลดกระแสแม่เหล็กที่สูญเปล่าและเพิ่มประสิทธิภาพโดยรวม', true, true
from categories c
where c.branch_id = '448937cf-58c5-4007-b57b-6a8bcf46c2fe' and c.code = 'machines'
  and not exists (
    select 1 from questions q2
    where q2.category_id = c.id and q2.question = 'เหตุใดจึงต้องมีช่องว่างอากาศ (Air Gap) ระหว่างสเตเตอร์และโรเตอร์ในเครื่องจักรกลไฟฟ้าหมุน และช่องว่างนี้มีผลต่อการออกแบบอย่างไร'
  );

commit;

-- ---------- ตรวจสอบผลลัพธ์ ----------
select c.name_th as category, count(q.id) as question_count
from categories c
left join questions q on q.category_id = c.id
where c.branch_id = '448937cf-58c5-4007-b57b-6a8bcf46c2fe' and c.code = 'machines'
group by c.name_th;
