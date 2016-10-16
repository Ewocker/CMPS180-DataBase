-- Query2
-- Find the names and addresses of the customers who have NULL email.
SELECT name address
FROM customers
WHERE email IS NULL;