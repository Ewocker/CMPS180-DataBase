DROP SCHEMA lab2 CASCADE;
CREATE SCHEMA lab2;

CREATE TABLE Stores (
	store_id	INT,
	name		CHAR(20),
	address		VARCHAR(50) NOT NULL,
	manager		CHAR(20),
	PRIMARY KEY (store_id),
	UNIQUE (name, address)
);

CREATE TABLE Customers (
	customer_id	INT,
	name		CHAR(20) NOT NULL,
	address		VARCHAR(50),
	email		CHAR(20),
	PRIMARY KEY(customer_id),
	UNIQUE (email),
	UNIQUE (name, address)
);

CREATE TABLE Products (
	product_id	INT,
	name		CHAR(20) NOT NULL,
	category	CHAR(20),
	manufacturer	CHAR(20) NOT NULL,
	PRIMARY KEY (product_id),
	UNIQUE (name, manufacturer),
	UNIQUE (category, name)
);

CREATE TABLE Sales (
	store_id	INT,
	customer_id	INT,
	product_id	INT,
	purchase_date	DATE,
	quantity	INT NOT NULL,
	price		DECIMAL(6,2) NOT NULL,
	shipped		BOOLEAN,
	PRIMARY KEY (store_id, customer_id, product_id, purchase_date)
);
