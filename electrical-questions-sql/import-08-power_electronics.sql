-- ============================================================
-- นำเข้าคำถามสาขาไฟฟ้า หมวดที่ 8: อิเล็กทรอนิกส์กำลัง (Power Electronics)
-- ไฟล์นี้รันได้อิสระ ไม่ต้องพึ่งไฟล์อื่น (idempotent)
-- ============================================================

begin;

-- ---------- เพิ่มหมวดหมู่ ----------
insert into categories (branch_id, code, name_th, sort_order)
select '448937cf-58c5-4007-b57b-6a8bcf46c2fe', 'power_electronics', 'อิเล็กทรอนิกส์กำลัง (Power Electronics)', 8
where not exists (
  select 1 from categories where branch_id = '448937cf-58c5-4007-b57b-6a8bcf46c2fe' and code = 'power_electronics'
);

-- ---------- เพิ่มคำถาม (33 ข้อ) ----------
insert into questions (category_id, question, answer, explanation, is_active, needs_review)
select c.id, 'ไทริสเตอร์ (Thyristor หรือ SCR) แตกต่างจากไดโอด (Diode) ในการควบคุมการนำกระแสอย่างไร', 'ไดโอดยอมให้กระแสไหลผ่านทันทีที่แรงดันไปข้างหน้า (Forward Bias) โดยไม่สามารถควบคุมได้ ในขณะที่ไทริสเตอร์ต้องอาศัยสัญญาณกระตุ้นที่ขา Gate เพื่อเริ่มนำกระแส แม้จะมีแรงดันไปข้างหน้าอยู่แล้วก็ตาม ทำให้สามารถควบคุมจังหวะเวลาเริ่มนำกระแสได้', 'ความสามารถในการควบคุมจังหวะการนำกระแสของไทริสเตอร์ทำให้สามารถควบคุมค่าแรงดันหรือกำลังไฟฟ้าเฉลี่ยที่ส่งออกได้ ซึ่งเป็นหลักการพื้นฐานของวงจรเรียงกระแสแบบควบคุมได้ (Controlled Rectifier)', true, true
from categories c
where c.branch_id = '448937cf-58c5-4007-b57b-6a8bcf46c2fe' and c.code = 'power_electronics'
  and not exists (
    select 1 from questions q2
    where q2.category_id = c.id and q2.question = 'ไทริสเตอร์ (Thyristor หรือ SCR) แตกต่างจากไดโอด (Diode) ในการควบคุมการนำกระแสอย่างไร'
  );
insert into questions (category_id, question, answer, explanation, is_active, needs_review)
select c.id, 'เหตุใดไทริสเตอร์จึงไม่สามารถหยุดนำกระแสได้ทันทีด้วยการส่งสัญญาณที่ขา Gate เหมือนตอนเริ่มนำกระแส', 'เพราะโครงสร้างภายในของไทริสเตอร์เมื่อเริ่มนำกระแสแล้วจะยังคงนำกระแสต่อไปด้วยตัวเอง (Latching) แม้จะไม่มีสัญญาณที่ขา Gate อีกต่อไป การหยุดนำกระแสทำได้โดยการลดกระแสที่ไหลผ่านให้ต่ำกว่าค่ากระแสยึด (Holding Current) เท่านั้น เช่น ผ่านการเปลี่ยนขั้วแรงดันในวงจรไฟฟ้ากระแสสลับตามธรรมชาติ', 'คุณสมบัตินี้ทำให้ไทริสเตอร์เหมาะกับการใช้งานในวงจรไฟฟ้ากระแสสลับที่มีการเปลี่ยนขั้วแรงดันตามธรรมชาติทุกครึ่งไซเคิล แต่มีข้อจำกัดในการใช้งานกับวงจรไฟฟ้ากระแสตรงที่ต้องอาศัยวงจรช่วยดับ (Commutation Circuit) เพิ่มเติม', true, true
from categories c
where c.branch_id = '448937cf-58c5-4007-b57b-6a8bcf46c2fe' and c.code = 'power_electronics'
  and not exists (
    select 1 from questions q2
    where q2.category_id = c.id and q2.question = 'เหตุใดไทริสเตอร์จึงไม่สามารถหยุดนำกระแสได้ทันทีด้วยการส่งสัญญาณที่ขา Gate เหมือนตอนเริ่มนำกระแส'
  );
insert into questions (category_id, question, answer, explanation, is_active, needs_review)
select c.id, 'IGBT (Insulated Gate Bipolar Transistor) รวมข้อดีของอุปกรณ์สารกึ่งตัวนำชนิดใดเข้าไว้ด้วยกัน', 'รวมข้อดีของ MOSFET ที่ควบคุมด้วยแรงดันที่ขา Gate โดยแทบไม่ใช้กระแสควบคุม (High Input Impedance) เข้ากับความสามารถทนกระแสและแรงดันสูงของทรานซิสเตอร์แบบ Bipolar (BJT)', 'ด้วยคุณสมบัตินี้ IGBT จึงเป็นอุปกรณ์ที่นิยมใช้อย่างแพร่หลายในงานอิเล็กทรอนิกส์กำลังระดับกลางถึงสูง เช่น อินเวอร์เตอร์ขับมอเตอร์และระบบพลังงานทดแทน เนื่องจากควบคุมง่ายเหมือน MOSFET แต่รับกำลังไฟฟ้าได้สูงกว่า', true, true
from categories c
where c.branch_id = '448937cf-58c5-4007-b57b-6a8bcf46c2fe' and c.code = 'power_electronics'
  and not exists (
    select 1 from questions q2
    where q2.category_id = c.id and q2.question = 'IGBT (Insulated Gate Bipolar Transistor) รวมข้อดีของอุปกรณ์สารกึ่งตัวนำชนิดใดเข้าไว้ด้วยกัน'
  );
insert into questions (category_id, question, answer, explanation, is_active, needs_review)
select c.id, 'MOSFET เหมาะกับการใช้งานในวงจรอิเล็กทรอนิกส์กำลังลักษณะใดเป็นพิเศษ เมื่อเทียบกับ IGBT', 'MOSFET เหมาะกับงานที่ต้องการความถี่สวิตชิ่งสูงมาก เนื่องจากมีความเร็วในการสวิตช์เปิด-ปิดที่รวดเร็วกว่า IGBT อย่างมีนัยสำคัญ แม้จะมีข้อจำกัดด้านการทนแรงดันและกระแสที่ต่ำกว่าในระดับกำลังไฟฟ้าเดียวกัน', 'จึงมักพบ MOSFET ในวงจรแหล่งจ่ายไฟสวิตชิ่งขนาดเล็กที่ต้องการความถี่สวิตชิ่งสูงเพื่อลดขนาดของหม้อแปลงและตัวเก็บประจุกรองสัญญาณ ในขณะที่ IGBT นิยมใช้ในงานกำลังไฟฟ้าสูงที่ความถี่สวิตชิ่งไม่จำเป็นต้องสูงมากนัก', true, true
from categories c
where c.branch_id = '448937cf-58c5-4007-b57b-6a8bcf46c2fe' and c.code = 'power_electronics'
  and not exists (
    select 1 from questions q2
    where q2.category_id = c.id and q2.question = 'MOSFET เหมาะกับการใช้งานในวงจรอิเล็กทรอนิกส์กำลังลักษณะใดเป็นพิเศษ เมื่อเทียบกับ IGBT'
  );
insert into questions (category_id, question, answer, explanation, is_active, needs_review)
select c.id, 'วงจรเรียงกระแสแบบครึ่งคลื่น (Half-wave Rectifier) และแบบเต็มคลื่น (Full-wave Rectifier) แตกต่างกันอย่างไรในการแปลงไฟฟ้ากระแสสลับเป็นกระแสตรง', 'วงจรเรียงกระแสแบบครึ่งคลื่นใช้ประโยชน์จากรูปคลื่นไฟฟ้ากระแสสลับเพียงครึ่งไซเคิล (ครึ่งบวกหรือครึ่งลบ) เท่านั้น ส่วนแบบเต็มคลื่นใช้ประโยชน์จากทั้งสองครึ่งไซเคิล ทำให้ได้ค่าแรงดันเฉลี่ยด้านออกสูงกว่าและมีระลอกคลื่น (Ripple) ที่น้อยกว่า', 'วงจรเรียงกระแสแบบเต็มคลื่นจึงเป็นที่นิยมใช้งานมากกว่าในทางปฏิบัติ เนื่องจากใช้ประสิทธิภาพของหม้อแปลงและให้คุณภาพแรงดันไฟฟ้ากระแสตรงที่ดีกว่า แม้จะต้องใช้ไดโอดหรือไทริสเตอร์จำนวนมากกว่า', true, true
from categories c
where c.branch_id = '448937cf-58c5-4007-b57b-6a8bcf46c2fe' and c.code = 'power_electronics'
  and not exists (
    select 1 from questions q2
    where q2.category_id = c.id and q2.question = 'วงจรเรียงกระแสแบบครึ่งคลื่น (Half-wave Rectifier) และแบบเต็มคลื่น (Full-wave Rectifier) แตกต่างกันอย่างไรในการแปลงไฟฟ้ากระแสสลับเป็นกระแสตรง'
  );
insert into questions (category_id, question, answer, explanation, is_active, needs_review)
select c.id, 'อินเวอร์เตอร์ (Inverter) ในงานอิเล็กทรอนิกส์กำลังทำหน้าที่อะไร และแตกต่างจากวงจรเรียงกระแสอย่างไร', 'อินเวอร์เตอร์ทำหน้าที่แปลงไฟฟ้ากระแสตรงให้เป็นไฟฟ้ากระแสสลับ ซึ่งเป็นทิศทางตรงข้ามกับวงจรเรียงกระแสที่แปลงไฟฟ้ากระแสสลับให้เป็นกระแสตรง', 'อินเวอร์เตอร์เป็นหัวใจสำคัญของระบบต่างๆ เช่น ระบบขับเคลื่อนมอเตอร์แบบปรับความเร็วรอบ (VFD), ระบบผลิตไฟฟ้าจากแผงโซลาร์เซลล์ที่ต้องแปลงไฟฟ้ากระแสตรงจากแผงให้เป็นไฟฟ้ากระแสสลับก่อนเชื่อมต่อกับระบบไฟฟ้าหรือใช้งานในบ้าน', true, true
from categories c
where c.branch_id = '448937cf-58c5-4007-b57b-6a8bcf46c2fe' and c.code = 'power_electronics'
  and not exists (
    select 1 from questions q2
    where q2.category_id = c.id and q2.question = 'อินเวอร์เตอร์ (Inverter) ในงานอิเล็กทรอนิกส์กำลังทำหน้าที่อะไร และแตกต่างจากวงจรเรียงกระแสอย่างไร'
  );
insert into questions (category_id, question, answer, explanation, is_active, needs_review)
select c.id, 'การมอดูเลตความกว้างพัลส์ (Pulse Width Modulation, PWM) มีหลักการทำงานอย่างไรในการควบคุมแรงดันขาออกของอินเวอร์เตอร์', 'ควบคุมโดยการเปิดปิดสวิตช์กำลังด้วยความถี่สูง แล้วปรับเปลี่ยนความกว้างของแต่ละพัลส์ (Duty Cycle) เพื่อควบคุมค่าแรงดันเฉลี่ยที่ได้ในแต่ละช่วงเวลา หากพัลส์กว้างมากแรงดันเฉลี่ยจะสูง หากพัลส์แคบแรงดันเฉลี่ยจะต่ำ', 'เทคนิค PWM ช่วยให้สามารถสร้างรูปคลื่นไฟฟ้ากระแสสลับที่ใกล้เคียงรูปไซน์ได้จากแหล่งจ่ายไฟฟ้ากระแสตรง โดยการปรับความกว้างพัลส์ตามฟังก์ชันไซน์อ้างอิง ซึ่งเป็นเทคนิคหลักที่ใช้ในอินเวอร์เตอร์สมัยใหม่เกือบทั้งหมด', true, true
from categories c
where c.branch_id = '448937cf-58c5-4007-b57b-6a8bcf46c2fe' and c.code = 'power_electronics'
  and not exists (
    select 1 from questions q2
    where q2.category_id = c.id and q2.question = 'การมอดูเลตความกว้างพัลส์ (Pulse Width Modulation, PWM) มีหลักการทำงานอย่างไรในการควบคุมแรงดันขาออกของอินเวอร์เตอร์'
  );
insert into questions (category_id, question, answer, explanation, is_active, needs_review)
select c.id, 'ฮาร์มอนิกที่เกิดจากอุปกรณ์อิเล็กทรอนิกส์กำลังส่งผลกระทบต่อระบบไฟฟ้ากำลังอย่างไร', 'การสวิตชิ่งของอุปกรณ์อิเล็กทรอนิกส์กำลังทำให้รูปคลื่นกระแสหรือแรงดันผิดเพี้ยนไปจากรูปไซน์บริสุทธิ์ เกิดฮาร์มอนิกลำดับต่างๆ แทรกเข้าไปในระบบไฟฟ้า ซึ่งอาจทำให้เกิดความร้อนเพิ่มขึ้นในสายไฟและหม้อแปลง รบกวนอุปกรณ์อิเล็กทรอนิกส์ที่ไวต่อสัญญาณ และในบางกรณีอาจทำให้เกิดเรโซแนนซ์กับตัวเก็บประจุในระบบ', 'ปัจจุบันมาตรฐานหลายฉบับกำหนดขีดจำกัดของปริมาณฮาร์มอนิกที่อุปกรณ์อิเล็กทรอนิกส์กำลังสามารถปล่อยเข้าสู่ระบบไฟฟ้าได้ เพื่อรักษาคุณภาพไฟฟ้าโดยรวมของระบบ', true, true
from categories c
where c.branch_id = '448937cf-58c5-4007-b57b-6a8bcf46c2fe' and c.code = 'power_electronics'
  and not exists (
    select 1 from questions q2
    where q2.category_id = c.id and q2.question = 'ฮาร์มอนิกที่เกิดจากอุปกรณ์อิเล็กทรอนิกส์กำลังส่งผลกระทบต่อระบบไฟฟ้ากำลังอย่างไร'
  );
insert into questions (category_id, question, answer, explanation, is_active, needs_review)
select c.id, 'ตัวกรองฮาร์มอนิก (Harmonic Filter) มีหลักการทำงานในการลดผลกระทบของฮาร์มอนิกอย่างไร', 'ตัวกรองแบบพาสซีฟ (Passive Filter) ใช้วงจร LC ที่จูนให้มีความถี่เรโซแนนซ์ตรงกับความถี่ฮาร์มอนิกที่ต้องการกำจัด เพื่อสร้างเส้นทางความต้านทานต่ำให้กระแสฮาร์มอนิกไหลผ่านแทนที่จะไหลเข้าสู่ระบบไฟฟ้าหลัก ส่วนตัวกรองแบบแอคทีฟ (Active Filter) ใช้อุปกรณ์อิเล็กทรอนิกส์กำลังสร้างกระแสชดเชยที่มีลักษณะตรงข้ามกับฮาร์มอนิกที่ตรวจพบแบบเรียลไทม์', 'ตัวกรองแบบแอคทีฟมีความยืดหยุ่นมากกว่าเพราะสามารถปรับตัวตามการเปลี่ยนแปลงของฮาร์มอนิกในระบบได้แบบไดนามิก แต่มีต้นทุนสูงกว่าตัวกรองแบบพาสซีฟที่เหมาะกับกรณีที่ทราบความถี่ฮาร์มอนิกหลักที่ต้องการกำจัดชัดเจน', true, true
from categories c
where c.branch_id = '448937cf-58c5-4007-b57b-6a8bcf46c2fe' and c.code = 'power_electronics'
  and not exists (
    select 1 from questions q2
    where q2.category_id = c.id and q2.question = 'ตัวกรองฮาร์มอนิก (Harmonic Filter) มีหลักการทำงานในการลดผลกระทบของฮาร์มอนิกอย่างไร'
  );
insert into questions (category_id, question, answer, explanation, is_active, needs_review)
select c.id, 'วงจรช็อปเปอร์ (DC Chopper) ทำหน้าที่อะไร และมีการใช้งานในลักษณะใด', 'ทำหน้าที่แปลงไฟฟ้ากระแสตรงระดับแรงดันหนึ่งให้เป็นไฟฟ้ากระแสตรงอีกระดับแรงดันหนึ่ง (สูงขึ้นหรือต่ำลง) โดยการสวิตชิ่งเปิดปิดด้วยความถี่สูงและควบคุม Duty Cycle คล้ายหลักการของ PWM', 'วงจรช็อปเปอร์นิยมใช้ในระบบขับเคลื่อนมอเตอร์ไฟฟ้ากระแสตรง เช่น รถไฟฟ้าหรือรถยกไฟฟ้า และยังเป็นพื้นฐานของวงจรแปลงแรงดันแบบ Buck (ลดแรงดัน) และ Boost (เพิ่มแรงดัน) ที่ใช้กันแพร่หลายในอุปกรณ์อิเล็กทรอนิกส์ทั่วไป', true, true
from categories c
where c.branch_id = '448937cf-58c5-4007-b57b-6a8bcf46c2fe' and c.code = 'power_electronics'
  and not exists (
    select 1 from questions q2
    where q2.category_id = c.id and q2.question = 'วงจรช็อปเปอร์ (DC Chopper) ทำหน้าที่อะไร และมีการใช้งานในลักษณะใด'
  );
insert into questions (category_id, question, answer, explanation, is_active, needs_review)
select c.id, 'วงจรแปลงแรงดันแบบ Buck Converter และ Boost Converter แตกต่างกันในโครงสร้างและหน้าที่อย่างไร', 'Buck Converter ทำหน้าที่ลดระดับแรงดันไฟฟ้ากระแสตรงจากด้านเข้าให้ต่ำกว่าที่ด้านออก ในขณะที่ Boost Converter ทำหน้าที่เพิ่มระดับแรงดันไฟฟ้ากระแสตรงจากด้านเข้าให้สูงกว่าที่ด้านออก ทั้งสองใช้หลักการเก็บและปลดปล่อยพลังงานผ่านตัวเหนี่ยวนำร่วมกับการสวิตชิ่ง', 'การเลือกใช้ขึ้นอยู่กับความต้องการของระบบ เช่น การชาร์จแบตเตอรี่จากแผงโซลาร์เซลล์ที่แรงดันแผงอาจสูงหรือต่ำกว่าแรงดันแบตเตอรี่ในแต่ละช่วงเวลา อาจต้องใช้วงจรแบบผสม (Buck-Boost) เพื่อรองรับทั้งสองสภาวะ', true, true
from categories c
where c.branch_id = '448937cf-58c5-4007-b57b-6a8bcf46c2fe' and c.code = 'power_electronics'
  and not exists (
    select 1 from questions q2
    where q2.category_id = c.id and q2.question = 'วงจรแปลงแรงดันแบบ Buck Converter และ Boost Converter แตกต่างกันในโครงสร้างและหน้าที่อย่างไร'
  );
insert into questions (category_id, question, answer, explanation, is_active, needs_review)
select c.id, 'เหตุใดวงจรอิเล็กทรอนิกส์กำลังจึงมักต้องมีวงจรสนับเบอร์ (Snubber Circuit) ติดตั้งคู่กับอุปกรณ์สวิตชิ่ง', 'วงจรสนับเบอร์ช่วยลดความเค้นทางไฟฟ้า (Voltage/Current Stress) ที่เกิดขึ้นกับอุปกรณ์สวิตชิ่งขณะเปลี่ยนสถานะเปิด-ปิดอย่างรวดเร็ว โดยเฉพาะแรงดันเกินชั่วครู่ (Voltage Spike) ที่เกิดจากพลังงานสะสมในองค์ประกอบเหนี่ยวนำปรสิต (Parasitic Inductance) ของวงจร', 'หากไม่มีวงจรสนับเบอร์ที่เหมาะสม แรงดันเกินชั่วครู่ที่เกิดขึ้นอาจสูงเกินพิกัดทนแรงดันของอุปกรณ์สวิตชิ่งจนเกิดความเสียหาย โดยเฉพาะในวงจรที่มีการสวิตชิ่งความถี่สูงและกระแสสูง', true, true
from categories c
where c.branch_id = '448937cf-58c5-4007-b57b-6a8bcf46c2fe' and c.code = 'power_electronics'
  and not exists (
    select 1 from questions q2
    where q2.category_id = c.id and q2.question = 'เหตุใดวงจรอิเล็กทรอนิกส์กำลังจึงมักต้องมีวงจรสนับเบอร์ (Snubber Circuit) ติดตั้งคู่กับอุปกรณ์สวิตชิ่ง'
  );
insert into questions (category_id, question, answer, explanation, is_active, needs_review)
select c.id, 'การสูญเสียในอุปกรณ์สวิตชิ่งอิเล็กทรอนิกส์กำลังแบ่งเป็นกี่ประเภทหลัก และแต่ละประเภทเกิดขึ้นในช่วงใด', 'แบ่งเป็น 2 ประเภทหลักคือ การสูญเสียขณะนำกระแส (Conduction Loss) ที่เกิดขึ้นตลอดช่วงเวลาที่อุปกรณ์นำกระแสอยู่ในสภาวะเปิด และการสูญเสียขณะสวิตช์ (Switching Loss) ที่เกิดขึ้นในช่วงเปลี่ยนสถานะจากเปิดเป็นปิดหรือปิดเป็นเปิด', 'การสูญเสียขณะสวิตช์จะเพิ่มขึ้นตามความถี่สวิตชิ่งที่สูงขึ้น ดังนั้นการเลือกความถี่สวิตชิ่งที่เหมาะสมจึงต้องสมดุลระหว่างข้อดีของความถี่สูง (เช่น ขนาดอุปกรณ์กรองสัญญาณเล็กลง) กับการสูญเสียพลังงานที่เพิ่มขึ้นตามความถี่', true, true
from categories c
where c.branch_id = '448937cf-58c5-4007-b57b-6a8bcf46c2fe' and c.code = 'power_electronics'
  and not exists (
    select 1 from questions q2
    where q2.category_id = c.id and q2.question = 'การสูญเสียในอุปกรณ์สวิตชิ่งอิเล็กทรอนิกส์กำลังแบ่งเป็นกี่ประเภทหลัก และแต่ละประเภทเกิดขึ้นในช่วงใด'
  );
insert into questions (category_id, question, answer, explanation, is_active, needs_review)
select c.id, 'เทคนิคการสวิตช์แบบนุ่มนวล (Soft Switching) มีข้อดีอย่างไรเหนือกว่าการสวิตช์แบบแข็ง (Hard Switching)', 'Soft Switching ออกแบบวงจรให้อุปกรณ์สวิตชิ่งเปลี่ยนสถานะขณะที่กระแสหรือแรงดันมีค่าใกล้ศูนย์ (Zero Current Switching หรือ Zero Voltage Switching) ซึ่งช่วยลดการสูญเสียขณะสวิตช์และลดความเค้นทางไฟฟ้าที่เกิดขึ้นกับอุปกรณ์ได้อย่างมาก เมื่อเทียบกับ Hard Switching ที่เปลี่ยนสถานะขณะยังมีกระแสและแรงดันค่าสูงอยู่', 'เทคนิค Soft Switching ช่วยให้สามารถเพิ่มความถี่สวิตชิ่งได้สูงขึ้นโดยไม่เพิ่มการสูญเสียมากเกินไป ทำให้ลดขนาดของอุปกรณ์กรองสัญญาณและเพิ่มประสิทธิภาพโดยรวมของวงจรได้', true, true
from categories c
where c.branch_id = '448937cf-58c5-4007-b57b-6a8bcf46c2fe' and c.code = 'power_electronics'
  and not exists (
    select 1 from questions q2
    where q2.category_id = c.id and q2.question = 'เทคนิคการสวิตช์แบบนุ่มนวล (Soft Switching) มีข้อดีอย่างไรเหนือกว่าการสวิตช์แบบแข็ง (Hard Switching)'
  );
insert into questions (category_id, question, answer, explanation, is_active, needs_review)
select c.id, 'วงจรแปลงผันแบบ Cycloconverter ทำหน้าที่แปลงไฟฟ้ากระแสสลับความถี่หนึ่งให้เป็นไฟฟ้ากระแสสลับความถี่ใดโดยตรง โดยไม่ต้องผ่านการแปลงเป็นไฟฟ้ากระแสตรงก่อน', 'Cycloconverter แปลงไฟฟ้ากระแสสลับความถี่สูง (หรือความถี่ปกติของระบบ) ให้เป็นไฟฟ้ากระแสสลับความถี่ต่ำกว่าได้โดยตรง โดยการเลือกและประกอบส่วนของรูปคลื่นแรงดันขาเข้าให้ได้รูปคลื่นความถี่ต่ำที่ต้องการที่ขาออก', 'เทคนิคนี้นิยมใช้ในงานที่ต้องการมอเตอร์ความเร็วต่ำมากแต่แรงบิดสูง เช่น เครื่องบดในโรงงานปูนซีเมนต์ แม้ปัจจุบันจะมีการใช้งานน้อยลงเนื่องจากเทคโนโลยี VFD สมัยใหม่ทำงานได้ดีกว่าในหลายด้าน', true, true
from categories c
where c.branch_id = '448937cf-58c5-4007-b57b-6a8bcf46c2fe' and c.code = 'power_electronics'
  and not exists (
    select 1 from questions q2
    where q2.category_id = c.id and q2.question = 'วงจรแปลงผันแบบ Cycloconverter ทำหน้าที่แปลงไฟฟ้ากระแสสลับความถี่หนึ่งให้เป็นไฟฟ้ากระแสสลับความถี่ใดโดยตรง โดยไม่ต้องผ่านการแปลงเป็นไฟฟ้ากระแสตรงก่อน'
  );
insert into questions (category_id, question, answer, explanation, is_active, needs_review)
select c.id, 'ตัวประกอบกำลังการกระจัด (Displacement Power Factor) และตัวประกอบกำลังที่แท้จริง (True Power Factor) แตกต่างกันอย่างไรในระบบที่มีฮาร์มอนิกสูง', 'Displacement Power Factor พิจารณาเฉพาะมุมเฟสระหว่างองค์ประกอบพื้นฐาน (Fundamental Component) ของกระแสและแรงดันเท่านั้น ในขณะที่ True Power Factor พิจารณาผลกระทบของฮาร์มอนิกทั้งหมดร่วมด้วย ในระบบที่มีฮาร์มอนิกสูง True Power Factor มักมีค่าต่ำกว่า Displacement Power Factor อย่างมีนัยสำคัญ', 'อุปกรณ์วัด Power Factor แบบเก่าที่วัดเฉพาะ Displacement Power Factor อาจให้ค่าที่ดูดีเกินความเป็นจริงในระบบที่มีอุปกรณ์อิเล็กทรอนิกส์กำลังจำนวนมาก จึงต้องใช้เครื่องมือวัดที่รองรับการวัด True Power Factor เพื่อประเมินคุณภาพไฟฟ้าที่แท้จริง', true, true
from categories c
where c.branch_id = '448937cf-58c5-4007-b57b-6a8bcf46c2fe' and c.code = 'power_electronics'
  and not exists (
    select 1 from questions q2
    where q2.category_id = c.id and q2.question = 'ตัวประกอบกำลังการกระจัด (Displacement Power Factor) และตัวประกอบกำลังที่แท้จริง (True Power Factor) แตกต่างกันอย่างไรในระบบที่มีฮาร์มอนิกสูง'
  );
insert into questions (category_id, question, answer, explanation, is_active, needs_review)
select c.id, 'วงจรเรียงกระแสแบบ 6 พัลส์ (Six-Pulse Rectifier) และแบบ 12 พัลส์ (Twelve-Pulse Rectifier) แตกต่างกันในแง่คุณภาพแรงดันไฟฟ้ากระแสตรงที่ได้อย่างไร', 'วงจรแบบ 12 พัลส์ให้ระลอกคลื่น (Ripple) ของแรงดันไฟฟ้ากระแสตรงที่ต่ำกว่าและมีความถี่ระลอกคลื่นสูงกว่าวงจรแบบ 6 พัลส์ อีกทั้งยังลดฮาร์มอนิกลำดับต่ำบางลำดับที่ป้อนกลับเข้าสู่ระบบไฟฟ้ากระแสสลับต้นทางได้ดีกว่า', 'วงจรแบบ 12 พัลส์ทำได้โดยการใช้หม้อแปลงสองชุดที่มีมุมเฟสต่างกัน 30 องศา (เช่น ชุดหนึ่งต่อแบบ Wye อีกชุดต่อแบบ Delta) ป้อนเข้าวงจรเรียงกระแส 6 พัลส์สองชุดขนานกัน ซึ่งนิยมใช้ในงานอิเล็กทรอนิกส์กำลังขนาดใหญ่ที่ต้องการคุณภาพไฟฟ้าสูง เช่น สถานีแปลงผัน HVDC', true, true
from categories c
where c.branch_id = '448937cf-58c5-4007-b57b-6a8bcf46c2fe' and c.code = 'power_electronics'
  and not exists (
    select 1 from questions q2
    where q2.category_id = c.id and q2.question = 'วงจรเรียงกระแสแบบ 6 พัลส์ (Six-Pulse Rectifier) และแบบ 12 พัลส์ (Twelve-Pulse Rectifier) แตกต่างกันในแง่คุณภาพแรงดันไฟฟ้ากระแสตรงที่ได้อย่างไร'
  );
insert into questions (category_id, question, answer, explanation, is_active, needs_review)
select c.id, 'เหตุใดวงจรอินเวอร์เตอร์ที่ใช้ในระบบผลิตไฟฟ้าจากแผงโซลาร์เซลล์ (Solar Inverter) จึงต้องมีฟังก์ชันติดตามจุดกำลังไฟฟ้าสูงสุด (Maximum Power Point Tracking, MPPT)', 'เพราะกำลังไฟฟ้าที่แผงโซลาร์เซลล์ผลิตได้ขึ้นอยู่กับความเข้มแสงและอุณหภูมิที่เปลี่ยนแปลงตลอดเวลา จุดที่ให้กำลังไฟฟ้าสูงสุด (Maximum Power Point) บนกราฟความสัมพันธ์แรงดัน-กระแสจึงเปลี่ยนตำแหน่งตลอดวัน ฟังก์ชัน MPPT ช่วยปรับจุดทำงานของอินเวอร์เตอร์ให้ดึงกำลังไฟฟ้าสูงสุดจากแผงได้ตลอดเวลาโดยอัตโนมัติ', 'หากไม่มีฟังก์ชัน MPPT ระบบจะทำงานที่จุดคงที่ซึ่งอาจไม่ตรงกับจุดกำลังไฟฟ้าสูงสุดในสภาวะแสงและอุณหภูมิที่เปลี่ยนแปลง ทำให้สูญเสียประสิทธิภาพการผลิตไฟฟ้าที่ควรจะได้รับอย่างมีนัยสำคัญ', true, true
from categories c
where c.branch_id = '448937cf-58c5-4007-b57b-6a8bcf46c2fe' and c.code = 'power_electronics'
  and not exists (
    select 1 from questions q2
    where q2.category_id = c.id and q2.question = 'เหตุใดวงจรอินเวอร์เตอร์ที่ใช้ในระบบผลิตไฟฟ้าจากแผงโซลาร์เซลล์ (Solar Inverter) จึงต้องมีฟังก์ชันติดตามจุดกำลังไฟฟ้าสูงสุด (Maximum Power Point Tracking, MPPT)'
  );
insert into questions (category_id, question, answer, explanation, is_active, needs_review)
select c.id, 'เหตุใดอุปกรณ์สวิตชิ่งอิเล็กทรอนิกส์กำลังจึงต้องการระบบระบายความร้อน (Heat Sink) ที่ออกแบบมาอย่างเหมาะสม', 'แม้อุปกรณ์สวิตชิ่งจะมีการสูญเสียพลังงานเพียงเล็กน้อยเมื่อเทียบกับกำลังไฟฟ้าที่ควบคุม แต่พลังงานที่สูญเสียนั้นเปลี่ยนเป็นความร้อนสะสมที่ตัวอุปกรณ์ซึ่งมีขนาดเล็กมาก ทำให้ความหนาแน่นความร้อน (Power Density) สูงมาก หากไม่มีการระบายความร้อนที่เพียงพอ อุณหภูมิของอุปกรณ์จะสูงเกินพิกัดจนเสียหายอย่างรวดเร็ว', 'การออกแบบระบบระบายความร้อนที่เหมาะสมเป็นส่วนสำคัญไม่แพ้การออกแบบวงจรควบคุมในงานอิเล็กทรอนิกส์กำลัง โดยอาจใช้วิธีระบายความร้อนหลายแบบ เช่น พัดลมบังคับอากาศ หรือระบบระบายความร้อนด้วยของเหลวสำหรับงานกำลังไฟฟ้าสูงมาก', true, true
from categories c
where c.branch_id = '448937cf-58c5-4007-b57b-6a8bcf46c2fe' and c.code = 'power_electronics'
  and not exists (
    select 1 from questions q2
    where q2.category_id = c.id and q2.question = 'เหตุใดอุปกรณ์สวิตชิ่งอิเล็กทรอนิกส์กำลังจึงต้องการระบบระบายความร้อน (Heat Sink) ที่ออกแบบมาอย่างเหมาะสม'
  );
insert into questions (category_id, question, answer, explanation, is_active, needs_review)
select c.id, 'การควบคุมมุมจุดชนวน (Firing Angle) ในวงจรเรียงกระแสแบบควบคุมได้ (Controlled Rectifier) มีผลต่อแรงดันไฟฟ้ากระแสตรงขาออกอย่างไร', 'มุมจุดชนวนคือมุมที่ล่าช้าออกไปจากจุดที่ไทริสเตอร์จะเริ่มนำกระแสได้ตามธรรมชาติ ยิ่งมุมจุดชนวนมากขึ้น ช่วงเวลาที่ไทริสเตอร์นำกระแสในแต่ละไซเคิลจะสั้นลง ทำให้ค่าแรงดันเฉลี่ยขาออกลดลงตามไปด้วย', 'การควบคุมมุมจุดชนวนนี้เป็นหลักการพื้นฐานที่ใช้ควบคุมแรงดันไฟฟ้ากระแสตรงขาออกของวงจรเรียงกระแสแบบควบคุมได้ ซึ่งนำไปประยุกต์ใช้ในระบบขับเคลื่อนมอเตอร์กระแสตรงและระบบ HVDC แบบ LCC', true, true
from categories c
where c.branch_id = '448937cf-58c5-4007-b57b-6a8bcf46c2fe' and c.code = 'power_electronics'
  and not exists (
    select 1 from questions q2
    where q2.category_id = c.id and q2.question = 'การควบคุมมุมจุดชนวน (Firing Angle) ในวงจรเรียงกระแสแบบควบคุมได้ (Controlled Rectifier) มีผลต่อแรงดันไฟฟ้ากระแสตรงขาออกอย่างไร'
  );
insert into questions (category_id, question, answer, explanation, is_active, needs_review)
select c.id, 'เหตุใดในวงจรเรียงกระแสแบบควบคุมได้ที่ใช้กับโหลดเหนี่ยวนำ จึงมักต้องมีไดโอดฟรีวีล (Freewheeling Diode) ต่อขนานกับโหลด', 'เพราะโหลดเหนี่ยวนำมีแนวโน้มรักษากระแสให้ไหลต่อเนื่อง แม้แรงดันจากแหล่งจ่ายจะกลับขั้วในบางช่วงของไซเคิล ไดโอดฟรีวีลให้เส้นทางสำหรับกระแสที่สะสมในตัวเหนี่ยวนำไหลวนต่อได้โดยไม่ต้องผ่านแหล่งจ่ายที่กลับขั้วแล้ว ป้องกันแรงดันเกินที่อาจเกิดขึ้นและช่วยให้กระแสโหลดมีความต่อเนื่องมากขึ้น', 'หากไม่มีไดโอดฟรีวีล พลังงานที่สะสมในตัวเหนี่ยวนำของโหลดอาจสร้างแรงดันเกินชั่วครู่ที่สูงมากเมื่อกระแสถูกบังคับให้เปลี่ยนแปลงอย่างฉับพลัน ซึ่งอาจทำความเสียหายแก่อุปกรณ์สวิตชิ่งในวงจรได้', true, true
from categories c
where c.branch_id = '448937cf-58c5-4007-b57b-6a8bcf46c2fe' and c.code = 'power_electronics'
  and not exists (
    select 1 from questions q2
    where q2.category_id = c.id and q2.question = 'เหตุใดในวงจรเรียงกระแสแบบควบคุมได้ที่ใช้กับโหลดเหนี่ยวนำ จึงมักต้องมีไดโอดฟรีวีล (Freewheeling Diode) ต่อขนานกับโหลด'
  );
insert into questions (category_id, question, answer, explanation, is_active, needs_review)
select c.id, 'การแยกทางไฟฟ้า (Galvanic Isolation) ในวงจรอิเล็กทรอนิกส์กำลังมีความสำคัญอย่างไร และทำได้ด้วยวิธีใด', 'การแยกทางไฟฟ้าช่วยป้องกันไม่ให้กระแสไฟฟ้าไหลโดยตรงระหว่างวงจรด้านเข้าและด้านออก ซึ่งสำคัญมากด้านความปลอดภัยของผู้ใช้งานและการป้องกันความเสียหายของอุปกรณ์ในกรณีเกิดความผิดปกติ ทำได้ด้วยการใช้หม้อแปลงแยก (Isolation Transformer) หรือออปโตคัปเปลอร์ (Optocoupler) สำหรับสัญญาณควบคุม', 'อุปกรณ์อิเล็กทรอนิกส์กำลังที่เชื่อมต่อโดยตรงกับระบบไฟฟ้าแรงดันสูง เช่น แหล่งจ่ายไฟสวิตชิ่งสำหรับอุปกรณ์อิเล็กทรอนิกส์ทั่วไป จำเป็นต้องมีการแยกทางไฟฟ้าเพื่อความปลอดภัยของผู้ใช้งานที่สัมผัสกับอุปกรณ์ด้านออก', true, true
from categories c
where c.branch_id = '448937cf-58c5-4007-b57b-6a8bcf46c2fe' and c.code = 'power_electronics'
  and not exists (
    select 1 from questions q2
    where q2.category_id = c.id and q2.question = 'การแยกทางไฟฟ้า (Galvanic Isolation) ในวงจรอิเล็กทรอนิกส์กำลังมีความสำคัญอย่างไร และทำได้ด้วยวิธีใด'
  );
insert into questions (category_id, question, answer, explanation, is_active, needs_review)
select c.id, 'เหตุใดวงจรอิเล็กทรอนิกส์กำลังสมัยใหม่จึงนิยมใช้ตัวควบคุมแบบดิจิทัล (Digital Controller) เช่น DSP หรือไมโครคอนโทรลเลอร์ แทนวงจรควบคุมแบบอนาล็อกดั้งเดิม', 'ตัวควบคุมแบบดิจิทัลมีความยืดหยุ่นในการปรับเปลี่ยนอัลกอริทึมควบคุมผ่านซอฟต์แวร์โดยไม่ต้องแก้ไขวงจรฮาร์ดแวร์ สามารถทำงานควบคุมที่ซับซ้อน เช่น Vector Control หรือ MPPT ได้แม่นยำกว่า และมีความเสถียรต่ออุณหภูมิและการเสื่อมสภาพของชิ้นส่วนดีกว่าวงจรอนาล็อก', 'อย่างไรก็ตาม ตัวควบคุมดิจิทัลต้องอาศัยเวลาประมวลผลซึ่งอาจสร้างความหน่วง (Latency) เล็กน้อยเมื่อเทียบกับวงจรอนาล็อกที่ตอบสนองแบบทันที ซึ่งเป็นข้อพิจารณาในงานที่ต้องการความเร็วในการตอบสนองสูงมากเป็นพิเศษ', true, true
from categories c
where c.branch_id = '448937cf-58c5-4007-b57b-6a8bcf46c2fe' and c.code = 'power_electronics'
  and not exists (
    select 1 from questions q2
    where q2.category_id = c.id and q2.question = 'เหตุใดวงจรอิเล็กทรอนิกส์กำลังสมัยใหม่จึงนิยมใช้ตัวควบคุมแบบดิจิทัล (Digital Controller) เช่น DSP หรือไมโครคอนโทรลเลอร์ แทนวงจรควบคุมแบบอนาล็อกดั้งเดิม'
  );
insert into questions (category_id, question, answer, explanation, is_active, needs_review)
select c.id, 'ระบบกักเก็บพลังงานด้วยแบตเตอรี่ (Battery Energy Storage System, BESS) ต้องใช้อุปกรณ์อิเล็กทรอนิกส์กำลังประเภทใดในการเชื่อมต่อกับระบบไฟฟ้ากระแสสลับ', 'ต้องใช้อินเวอร์เตอร์แบบสองทิศทาง (Bidirectional Inverter) ที่สามารถแปลงไฟฟ้ากระแสตรงจากแบตเตอรี่เป็นกระแสสลับเพื่อจ่ายเข้าระบบ (โหมดปล่อยพลังงาน) และแปลงไฟฟ้ากระแสสลับจากระบบเป็นกระแสตรงเพื่อชาร์จแบตเตอรี่ (โหมดชาร์จพลังงาน) ได้ทั้งสองทิศทาง', 'ความสามารถทำงานสองทิศทางนี้แตกต่างจากอินเวอร์เตอร์ของระบบโซลาร์เซลล์ทั่วไปที่มักทำงานทิศทางเดียวเท่านั้น (จากแผงสู่ระบบ) ทำให้การออกแบบวงจรควบคุมของ BESS มีความซับซ้อนเพิ่มขึ้นตามความสามารถในการทำงานสองทิศทาง', true, true
from categories c
where c.branch_id = '448937cf-58c5-4007-b57b-6a8bcf46c2fe' and c.code = 'power_electronics'
  and not exists (
    select 1 from questions q2
    where q2.category_id = c.id and q2.question = 'ระบบกักเก็บพลังงานด้วยแบตเตอรี่ (Battery Energy Storage System, BESS) ต้องใช้อุปกรณ์อิเล็กทรอนิกส์กำลังประเภทใดในการเชื่อมต่อกับระบบไฟฟ้ากระแสสลับ'
  );
insert into questions (category_id, question, answer, explanation, is_active, needs_review)
select c.id, 'เหตุใดกระแสรั่วไหล (Leakage Current) ในวงจรอิเล็กทรอนิกส์กำลังบางประเภทจึงเป็นประเด็นที่ต้องพิจารณาด้านความปลอดภัย', 'กระแสรั่วไหลอาจเกิดจากความจุปรสิต (Parasitic Capacitance) ระหว่างวงจรกับโครงโลหะหรือกราวด์ โดยเฉพาะในวงจรที่มีการสวิตชิ่งความถี่สูง กระแสนี้แม้จะมีขนาดเล็กแต่หากไหลผ่านร่างกายมนุษย์ที่สัมผัสโครงอุปกรณ์อาจก่อให้เกิดอันตรายได้ โดยเฉพาะในระบบที่ไม่มีการต่อกราวด์ที่เหมาะสม', 'มาตรฐานความปลอดภัยของอุปกรณ์อิเล็กทรอนิกส์กำลัง เช่น อินเวอร์เตอร์โซลาร์เซลล์ จึงมักกำหนดขีดจำกัดของกระแสรั่วไหลที่ยอมรับได้ พร้อมทั้งกำหนดให้มีฟังก์ชันตรวจจับกระแสรั่วไหลเพื่อตัดการทำงานเมื่อพบความผิดปกติ', true, true
from categories c
where c.branch_id = '448937cf-58c5-4007-b57b-6a8bcf46c2fe' and c.code = 'power_electronics'
  and not exists (
    select 1 from questions q2
    where q2.category_id = c.id and q2.question = 'เหตุใดกระแสรั่วไหล (Leakage Current) ในวงจรอิเล็กทรอนิกส์กำลังบางประเภทจึงเป็นประเด็นที่ต้องพิจารณาด้านความปลอดภัย'
  );
insert into questions (category_id, question, answer, explanation, is_active, needs_review)
select c.id, 'เหตุใดวงจรอิเล็กทรอนิกส์กำลังที่เชื่อมต่อกับระบบไฟฟ้าจึงต้องมีฟังก์ชัน Anti-Islanding Protection', 'เพื่อป้องกันไม่ให้แหล่งผลิตไฟฟ้าแบบกระจายตัว เช่น ระบบโซลาร์เซลล์ ยังคงจ่ายไฟฟ้าต่อไปในส่วนของระบบที่ถูกตัดขาดจากระบบไฟฟ้าหลักแล้ว (Islanding) ซึ่งเป็นอันตรายอย่างยิ่งต่อเจ้าหน้าที่ที่กำลังซ่อมบำรุงระบบไฟฟ้าโดยเข้าใจว่าไม่มีไฟฟ้าอยู่ในส่วนนั้นแล้ว', 'ฟังก์ชันนี้ตรวจจับการเปลี่ยนแปลงของแรงดันหรือความถี่ที่ผิดปกติซึ่งบ่งชี้ว่าระบบไฟฟ้าหลักถูกตัดขาดไปแล้ว แล้วสั่งให้อุปกรณ์หยุดจ่ายไฟฟ้าเข้าสู่ระบบทันทีเพื่อความปลอดภัย', true, true
from categories c
where c.branch_id = '448937cf-58c5-4007-b57b-6a8bcf46c2fe' and c.code = 'power_electronics'
  and not exists (
    select 1 from questions q2
    where q2.category_id = c.id and q2.question = 'เหตุใดวงจรอิเล็กทรอนิกส์กำลังที่เชื่อมต่อกับระบบไฟฟ้าจึงต้องมีฟังก์ชัน Anti-Islanding Protection'
  );
insert into questions (category_id, question, answer, explanation, is_active, needs_review)
select c.id, 'ความแตกต่างระหว่างวงจรแปลงผันแบบ Two-Level Inverter และ Multilevel Inverter คืออะไร และเหตุใด Multilevel Inverter จึงได้รับความนิยมเพิ่มขึ้นในงานกำลังไฟฟ้าสูง', 'Two-Level Inverter สร้างรูปคลื่นแรงดันขาออกจากเพียงสองระดับแรงดัน (บวกและลบ) ในขณะที่ Multilevel Inverter สามารถสร้างรูปคลื่นจากหลายระดับแรงดันย่อย ทำให้รูปคลื่นที่ได้ใกล้เคียงรูปไซน์มากกว่าและมีฮาร์มอนิกต่ำกว่าอย่างมีนัยสำคัญ โดยไม่ต้องเพิ่มความถี่สวิตชิ่งสูงมาก', 'ในงานกำลังไฟฟ้าสูงมาก การใช้ Multilevel Inverter ยังช่วยลดความเค้นทางแรงดันที่ตกคร่อมอุปกรณ์สวิตชิ่งแต่ละตัว เนื่องจากแรงดันรวมถูกแบ่งกระจายไปยังหลายระดับ ทำให้สามารถใช้อุปกรณ์สวิตชิ่งที่มีพิกัดแรงดันต่ำกว่ามาต่อร่วมกันได้', true, true
from categories c
where c.branch_id = '448937cf-58c5-4007-b57b-6a8bcf46c2fe' and c.code = 'power_electronics'
  and not exists (
    select 1 from questions q2
    where q2.category_id = c.id and q2.question = 'ความแตกต่างระหว่างวงจรแปลงผันแบบ Two-Level Inverter และ Multilevel Inverter คืออะไร และเหตุใด Multilevel Inverter จึงได้รับความนิยมเพิ่มขึ้นในงานกำลังไฟฟ้าสูง'
  );
insert into questions (category_id, question, answer, explanation, is_active, needs_review)
select c.id, 'เหตุใดวงจรอิเล็กทรอนิกส์กำลังในงานยานยนต์ไฟฟ้าจึงต้องออกแบบให้มีความหนาแน่นกำลังไฟฟ้า (Power Density) สูงเป็นพิเศษ', 'เพราะพื้นที่และน้ำหนักในตัวรถมีจำกัดมาก การเพิ่มความหนาแน่นกำลังไฟฟ้าช่วยให้สามารถควบคุมกำลังไฟฟ้าปริมาณมากด้วยอุปกรณ์ที่มีขนาดเล็กและน้ำหนักเบา ซึ่งส่งผลโดยตรงต่อระยะทางวิ่งและประสิทธิภาพโดยรวมของยานยนต์ไฟฟ้า', 'การเพิ่มความหนาแน่นกำลังไฟฟ้ามักต้องแลกกับความท้าทายด้านการระบายความร้อนที่เพิ่มขึ้น จึงเป็นแรงผลักดันสำคัญที่ทำให้เทคโนโลยีสารกึ่งตัวนำใหม่ๆ เช่น Silicon Carbide (SiC) และ Gallium Nitride (GaN) ได้รับความสนใจมากขึ้นในอุตสาหกรรมยานยนต์ไฟฟ้า', true, true
from categories c
where c.branch_id = '448937cf-58c5-4007-b57b-6a8bcf46c2fe' and c.code = 'power_electronics'
  and not exists (
    select 1 from questions q2
    where q2.category_id = c.id and q2.question = 'เหตุใดวงจรอิเล็กทรอนิกส์กำลังในงานยานยนต์ไฟฟ้าจึงต้องออกแบบให้มีความหนาแน่นกำลังไฟฟ้า (Power Density) สูงเป็นพิเศษ'
  );
insert into questions (category_id, question, answer, explanation, is_active, needs_review)
select c.id, 'สารกึ่งตัวนำ Silicon Carbide (SiC) และ Gallium Nitride (GaN) มีข้อดีเหนือกว่าซิลิคอน (Silicon) แบบดั้งเดิมในงานอิเล็กทรอนิกส์กำลังอย่างไร', 'สารกึ่งตัวนำแบบ Wide Bandgap เหล่านี้สามารถทนแรงดันและอุณหภูมิสูงได้ดีกว่า มีความต้านทานขณะนำกระแสต่ำกว่า และสามารถสวิตช์ด้วยความถี่สูงกว่าซิลิคอนแบบดั้งเดิมมาก ทำให้ลดการสูญเสียพลังงานและสามารถลดขนาดของอุปกรณ์กรองสัญญาณและระบบระบายความร้อนได้', 'แม้ต้นทุนของสารกึ่งตัวนำเหล่านี้ยังสูงกว่าซิลิคอนแบบดั้งเดิม แต่แนวโน้มราคาที่ลดลงและประโยชน์ด้านประสิทธิภาพทำให้ได้รับความนิยมเพิ่มขึ้นอย่างรวดเร็วในงานที่ต้องการประสิทธิภาพสูง เช่น ยานยนต์ไฟฟ้าและระบบพลังงานทดแทน', true, true
from categories c
where c.branch_id = '448937cf-58c5-4007-b57b-6a8bcf46c2fe' and c.code = 'power_electronics'
  and not exists (
    select 1 from questions q2
    where q2.category_id = c.id and q2.question = 'สารกึ่งตัวนำ Silicon Carbide (SiC) และ Gallium Nitride (GaN) มีข้อดีเหนือกว่าซิลิคอน (Silicon) แบบดั้งเดิมในงานอิเล็กทรอนิกส์กำลังอย่างไร'
  );
insert into questions (category_id, question, answer, explanation, is_active, needs_review)
select c.id, 'เหตุใดการทดสอบความทนทานต่อการเปลี่ยนแปลงอุณหภูมิอย่างรวดเร็ว (Thermal Cycling Test) จึงมีความสำคัญสำหรับอุปกรณ์อิเล็กทรอนิกส์กำลัง', 'เพราะในการใช้งานจริง อุปกรณ์สวิตชิ่งต้องผ่านรอบการเปิด-ปิดที่ทำให้เกิดความร้อนและเย็นตัวสลับกันตลอดเวลา ความแตกต่างของค่าสัมประสิทธิ์การขยายตัวทางความร้อน (Thermal Expansion Coefficient) ระหว่างวัสดุต่างชนิดที่ประกอบกันในตัวอุปกรณ์ อาจก่อให้เกิดความเค้นเชิงกลสะสมจนนำไปสู่รอยแตกร้าวและความล้มเหลวในระยะยาว', 'การทดสอบนี้จึงเป็นส่วนสำคัญของการประเมินความน่าเชื่อถือ (Reliability) ของอุปกรณ์อิเล็กทรอนิกส์กำลัง โดยเฉพาะในงานที่มีรอบการทำงานเปิด-ปิดบ่อยครั้ง เช่น ระบบขับเคลื่อนมอเตอร์ในงานอุตสาหกรรมที่หยุดสตาร์ทซ้ำๆ', true, true
from categories c
where c.branch_id = '448937cf-58c5-4007-b57b-6a8bcf46c2fe' and c.code = 'power_electronics'
  and not exists (
    select 1 from questions q2
    where q2.category_id = c.id and q2.question = 'เหตุใดการทดสอบความทนทานต่อการเปลี่ยนแปลงอุณหภูมิอย่างรวดเร็ว (Thermal Cycling Test) จึงมีความสำคัญสำหรับอุปกรณ์อิเล็กทรอนิกส์กำลัง'
  );
insert into questions (category_id, question, answer, explanation, is_active, needs_review)
select c.id, 'การควบคุมแบบ Vector Control ที่กล่าวถึงในการควบคุมมอเตอร์เหนี่ยวนำ (หมวดเครื่องจักรกลไฟฟ้า) อาศัยความสามารถของอุปกรณ์อิเล็กทรอนิกส์กำลังส่วนใดเป็นพื้นฐานสำคัญ', 'อาศัยความสามารถของอินเวอร์เตอร์ที่ใช้เทคนิค PWM ในการสร้างรูปคลื่นแรงดันและกระแสที่มีขนาดและมุมเฟสตามที่อัลกอริทึม Vector Control คำนวณได้อย่างแม่นยำและรวดเร็ว ซึ่งต้องอาศัยความเร็วในการสวิตชิ่งและความละเอียดในการควบคุมที่สูง', 'ความก้าวหน้าของอุปกรณ์อิเล็กทรอนิกส์กำลังและตัวควบคุมดิจิทัลความเร็วสูง เป็นปัจจัยสำคัญที่ทำให้เทคนิคการควบคุมมอเตอร์ขั้นสูงอย่าง Vector Control สามารถนำมาใช้งานจริงได้อย่างแพร่หลายในปัจจุบัน', true, true
from categories c
where c.branch_id = '448937cf-58c5-4007-b57b-6a8bcf46c2fe' and c.code = 'power_electronics'
  and not exists (
    select 1 from questions q2
    where q2.category_id = c.id and q2.question = 'การควบคุมแบบ Vector Control ที่กล่าวถึงในการควบคุมมอเตอร์เหนี่ยวนำ (หมวดเครื่องจักรกลไฟฟ้า) อาศัยความสามารถของอุปกรณ์อิเล็กทรอนิกส์กำลังส่วนใดเป็นพื้นฐานสำคัญ'
  );
insert into questions (category_id, question, answer, explanation, is_active, needs_review)
select c.id, 'เหตุใดในการออกแบบวงจรอิเล็กทรอนิกส์กำลังจึงต้องพิจารณาความเข้ากันได้ทางแม่เหล็กไฟฟ้า (Electromagnetic Compatibility, EMC) นอกเหนือจากประสิทธิภาพทางไฟฟ้า', 'การสวิตชิ่งด้วยความถี่สูงของอุปกรณ์อิเล็กทรอนิกส์กำลังก่อให้เกิดสัญญาณรบกวนแม่เหล็กไฟฟ้าทั้งแบบแผ่กระจายในอากาศ (Radiated) และแบบนำผ่านสาย (Conducted) ซึ่งอาจรบกวนการทำงานของอุปกรณ์อิเล็กทรอนิกส์อื่นที่อยู่ใกล้เคียง หากไม่มีการออกแบบป้องกันที่เหมาะสม', 'การออกแบบเพื่อความเข้ากันได้ทางแม่เหล็กไฟฟ้ามักรวมถึงการใช้ตัวกรองสัญญาณรบกวน (EMI Filter) การป้องกันด้วยชีลด์โลหะ และการจัดวางเส้นทางกระแสให้ลดพื้นที่ลูปที่อาจแผ่กระจายสัญญาณรบกวนออกไป', true, true
from categories c
where c.branch_id = '448937cf-58c5-4007-b57b-6a8bcf46c2fe' and c.code = 'power_electronics'
  and not exists (
    select 1 from questions q2
    where q2.category_id = c.id and q2.question = 'เหตุใดในการออกแบบวงจรอิเล็กทรอนิกส์กำลังจึงต้องพิจารณาความเข้ากันได้ทางแม่เหล็กไฟฟ้า (Electromagnetic Compatibility, EMC) นอกเหนือจากประสิทธิภาพทางไฟฟ้า'
  );
insert into questions (category_id, question, answer, explanation, is_active, needs_review)
select c.id, 'เหตุใดวงจรอิเล็กทรอนิกส์กำลังในระบบสำคัญ เช่น ระบบขับเคลื่อนมอเตอร์อุตสาหกรรมขนาดใหญ่ จึงมักออกแบบให้มีฟังก์ชันวินิจฉัยตัวเองและป้องกันความผิดปกติในตัว (Self-diagnostic and Protection Function)', 'เพราะอุปกรณ์อิเล็กทรอนิกส์กำลังมีความไวต่อความเสียหายจากสภาวะผิดปกติ เช่น กระแสเกิน แรงดันเกิน หรืออุณหภูมิสูงเกิน มากกว่าอุปกรณ์ไฟฟ้ากำลังทั่วไป ฟังก์ชันป้องกันในตัวช่วยตัดการทำงานอย่างรวดเร็วก่อนเกิดความเสียหายลุกลาม และฟังก์ชันวินิจฉัยช่วยระบุสาเหตุของปัญหาได้รวดเร็วเพื่อการซ่อมบำรุงที่มีประสิทธิภาพ', 'อุปกรณ์อิเล็กทรอนิกส์กำลังสมัยใหม่ เช่น VFD มักมีระบบแสดงรหัสข้อผิดพลาด (Fault Code) ที่ช่วยให้ช่างซ่อมบำรุงสามารถระบุสาเหตุของปัญหาได้อย่างรวดเร็ว แทนที่จะต้องตรวจสอบทั้งระบบทีละจุดด้วยตนเอง', true, true
from categories c
where c.branch_id = '448937cf-58c5-4007-b57b-6a8bcf46c2fe' and c.code = 'power_electronics'
  and not exists (
    select 1 from questions q2
    where q2.category_id = c.id and q2.question = 'เหตุใดวงจรอิเล็กทรอนิกส์กำลังในระบบสำคัญ เช่น ระบบขับเคลื่อนมอเตอร์อุตสาหกรรมขนาดใหญ่ จึงมักออกแบบให้มีฟังก์ชันวินิจฉัยตัวเองและป้องกันความผิดปกติในตัว (Self-diagnostic and Protection Function)'
  );

commit;

-- ---------- ตรวจสอบผลลัพธ์ ----------
select c.name_th as category, count(q.id) as question_count
from categories c
left join questions q on q.category_id = c.id
where c.branch_id = '448937cf-58c5-4007-b57b-6a8bcf46c2fe' and c.code = 'power_electronics'
group by c.name_th;
