ALTER TABLE sales ADD CHECK (unit_price IS NOT NULL);
ALTER TABLE sales ADD CONSTRAINT positive_price CHECK (unit_price > 0);
ALTER TABLE customers ADD CHECK (name IS NOT NULL);
ALTER TABLE sales ADD CHECK (quantity * unit_price <= 1000);