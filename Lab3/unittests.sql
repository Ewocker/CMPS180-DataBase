-- Three Foreign Key Constraint in 2.3

DELETE FROM stores
WHERE store_id = 200;

DELETE FROM customers
WHERE customer_id = 1;

DELETE FROM products
WHERE product_id = 1000;

-- Four general constraints

-- Unit_price in Sales must not be NULL.
    -- Meeting
INSERT INTO sales
VALUES (100, 
        1,
        9000,
        '1996-05-09',
        1,
        105,
        FALSE);
    -- Violate
INSERT INTO sales
VALUES (100, 
        1,
        9000,
        '1996-05-10',
        1,
        NULL,
        FALSE);

-- Unit_price in Sales must be positive.
    -- Meeting
INSERT INTO sales
VALUES (100, 
        1,
        9000,
        '1996-05-11',
        1,
        105,
        FALSE);
    -- Violate
INSERT INTO sales
VALUES (100, 
        1,
        9000,
        '1996-05-12',
        1,
        -105,
        FALSE);

-- A record in Customers may not have a NULL value for name.
    -- Meeting
INSERT INTO customers
VALUES (101, 
        'Ewing',
        'My Address',
        'email@ucsc.edu');
    -- Violate
INSERT INTO customers
VALUES (101, 
        NULL,
        'My Address',
        'email@ucsc.edu');

-- The total price for a tuple that’s in Sales must not be more than 1000.
    -- Meeting
INSERT INTO sales
VALUES (100, 
        1,
        9000,
        '1996-05-13',
        1,
        105,
        FALSE);
    -- Violate
INSERT INTO sales
VALUES (100, 
        1,
        9000,
        '1996-05-14',
        10,
        200,
        FALSE);