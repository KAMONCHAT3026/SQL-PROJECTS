-- 1.หายอดขายรวมของแต่ละสินค้าแต่ละรายการ เรียงตามลำดับไอดีของสินค้า
-- ให้เรียกดูข้อมูล item_id, item_name และ total_sales เรียงลำดับตาม item_id
SELECT    
    i.item_id,
    i.item_name,
    SUM(i.price * inv.quantity) AS total_sales
FROM
    Items i
JOIN
    Invoices inv ON i.item_id = inv.item_id
GROUP BY
    i.item_id, i.item_name
ORDER BY
    i.item_id;