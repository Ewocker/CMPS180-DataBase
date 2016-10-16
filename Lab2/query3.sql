-- Query3
-- For managers who are also customers (same names), provide the name of the manager, the store_id for the store that person manages, and the manager’s personal (not store) address.
SELECT C.name, S.store_id, C.address
FROM stores S, customers C 
WHERE C.name = S.manager;