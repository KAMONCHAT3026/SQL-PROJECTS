-- 5.ถ้ามีพนักงานเข้ามาในวันที่ 14-Oct-23 ตำแหน่ง Marketing เงินเดือน 45,000 บาท เงินเดือนเฉลี่ยล่าสุดของตำแหน่ง Marketing จะเป็นเท่าใด ?
-- เพิ่มข้อมูลพนักงานใหม่คนที่ 11 ในตาราง employee และ salary ตามข้อมูลที่โจทย์บอก
INSERT INTO employee (employee_id, first_name, last_name, email, hire_date, team_id) VALUES
(11, 'Harry', 'Pottor' , 'harry@gmail.com' , '11-Oct-23', 1);

INSERT INTO Salary (employee_id, role, salary) VALUES
(11, 'Marketing', 45000);

-- หาเงินเดือนเฉลี่ยของ Marketing ใหม่
SELECT
	role,
	AVG(salary) AS average_salary
FROM
	salary
GROUP BY
	role
HAVING
	role = 'Marketing';