-- 3.เงินเดือนเฉลี่ยของพนักงานแต่ละตำแหน่ง ?
-- 3.1 ) หาเงินเดือนเลี่ยของแต่ละตำแหน่ง
SELECT
	role,
	AVG(salary) AS average_salary
FROM
	salary
GROUP BY
	role;

-- 3.2 ) หาเงินเดือนของแต่ละตำแหน่งเป็นสัดส่วนเท่าใดของเงินที่จ้างพนักงานทั้งหมด
SELECT
	S.role,
	ROUND(SUM(S.salary) * 1.0 / (SELECT SUM(salary) FROM Salary), 4) AS proportion
FROM
	Team T
JOIN
	Employee E ON T.team_id = E.team_id
JOIN
	Salary S ON E.employee_id = S.employee_id
GROUP BY
	S.role;
