-- Query6
-- Find the total quantity sold for each product for each purchase_date. Your answer should include the product’s name, the product’s manufacturer, the purchase_date, and the total quantity sold.
SELECT name, manufacturer, purchase_date, sum as quantity
FROM products JOIN (SELECT product_id, purchase_date, SUM(quantity)
					FROM sales                                                                  
					GROUP BY purchase_date, product_id) AS tmp
ON products.product_id = tmp.product_id
ORDER BY purchase_date ASC;