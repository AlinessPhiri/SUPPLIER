CREATE DATABASE my_database;
USE my_database;

CREATE TABLE SUPPLIER (
Sup_No VARCHAR(2) PRIMARY KEY,
Sup_Name CHAR(50),
Item_Supplied CHAR (50),
Item_Price BIGINT,
City CHAR(50)
);

INSERT INTO SUPPLIER (Sup_No, Sup_Name, Item_Supplied, Item_Price, City) VALUES
('S1', 'Suresh', 'Keyboard', 400, 'Hyderabad'),
('S2', 'Kiran', 'Processor', 8000, 'Delhi'),
('S3', 'Mohan', 'Mouse', 350, 'Delhi'),
('S4', 'Ramesh', 'Processor', 9000, 'Bangalore'),
('S5', 'Manish', 'Printer', 6000, 'Mumbai'),
('S6', 'Srikanth', 'Processor', 8500, 'Chennai');

SELECT * FROM SUPPLIER;

SELECT Sup_No, Sup_Name
FROM SUPPLIER
WHERE Sup_Name LIKE 'R%';

SELECT Sup_Name, Item_Supplied, City
FROM SUPPLIER
WHERE Item_Supplied = 'Processor' AND City = 'Delhi';

SELECT Sup_Name, Item_Supplied, City
FROM SUPPLIER
WHERE Item_Supplied = 'Processor' AND City = 'Delhi';

SELECT DISTINCT Sup_Name
FROM SUPPLIER
WHERE Item_Supplied = (
    SELECT Item_Supplied
    FROM SUPPLIER
    WHERE Sup_Name = 'Ramesh'
)
AND Sup_Name != 'Ramesh';

SET SQL_SAFE_UPDATES = 0;

UPDATE SUPPLIER
SET Item_Price = Item_Price + 200
WHERE Item_Supplied = 'Keyboard';

SELECT Sup_No, Sup_Name, Item_Price
FROM SUPPLIER
WHERE City = 'Delhi'
ORDER BY Item_Price ASC;

ALTER TABLE SUPPLIER
ADD CONTACTNO VARCHAR(20);

SET SQL_SAFE_UPDATES = 1;

DELETE FROM SUPPLIER
WHERE Item_Price = (
    SELECT min_price
    FROM (SELECT MIN(Item_Price) AS min_price FROM SUPPLIER) AS temp
)
LIMIT 1;

CREATE VIEW SupplierDetails AS
SELECT Sup_No, Sup_Name
FROM SUPPLIER;

SELECT Sup_No, Sup_Name, Item_Supplied, Item_Price, City, CONTACTNO
FROM SUPPLIER
ORDER BY Item_Supplied ASC, Item_Price DESC;

SELECT Sup_No, Sup_Name, Item_Supplied, Item_Price, City, CONTACTNO
FROM SUPPLIER
WHERE Item_Supplied NOT IN ('Processor', 'Keyboard');

