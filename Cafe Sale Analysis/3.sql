-- 3.ให้จำแนกรายการสินค้า Dairy Products หรือ Non-Dairy Products
-- ให้เรียกข้อมูลทั้งหมดจากตาราง Items และ สร้าง product_category โดยมีเงื่อนไขว่าถ้า item_id ประกอบด้วย 3, 4, 5, 8 และ 9 ให้บันทึกเป็น “Dairy Product” นอกเหนือจากนั้นให้บันทึกเป็น “Non-Dairy Product”
SELECT
    item_id,
    item_name,
    price,
    invoice_id,
	CASE
		WHEN item_id IN (3, 4, 5, 8, 9) THEN 'Dairy Product'
		ELSE 'Non-Dairy Product'
	END AS product_category
FROM
    Items;