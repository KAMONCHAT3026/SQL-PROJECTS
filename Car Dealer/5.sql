-- 5.หัวหน้าทีมต้องการจัดหมวดหมู่ให้กับรถแต่ละโมเดล โดยมีเงื่อนไขว่า ถ้าราคาเท่ากับ หรือ มากกว่า 1 ล้านให้จัดเป็นรุ่น Flagship Model แต่ถ้าราคาต่ำกว่านั้นให้จัดเป็นรุ่น Normal Model
-- ให้ดึงข้อมูล ModelName และ สร้างคอลัมน์ใหม่ให้ชื่อว่า ModelLabel แล้วเรียงลำดับตามตัวอักษร ModelName จากน้อยไปมาก
SELECT 
	ModelName,
  		CASE
    			WHEN Price >= 1000000 THEN 'Flagship Model'
    			ELSE 'Normal Model'
  		END AS ModelLabel
FROM 
	Vehicle
GROUP BY 
	ModelName
ORDER BY 
	ModelName ASC;