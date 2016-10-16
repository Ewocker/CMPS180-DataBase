-- Query5
-- List the customer_id and purchase_date for every sale that was made at a store managed by George Jetson of a product manufactured by Kellogg at a price that’s more than 49.98, but which has been shipped to the customer.
SELECT customer_id, purchase_date
FROM sales
WHERE store_id IN (SELECT store_id
					FROM stores
					WHERE manager = 'George Jetson')
		AND
		product_id IN (SELECT product_id
						FROM products
						WHERE manufacturer = 'Kellogg')
		AND
		price < 49.98
		AND
		shipped = TRUE;