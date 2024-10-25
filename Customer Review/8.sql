-- 8.ลูกค้าแต่ละคนมักเขียนข้อความรีวิวโดยเฉลี่ยกี่คำ
-- ให้ดึงข้อมูล ชื่อลูกค้า อีเมล์ และ ความยาวเฉลี่ยทุกครั้งของการเขียนข้อความรีวิว
-- Note : ลูกค้าหนึ่งคนอาจซื้อของมากกว่า 1 ครั้ง และ เขียนรีวิวมากกว่า 1 ครั้ง ดังนั้นให้หาความยาวเฉลี่ยของการเขียนข้อความรีวิว
SELECT
	c.name, 
	c.contact_info,
       AVG(LENGTH(r.review_text)) AS avg_review_length
FROM
	Customers c
JOIN 
	Reviews r ON c.customer_id = r.customer_id
GROUP BY 
	c.customer_id
ORDER BY 
	avg_review_length DESC;