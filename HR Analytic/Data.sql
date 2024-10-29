-- สร้าง Table
CREATE TABLE Team (
	team_id INT PRIMARY KEY,
	team_name VARCHAR(50)
);

CREATE TABLE Employee (
	employee_id INT PRIMARY KEY,
	first_name VARCHAR(50),
	last_name VARCHAR(50),
	email VARCHAR(255) UNIQUE,
	hire_date DATE,
	team_id INT,
	FOREIGN KEY (team_id) REFERENCES team(team_id)
);

CREATE TABLE Salary (
	employee_id INT PRIMARY KEY,
	role VARCHAR(50),
	salary INTEGER
);

-- เพิ่มข้อมูลไปในแต่ละ Table
INSERT INTO employee (employee_id, first_name, last_name, email, hire_date, team_id) VALUES
(1, 'Warde', 'Remon', 'wremon0@zimbio.com','1-Jun-23', 1),
(2, 'Orlando', 'Groneway', 'ogroneway1@wikipedia.org', '22-Jun-23', 1),
(3, 'Amalita', 'Shorland', 'ashorland2@npr.org', '25-Mar-23', 1),
(4, 'Reinwald', 'Pickersail', 'rpickersail3@skyrock.com', '24-Jun-23', 1),
(5, 'Ilario', 'Anfrey', 'ianfrey4@google.com','2-Jan-23',1),
(6,'Davey', 'Frowen', 'dfrowen5@nsw.gov.au', '3-Mar-23', 6),
(7, 'Leigha', 'Randlesome', 'lrandlesome6@alibaba.com', '15-Oct-22', 6),
(8,'Junia', 'Yakovliv', 'jyakovliv7@artisteer.com', '31-Jul-23', 6),
(9, 'Rochell', 'Waggatt', 'rwaggatt8@opera.com', '15-Apr-23', 6),
(10, 'Moises', 'Ardley', 'mardley9@webnode.com', '21-Jun-23', 6);

INSERT INTO Team (team_id, team_name) VALUES 
(1, 'plan_A'),
(6, 'plan_B');

INSERT INTO Salary (employee_id, role, salary) VALUES 
(1, 'Sales', 40153),
(2, 'Marketing', 46670),
(3, 'Legal', 71983),
(4, 'Sales', 15857),
(5, 'Software Engineer', 95174),
(6, 'Sales', 27819),
(7, 'Legal', 75323),
(8, 'Software Engineer', 90525),
(9, 'Tax Accountant', 85946),
(10, 'Marketing', 56575);