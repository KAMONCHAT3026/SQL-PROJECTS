-- 6.นับจำนวนข้อความที่รีวิวในด้านลบ ( ข้อความรีวิวในด้านลบจะมีคำว่า “disappointed” )
-- ให้ดึง count(review_text) ที่มีคำว่า “disappointed.”
SELECT
	count(review_text)
FROM
	Reviews
WHERE 
	review_text LIKE '%disappointed%';