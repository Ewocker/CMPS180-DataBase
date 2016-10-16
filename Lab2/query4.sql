-- #uery4
-- List the product_id and name for all the different products that were purchased on July 4, 2016.
SELECT name
FROM products
WHERE product_id IN	(SELECT product_id
					FROM sales
					WHERE purchase_date = '20160704');