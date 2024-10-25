-- 2.หายอดขายสะสมของลูกค้าแต่ละคน เรียงลำดับจากยอดขายสะสมมากไปน้อย
-- ให้เรียกดูข้อมูล customer_id, email และ คำนวณ cumulative_sales จากนั้นลำดับ cumulative_sales จากมากไปน้อย
SELECT
    c.customer_id,
    c.email,
    SUM(i.price * inv.quantity) AS cumulative_sales
FROM
    Customers c
JOIN
    Invoices inv ON c.customer_id = inv.customer_id
JOIN
    Items i ON inv.item_id = i.item_id
GROUP BY
    c.customer_id, c.email
ORDER BY
    cumulative_sales DESC;