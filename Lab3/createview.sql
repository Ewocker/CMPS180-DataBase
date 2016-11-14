CREATE VIEW unshipped_products AS
SELECT name,
       manufacturer
FROM products,
     sales
WHERE shipped = FALSE
    AND products.product_id = sales.product_id
ORDER BY name ASC,
         manufacturer;
