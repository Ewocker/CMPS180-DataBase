ALTER TABLE sales ADD
FOREIGN KEY (store_id) REFERENCES stores(store_id);


ALTER TABLE sales ADD
FOREIGN KEY (customer_id) REFERENCES customers(customer_id);


ALTER TABLE sales ADD
FOREIGN KEY (product_id) REFERENCES products(product_id);
