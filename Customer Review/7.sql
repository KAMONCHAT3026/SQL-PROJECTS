-- 7.หาว่าลูกค้าคนไหนบ้างที่เขียนข้อความรีวิวในด้านบวก
-- ให้ดึงข้อมูล customer_id, review_text ที่ข้อความรีวิวในด้านบวกจะมีคำว่า “excellent” ,“impressive” หรือ “recommend” และ ได้คะแนนเรทติ้งสูง (เรตติ้งเท่ากับ หรือ มากกว่า 4)
SELECT 
	customer_id,
	review_text
FROM 
	Reviews
WHERE 
	(review_text LIKE '%excellent%' OR review_text LIKE '%impressive%' OR review_text LIKE '%recommend%') AND (rating >=4);