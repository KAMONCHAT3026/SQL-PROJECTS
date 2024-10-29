-- 4.กำหนดให้พนักงานที่เงินเดือนสูงกว่า 75,000 เรียกว่า Manager / เงินเดือนตั้งแต่ 45,000 ถึง 75,000 เรียก Senior / ส่วนเงินเดือนน้อยกว่านั้นเรียกว่า Staff
SELECT
	E.employee_id,
	E.first_name,
	E.last_name,
	S.salary,
	CASE
		WHEN S.salary > 75000 THEN 'Manager'
		WHEN S.salary <= 75000 AND S.salary > 45000 THEN 'Senior'
		ELSE 'Staff'
	END AS employee_category
FROM
	Employee E
JOIN
	Salary S ON E.employee_id = S.employee_id;