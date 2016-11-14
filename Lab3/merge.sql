INSERT INTO sales
SELECT *
FROM newsales n WHERE(n.store_id, n.customer_id, n.product_id, n.purchase_date, n.quantity, n.unit_price) NOT IN
    (SELECT sales.store_id,
            sales.customer_id,
            sales.product_id,
            sales.purchase_date,
            sales.quantity,
            sales.unit_price
     FROM sales);

UPDATE sales
SET shipped = FALSE
WHERE shipped IS NULL;