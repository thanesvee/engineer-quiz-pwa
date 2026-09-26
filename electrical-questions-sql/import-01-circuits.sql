-- ============================================================
-- นำเข้าคำถามสาขาไฟฟ้า หมวดที่ 1: วงจรไฟฟ้า (Electric Circuits)
-- ไฟล์นี้รันได้อิสระ ไม่ต้องพึ่งไฟล์อื่น (idempotent)
-- ============================================================

begin;

-- ---------- เพิ่มหมวดหมู่ ----------
insert into categories (branch_id, code, name_th, sort_order)
select '448937cf-58c5-4007-b57b-6a8bcf46c2fe', 'circuits', 'วงจรไฟฟ้า (Electric Circuits)', 1
where not exists (
  select 1 from categories where branch_id = '448937cf-58c5-4007-b57b-6a8bcf46c2fe' and code = 'circuits'
);

-- ---------- เพิ่มคำถาม (33 ข้อ) ----------
insert into questions (category_id, question, answer, explanation, is_active, needs_review)
select c.id, 'กฎกระแสไฟฟ้าของ Kirchhoff (KCL) มีใจความสำคัญว่าอย่างไร และนำไปใช้วิเคราะห์วงจรอย่างไร', 'ผลรวมกระแสไฟฟ้าที่ไหลเข้าจุดต่อ (Node) ใดๆ มีค่าเท่ากับผลรวมกระแสที่ไหลออกจากจุดนั้นเสมอ ใช้เป็นหลักในการเขียนสมการวิเคราะห์วงจรแบบ Nodal Analysis', 'KCL อาศัยหลักการอนุรักษ์ประจุไฟฟ้า (Conservation of Charge) เพราะประจุไม่สามารถสะสมที่จุดต่อได้ในสภาวะคงตัว', true, true
from categories c
where c.branch_id = '448937cf-58c5-4007-b57b-6a8bcf46c2fe' and c.code = 'circuits'
  and not exists (
    select 1 from questions q2
    where q2.category_id = c.id and q2.question = 'กฎกระแสไฟฟ้าของ Kirchhoff (KCL) มีใจความสำคัญว่าอย่างไร และนำไปใช้วิเคราะห์วงจรอย่างไร'
  );
insert into questions (category_id, question, answer, explanation, is_active, needs_review)
select c.id, 'กฎแรงดันไฟฟ้าของ Kirchhoff (KVL) มีใจความสำคัญว่าอย่างไร และนำไปใช้วิเคราะห์วงจรอย่างไร', 'ผลรวมของแรงดันไฟฟ้าตลอดลูปปิด (Closed Loop) ใดๆ ในวงจรมีค่าเท่ากับศูนย์ ใช้เป็นหลักในการเขียนสมการวิเคราะห์วงจรแบบ Mesh Analysis', 'KVL อาศัยหลักการอนุรักษ์พลังงาน เพราะพลังงานที่แหล่งจ่ายให้ต้องเท่ากับพลังงานที่สูญเสียไปตลอดลูปนั้นพอดี', true, true
from categories c
where c.branch_id = '448937cf-58c5-4007-b57b-6a8bcf46c2fe' and c.code = 'circuits'
  and not exists (
    select 1 from questions q2
    where q2.category_id = c.id and q2.question = 'กฎแรงดันไฟฟ้าของ Kirchhoff (KVL) มีใจความสำคัญว่าอย่างไร และนำไปใช้วิเคราะห์วงจรอย่างไร'
  );
insert into questions (category_id, question, answer, explanation, is_active, needs_review)
select c.id, 'ทฤษฎีเทวินิน (Thevenin''s Theorem) ใช้แก้ปัญหาการวิเคราะห์วงจรในลักษณะใด และมีข้อจำกัดอย่างไร', 'ใช้ลดทอนวงจรเชิงเส้นที่ซับซ้อนให้เหลือแหล่งจ่ายแรงดันสมมูล (Vth) ต่ออนุกรมกับความต้านทานสมมูล (Rth) มองจากขั้วที่สนใจ เพื่อวิเคราะห์ผลกระทบต่อโหลดที่เปลี่ยนแปลงได้ง่ายขึ้น ข้อจำกัดคือใช้ได้เฉพาะวงจรเชิงเส้น (Linear) เท่านั้น', 'มีประโยชน์มากเมื่อต้องการทดสอบผลของโหลดหลายค่าโดยไม่ต้องวิเคราะห์วงจรเดิมซ้ำทุกครั้ง', true, true
from categories c
where c.branch_id = '448937cf-58c5-4007-b57b-6a8bcf46c2fe' and c.code = 'circuits'
  and not exists (
    select 1 from questions q2
    where q2.category_id = c.id and q2.question = 'ทฤษฎีเทวินิน (Thevenin''s Theorem) ใช้แก้ปัญหาการวิเคราะห์วงจรในลักษณะใด และมีข้อจำกัดอย่างไร'
  );
insert into questions (category_id, question, answer, explanation, is_active, needs_review)
select c.id, 'ทฤษฎีนอร์ตัน (Norton''s Theorem) แตกต่างจากทฤษฎีเทวินินอย่างไร และแปลงกลับไปมาระหว่างกันได้หรือไม่', 'นอร์ตันแปลงวงจรให้เหลือแหล่งจ่ายกระแสสมมูล (IN) ต่อขนานกับความต้านทานสมมูล (RN) ต่างจากเทวินินที่ใช้แหล่งจ่ายแรงดันต่ออนุกรม ทั้งสองสามารถแปลงกลับไปมาได้ เพราะ RN มีค่าเท่ากับ Rth เสมอ', 'การแปลงใช้ความสัมพันธ์ IN = Vth/Rth ทำให้เลือกใช้รูปแบบที่สะดวกต่อการคำนวณในแต่ละสถานการณ์ได้', true, true
from categories c
where c.branch_id = '448937cf-58c5-4007-b57b-6a8bcf46c2fe' and c.code = 'circuits'
  and not exists (
    select 1 from questions q2
    where q2.category_id = c.id and q2.question = 'ทฤษฎีนอร์ตัน (Norton''s Theorem) แตกต่างจากทฤษฎีเทวินินอย่างไร และแปลงกลับไปมาระหว่างกันได้หรือไม่'
  );
insert into questions (category_id, question, answer, explanation, is_active, needs_review)
select c.id, 'หลักการซ้อนทับ (Superposition Theorem) มีขั้นตอนวิเคราะห์อย่างไร และใช้ได้กับวงจรลักษณะใด', 'พิจารณาผลจากแหล่งจ่ายอิสระทีละตัว โดยปิดแหล่งจ่ายแรงดันที่เหลือให้เป็นลัดวงจร และปิดแหล่งจ่ายกระแสที่เหลือให้เป็นวงจรเปิด แล้วนำผลลัพธ์จากแต่ละแหล่งจ่ายมารวมกัน ใช้ได้เฉพาะวงจรเชิงเส้นที่มีแหล่งจ่ายอิสระมากกว่า 1 ตัว', 'หลักการนี้อาศัยคุณสมบัติเชิงเส้นของวงจร (Linearity) ซึ่งไม่สามารถใช้กับวงจรที่มีอุปกรณ์ไม่เชิงเส้น เช่น ไดโอด ได้', true, true
from categories c
where c.branch_id = '448937cf-58c5-4007-b57b-6a8bcf46c2fe' and c.code = 'circuits'
  and not exists (
    select 1 from questions q2
    where q2.category_id = c.id and q2.question = 'หลักการซ้อนทับ (Superposition Theorem) มีขั้นตอนวิเคราะห์อย่างไร และใช้ได้กับวงจรลักษณะใด'
  );
insert into questions (category_id, question, answer, explanation, is_active, needs_review)
select c.id, 'ค่าคงที่เวลา (Time Constant, τ) ของวงจร RC และวงจร RL มีความหมายและคำนวณต่างกันอย่างไร', 'τ ของวงจร RC คำนวณจาก R×C ส่วน τ ของวงจร RL คำนวณจาก L/R ทั้งสองมีหน่วยเป็นวินาที และบอกอัตราเร็วในการเปลี่ยนแปลงของแรงดัน/กระแสในวงจรเมื่อเกิดการชาร์จหรือคายพลังงาน', 'หลังผ่านไป 5τ วงจรจะเข้าสู่สภาวะคงตัว (Steady State) โดยประมาณ ถือเป็นค่าที่ใช้ในการออกแบบวงจรหน่วงเวลาหรือกรองสัญญาณ', true, true
from categories c
where c.branch_id = '448937cf-58c5-4007-b57b-6a8bcf46c2fe' and c.code = 'circuits'
  and not exists (
    select 1 from questions q2
    where q2.category_id = c.id and q2.question = 'ค่าคงที่เวลา (Time Constant, τ) ของวงจร RC และวงจร RL มีความหมายและคำนวณต่างกันอย่างไร'
  );
insert into questions (category_id, question, answer, explanation, is_active, needs_review)
select c.id, 'กำลังไฟฟ้าจริง (Active Power) และกำลังไฟฟ้ารีแอคทีฟ (Reactive Power) แตกต่างกันอย่างไรในเชิงการใช้งาน', 'กำลังไฟฟ้าจริง (หน่วยวัตต์) คือกำลังที่ถูกใช้งานจริงและเปลี่ยนเป็นงานหรือความร้อน ส่วนกำลังไฟฟ้ารีแอคทีฟ (หน่วย VAR) เกิดจากองค์ประกอบตัวเหนี่ยวนำหรือตัวเก็บประจุ ไม่ก่อให้เกิดงานจริงแต่จำเป็นสำหรับสร้างสนามแม่เหล็กหรือสนามไฟฟ้าในอุปกรณ์', 'กำลังไฟฟ้ารีแอคทีฟที่มากเกินไปทำให้ระบบไฟฟ้าต้องจ่ายกระแสสูงขึ้นโดยไม่ได้งานเพิ่ม จึงต้องมีการปรับปรุงตัวประกอบกำลัง (Power Factor Correction)', true, true
from categories c
where c.branch_id = '448937cf-58c5-4007-b57b-6a8bcf46c2fe' and c.code = 'circuits'
  and not exists (
    select 1 from questions q2
    where q2.category_id = c.id and q2.question = 'กำลังไฟฟ้าจริง (Active Power) และกำลังไฟฟ้ารีแอคทีฟ (Reactive Power) แตกต่างกันอย่างไรในเชิงการใช้งาน'
  );
insert into questions (category_id, question, answer, explanation, is_active, needs_review)
select c.id, 'ตัวประกอบกำลัง (Power Factor) คืออะไร และเหตุใดค่า Power Factor ต่ำจึงเป็นปัญหาต่อระบบไฟฟ้า', 'Power Factor คืออัตราส่วนระหว่างกำลังไฟฟ้าจริงต่อกำลังไฟฟ้าปรากฏ (P/S) บ่งบอกประสิทธิภาพการใช้พลังงาน ค่าต่ำหมายถึงต้องจ่ายกระแสมากขึ้นเพื่องานที่เท่าเดิม ทำให้สายไฟและอุปกรณ์ต้องรองรับกระแสสูงขึ้นโดยไม่จำเป็น', 'การไฟฟ้ามักคิดค่าปรับกับผู้ใช้ไฟฟ้าที่มี Power Factor ต่ำกว่าเกณฑ์ เนื่องจากเป็นภาระต่อระบบส่งจ่ายโดยรวม', true, true
from categories c
where c.branch_id = '448937cf-58c5-4007-b57b-6a8bcf46c2fe' and c.code = 'circuits'
  and not exists (
    select 1 from questions q2
    where q2.category_id = c.id and q2.question = 'ตัวประกอบกำลัง (Power Factor) คืออะไร และเหตุใดค่า Power Factor ต่ำจึงเป็นปัญหาต่อระบบไฟฟ้า'
  );
insert into questions (category_id, question, answer, explanation, is_active, needs_review)
select c.id, 'ในระบบไฟฟ้า 3 เฟส การต่อแบบสตาร์ (Star/Y) และเดลตา (Delta) แตกต่างกันในความสัมพันธ์ระหว่างแรงดันเฟสและแรงดันไลน์อย่างไร', 'การต่อแบบสตาร์ แรงดันไลน์มีค่าเท่ากับ √3 เท่าของแรงดันเฟส ส่วนการต่อแบบเดลตา แรงดันไลน์มีค่าเท่ากับแรงดันเฟสโดยตรง แต่กระแสไลน์กลับมีค่าเป็น √3 เท่าของกระแสเฟสแทน', 'ความแตกต่างนี้มีผลต่อการเลือกใช้งานจริง เช่น ระบบจำหน่ายไฟฟ้าในบ้านเรือนของไทยมักใช้การต่อแบบสตาร์เพื่อให้มีทั้งแรงดันเฟส (220V) และแรงดันไลน์ (380V) ให้เลือกใช้', true, true
from categories c
where c.branch_id = '448937cf-58c5-4007-b57b-6a8bcf46c2fe' and c.code = 'circuits'
  and not exists (
    select 1 from questions q2
    where q2.category_id = c.id and q2.question = 'ในระบบไฟฟ้า 3 เฟส การต่อแบบสตาร์ (Star/Y) และเดลตา (Delta) แตกต่างกันในความสัมพันธ์ระหว่างแรงดันเฟสและแรงดันไลน์อย่างไร'
  );
insert into questions (category_id, question, answer, explanation, is_active, needs_review)
select c.id, 'ความถี่เรโซแนนซ์ (Resonant Frequency) ของวงจร RLC อนุกรมคืออะไร และมีผลต่อพฤติกรรมวงจรอย่างไร', 'คือความถี่ที่ค่ารีแอคแตนซ์ของตัวเหนี่ยวนำ (XL) เท่ากับค่ารีแอคแตนซ์ของตัวเก็บประจุ (XC) พอดี ทำให้หักล้างกันหมด อิมพีแดนซ์รวมของวงจรอนุกรมจึงลดลงเหลือเพียงค่าความต้านทาน R ทำให้กระแสไหลในวงจรสูงสุด', 'ปรากฏการณ์นี้ถูกนำไปใช้ในวงจรกรองความถี่และวงจรจูนสัญญาณในระบบสื่อสาร เพื่อเลือกรับเฉพาะความถี่ที่ต้องการ', true, true
from categories c
where c.branch_id = '448937cf-58c5-4007-b57b-6a8bcf46c2fe' and c.code = 'circuits'
  and not exists (
    select 1 from questions q2
    where q2.category_id = c.id and q2.question = 'ความถี่เรโซแนนซ์ (Resonant Frequency) ของวงจร RLC อนุกรมคืออะไร และมีผลต่อพฤติกรรมวงจรอย่างไร'
  );
insert into questions (category_id, question, answer, explanation, is_active, needs_review)
select c.id, 'เหตุใดตัวเหนี่ยวนำในสภาวะคงตัวของวงจรไฟฟ้ากระแสตรง (DC Steady State) จึงมีพฤติกรรมเหมือนลัดวงจร', 'เพราะแรงดันตกคร่อมตัวเหนี่ยวนำแปรผันตามอัตราการเปลี่ยนแปลงของกระแส (V=L×dI/dt) เมื่อวงจรเข้าสู่สภาวะคงตัว กระแสไม่มีการเปลี่ยนแปลงอีก (dI/dt=0) จึงไม่มีแรงดันตกคร่อม เสมือนลัดวงจร', 'หลักการนี้ใช้ในการวิเคราะห์วงจรที่สภาวะคงตัวเบื้องต้น ก่อนพิจารณาพฤติกรรมชั่วครู่ (Transient) ที่ซับซ้อนกว่า', true, true
from categories c
where c.branch_id = '448937cf-58c5-4007-b57b-6a8bcf46c2fe' and c.code = 'circuits'
  and not exists (
    select 1 from questions q2
    where q2.category_id = c.id and q2.question = 'เหตุใดตัวเหนี่ยวนำในสภาวะคงตัวของวงจรไฟฟ้ากระแสตรง (DC Steady State) จึงมีพฤติกรรมเหมือนลัดวงจร'
  );
insert into questions (category_id, question, answer, explanation, is_active, needs_review)
select c.id, 'เหตุใดตัวเก็บประจุในสภาวะคงตัวของวงจรไฟฟ้ากระแสตรงจึงมีพฤติกรรมเหมือนวงจรเปิด', 'เพราะตัวเก็บประจุจะชาร์จจนเต็มในสภาวะคงตัว ไม่มีกระแสไหลผ่านได้อีก (กระแสไหลผ่านตัวเก็บประจุแปรผันตามอัตราการเปลี่ยนแปลงของแรงดัน I=C×dV/dt ซึ่งเป็นศูนย์เมื่อ dV/dt=0)', 'หลักการนี้สำคัญในการวิเคราะห์วงจรกรองสัญญาณและวงจรจ่ายไฟที่มีตัวเก็บประจุปรับเรียบ (Filter Capacitor)', true, true
from categories c
where c.branch_id = '448937cf-58c5-4007-b57b-6a8bcf46c2fe' and c.code = 'circuits'
  and not exists (
    select 1 from questions q2
    where q2.category_id = c.id and q2.question = 'เหตุใดตัวเก็บประจุในสภาวะคงตัวของวงจรไฟฟ้ากระแสตรงจึงมีพฤติกรรมเหมือนวงจรเปิด'
  );
insert into questions (category_id, question, answer, explanation, is_active, needs_review)
select c.id, 'มุมเฟสระหว่างกระแสและแรงดันในวงจรที่มีโหลดเป็นตัวเก็บประจุล้วนเป็นอย่างไร และต่างจากโหลดตัวเหนี่ยวนำล้วนอย่างไร', 'ในวงจรตัวเก็บประจุล้วน กระแสจะนำหน้าแรงดัน 90 องศา ส่วนในวงจรตัวเหนี่ยวนำล้วน กระแสจะล้าหลังแรงดัน 90 องศา ซึ่งเป็นมุมเฟสตรงข้ามกัน', 'นิยมจำด้วยคำย่อ ICE (I นำหน้า C แล้วตามด้วย E คือแรงดัน) และ ELI (E นำหน้า L แล้วตามด้วย I) เพื่อช่วยจดจำทิศทางมุมเฟสของอุปกรณ์ทั้งสองชนิด', true, true
from categories c
where c.branch_id = '448937cf-58c5-4007-b57b-6a8bcf46c2fe' and c.code = 'circuits'
  and not exists (
    select 1 from questions q2
    where q2.category_id = c.id and q2.question = 'มุมเฟสระหว่างกระแสและแรงดันในวงจรที่มีโหลดเป็นตัวเก็บประจุล้วนเป็นอย่างไร และต่างจากโหลดตัวเหนี่ยวนำล้วนอย่างไร'
  );
insert into questions (category_id, question, answer, explanation, is_active, needs_review)
select c.id, 'ค่า RMS ของแรงดันไฟฟ้ากระแสสลับรูปคลื่นไซน์มีความสำคัญอย่างไร และสัมพันธ์กับค่าพีคอย่างไร', 'ค่า RMS คือค่าแรงดันไฟฟ้ากระแสสลับที่ให้ผลกำลังไฟฟ้าเทียบเท่ากับไฟฟ้ากระแสตรงขนาดเดียวกัน สำหรับคลื่นไซน์บริสุทธิ์ Vrms มีค่าประมาณ 0.707 เท่าของค่าพีค (Vpeak)', 'ค่าที่ระบุบนป้ายอุปกรณ์ไฟฟ้าและมาตรวัดไฟฟ้าทั่วไป เช่น 220V เป็นค่า RMS ไม่ใช่ค่าพีคของแรงดัน', true, true
from categories c
where c.branch_id = '448937cf-58c5-4007-b57b-6a8bcf46c2fe' and c.code = 'circuits'
  and not exists (
    select 1 from questions q2
    where q2.category_id = c.id and q2.question = 'ค่า RMS ของแรงดันไฟฟ้ากระแสสลับรูปคลื่นไซน์มีความสำคัญอย่างไร และสัมพันธ์กับค่าพีคอย่างไร'
  );
insert into questions (category_id, question, answer, explanation, is_active, needs_review)
select c.id, 'การถ่ายโอนกำลังไฟฟ้าสูงสุด (Maximum Power Transfer Theorem) มีเงื่อนไขอย่างไร และมีข้อจำกัดในทางปฏิบัติอย่างไร', 'กำลังไฟฟ้าที่ถ่ายโอนไปยังโหลดจะสูงสุดเมื่อความต้านทานโหลด (RL) มีค่าเท่ากับความต้านทานเทวินินของวงจร (Rth) แต่ในทางปฏิบัติ เงื่อนไขนี้ให้ประสิทธิภาพการถ่ายโอนพลังงานเพียง 50% เท่านั้น จึงเหมาะกับงานสื่อสารสัญญาณมากกว่างานส่งกำลังไฟฟ้า', 'ในระบบไฟฟ้ากำลังจริงมักออกแบบให้ RL มีค่าน้อยกว่า Rth มาก เพื่อให้ได้ประสิทธิภาพการส่งพลังงานสูงแทนที่จะเน้นกำลังสูงสุด', true, true
from categories c
where c.branch_id = '448937cf-58c5-4007-b57b-6a8bcf46c2fe' and c.code = 'circuits'
  and not exists (
    select 1 from questions q2
    where q2.category_id = c.id and q2.question = 'การถ่ายโอนกำลังไฟฟ้าสูงสุด (Maximum Power Transfer Theorem) มีเงื่อนไขอย่างไร และมีข้อจำกัดในทางปฏิบัติอย่างไร'
  );
insert into questions (category_id, question, answer, explanation, is_active, needs_review)
select c.id, 'หม้อแปลงไฟฟ้าในอุดมคติ มีความสัมพันธ์ระหว่างอัตราส่วนขดลวดกับแรงดันและกระแสอย่างไร', 'อัตราส่วนแรงดันแปรผันตรงกับอัตราส่วนจำนวนรอบขดลวด (V1/V2 = N1/N2) ในขณะที่อัตราส่วนกระแสแปรผกผันกับอัตราส่วนขดลวด (I1/I2 = N2/N1) เพื่อรักษากำลังไฟฟ้าด้านเข้าและออกให้เท่ากันตามหลักอนุรักษ์พลังงาน', 'หลักการนี้เป็นพื้นฐานของการเลือกใช้หม้อแปลงแปลงแรงดันสูง-ต่ำในระบบส่งและจำหน่ายไฟฟ้า', true, true
from categories c
where c.branch_id = '448937cf-58c5-4007-b57b-6a8bcf46c2fe' and c.code = 'circuits'
  and not exists (
    select 1 from questions q2
    where q2.category_id = c.id and q2.question = 'หม้อแปลงไฟฟ้าในอุดมคติ มีความสัมพันธ์ระหว่างอัตราส่วนขดลวดกับแรงดันและกระแสอย่างไร'
  );
insert into questions (category_id, question, answer, explanation, is_active, needs_review)
select c.id, 'การวิเคราะห์วงจรด้วยวิธี Nodal Analysis และ Mesh Analysis แตกต่างกันในหลักการพื้นฐานอย่างไร', 'Nodal Analysis อาศัย KCL เขียนสมการที่แต่ละจุดต่อของวงจรโดยใช้แรงดันเป็นตัวแปรไม่ทราบค่า ส่วน Mesh Analysis อาศัย KVL เขียนสมการรอบลูปปิดแต่ละลูปโดยใช้กระแสเป็นตัวแปรไม่ทราบค่า', 'การเลือกใช้วิธีใดขึ้นกับโครงสร้างวงจร หากวงจรมีจุดต่อน้อยกว่าลูป มักเลือกใช้ Nodal Analysis เพื่อลดจำนวนสมการที่ต้องแก้', true, true
from categories c
where c.branch_id = '448937cf-58c5-4007-b57b-6a8bcf46c2fe' and c.code = 'circuits'
  and not exists (
    select 1 from questions q2
    where q2.category_id = c.id and q2.question = 'การวิเคราะห์วงจรด้วยวิธี Nodal Analysis และ Mesh Analysis แตกต่างกันในหลักการพื้นฐานอย่างไร'
  );
insert into questions (category_id, question, answer, explanation, is_active, needs_review)
select c.id, 'เหตุใดแหล่งจ่ายแรงดันในอุดมคติจึงต้องมีความต้านทานภายในเป็นศูนย์ และในทางปฏิบัติเป็นเช่นนั้นหรือไม่', 'เพื่อให้สามารถจ่ายแรงดันคงที่ได้ไม่ว่าโหลดจะดึงกระแสเท่าใด แต่ในทางปฏิบัติแหล่งจ่ายจริงมีความต้านทานภายในค่าน้อยๆ อยู่เสมอ ทำให้แรงดันขาออกลดลงเล็กน้อยเมื่อจ่ายกระแสมาก (Voltage Drop)', 'ปรากฏการณ์นี้เรียกว่า Voltage Regulation ซึ่งเป็นตัวชี้วัดคุณภาพของแหล่งจ่ายไฟฟ้าจริง ยิ่งความต้านทานภายในต่ำ ยิ่งรักษาแรงดันได้ดีเมื่อโหลดเปลี่ยนแปลง', true, true
from categories c
where c.branch_id = '448937cf-58c5-4007-b57b-6a8bcf46c2fe' and c.code = 'circuits'
  and not exists (
    select 1 from questions q2
    where q2.category_id = c.id and q2.question = 'เหตุใดแหล่งจ่ายแรงดันในอุดมคติจึงต้องมีความต้านทานภายในเป็นศูนย์ และในทางปฏิบัติเป็นเช่นนั้นหรือไม่'
  );
insert into questions (category_id, question, answer, explanation, is_active, needs_review)
select c.id, 'การต่อตัวเก็บประจุแบบอนุกรมและแบบขนาน ให้ผลต่อค่าความจุรวมต่างจากการต่อตัวต้านทานอย่างไร', 'ตัวเก็บประจุต่อขนานให้ค่าความจุรวมเพิ่มขึ้น (บวกกันโดยตรง) ในขณะที่ต่ออนุกรมให้ค่าความจุรวมลดลง (คำนวณแบบส่วนกลับ) ซึ่งตรงข้ามกับพฤติกรรมของตัวต้านทานที่ต่ออนุกรมแล้วค่าเพิ่มขึ้น ต่อขนานแล้วค่าลดลง', 'ความแตกต่างนี้เกิดจากธรรมชาติของตัวเก็บประจุที่เก็บประจุตามพื้นที่แผ่นตัวนำ การต่อขนานเสมือนเพิ่มพื้นที่แผ่นตัวนำ จึงเพิ่มความจุ', true, true
from categories c
where c.branch_id = '448937cf-58c5-4007-b57b-6a8bcf46c2fe' and c.code = 'circuits'
  and not exists (
    select 1 from questions q2
    where q2.category_id = c.id and q2.question = 'การต่อตัวเก็บประจุแบบอนุกรมและแบบขนาน ให้ผลต่อค่าความจุรวมต่างจากการต่อตัวต้านทานอย่างไร'
  );
insert into questions (category_id, question, answer, explanation, is_active, needs_review)
select c.id, 'อิมพีแดนซ์ (Impedance) ในวงจรไฟฟ้ากระแสสลับคืออะไร และแตกต่างจากความต้านทานในวงจรกระแสตรงอย่างไร', 'อิมพีแดนซ์คือปริมาณเชิงซ้อนที่รวมทั้งความต้านทาน (R) และรีแอคแตนซ์ (X) เข้าด้วยกัน ใช้แทนความต้านทานการไหลของกระแสในวงจร AC ต่างจากความต้านทานในวงจร DC ที่เป็นปริมาณสเกลาร์อย่างเดียว', 'อิมพีแดนซ์มีทั้งขนาดและมุมเฟส ซึ่งสะท้อนถึงความสัมพันธ์ระหว่างกระแสและแรงดันที่อาจไม่ตรงเฟสกันในวงจร AC', true, true
from categories c
where c.branch_id = '448937cf-58c5-4007-b57b-6a8bcf46c2fe' and c.code = 'circuits'
  and not exists (
    select 1 from questions q2
    where q2.category_id = c.id and q2.question = 'อิมพีแดนซ์ (Impedance) ในวงจรไฟฟ้ากระแสสลับคืออะไร และแตกต่างจากความต้านทานในวงจรกระแสตรงอย่างไร'
  );
insert into questions (category_id, question, answer, explanation, is_active, needs_review)
select c.id, 'เหตุใดการวิเคราะห์วงจรไฟฟ้ากระแสสลับจึงนิยมใช้จำนวนเชิงซ้อน (Complex Number) หรือ Phasor แทนฟังก์ชันเวลา', 'เพราะช่วยแปลงการคำนวณสมการเชิงอนุพันธ์ตามเวลาให้เป็นพีชคณิตธรรมดา ทำให้สามารถบวก ลบ คูณ หารปริมาณที่มีทั้งขนาดและมุมเฟสได้ง่ายขึ้นมาก', 'การใช้ Phasor อาศัยสมมติฐานว่าวงจรทำงานที่สภาวะคงตัวเชิงไซน์ (Sinusoidal Steady State) ที่ความถี่เดียวตลอดทั้งวงจร', true, true
from categories c
where c.branch_id = '448937cf-58c5-4007-b57b-6a8bcf46c2fe' and c.code = 'circuits'
  and not exists (
    select 1 from questions q2
    where q2.category_id = c.id and q2.question = 'เหตุใดการวิเคราะห์วงจรไฟฟ้ากระแสสลับจึงนิยมใช้จำนวนเชิงซ้อน (Complex Number) หรือ Phasor แทนฟังก์ชันเวลา'
  );
insert into questions (category_id, question, answer, explanation, is_active, needs_review)
select c.id, 'ความแตกต่างระหว่างวงจรเปิด (Open Circuit) และวงจรลัด (Short Circuit) ในแง่ของกระแสและแรงดันเป็นอย่างไร', 'วงจรเปิดมีความต้านทานเป็นอนันต์ ทำให้ไม่มีกระแสไหลผ่านแต่มีแรงดันตกคร่อมได้เต็มที่ ส่วนวงจรลัดมีความต้านทานเป็นศูนย์ ทำให้กระแสไหลได้สูงสุดแต่ไม่มีแรงดันตกคร่อม', 'วงจรลัดในระบบไฟฟ้าจริงเป็นอันตราย เพราะกระแสที่ไหลสูงมากจนเกินพิกัดของอุปกรณ์ ทำให้เกิดความร้อนสูงและอาจเกิดเพลิงไหม้ได้ จึงต้องมีอุปกรณ์ป้องกัน เช่น ฟิวส์หรือเบรกเกอร์', true, true
from categories c
where c.branch_id = '448937cf-58c5-4007-b57b-6a8bcf46c2fe' and c.code = 'circuits'
  and not exists (
    select 1 from questions q2
    where q2.category_id = c.id and q2.question = 'ความแตกต่างระหว่างวงจรเปิด (Open Circuit) และวงจรลัด (Short Circuit) ในแง่ของกระแสและแรงดันเป็นอย่างไร'
  );
insert into questions (category_id, question, answer, explanation, is_active, needs_review)
select c.id, 'การวัดกำลังไฟฟ้าในวงจร 3 เฟส ด้วยวิธี Two-Wattmeter Method ใช้หลักการอย่างไร', 'ใช้วัตต์มิเตอร์ 2 ตัวต่อในตำแหน่งที่เหมาะสมของวงจร 3 เฟส แล้วนำค่าที่อ่านได้จากทั้งสองตัวมาบวกกัน จะได้กำลังไฟฟ้ารวมของระบบ 3 เฟส แม้ระบบจะไม่สมดุลก็ตาม', 'วิธีนี้ประหยัดกว่าการใช้วัตต์มิเตอร์ 3 ตัว และยังสามารถใช้คำนวณค่าตัวประกอบกำลังของระบบได้จากอัตราส่วนของค่าที่อ่านได้ทั้งสองตัว', true, true
from categories c
where c.branch_id = '448937cf-58c5-4007-b57b-6a8bcf46c2fe' and c.code = 'circuits'
  and not exists (
    select 1 from questions q2
    where q2.category_id = c.id and q2.question = 'การวัดกำลังไฟฟ้าในวงจร 3 เฟส ด้วยวิธี Two-Wattmeter Method ใช้หลักการอย่างไร'
  );
insert into questions (category_id, question, answer, explanation, is_active, needs_review)
select c.id, 'เหตุใดระบบไฟฟ้าที่มีฮาร์มอนิก (Harmonics) สูงจึงเป็นปัญหาต่อวงจรไฟฟ้า', 'ฮาร์มอนิกทำให้รูปคลื่นแรงดันหรือกระแสผิดเพี้ยนไปจากรูปไซน์บริสุทธิ์ ก่อให้เกิดความร้อนเพิ่มขึ้นในสายไฟและอุปกรณ์ รบกวนอุปกรณ์อิเล็กทรอนิกส์ที่ไวต่อสัญญาณ และอาจทำให้ค่า Power Factor ที่แท้จริงลดลง', 'แหล่งกำเนิดฮาร์มอนิกที่พบบ่อยคืออุปกรณ์อิเล็กทรอนิกส์กำลังที่มีการสวิตชิ่งความถี่สูง เช่น อินเวอร์เตอร์ หรือหลอดไฟ LED บางชนิด', true, true
from categories c
where c.branch_id = '448937cf-58c5-4007-b57b-6a8bcf46c2fe' and c.code = 'circuits'
  and not exists (
    select 1 from questions q2
    where q2.category_id = c.id and q2.question = 'เหตุใดระบบไฟฟ้าที่มีฮาร์มอนิก (Harmonics) สูงจึงเป็นปัญหาต่อวงจรไฟฟ้า'
  );
insert into questions (category_id, question, answer, explanation, is_active, needs_review)
select c.id, 'ความต้านทานสมมูล (Equivalent Resistance) ของวงจรผสม (อนุกรมและขนานรวมกัน) มีแนวทางการคำนวณอย่างไร', 'ต้องวิเคราะห์โครงสร้างวงจรก่อนว่าส่วนใดต่ออนุกรมและส่วนใดต่อขนาน แล้วลดทอนทีละส่วนจากจุดที่ซับซ้อนน้อยที่สุดไปหามากที่สุด จนเหลือความต้านทานสมมูลค่าเดียว', 'การวิเคราะห์วงจรผสมที่ซับซ้อนมากอาจต้องใช้เทคนิคการแปลงวงจรแบบ Delta-Wye (Δ-Y Transformation) ช่วยในการลดทอน', true, true
from categories c
where c.branch_id = '448937cf-58c5-4007-b57b-6a8bcf46c2fe' and c.code = 'circuits'
  and not exists (
    select 1 from questions q2
    where q2.category_id = c.id and q2.question = 'ความต้านทานสมมูล (Equivalent Resistance) ของวงจรผสม (อนุกรมและขนานรวมกัน) มีแนวทางการคำนวณอย่างไร'
  );
insert into questions (category_id, question, answer, explanation, is_active, needs_review)
select c.id, 'การแปลงวงจร Delta-Wye (Δ-Y Transformation) มีประโยชน์อย่างไรในการวิเคราะห์วงจร', 'ใช้แปลงกลุ่มความต้านทานที่ต่อกันแบบสามเหลี่ยม (Delta) ให้เป็นแบบดาว (Wye) หรือกลับกัน เพื่อให้สามารถวิเคราะห์วงจรที่ไม่ใช่อนุกรมหรือขนานล้วนๆ ได้ง่ายขึ้น', 'มักใช้ในวงจรที่มีโครงสร้างสะพาน (Bridge Circuit) หรือวงจร 3 เฟสที่ไม่สามารถลดทอนด้วยกฎอนุกรม-ขนานพื้นฐานได้โดยตรง', true, true
from categories c
where c.branch_id = '448937cf-58c5-4007-b57b-6a8bcf46c2fe' and c.code = 'circuits'
  and not exists (
    select 1 from questions q2
    where q2.category_id = c.id and q2.question = 'การแปลงวงจร Delta-Wye (Δ-Y Transformation) มีประโยชน์อย่างไรในการวิเคราะห์วงจร'
  );
insert into questions (category_id, question, answer, explanation, is_active, needs_review)
select c.id, 'เหตุใดสายไฟที่ยาวมากในระบบไฟฟ้ากระแสสลับความถี่สูงจึงต้องพิจารณาผลของความเหนี่ยวนำและความจุของสายไฟเองด้วย', 'เพราะสายไฟที่ยาวมีค่าความเหนี่ยวนำและความจุแฝงกระจายตัวตลอดความยาวสาย ซึ่งที่ความถี่สูงค่าเหล่านี้มีผลต่อพฤติกรรมของสัญญาณอย่างมีนัยสำคัญ ไม่สามารถมองข้ามได้เหมือนที่ความถี่ต่ำ', 'ปรากฏการณ์นี้นำไปสู่แนวคิดสายส่ง (Transmission Line) ที่ต้องพิจารณาค่าอิมพีแดนซ์คุณลักษณะ (Characteristic Impedance) เพื่อป้องกันการสะท้อนกลับของสัญญาณ', true, true
from categories c
where c.branch_id = '448937cf-58c5-4007-b57b-6a8bcf46c2fe' and c.code = 'circuits'
  and not exists (
    select 1 from questions q2
    where q2.category_id = c.id and q2.question = 'เหตุใดสายไฟที่ยาวมากในระบบไฟฟ้ากระแสสลับความถี่สูงจึงต้องพิจารณาผลของความเหนี่ยวนำและความจุของสายไฟเองด้วย'
  );
insert into questions (category_id, question, answer, explanation, is_active, needs_review)
select c.id, 'กระแสไฟฟ้าเหนี่ยวนำ (Induced Current) เกิดขึ้นได้อย่างไรตามกฎการเหนี่ยวนำของฟาราเดย์ (Faraday''s Law)', 'เกิดขึ้นเมื่อมีการเปลี่ยนแปลงฟลักซ์แม่เหล็กที่ผ่านขดลวดตัวนำ โดยแรงเคลื่อนไฟฟ้าเหนี่ยวนำที่เกิดขึ้นแปรผันตามอัตราการเปลี่ยนแปลงของฟลักซ์แม่เหล็กตามเวลา', 'หลักการนี้เป็นพื้นฐานการทำงานของเครื่องกำเนิดไฟฟ้าและหม้อแปลงไฟฟ้าทุกชนิด', true, true
from categories c
where c.branch_id = '448937cf-58c5-4007-b57b-6a8bcf46c2fe' and c.code = 'circuits'
  and not exists (
    select 1 from questions q2
    where q2.category_id = c.id and q2.question = 'กระแสไฟฟ้าเหนี่ยวนำ (Induced Current) เกิดขึ้นได้อย่างไรตามกฎการเหนี่ยวนำของฟาราเดย์ (Faraday''s Law)'
  );
insert into questions (category_id, question, answer, explanation, is_active, needs_review)
select c.id, 'กฎของเลนซ์ (Lenz''s Law) มีความสัมพันธ์กับกฎการเหนี่ยวนำของฟาราเดย์อย่างไร', 'กฎของเลนซ์ระบุทิศทางของกระแสเหนี่ยวนำว่าจะไหลในทิศทางที่ต่อต้านการเปลี่ยนแปลงของฟลักซ์แม่เหล็กที่เป็นสาเหตุ ซึ่งเป็นส่วนเสริมของกฎฟาราเดย์ที่บอกเพียงขนาดของแรงเคลื่อนไฟฟ้าเหนี่ยวนำ', 'กฎของเลนซ์สอดคล้องกับหลักการอนุรักษ์พลังงาน เพราะหากกระแสเหนี่ยวนำไหลไปในทิศทางเสริมฟลักซ์แทนที่จะต่อต้าน จะทำให้พลังงานเพิ่มขึ้นได้เองโดยไม่มีแหล่งจ่ายภายนอก ซึ่งขัดกับกฎฟิสิกส์', true, true
from categories c
where c.branch_id = '448937cf-58c5-4007-b57b-6a8bcf46c2fe' and c.code = 'circuits'
  and not exists (
    select 1 from questions q2
    where q2.category_id = c.id and q2.question = 'กฎของเลนซ์ (Lenz''s Law) มีความสัมพันธ์กับกฎการเหนี่ยวนำของฟาราเดย์อย่างไร'
  );
insert into questions (category_id, question, answer, explanation, is_active, needs_review)
select c.id, 'การต่อวงจรแบบบริดจ์ (Wheatstone Bridge) ใช้หลักการใดในการวัดค่าความต้านทานที่ไม่ทราบค่า', 'ใช้หลักการปรับความต้านทานในแขนหนึ่งของวงจรจนกระแสที่ไหลผ่านกัลวานอมิเตอร์ตรงกลางเป็นศูนย์ (จุดสมดุล) ซึ่งขณะนั้นอัตราส่วนความต้านทานในแขนทั้งสี่ของบริดจ์จะมีความสัมพันธ์ที่ทราบค่า ทำให้คำนวณความต้านทานที่ไม่ทราบค่าได้', 'วงจรบริดจ์แบบนี้ให้ความแม่นยำสูงกว่าการวัดด้วยโอห์มมิเตอร์ธรรมดา เพราะไม่ขึ้นกับความแม่นยำของแหล่งจ่ายแรงดันที่ใช้', true, true
from categories c
where c.branch_id = '448937cf-58c5-4007-b57b-6a8bcf46c2fe' and c.code = 'circuits'
  and not exists (
    select 1 from questions q2
    where q2.category_id = c.id and q2.question = 'การต่อวงจรแบบบริดจ์ (Wheatstone Bridge) ใช้หลักการใดในการวัดค่าความต้านทานที่ไม่ทราบค่า'
  );
insert into questions (category_id, question, answer, explanation, is_active, needs_review)
select c.id, 'เหตุใดในการออกแบบวงจรไฟฟ้าจริงจึงต้องพิจารณาความคลาดเคลื่อน (Tolerance) ของค่าอุปกรณ์ เช่น ตัวต้านทาน แทนที่จะใช้ค่าตามป้ายเพียงอย่างเดียว', 'เพราะอุปกรณ์จริงมีความคลาดเคลื่อนจากกระบวนการผลิต เช่น ตัวต้านทานทั่วไปอาจมีค่าคลาดเคลื่อน ±5% หรือ ±10% จากค่าที่ระบุ หากไม่พิจารณาผลนี้ วงจรอาจทำงานคลาดเคลื่อนจากที่ออกแบบไว้เมื่อประกอบใช้งานจริง', 'ในวงจรที่ต้องการความแม่นยำสูง เช่น วงจรมาตรฐานอ้างอิง มักเลือกใช้อุปกรณ์ที่มีค่าความคลาดเคลื่อนต่ำเป็นพิเศษ (Precision Component) แม้จะมีราคาสูงกว่า', true, true
from categories c
where c.branch_id = '448937cf-58c5-4007-b57b-6a8bcf46c2fe' and c.code = 'circuits'
  and not exists (
    select 1 from questions q2
    where q2.category_id = c.id and q2.question = 'เหตุใดในการออกแบบวงจรไฟฟ้าจริงจึงต้องพิจารณาความคลาดเคลื่อน (Tolerance) ของค่าอุปกรณ์ เช่น ตัวต้านทาน แทนที่จะใช้ค่าตามป้ายเพียงอย่างเดียว'
  );
insert into questions (category_id, question, answer, explanation, is_active, needs_review)
select c.id, 'การต่อแบตเตอรี่หลายก้อนแบบอนุกรมและแบบขนาน ให้ผลต่อแรงดันและความจุกระแสไฟฟ้ารวมต่างกันอย่างไร', 'การต่ออนุกรมทำให้แรงดันรวมเพิ่มขึ้น (บวกกัน) แต่ความจุกระแส (Capacity) ยังคงเท่าเดิม ส่วนการต่อขนานทำให้ความจุกระแสรวมเพิ่มขึ้น (บวกกัน) แต่แรงดันยังคงเท่าเดิม', 'การเลือกวิธีต่อขึ้นอยู่กับความต้องการใช้งาน หากต้องการแรงดันสูงขึ้นให้ต่ออนุกรม หากต้องการให้จ่ายกระแสได้นานขึ้นหรือมากขึ้นให้ต่อขนาน โดยควรใช้แบตเตอรี่รุ่นและสภาพเดียวกันเพื่อป้องกันการชาร์จ/คายประจุไม่สมดุล', true, true
from categories c
where c.branch_id = '448937cf-58c5-4007-b57b-6a8bcf46c2fe' and c.code = 'circuits'
  and not exists (
    select 1 from questions q2
    where q2.category_id = c.id and q2.question = 'การต่อแบตเตอรี่หลายก้อนแบบอนุกรมและแบบขนาน ให้ผลต่อแรงดันและความจุกระแสไฟฟ้ารวมต่างกันอย่างไร'
  );
insert into questions (category_id, question, answer, explanation, is_active, needs_review)
select c.id, 'เหตุใดการวัดแรงดันไฟฟ้าต้องต่อโวลต์มิเตอร์แบบขนานกับวงจร ในขณะที่การวัดกระแสไฟฟ้าต้องต่อแอมมิเตอร์แบบอนุกรม', 'โวลต์มิเตอร์ในอุดมคติมีความต้านทานภายในสูงมาก (เข้าใกล้อนันต์) จึงต้องต่อขนานเพื่อไม่ให้ดึงกระแสจากวงจรเดิมมากเกินไปจนรบกวนการทำงาน ส่วนแอมมิเตอร์ในอุดมคติมีความต้านทานภายในต่ำมาก (เข้าใกล้ศูนย์) จึงต้องต่ออนุกรมเพื่อให้กระแสในวงจรไหลผ่านได้โดยไม่มีการตกคร่อมแรงดันเพิ่มเติมจากตัวมิเตอร์เอง', 'หากต่อแอมมิเตอร์ผิดวิธีคือต่อขนานกับวงจร จะเกิดการลัดวงจรผ่านความต้านทานภายในที่ต่ำมากของแอมมิเตอร์ อาจทำให้มิเตอร์เสียหายหรือเกิดอันตรายได้', true, true
from categories c
where c.branch_id = '448937cf-58c5-4007-b57b-6a8bcf46c2fe' and c.code = 'circuits'
  and not exists (
    select 1 from questions q2
    where q2.category_id = c.id and q2.question = 'เหตุใดการวัดแรงดันไฟฟ้าต้องต่อโวลต์มิเตอร์แบบขนานกับวงจร ในขณะที่การวัดกระแสไฟฟ้าต้องต่อแอมมิเตอร์แบบอนุกรม'
  );

commit;

-- ---------- ตรวจสอบผลลัพธ์ ----------
select c.name_th as category, count(q.id) as question_count
from categories c
left join questions q on q.category_id = c.id
where c.branch_id = '448937cf-58c5-4007-b57b-6a8bcf46c2fe' and c.code = 'circuits'
group by c.name_th;
