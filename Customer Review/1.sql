-- 1.หาเรตติ้งเฉลี่ยของสินค้าแต่ละรายการ 
-- ให้ดึงข้อมูล product_id, product_name และ average_rating
SELECT
	p.product_id,
	p.product_name,
	ROUND(AVG(r.rating), 2) AS average_rating
FROM
	Products p
LEFT JOIN 
	Reviews r ON p.product_id = r.product_id
GROUP BY 
	p.product_id, p.product_name;