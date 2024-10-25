-- 1.แสดงประเภทของรถยนต์ที่ขายได้ จากขายได้มากที่สุดไปน้อยที่สุด
-- ให้ดึงข้อมูลประเภทรถยนต์ (VehicleType) และ จำนวนรถยนต์ที่ขายได้ COUNT(TransactionID) AS TotalSales เรียงลำดับจำนวนรถยนต์ที่ขายได้จากมากไปน้อย
SELECT
	VehicleType, 
    	COUNT(TransactionID) AS TotalSales
FROM 
	SalesTransaction
JOIN 
	Vehicle ON SalesTransaction.VehicleID = Vehicle.VehicleID
GROUP BY 
	VehicleType
ORDER BY 
	TotalSales DESC;