-- 3.นับจำนวนครั้งที่ลูกค้าแต่ละคนเข้ามาเขียนรีวิว
-- ให้ดึงข้อมูลชื่อลูกค้า (name) และ จำนวนข้อความรีวิว (review_count)
SELECT 
	c.name,
    	COUNT(r.review_id) AS review_count
FROM 
	Customers c
JOIN 
	Reviews r ON c.customer_id = r.customer_id
GROUP BY 
	c.customer_id
HAVING 
	COUNT(r.review_id) > 1;