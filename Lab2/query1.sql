-- Query1
-- Find the names of the stores that are managed by a person named Shel Finkelstein.
SELECT name
FROM stores
WHERE manager = 'Shel Finkelstein';