-- 5.หาว่าสินค้าที่ได้เรตติ้งเท่ากับ หรือ มากกว่า 3.5 เป็นสินค้าชนิดใดบ้าง
-- ให้ดึงข้อมูล product_id, product_name และ average_rating
SELECT 
	p.product_id, 
    	p.product_name, 
    	ROUND(AVG(r.rating), 2) AS avg_rating
FROM
	Products p
LEFT JOIN 
	Reviews r ON p.product_id = r.product_id
GROUP BY 
	p.product_id, p.product_name
HAVING 
	AVG(r.rating) >= 3.5;