DROP SCHEMA lab2 CASCADE;
CREATE SCHEMA lab2;

CREATE TABLE Stores (
	store_id	INT,
	address		VARCHAR(50),
	manager		CHAR(20),
	PRIMARY KEY (store_id)
);

CREATE TABLE Customers (
	customer_id	INT,
	name		CHAR(20),
	address		VARCHAR(50),
	email		CHAR(20),
	PRIMARY KEY(customer_id)
);

CREATE TABLE Products (
	product_id	INT,
	name		CHAR(20),
	category	CHAR(20),
	manufacture	CHAR(20),
	PRIMARY KEY (product_id)
);

CREATE TABLE Sales (
	store_id	INT,
	customer_id	INT,
	product_id	INT,
	purchase_date	DATE,
	quantity	INT,
	price		DECIMAL(6,2),
	shipped		BOOLEAN,
	PRIMARY KEY (store_id, customer_id, product_id, purchase_date)
);
