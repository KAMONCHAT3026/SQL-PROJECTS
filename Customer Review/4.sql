-- 4.หาค่าเฉลี่ยเรตติ้งในแต่ละวันในสัปดาห์
-- ให้ดึงข้อมูลวันในสัปดาห์ (day_of_week) และ ค่าเฉลี่ยเรทติ้ง (avg_rating)
SELECT 
	strftime('%w', date) AS day_of_week,
    	AVG(r.rating) AS avg_rating
FROM 
	Reviews r
WHERE 
	r.product_id = 1
GROUP BY 
	day_of_week
ORDER BY 
	day_of_week;