-- 4.คำนวณยอดขายสินค้าประเภท Dairy Products และ Non-Dairy Products พร้อมทั้งหาสัดส่วนยอดขายของสินค้าทั้งสอง
-- ให้เรียกข้อมูล product_category, total_quantity_sold และ percentage_sold ซึ่ง
-- 4.1 ) product_category ประกอบด้วย Dairy Product และ Non-Dairy Product
-- 4.2 ) total_quantity_sold คือ ผลรวมของ quantity
-- 4.3 ) percentage_sold คือ สัดส่วนของ Dairy Product ต่อสินค้าทั้งหมด และ ส่วนของ Non-Dairy Product ต่อสินค้าทั้งหมด
WITH ProductCategories AS (
    SELECT
        i.item_id,
        i.item_name,
        	CASE
            		WHEN i.item_id IN (3, 4, 5, 8, 9) THEN 'Dairy Product'
            		ELSE 'Non-Dairy Product'
        	END AS product_category
    FROM
        Items i
)
SELECT
    pc.product_category,
    SUM(inv.quantity) AS total_quantity_sold,
    (SUM(inv.quantity) * 100 / (SELECT SUM(quantity) FROM Invoices)) AS percentage_sold
FROM
    ProductCategories pc
JOIN
    Invoices inv ON pc.item_id = inv.item_id
GROUP BY
    pc.product_category;