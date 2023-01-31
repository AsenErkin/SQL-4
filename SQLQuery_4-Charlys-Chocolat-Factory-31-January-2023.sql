-- Assignment - 4
/*
Charlie's Chocolate Factory company produces chocolates. The following product information is stored: 
product name, product ID, and quantity on hand. These chocolates are made up of many components. 
Each component can be supplied by one or more suppliers. The following component information is kept: 
component ID, name, description, quantity on hand, suppliers who supply them, when and how much they supplied, 
and products in which they are used. On the other hand following supplier information is stored: supplier ID, 
name, and activation status.

Assumptions

A supplier can exist without providing components.
A component does not have to be associated with a supplier. It may already have been in the inventory.
A component does not have to be associated with a product. Not all components are used in products.
A product cannot exist without components. 
*/

--Do the following exercises, using the data model.     
    --a) Create a database named "Manufacturer"
    --b) Create the tables in the database.
    --c) Define table constraints.


--a) Create a database named "Manufacturer"

CREATE DATABASE Manufacturer;

--b) Create the tables in the database.

CREATE TABLE Product (
	  prod_id INT PRIMARY KEY,
	  prod_name VARCHAR(50) NOT NULL,
	  quantity INT
	);

CREATE TABLE Component (
	  comp_id INT PRIMARY KEY,
	  comp_name VARCHAR(50) NOT NULL,
	  description VARCHAR(50),
	  quantity_comp INT
	);

CREATE TABLE Supplier (
	  supp_id INT PRIMARY KEY,
	  supp_name VARCHAR(50) NOT NULL,
	  supp_location VARCHAR(50),
	  sup_country VARCHAR(50),
	  is_active BIT
	);

CREATE TABLE Comp_Supp (
	  supp_id INT,
	  comp_id INT, 
	  order_date DATE,
	  quantity INT,
	  FOREIGN KEY (supp_id) REFERENCES Supplier(supp_id),	  
	  FOREIGN KEY (comp_id) REFERENCES Component(comp_id)
	  
	);


--c) Define table constraints.


ALTER TABLE Component
	  ADD CONSTRAINT quantity_comp CHECK (quantity_comp >= 0);
	
	ALTER TABLE Supplier
	  ADD CONSTRAINT supplier_id CHECK (is_active IN (0, 1, NULL));
	
	ALTER TABLE Comp_Supp
	  ADD CONSTRAINT quantity CHECK (quantity >= 0);
