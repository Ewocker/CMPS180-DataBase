-- QUERY 1
SELECT DISTINCT manufacturer FROM unshipped_products;
-- RESULT 1
--      manufacturer     
-- ----------------------
--  Apple               
--  Kellogg             
--  HP                  
--  Samsung             
--  Motorola            
-- (5 rows)


-- DELETE
-- store_id, customer_id, product_id, purchase_date
-- (300, 8, 8000, ’10/21/2016’)
-- (300, 2, 7000, ’10/22/2016’)
-- (500, 10, 8000, ’10/21/2016’)
-- (500, 11, 9000, ’10/23/2016’)
DELETE
FROM sales
WHERE (store_id = 300
       AND customer_id = 8
       AND product_id = 8000
       AND purchase_date = '10/21/2016')
    OR (store_id = 300
        AND customer_id = 2
        AND product_id = 7000
        AND purchase_date = '10/22/2016')
    OR (store_id = 500
        AND customer_id = 10
        AND product_id = 8000
        AND purchase_date = '10/21/2016')
    OR (store_id = 500
        AND customer_id = 11
        AND product_id = 9000
        AND purchase_date = '10/23/2016');

-- QUERY 2
SELECT DISTINCT manufacturer FROM unshipped_products;
-- RESULT 2
--      manufacturer     
-- ----------------------
--  Apple               
--  Kellogg             
--  HP                  
-- (3 rows)

