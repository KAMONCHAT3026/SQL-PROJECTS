-- 5.คำนวณยอดขายรวมของแต่ละวันในสัปดาห์ (Sunday to Saturday)
-- ให้เรียกข้อมูล day_of_week และ total_sold 
-- day_of_week : 0 แทน วันอาทิตย์, 1 แทน วันจันทร์, …, 6 แทน วันเสาร์
SELECT
    strftime('%w', inv.order_date) AS day_of_week,
    SUM(i.price * inv.quantity) AS total_sold
FROM
    Invoices inv
JOIN
    Items i ON inv.item_id = i.item_id
GROUP BY
    day_of_week
ORDER BY
    day_of_week;