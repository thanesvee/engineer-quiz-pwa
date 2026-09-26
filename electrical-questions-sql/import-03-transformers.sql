-- ============================================================
-- นำเข้าคำถามสาขาไฟฟ้า หมวดที่ 3: หม้อแปลงไฟฟ้า (Transformers)
-- ไฟล์นี้รันได้อิสระ ไม่ต้องพึ่งไฟล์อื่น (idempotent)
-- ============================================================

begin;

-- ---------- เพิ่มหมวดหมู่ ----------
insert into categories (branch_id, code, name_th, sort_order)
select '448937cf-58c5-4007-b57b-6a8bcf46c2fe', 'transformers', 'หม้อแปลงไฟฟ้า (Transformers)', 3
where not exists (
  select 1 from categories where branch_id = '448937cf-58c5-4007-b57b-6a8bcf46c2fe' and code = 'transformers'
);

-- ---------- เพิ่มคำถาม (33 ข้อ) ----------
insert into questions (category_id, question, answer, explanation, is_active, needs_review)
select c.id, 'Vector Group ของหม้อแปลงไฟฟ้า 3 เฟส คืออะไร และมีความสำคัญอย่างไร', 'Vector Group คือสัญลักษณ์ที่บ่งบอกลักษณะการต่อขดลวดด้านปฐมภูมิและทุติยภูมิ (เช่น Delta หรือ Wye) พร้อมมุมเฟสที่แตกต่างกันระหว่างแรงดันทั้งสองด้าน (เช่น Dyn11) ซึ่งมีความสำคัญมากเมื่อต้องนำหม้อแปลงหลายตัวมาทำงานขนานกัน', 'หม้อแปลงที่มี Vector Group ต่างกันไม่สามารถต่อขนานกันได้โดยตรง เพราะมุมเฟสที่ไม่ตรงกันจะทำให้เกิดกระแสไหลเวียนขนาดใหญ่ระหว่างหม้อแปลงทั้งสองตัว', true, true
from categories c
where c.branch_id = '448937cf-58c5-4007-b57b-6a8bcf46c2fe' and c.code = 'transformers'
  and not exists (
    select 1 from questions q2
    where q2.category_id = c.id and q2.question = 'Vector Group ของหม้อแปลงไฟฟ้า 3 เฟส คืออะไร และมีความสำคัญอย่างไร'
  );
insert into questions (category_id, question, answer, explanation, is_active, needs_review)
select c.id, 'เงื่อนไขสำคัญในการนำหม้อแปลงไฟฟ้า 2 ตัวมาทำงานขนานกัน (Parallel Operation) มีอะไรบ้าง', 'ต้องมีอัตราส่วนแปลงแรงดัน (Turns Ratio) เท่ากัน, Vector Group ตรงกัน, ค่าอิมพีแดนซ์เปอร์เซ็นต์ (% Impedance) ใกล้เคียงกัน และมีอัตราส่วนกำลังพิกัดไม่แตกต่างกันมากเกินไป', 'หากค่าอิมพีแดนซ์เปอร์เซ็นต์ต่างกันมาก หม้อแปลงที่มีอิมพีแดนซ์ต่ำกว่าจะรับภาระโหลดมากกว่าสัดส่วนพิกัดของตน อาจทำให้เกิดโอเวอร์โหลดในหม้อแปลงตัวนั้นก่อนที่อีกตัวจะถึงพิกัด', true, true
from categories c
where c.branch_id = '448937cf-58c5-4007-b57b-6a8bcf46c2fe' and c.code = 'transformers'
  and not exists (
    select 1 from questions q2
    where q2.category_id = c.id and q2.question = 'เงื่อนไขสำคัญในการนำหม้อแปลงไฟฟ้า 2 ตัวมาทำงานขนานกัน (Parallel Operation) มีอะไรบ้าง'
  );
insert into questions (category_id, question, answer, explanation, is_active, needs_review)
select c.id, 'ค่าอิมพีแดนซ์เปอร์เซ็นต์ (% Impedance) ของหม้อแปลงไฟฟ้าคืออะไร และมีผลต่อการเลือกใช้งานอย่างไร', 'คือค่าแรงดันที่ต้องจ่ายด้านปฐมภูมิ (คิดเป็นเปอร์เซ็นต์ของแรงดันพิกัด) เพื่อให้เกิดกระแสพิกัดไหลด้านทุติยภูมิเมื่อลัดวงจร เป็นตัวบ่งชี้ว่าหม้อแปลงจะจำกัดกระแสลัดวงจรได้มากน้อยเพียงใด', 'หม้อแปลงที่มีค่าอิมพีแดนซ์เปอร์เซ็นต์ต่ำจะให้กระแสลัดวงจรสูงกว่าเมื่อเกิดความผิดพร่อง จึงต้องเลือกอุปกรณ์ป้องกันด้านทุติยภูมิให้ทนกระแสลัดวงจรที่อาจเกิดขึ้นได้', true, true
from categories c
where c.branch_id = '448937cf-58c5-4007-b57b-6a8bcf46c2fe' and c.code = 'transformers'
  and not exists (
    select 1 from questions q2
    where q2.category_id = c.id and q2.question = 'ค่าอิมพีแดนซ์เปอร์เซ็นต์ (% Impedance) ของหม้อแปลงไฟฟ้าคืออะไร และมีผลต่อการเลือกใช้งานอย่างไร'
  );
insert into questions (category_id, question, answer, explanation, is_active, needs_review)
select c.id, 'รีเลย์ Buchholz (Buchholz Relay) ในหม้อแปลงไฟฟ้าชนิดใช้น้ำมันทำหน้าที่อะไร', 'ตรวจจับก๊าซที่เกิดจากการสลายตัวของน้ำมันหม้อแปลงเนื่องจากความผิดปกติภายใน เช่น อาร์กไฟฟ้าหรือความร้อนสูงผิดปกติ โดยติดตั้งอยู่ในท่อระหว่างตัวถังหม้อแปลงกับถังขยายน้ำมัน (Conservator Tank)', 'รีเลย์นี้สามารถแยกแยะระหว่างความผิดปกติระดับเบา (สั่งแจ้งเตือน) กับความผิดปกติรุนแรง (สั่งตัดวงจร) ได้ ถือเป็นอุปกรณ์ป้องกันที่สำคัญมากสำหรับหม้อแปลงขนาดใหญ่', true, true
from categories c
where c.branch_id = '448937cf-58c5-4007-b57b-6a8bcf46c2fe' and c.code = 'transformers'
  and not exists (
    select 1 from questions q2
    where q2.category_id = c.id and q2.question = 'รีเลย์ Buchholz (Buchholz Relay) ในหม้อแปลงไฟฟ้าชนิดใช้น้ำมันทำหน้าที่อะไร'
  );
insert into questions (category_id, question, answer, explanation, is_active, needs_review)
select c.id, 'การป้องกันแบบผลต่างกระแส (Differential Protection) ของหม้อแปลงไฟฟ้าทำงานตามหลักการใด', 'เปรียบเทียบกระแสที่ไหลเข้าด้านปฐมภูมิกับกระแสที่ไหลออกด้านทุติยภูมิ (ผ่านหม้อแปลงกระแส CT ทั้งสองด้าน) หากกระแสทั้งสองไม่เท่ากันเกินค่าที่กำหนด แสดงว่ามีความผิดพร่องเกิดขึ้นภายในโซนป้องกัน จึงสั่งตัดวงจรทันที', 'การป้องกันแบบนี้มีความไวและความรวดเร็วสูง เพราะพิจารณาเฉพาะความผิดพร่องภายในโซนที่กำหนดเท่านั้น ไม่ได้รับผลกระทบจากความผิดพร่องภายนอกโซน', true, true
from categories c
where c.branch_id = '448937cf-58c5-4007-b57b-6a8bcf46c2fe' and c.code = 'transformers'
  and not exists (
    select 1 from questions q2
    where q2.category_id = c.id and q2.question = 'การป้องกันแบบผลต่างกระแส (Differential Protection) ของหม้อแปลงไฟฟ้าทำงานตามหลักการใด'
  );
insert into questions (category_id, question, answer, explanation, is_active, needs_review)
select c.id, 'Tap Changer ในหม้อแปลงไฟฟ้ามีหน้าที่อะไร และมีกี่ประเภทหลัก', 'ทำหน้าที่ปรับเปลี่ยนจำนวนรอบขดลวดที่ใช้งาน เพื่อปรับแรงดันขาออกให้เหมาะสมกับความต้องการ มี 2 ประเภทหลักคือ Off-load Tap Changer (ต้องตัดไฟก่อนปรับ) และ On-load Tap Changer หรือ OLTC (ปรับได้ขณะจ่ายไฟตามปกติ)', 'OLTC นิยมใช้ในหม้อแปลงจำหน่ายไฟฟ้าหลักที่ต้องรักษาระดับแรงดันให้คงที่ตลอดเวลาแม้ภาระจะเปลี่ยนแปลง โดยไม่ต้องหยุดจ่ายไฟให้ผู้ใช้ไฟฟ้า', true, true
from categories c
where c.branch_id = '448937cf-58c5-4007-b57b-6a8bcf46c2fe' and c.code = 'transformers'
  and not exists (
    select 1 from questions q2
    where q2.category_id = c.id and q2.question = 'Tap Changer ในหม้อแปลงไฟฟ้ามีหน้าที่อะไร และมีกี่ประเภทหลัก'
  );
insert into questions (category_id, question, answer, explanation, is_active, needs_review)
select c.id, 'Voltage Regulation ของหม้อแปลงไฟฟ้าคืออะไร และคำนวณจากอะไร', 'คือเปอร์เซ็นต์การเปลี่ยนแปลงของแรงดันขาออกระหว่างสภาวะไม่มีโหลด (No Load) กับสภาวะมีโหลดเต็มพิกัด (Full Load) ที่ตัวประกอบกำลังหนึ่งๆ เทียบกับแรงดันไม่มีโหลด', 'ค่า Voltage Regulation ที่ต่ำแสดงว่าหม้อแปลงรักษาระดับแรงดันได้ดีเมื่อภาระเปลี่ยนแปลง ซึ่งเป็นคุณสมบัติที่พึงประสงค์สำหรับหม้อแปลงจำหน่ายไฟฟ้า', true, true
from categories c
where c.branch_id = '448937cf-58c5-4007-b57b-6a8bcf46c2fe' and c.code = 'transformers'
  and not exists (
    select 1 from questions q2
    where q2.category_id = c.id and q2.question = 'Voltage Regulation ของหม้อแปลงไฟฟ้าคืออะไร และคำนวณจากอะไร'
  );
insert into questions (category_id, question, answer, explanation, is_active, needs_review)
select c.id, 'หม้อแปลงกระแส (Current Transformer, CT) และหม้อแปลงแรงดัน (Potential Transformer, PT) ใช้งานแตกต่างจากหม้อแปลงกำลังทั่วไปอย่างไร', 'CT และ PT เป็นหม้อแปลงเครื่องมือวัด (Instrument Transformer) ใช้แปลงกระแสหรือแรงดันขนาดใหญ่ในระบบไฟฟ้ากำลังให้เป็นค่าขนาดเล็กมาตรฐาน เพื่อใช้กับเครื่องมือวัดและรีเลย์ป้องกันได้อย่างปลอดภัย โดยไม่ได้มีวัตถุประสงค์ในการส่งผ่านกำลังไฟฟ้าเหมือนหม้อแปลงกำลัง', 'CT มีขดลวดปฐมภูมิต่ออนุกรมในวงจรกำลัง ส่วน PT มีขดลวดปฐมภูมิต่อขนานกับวงจรกำลัง ซึ่งตรงข้ามกับวิธีต่อของ CT', true, true
from categories c
where c.branch_id = '448937cf-58c5-4007-b57b-6a8bcf46c2fe' and c.code = 'transformers'
  and not exists (
    select 1 from questions q2
    where q2.category_id = c.id and q2.question = 'หม้อแปลงกระแส (Current Transformer, CT) และหม้อแปลงแรงดัน (Potential Transformer, PT) ใช้งานแตกต่างจากหม้อแปลงกำลังทั่วไปอย่างไร'
  );
insert into questions (category_id, question, answer, explanation, is_active, needs_review)
select c.id, 'เหตุใดจึงห้ามปล่อยให้ขดลวดทุติยภูมิของหม้อแปลงกระแส (CT) เปิดวงจร (Open Circuit) ขณะที่ยังมีกระแสไหลผ่านด้านปฐมภูมิ', 'เพราะ CT ถูกออกแบบให้ทำงานเสมือนแหล่งจ่ายกระแส หากด้านทุติยภูมิเปิดวงจร ฟลักซ์แม่เหล็กในแกนเหล็กจะไม่ถูกหักล้างจากกระแสทุติยภูมิ ทำให้ฟลักซ์สูงมากผิดปกติ เกิดแรงดันเหนี่ยวนำสูงมากที่ขั้วทุติยภูมิ ซึ่งอาจเป็นอันตรายต่อผู้ปฏิบัติงานและทำให้ฉนวนของ CT เสียหาย', 'ในทางปฏิบัติ หากต้องถอดอุปกรณ์วัดออกจากวงจรทุติยภูมิของ CT จะต้องลัดวงจร (Short) ขั้วทุติยภูมิไว้ก่อนเสมอเพื่อความปลอดภัย', true, true
from categories c
where c.branch_id = '448937cf-58c5-4007-b57b-6a8bcf46c2fe' and c.code = 'transformers'
  and not exists (
    select 1 from questions q2
    where q2.category_id = c.id and q2.question = 'เหตุใดจึงห้ามปล่อยให้ขดลวดทุติยภูมิของหม้อแปลงกระแส (CT) เปิดวงจร (Open Circuit) ขณะที่ยังมีกระแสไหลผ่านด้านปฐมภูมิ'
  );
insert into questions (category_id, question, answer, explanation, is_active, needs_review)
select c.id, 'หม้อแปลง 3 ขดลวด (Three-Winding Transformer) มีลักษณะการใช้งานอย่างไร และมีขดลวดที่ 3 ไว้เพื่อจุดประสงค์ใดโดยทั่วไป', 'เป็นหม้อแปลงที่มีขดลวด 3 ชุดต่อร่วมแกนเหล็กเดียวกัน สามารถจ่ายไฟให้โหลด 2 ระดับแรงดันที่แตกต่างกันจากแหล่งจ่ายเดียว ขดลวดที่ 3 มักเป็นขดลวด Delta ขนาดเล็กที่ไม่ได้จ่ายโหลดโดยตรง แต่ทำหน้าที่ลดฮาร์มอนิกและให้เส้นทางกระแสลำดับศูนย์', 'หม้อแปลง 3 ขดลวดนิยมใช้ในสถานีไฟฟ้าย่อยที่ต้องจ่ายไฟให้ทั้งระบบส่งและระบบจำหน่ายพร้อมกันจากหม้อแปลงตัวเดียว ลดจำนวนอุปกรณ์ที่ต้องติดตั้ง', true, true
from categories c
where c.branch_id = '448937cf-58c5-4007-b57b-6a8bcf46c2fe' and c.code = 'transformers'
  and not exists (
    select 1 from questions q2
    where q2.category_id = c.id and q2.question = 'หม้อแปลง 3 ขดลวด (Three-Winding Transformer) มีลักษณะการใช้งานอย่างไร และมีขดลวดที่ 3 ไว้เพื่อจุดประสงค์ใดโดยทั่วไป'
  );
insert into questions (category_id, question, answer, explanation, is_active, needs_review)
select c.id, 'การเกิดกระแสพุ่งเข้า (Inrush Current) ขณะสับสวิตช์จ่ายไฟให้หม้อแปลงเกิดจากสาเหตุใด', 'เกิดจากฟลักซ์แม่เหล็กตกค้าง (Residual Flux) ในแกนเหล็กร่วมกับจังหวะมุมเฟสของแรงดันขณะสับสวิตช์ ทำให้ฟลักซ์รวมในแกนเหล็กสูงเกินจุดอิ่มตัว ส่งผลให้กระแสแม่เหล็กไหลสูงมากในช่วงเสี้ยววินาทีแรก', 'กระแสพุ่งเข้านี้อาจสูงถึง 6-10 เท่าของกระแสพิกัด แต่ลดลงอย่างรวดเร็วภายในไม่กี่รอบคลื่น รีเลย์ป้องกันหม้อแปลงจึงต้องออกแบบให้แยกแยะกระแสพุ่งเข้านี้ออกจากกระแสลัดวงจรจริง เพื่อไม่ให้ตัดวงจรผิดพลาดโดยไม่จำเป็น', true, true
from categories c
where c.branch_id = '448937cf-58c5-4007-b57b-6a8bcf46c2fe' and c.code = 'transformers'
  and not exists (
    select 1 from questions q2
    where q2.category_id = c.id and q2.question = 'การเกิดกระแสพุ่งเข้า (Inrush Current) ขณะสับสวิตช์จ่ายไฟให้หม้อแปลงเกิดจากสาเหตุใด'
  );
insert into questions (category_id, question, answer, explanation, is_active, needs_review)
select c.id, 'รีเลย์ป้องกันหม้อแปลงมักใช้เทคนิคใดในการแยกแยะระหว่างกระแสพุ่งเข้า (Inrush Current) กับกระแสลัดวงจรจริง', 'อาศัยการตรวจจับปริมาณฮาร์มอนิกลำดับที่ 2 (Second Harmonic) ในรูปคลื่นกระแส เนื่องจากกระแสพุ่งเข้ามีสัดส่วนฮาร์มอนิกลำดับที่ 2 สูงกว่ากระแสลัดวงจรจริงอย่างชัดเจน หากตรวจพบฮาร์มอนิกนี้สูงเกินเกณฑ์ รีเลย์จะหน่วงหรือไม่สั่งตัดวงจร', 'เทคนิคนี้เรียกว่า Second Harmonic Restraint ซึ่งเป็นฟังก์ชันมาตรฐานที่มีอยู่ในรีเลย์ป้องกันผลต่างกระแสของหม้อแปลง (Differential Relay) รุ่นใหม่ทั่วไป', true, true
from categories c
where c.branch_id = '448937cf-58c5-4007-b57b-6a8bcf46c2fe' and c.code = 'transformers'
  and not exists (
    select 1 from questions q2
    where q2.category_id = c.id and q2.question = 'รีเลย์ป้องกันหม้อแปลงมักใช้เทคนิคใดในการแยกแยะระหว่างกระแสพุ่งเข้า (Inrush Current) กับกระแสลัดวงจรจริง'
  );
insert into questions (category_id, question, answer, explanation, is_active, needs_review)
select c.id, 'การทดสอบอัตราส่วนขดลวด (Turns Ratio Test) ของหม้อแปลงมีวัตถุประสงค์อะไร', 'ตรวจสอบว่าอัตราส่วนแรงดันระหว่างขดลวดปฐมภูมิและทุติยภูมิตรงตามค่าที่ระบุในแผ่นป้าย (Nameplate) หรือไม่ เพื่อยืนยันว่าไม่มีขดลวดลัดวงจรบางส่วน (Turn-to-turn Short) ซึ่งเป็นความผิดปกติที่ตรวจจับได้ยากด้วยวิธีอื่น', 'มักทำการทดสอบนี้ทั้งก่อนติดตั้งใช้งานครั้งแรก และเป็นส่วนหนึ่งของการบำรุงรักษาเชิงป้องกันตามระยะเวลาที่กำหนด', true, true
from categories c
where c.branch_id = '448937cf-58c5-4007-b57b-6a8bcf46c2fe' and c.code = 'transformers'
  and not exists (
    select 1 from questions q2
    where q2.category_id = c.id and q2.question = 'การทดสอบอัตราส่วนขดลวด (Turns Ratio Test) ของหม้อแปลงมีวัตถุประสงค์อะไร'
  );
insert into questions (category_id, question, answer, explanation, is_active, needs_review)
select c.id, 'ค่าความต้านทานฉนวน (Insulation Resistance) ของหม้อแปลงไฟฟ้า วัดด้วยเครื่องมือใด และบ่งบอกอะไร', 'วัดด้วยเครื่อง Megger หรือ Insulation Resistance Tester โดยจ่ายแรงดันไฟฟ้ากระแสตรงค่าสูงเข้าไประหว่างขดลวดกับตัวถัง (Ground) เพื่อวัดความต้านทานฉนวน ค่าที่ต่ำผิดปกติบ่งบอกถึงความชื้นหรือการเสื่อมสภาพของฉนวน', 'ค่าความต้านทานฉนวนที่วัดได้ควรนำมาเปรียบเทียบกับค่ามาตรฐานหรือค่าที่วัดได้ในอดีต เพื่อประเมินแนวโน้มการเสื่อมสภาพของฉนวนตามอายุการใช้งาน', true, true
from categories c
where c.branch_id = '448937cf-58c5-4007-b57b-6a8bcf46c2fe' and c.code = 'transformers'
  and not exists (
    select 1 from questions q2
    where q2.category_id = c.id and q2.question = 'ค่าความต้านทานฉนวน (Insulation Resistance) ของหม้อแปลงไฟฟ้า วัดด้วยเครื่องมือใด และบ่งบอกอะไร'
  );
insert into questions (category_id, question, answer, explanation, is_active, needs_review)
select c.id, 'การทดสอบ Dissolved Gas Analysis (DGA) ของน้ำมันหม้อแปลงมีประโยชน์อย่างไร', 'วิเคราะห์ปริมาณและชนิดของก๊าซที่ละลายอยู่ในน้ำมันหม้อแปลง ซึ่งเกิดจากการสลายตัวของน้ำมันหรือฉนวนกระดาษภายใต้ความร้อนหรืออาร์กไฟฟ้า สามารถบ่งชี้ถึงความผิดปกติภายในหม้อแปลงได้ตั้งแต่ระยะเริ่มต้นก่อนที่จะเกิดความเสียหายรุนแรง', 'อัตราส่วนของก๊าซแต่ละชนิด เช่น Acetylene, Ethylene, Methane สามารถช่วยวินิจฉัยประเภทของความผิดปกติ เช่น อาร์กไฟฟ้าพลังงานสูง ความร้อนสูงเฉพาะจุด หรือ Partial Discharge ได้อย่างเจาะจงมากขึ้น', true, true
from categories c
where c.branch_id = '448937cf-58c5-4007-b57b-6a8bcf46c2fe' and c.code = 'transformers'
  and not exists (
    select 1 from questions q2
    where q2.category_id = c.id and q2.question = 'การทดสอบ Dissolved Gas Analysis (DGA) ของน้ำมันหม้อแปลงมีประโยชน์อย่างไร'
  );
insert into questions (category_id, question, answer, explanation, is_active, needs_review)
select c.id, 'หม้อแปลงชนิดแห้ง (Dry-type Transformer) แตกต่างจากหม้อแปลงชนิดใช้น้ำมัน (Oil-immersed Transformer) อย่างไร และเหมาะกับการใช้งานลักษณะใด', 'หม้อแปลงชนิดแห้งใช้อากาศหรือเรซินหล่อเป็นฉนวนและระบายความร้อนแทนน้ำมัน ไม่มีความเสี่ยงจากการรั่วไหลหรือติดไฟของน้ำมัน จึงเหมาะกับการติดตั้งภายในอาคารหรือพื้นที่ที่มีข้อจำกัดด้านความปลอดภัยจากอัคคีภัย', 'หม้อแปลงชนิดแห้งมักมีราคาสูงกว่าและระบายความร้อนได้จำกัดกว่าชนิดน้ำมันที่พิกัดกำลังเดียวกัน จึงนิยมใช้กับหม้อแปลงขนาดกลางถึงเล็กที่ติดตั้งในอาคาร เช่น ห้างสรรพสินค้าหรืออาคารสำนักงาน', true, true
from categories c
where c.branch_id = '448937cf-58c5-4007-b57b-6a8bcf46c2fe' and c.code = 'transformers'
  and not exists (
    select 1 from questions q2
    where q2.category_id = c.id and q2.question = 'หม้อแปลงชนิดแห้ง (Dry-type Transformer) แตกต่างจากหม้อแปลงชนิดใช้น้ำมัน (Oil-immersed Transformer) อย่างไร และเหมาะกับการใช้งานลักษณะใด'
  );
insert into questions (category_id, question, answer, explanation, is_active, needs_review)
select c.id, 'การต่อกราวด์ (Grounding) จุดนิวทรัลของหม้อแปลงมีวัตถุประสงค์หลักอะไร', 'เพื่อรักษาระดับแรงดันของระบบเทียบกับดินให้อยู่ในระดับที่ปลอดภัยและคาดการณ์ได้ ช่วยให้อุปกรณ์ป้องกันสามารถตรวจจับและตัดวงจรเมื่อเกิดความผิดพร่องลงดินได้อย่างมีประสิทธิภาพ', 'วิธีการต่อกราวด์นิวทรัล เช่น ต่อตรง (Solid Grounding) หรือผ่านความต้านทาน/รีแอคแตนซ์ (Resistance/Reactance Grounding) มีผลต่อขนาดกระแสลัดวงจรลงดินและระดับแรงดันเกินที่อาจเกิดขึ้นในระบบแตกต่างกัน', true, true
from categories c
where c.branch_id = '448937cf-58c5-4007-b57b-6a8bcf46c2fe' and c.code = 'transformers'
  and not exists (
    select 1 from questions q2
    where q2.category_id = c.id and q2.question = 'การต่อกราวด์ (Grounding) จุดนิวทรัลของหม้อแปลงมีวัตถุประสงค์หลักอะไร'
  );
insert into questions (category_id, question, answer, explanation, is_active, needs_review)
select c.id, 'การเกิด Partial Discharge ในฉนวนของหม้อแปลงคืออะไร และเป็นสัญญาณเตือนของปัญหาใด', 'คือการปล่อยประจุไฟฟ้าเฉพาะจุดขนาดเล็กภายในช่องว่างอากาศหรือรอยบกพร่องในฉนวน โดยไม่ทำให้ฉนวนวิบัติสมบูรณ์ในทันที แต่เป็นสัญญาณเตือนของความบกพร่องในฉนวนที่อาจขยายตัวจนวิบัติสมบูรณ์ได้ในอนาคต', 'การตรวจวัด Partial Discharge เป็นเทคนิคการวินิจฉัยสภาพฉนวนแบบไม่ทำลาย (Non-Destructive) ที่นิยมใช้ตรวจสอบหม้อแปลงและอุปกรณ์ไฟฟ้าแรงสูงในเชิงป้องกันก่อนเกิดความเสียหาย', true, true
from categories c
where c.branch_id = '448937cf-58c5-4007-b57b-6a8bcf46c2fe' and c.code = 'transformers'
  and not exists (
    select 1 from questions q2
    where q2.category_id = c.id and q2.question = 'การเกิด Partial Discharge ในฉนวนของหม้อแปลงคืออะไร และเป็นสัญญาณเตือนของปัญหาใด'
  );
insert into questions (category_id, question, answer, explanation, is_active, needs_review)
select c.id, 'เหตุใดหม้อแปลงไฟฟ้าที่ทำงานเกินพิกัด (Overload) เป็นเวลานานจึงส่งผลเสียต่ออายุการใช้งาน', 'การทำงานเกินพิกัดทำให้อุณหภูมิของขดลวดและน้ำมันสูงขึ้นเกินค่าที่ออกแบบไว้ ซึ่งเร่งอัตราการเสื่อมสภาพของฉนวนกระดาษที่หุ้มขดลวดตามหลักการทางเคมีที่อัตราการเสื่อมสภาพเพิ่มขึ้นแบบทวีคูณตามอุณหภูมิที่สูงขึ้น', 'มีหลักการโดยประมาณว่าทุกๆ อุณหภูมิที่เพิ่มขึ้น 6-8 องศาเซลเซียสเหนือค่าที่ออกแบบ อายุการใช้งานของฉนวนจะลดลงประมาณครึ่งหนึ่ง ซึ่งเป็นเหตุผลที่การควบคุมอุณหภูมิหม้อแปลงมีความสำคัญมาก', true, true
from categories c
where c.branch_id = '448937cf-58c5-4007-b57b-6a8bcf46c2fe' and c.code = 'transformers'
  and not exists (
    select 1 from questions q2
    where q2.category_id = c.id and q2.question = 'เหตุใดหม้อแปลงไฟฟ้าที่ทำงานเกินพิกัด (Overload) เป็นเวลานานจึงส่งผลเสียต่ออายุการใช้งาน'
  );
insert into questions (category_id, question, answer, explanation, is_active, needs_review)
select c.id, 'ระบบระบายความร้อนของหม้อแปลงชนิด ONAN และ ONAF แตกต่างกันอย่างไร', 'ONAN (Oil Natural Air Natural) ใช้การพาความร้อนตามธรรมชาติทั้งของน้ำมันและอากาศ ส่วน ONAF (Oil Natural Air Forced) ใช้การพาความร้อนตามธรรมชาติของน้ำมัน แต่ใช้พัดลมบังคับอากาศให้ไหลผ่านหม้อน้ำระบายความร้อนเพื่อเพิ่มประสิทธิภาพการระบายความร้อน', 'หม้อแปลงตัวเดียวกันมักมีพิกัดกำลังหลายระดับตามระบบระบายความร้อนที่ใช้งาน เช่น ONAN/ONAF สามารถเพิ่มพิกัดกำลังได้เมื่อเปิดพัดลมทำงานเสริมจากการระบายความร้อนตามธรรมชาติ', true, true
from categories c
where c.branch_id = '448937cf-58c5-4007-b57b-6a8bcf46c2fe' and c.code = 'transformers'
  and not exists (
    select 1 from questions q2
    where q2.category_id = c.id and q2.question = 'ระบบระบายความร้อนของหม้อแปลงชนิด ONAN และ ONAF แตกต่างกันอย่างไร'
  );
insert into questions (category_id, question, answer, explanation, is_active, needs_review)
select c.id, 'การทดสอบ Winding Resistance ของหม้อแปลงมีประโยชน์ในการวินิจฉัยปัญหาใด', 'ใช้ตรวจสอบความสมบูรณ์ของขดลวดและจุดต่อภายใน หากพบค่าความต้านทานสูงผิดปกติหรือไม่สมดุลระหว่างเฟส อาจบ่งชี้ถึงจุดต่อหลวม การกัดกร่อน หรือความเสียหายบางส่วนของขดลวด', 'การทดสอบนี้มักทำร่วมกับการทดสอบอัตราส่วนขดลวดและการทดสอบฉนวน เพื่อประเมินสภาพโดยรวมของหม้อแปลงก่อนนำเข้าใช้งานหรือระหว่างการบำรุงรักษาตามวาระ', true, true
from categories c
where c.branch_id = '448937cf-58c5-4007-b57b-6a8bcf46c2fe' and c.code = 'transformers'
  and not exists (
    select 1 from questions q2
    where q2.category_id = c.id and q2.question = 'การทดสอบ Winding Resistance ของหม้อแปลงมีประโยชน์ในการวินิจฉัยปัญหาใด'
  );
insert into questions (category_id, question, answer, explanation, is_active, needs_review)
select c.id, 'เหตุใดหม้อแปลงไฟฟ้าแรงสูงขนาดใหญ่มักมีการติดตั้ง Silica Gel Breather ที่ถังขยายน้ำมัน (Conservator)', 'เพื่อดูดความชื้นออกจากอากาศที่ไหลเข้าออกถังขยายน้ำมันตามการขยายและหดตัวของน้ำมันเมื่ออุณหภูมิเปลี่ยนแปลง ป้องกันไม่ให้ความชื้นจากอากาศภายนอกเข้าไปปนเปื้อนในน้ำมันหม้อแปลง', 'ความชื้นในน้ำมันหม้อแปลงเป็นสาเหตุสำคัญที่ทำให้คุณสมบัติการเป็นฉนวนของน้ำมันลดลง จึงต้องมีการตรวจสอบและเปลี่ยน Silica Gel เมื่อเปลี่ยนสีเป็นระยะตามคู่มือบำรุงรักษา', true, true
from categories c
where c.branch_id = '448937cf-58c5-4007-b57b-6a8bcf46c2fe' and c.code = 'transformers'
  and not exists (
    select 1 from questions q2
    where q2.category_id = c.id and q2.question = 'เหตุใดหม้อแปลงไฟฟ้าแรงสูงขนาดใหญ่มักมีการติดตั้ง Silica Gel Breather ที่ถังขยายน้ำมัน (Conservator)'
  );
insert into questions (category_id, question, answer, explanation, is_active, needs_review)
select c.id, 'การเลือกขนาดพิกัดหม้อแปลง (kVA Rating) ให้เหมาะสมกับโหลดของอาคาร ควรพิจารณาปัจจัยใดเป็นหลัก', 'ต้องพิจารณาผลรวมโหลดสูงสุดที่คาดว่าจะใช้งานพร้อมกันจริง (Demand Load หลังคูณ Demand Factor) ไม่ใช่ผลรวมพิกัดของอุปกรณ์ไฟฟ้าทั้งหมดในอาคารโดยตรง รวมถึงเผื่อสำรองสำหรับการขยายโหลดในอนาคต', 'การเลือกขนาดหม้อแปลงใหญ่เกินความจำเป็นทำให้หม้อแปลงทำงานที่ภาระต่ำเป็นส่วนใหญ่ ซึ่งมีประสิทธิภาพต่ำกว่าการทำงานใกล้พิกัด และสิ้นเปลืองเงินลงทุนเกินความจำเป็น', true, true
from categories c
where c.branch_id = '448937cf-58c5-4007-b57b-6a8bcf46c2fe' and c.code = 'transformers'
  and not exists (
    select 1 from questions q2
    where q2.category_id = c.id and q2.question = 'การเลือกขนาดพิกัดหม้อแปลง (kVA Rating) ให้เหมาะสมกับโหลดของอาคาร ควรพิจารณาปัจจัยใดเป็นหลัก'
  );
insert into questions (category_id, question, answer, explanation, is_active, needs_review)
select c.id, 'Neutral Grounding Resistor (NGR) ที่ต่อร่วมกับจุดนิวทรัลของหม้อแปลงมีหน้าที่อะไร', 'ทำหน้าที่จำกัดขนาดกระแสลัดวงจรลงดินให้อยู่ในระดับที่ควบคุมได้ ลดความเสียหายจากอาร์กไฟฟ้ารุนแรงและแรงดันเกินชั่วครู่ที่อาจเกิดขึ้นเมื่อมีความผิดพร่องลงดินในระบบ', 'การเลือกขนาดความต้านทานของ NGR ต้องสมดุลระหว่างการจำกัดกระแสลัดวงจรให้ต่ำพอที่จะไม่สร้างความเสียหายรุนแรง แต่ยังสูงพอที่อุปกรณ์ป้องกันจะตรวจจับความผิดพร่องได้อย่างแม่นยำ', true, true
from categories c
where c.branch_id = '448937cf-58c5-4007-b57b-6a8bcf46c2fe' and c.code = 'transformers'
  and not exists (
    select 1 from questions q2
    where q2.category_id = c.id and q2.question = 'Neutral Grounding Resistor (NGR) ที่ต่อร่วมกับจุดนิวทรัลของหม้อแปลงมีหน้าที่อะไร'
  );
insert into questions (category_id, question, answer, explanation, is_active, needs_review)
select c.id, 'มาตรฐานการทดสอบหม้อแปลงไฟฟ้าก่อนส่งมอบจากโรงงาน (Routine Test) โดยทั่วไปครอบคลุมรายการใดบ้าง', 'โดยทั่วไปครอบคลุมการวัดความต้านทานขดลวด, การทดสอบอัตราส่วนขดลวดและตรวจสอบ Vector Group, การทดสอบความต้านทานฉนวน, การทดสอบวงจรเปิดและวงจรลัด และการทดสอบทนแรงดันไฟฟ้า (Voltage Withstand Test)', 'การทดสอบเหล่านี้ทำเพื่อยืนยันว่าหม้อแปลงที่ผลิตเสร็จมีคุณสมบัติตรงตามข้อกำหนดการออกแบบและมาตรฐานที่เกี่ยวข้อง ก่อนส่งมอบให้ผู้ใช้งานนำไปติดตั้งจริง', true, true
from categories c
where c.branch_id = '448937cf-58c5-4007-b57b-6a8bcf46c2fe' and c.code = 'transformers'
  and not exists (
    select 1 from questions q2
    where q2.category_id = c.id and q2.question = 'มาตรฐานการทดสอบหม้อแปลงไฟฟ้าก่อนส่งมอบจากโรงงาน (Routine Test) โดยทั่วไปครอบคลุมรายการใดบ้าง'
  );
insert into questions (category_id, question, answer, explanation, is_active, needs_review)
select c.id, 'เหตุใดจึงไม่ควรต่อขนานหม้อแปลงที่มีค่าอัตราส่วนแปลง (Turns Ratio) ต่างกัน แม้จะมี Vector Group เดียวกัน', 'หากอัตราส่วนแปลงต่างกัน แรงดันขาออกที่ไม่มีโหลดของหม้อแปลงทั้งสองตัวจะไม่เท่ากัน เกิดผลต่างแรงดัน (Circulating Voltage) ซึ่งขับให้เกิดกระแสไหลเวียนระหว่างหม้อแปลงทั้งสองตัวตลอดเวลาแม้ไม่มีโหลดภายนอก ทำให้เกิดการสูญเสียพลังงานและความร้อนสะสมโดยไม่จำเป็น', 'กระแสไหลเวียนนี้จะลดความสามารถในการจ่ายโหลดจริงของระบบ เพราะส่วนหนึ่งของความสามารถหม้อแปลงถูกใช้ไปกับกระแสไหลเวียนที่ไม่ก่อให้เกิดประโยชน์', true, true
from categories c
where c.branch_id = '448937cf-58c5-4007-b57b-6a8bcf46c2fe' and c.code = 'transformers'
  and not exists (
    select 1 from questions q2
    where q2.category_id = c.id and q2.question = 'เหตุใดจึงไม่ควรต่อขนานหม้อแปลงที่มีค่าอัตราส่วนแปลง (Turns Ratio) ต่างกัน แม้จะมี Vector Group เดียวกัน'
  );
insert into questions (category_id, question, answer, explanation, is_active, needs_review)
select c.id, 'การป้องกันหม้อแปลงด้วยฟิวส์แรงสูง (High Voltage Fuse) เหมาะกับหม้อแปลงขนาดใดเป็นหลัก และมีข้อจำกัดอย่างไร', 'เหมาะกับหม้อแปลงขนาดเล็กถึงขนาดกลางที่ไม่คุ้มค่ากับการติดตั้งระบบป้องกันแบบรีเลย์ที่ซับซ้อน ข้อจำกัดคือฟิวส์ไม่สามารถแยกแยะกระแสพุ่งเข้ากับกระแสลัดวงจรจริงได้ดีเท่ารีเลย์ และไม่มีความสามารถในการปรับตั้งค่าให้เหมาะกับสภาพการทำงานที่เปลี่ยนแปลง', 'หม้อแปลงขนาดใหญ่ในระบบไฟฟ้ากำลังจึงมักใช้ระบบป้องกันแบบรีเลย์ผลต่างกระแสร่วมกับเซอร์กิตเบรกเกอร์แทนฟิวส์ เพื่อความแม่นยำและความน่าเชื่อถือที่สูงกว่า', true, true
from categories c
where c.branch_id = '448937cf-58c5-4007-b57b-6a8bcf46c2fe' and c.code = 'transformers'
  and not exists (
    select 1 from questions q2
    where q2.category_id = c.id and q2.question = 'การป้องกันหม้อแปลงด้วยฟิวส์แรงสูง (High Voltage Fuse) เหมาะกับหม้อแปลงขนาดใดเป็นหลัก และมีข้อจำกัดอย่างไร'
  );
insert into questions (category_id, question, answer, explanation, is_active, needs_review)
select c.id, 'การทำ Load Tap Changing (LTC) โดยไม่ตัดไฟระหว่างการปรับแทป มีหลักการทางเทคนิคอย่างไรเพื่อไม่ให้เกิดวงจรเปิดชั่วขณะ', 'ใช้ความต้านทานหรือรีแอคเตอร์เปลี่ยนผ่าน (Transition Resistor/Reactor) เชื่อมต่อระหว่างแทปเก่าและแทปใหม่ชั่วขณะระหว่างกระบวนการสลับ เพื่อให้กระแสยังคงไหลผ่านได้ต่อเนื่องโดยไม่เกิดการเปิดวงจรหรืออาร์กไฟฟ้ารุนแรง', 'กลไกนี้ต้องทำงานรวดเร็วและแม่นยำ เนื่องจากต้องสลับตำแหน่งแทปขณะที่ยังมีกระแสไหลผ่านเต็มพิกัด จึงเป็นกลไกเชิงกลที่ซับซ้อนและต้องมีการบำรุงรักษาเฉพาะทาง', true, true
from categories c
where c.branch_id = '448937cf-58c5-4007-b57b-6a8bcf46c2fe' and c.code = 'transformers'
  and not exists (
    select 1 from questions q2
    where q2.category_id = c.id and q2.question = 'การทำ Load Tap Changing (LTC) โดยไม่ตัดไฟระหว่างการปรับแทป มีหลักการทางเทคนิคอย่างไรเพื่อไม่ให้เกิดวงจรเปิดชั่วขณะ'
  );
insert into questions (category_id, question, answer, explanation, is_active, needs_review)
select c.id, 'ทำไมการติดตั้งหม้อแปลงไฟฟ้าขนาดใหญ่จึงมักต้องมีการออกแบบบ่อดักน้ำมัน (Oil Containment) รอบฐานติดตั้ง', 'เพื่อป้องกันไม่ให้น้ำมันหม้อแปลงที่อาจรั่วไหลหรือไหลออกกรณีเกิดอุบัติเหตุร้ายแรง แพร่กระจายไปปนเปื้อนสิ่งแวดล้อมหรือก่อให้เกิดเพลิงไหม้ลุกลามไปยังพื้นที่ข้างเคียง', 'ขนาดของบ่อดักน้ำมันมักออกแบบให้รองรับปริมาณน้ำมันทั้งหมดในหม้อแปลงได้ ตามข้อกำหนดด้านความปลอดภัยและสิ่งแวดล้อมที่เกี่ยวข้อง', true, true
from categories c
where c.branch_id = '448937cf-58c5-4007-b57b-6a8bcf46c2fe' and c.code = 'transformers'
  and not exists (
    select 1 from questions q2
    where q2.category_id = c.id and q2.question = 'ทำไมการติดตั้งหม้อแปลงไฟฟ้าขนาดใหญ่จึงมักต้องมีการออกแบบบ่อดักน้ำมัน (Oil Containment) รอบฐานติดตั้ง'
  );
insert into questions (category_id, question, answer, explanation, is_active, needs_review)
select c.id, 'เหตุใดการติดตั้งหม้อแปลงไฟฟ้าภายในอาคารจึงต้องพิจารณาเรื่องระยะห่างความปลอดภัยทางไฟฟ้า (Electrical Clearance) เป็นพิเศษ', 'เพื่อป้องกันการเกิดอาร์กไฟฟ้าข้ามระหว่างส่วนที่มีแรงดันไฟฟ้าต่างศักย์กับโครงสร้างที่ต่อกราวด์หรือส่วนอื่นๆ ที่อยู่ใกล้เคียง ระยะห่างที่เพียงพอช่วยลดความเสี่ยงจากไฟฟ้าลัดวงจรและอันตรายต่อผู้ปฏิบัติงาน', 'ระยะห่างความปลอดภัยที่ต้องการจะแปรผันตามระดับแรงดันไฟฟ้าของหม้อแปลง ยิ่งแรงดันสูงยิ่งต้องการระยะห่างมากขึ้นตามข้อกำหนดมาตรฐานที่เกี่ยวข้อง', true, true
from categories c
where c.branch_id = '448937cf-58c5-4007-b57b-6a8bcf46c2fe' and c.code = 'transformers'
  and not exists (
    select 1 from questions q2
    where q2.category_id = c.id and q2.question = 'เหตุใดการติดตั้งหม้อแปลงไฟฟ้าภายในอาคารจึงต้องพิจารณาเรื่องระยะห่างความปลอดภัยทางไฟฟ้า (Electrical Clearance) เป็นพิเศษ'
  );
insert into questions (category_id, question, answer, explanation, is_active, needs_review)
select c.id, 'ค่า Nameplate Rating ของหม้อแปลงไฟฟ้าโดยทั่วไประบุข้อมูลสำคัญใดบ้าง', 'โดยทั่วไประบุพิกัดกำลัง (kVA), แรงดันพิกัดทั้งสองด้าน, ความถี่, Vector Group, ค่าอิมพีแดนซ์เปอร์เซ็นต์, ประเภทการระบายความร้อน และปีที่ผลิต ซึ่งเป็นข้อมูลจำเป็นสำหรับการเลือกใช้งานและการต่อขนานกับหม้อแปลงตัวอื่น', 'ข้อมูลบนแผ่นป้ายนี้เป็นข้อมูลอ้างอิงหลักที่วิศวกรต้องตรวจสอบก่อนติดตั้งใช้งานหรือทำการทดสอบเปรียบเทียบกับผลการทดสอบจริง', true, true
from categories c
where c.branch_id = '448937cf-58c5-4007-b57b-6a8bcf46c2fe' and c.code = 'transformers'
  and not exists (
    select 1 from questions q2
    where q2.category_id = c.id and q2.question = 'ค่า Nameplate Rating ของหม้อแปลงไฟฟ้าโดยทั่วไประบุข้อมูลสำคัญใดบ้าง'
  );
insert into questions (category_id, question, answer, explanation, is_active, needs_review)
select c.id, 'การเสื่อมสภาพของฉนวนกระดาษ (Cellulose Insulation) ในหม้อแปลงไฟฟ้าที่ใช้น้ำมันเป็นตัวกลาง ส่งผลต่ออายุการใช้งานโดยรวมของหม้อแปลงอย่างไร', 'ฉนวนกระดาษเป็นองค์ประกอบที่เสื่อมสภาพแบบถาวรและไม่สามารถซ่อมแซมหรือทดแทนได้ง่ายเหมือนน้ำมัน ดังนั้นอายุการใช้งานของหม้อแปลงโดยรวมจึงมักถูกกำหนดโดยสภาพของฉนวนกระดาษเป็นหลัก แม้ว่าจะเปลี่ยนถ่ายน้ำมันใหม่แล้วก็ตาม', 'การวิเคราะห์ก๊าซ Furan ในน้ำมันเป็นวิธีหนึ่งที่ใช้ประเมินระดับการเสื่อมสภาพของฉนวนกระดาษภายในโดยไม่ต้องเปิดหม้อแปลงออกตรวจสอบโดยตรง', true, true
from categories c
where c.branch_id = '448937cf-58c5-4007-b57b-6a8bcf46c2fe' and c.code = 'transformers'
  and not exists (
    select 1 from questions q2
    where q2.category_id = c.id and q2.question = 'การเสื่อมสภาพของฉนวนกระดาษ (Cellulose Insulation) ในหม้อแปลงไฟฟ้าที่ใช้น้ำมันเป็นตัวกลาง ส่งผลต่ออายุการใช้งานโดยรวมของหม้อแปลงอย่างไร'
  );
insert into questions (category_id, question, answer, explanation, is_active, needs_review)
select c.id, 'เหตุใดในการติดตั้งหม้อแปลงไฟฟ้าใหม่ จึงควรทำการทดสอบเปรียบเทียบผลกับข้อมูลจากโรงงานผู้ผลิต (Factory Test Report) เสมอ', 'เพื่อยืนยันว่าหม้อแปลงไม่ได้รับความเสียหายระหว่างการขนส่งหรือติดตั้ง เช่น การกระแทกที่อาจทำให้ขดลวดเคลื่อนตัวหรือฉนวนเสียหาย โดยเปรียบเทียบผลทดสอบภาคสนาม เช่น ความต้านทานขดลวดและความต้านทานฉนวน กับค่าที่ระบุในรายงานทดสอบจากโรงงาน', 'หากพบความแตกต่างอย่างมีนัยสำคัญระหว่างผลทดสอบภาคสนามกับรายงานโรงงาน ควรตรวจสอบหาสาเหตุเพิ่มเติมก่อนนำหม้อแปลงเข้าใช้งานจริง เพื่อป้องกันความเสียหายร้ายแรงที่อาจเกิดขึ้นภายหลัง', true, true
from categories c
where c.branch_id = '448937cf-58c5-4007-b57b-6a8bcf46c2fe' and c.code = 'transformers'
  and not exists (
    select 1 from questions q2
    where q2.category_id = c.id and q2.question = 'เหตุใดในการติดตั้งหม้อแปลงไฟฟ้าใหม่ จึงควรทำการทดสอบเปรียบเทียบผลกับข้อมูลจากโรงงานผู้ผลิต (Factory Test Report) เสมอ'
  );

commit;

-- ---------- ตรวจสอบผลลัพธ์ ----------
select c.name_th as category, count(q.id) as question_count
from categories c
left join questions q on q.category_id = c.id
where c.branch_id = '448937cf-58c5-4007-b57b-6a8bcf46c2fe' and c.code = 'transformers'
group by c.name_th;
