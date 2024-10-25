-- 4.ในปี 2023 ระหว่างรถพลังงานไฟฟ้า (Electric) หรือ พลังงานเชื้อเพลิง (Petrol) แบบไหนได้รับความนิยมมากกว่ากัน
-- ให้ดึงข้อมูลประเภทพลังงานที่ใช้ FuelType และ จำนวนขาย COUNT(TransactionID) AS TotalSales ของรถ ที่ Electric และ รถ Petrol ในปี 2023
SELECT 
	v.FuelType,
    	COUNT(st.TransactionID) AS TotalSales
FROM 
	SalesTransaction st
JOIN 
	Vehicle v ON st.VehicleID = v.VehicleID
WHERE 
	strftime('%Y', st.SaleDate) = '2023' AND v.FuelType IN ('Electric', 'Petrol')
GROUP BY 
	v.FuelType;