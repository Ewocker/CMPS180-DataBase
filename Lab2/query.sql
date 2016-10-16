#Query1
#Find the names of the stores that are managed by a person named Shel Finkelstein.
SELECT name
FROM stores
WHERE manager = 'Shel Finkelstein';

#Query2
#Find the names and addresses of the customers who have NULL email.
SELECT name address
FROM customers
WHERE email IS NULL;

#Query3
#For managers who are also customers (same names), provide the name of the manager, the store_id for the store that person manages, and the manager’s personal (not store) address.
SELECT C.name, S.store_id, C.address
FROM stores S, customers C 
WHERE C.name = S.manager;

#Query4
#List the product_id and name for all the different products that were purchased on July 4, 2016.
SELECT name
FROM products
WHERE product_id IN	(SELECT product_id
					FROM sales
					WHERE purchase_date = '20160704');

#Query5
#List the customer_id and purchase_date for every sale that was made at a store managed by George Jetson of a product manufactured by Kellogg at a price that’s more than 49.98, but which has been shipped to the customer.
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

#Query6
#Find the total quantity sold for each product for each purchase_date. Your answer should include the product’s name, the product’s manufacturer, the purchase_date, and the total quantity sold.
SELECT name, manufacturer, purchase_date, sum as quantity
FROM products JOIN (SELECT product_id, purchase_date, SUM(quantity)
					FROM sales                                                                  
					GROUP BY purchase_date, product_id) AS tmp
ON products.product_id = tmp.product_id
ORDER BY purchase_date ASC;
