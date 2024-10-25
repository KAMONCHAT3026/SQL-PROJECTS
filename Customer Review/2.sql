-- 2.ดึงข้อมูลลูกค้าที่ให้เรตติ้งสูง เงื่อนไข คือ ลูกค้าให้เรตติ้งมากกว่า 4
-- ให้ดึงข้อมูลชื่อลูกค้า (name) และ อีเมล์ (contact_info) ที่ให้เรตติ้งมากกว่า 4
SELECT 
	name, 
    	contact_info
FROM 
	Customers
WHERE 
	customer_id IN (
    		SELECT DISTINCT 
      			customer_id
    		FROM 
      			Reviews
    		WHERE 
      			rating > 4
);