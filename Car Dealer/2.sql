-- 2.ระบุพนักงานขาย (ชื่อ-นามสกุล) ที่ขายรถได้มากที่สุด และ ขายได้กี่คัน
-- ให้ดึงข้อมูลชื่อ-นามสกุล (FirstName, LastName) และจำนวนรถยนต์ที่ขายได้ COUNT(TransactionID) AS TotalTransactions
SELECT 
	s.FirstName,
    	s.LastName, 
    	COUNT(st.TransactionID) AS TotalTransactions
FROM 
	Salesperson s
JOIN 
	SalesTransaction st ON s.SalespersonID = st.SalespersonID
GROUP BY 
	s.SalespersonID
ORDER BY 
	TotalTransactions DESC
LIMIT 1;