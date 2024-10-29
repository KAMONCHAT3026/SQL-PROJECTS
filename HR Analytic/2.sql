-- 2.พนักงานที่รับเข้าทำงาน 3 คนล่าสุดเป็นใคร อยู่ทีมไหน เข้ามาทำงานวันไหน ?
-- ให้เรียกดูข้อมูลชื่อ นามสกุล, อีเมล, วันที่จ้างงาน, ชื่อทีม หรือ รหัสทีม จาก 2 Table คือ Table Employee และ Table Team โดยคีย์หลัก คือ team_id จากฐานข้อมูลทีม
SELECT
	t.team_name,
	e.first_name,
	e.last_name,
	e.email,
	e.hire_date,
	RANK() OVER (ORDER BY e.hire_date ASC) AS hire_date_rank
FROM
	employee e
JOIN
	team t ON e.team_id = t.team_id
LIMIT 3;