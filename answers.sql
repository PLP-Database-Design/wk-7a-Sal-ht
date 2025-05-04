
-- Question 1 Achieving 1NF (First Normal Form)
/* Write an SQL query** to transform this table into **1NF**, ensuring that each row represents a single product for an order*/

-- | OrderID | CustomerName  | Products                        |
-- |---------|---------------|---------------------------------|
-- | 101     | John Doe      | Laptop, Mouse                   |
-- | 102     | Jane Smith    | Tablet, Keyboard, Mouse         |
-- | 103     | Emily Clark   | Phone                           |

-- Approach: Instead of having one column showing multiple products, a new table created separately to show products

-- Orders table(original table)
CREATE TABLE orders (
    OrderID INT PRIMARY KEY,
    CustomerName VARCHAR(100)
);

-- Insert data 
INSERT INTO orders (OrderID, CustomerName) VALUES
(101, 'John Doe'),
(102, 'Jane Smith'),
(103, 'Emily Clark');

-- New table to show the products with a relationship to our first table(orders)
CREATE TABLE orderproducts (
    OrderID INT,
    Product VARCHAR(100),
    FOREIGN KEY (OrderID) REFERENCES orders(OrderID)
);

-- Insert data into orderproducts table
INSERT INTO orderproducts (OrderID, Product) VALUES
(101, 'Laptop'),
(101, 'Mouse'),
(102, 'Tablet'),
(102, 'Keyboard'),
(102, 'Mouse'),
(103, 'Phone');

-- Question 2 Achieving 2NF (Second Normal Form) 
/*Write an SQL query to transform this table into **2NF** by removing partial dependencies. Ensure that each non-key column fully depends on the entire primary key.*/

-- Approach: CustomerName depends only on OrderID which brings about the partial dependency thus create two tables, one for the CustomerName and the other for Orderdetails.

-- orders table
CREATE TABLE orders (
    OrderID INT PRIMARY KEY,
    CustomerName VARCHAR(100)
);

INSERT INTO orders (OrderID, CustomerName) VALUES
(101, 'John Doe'),
(102, 'Jane Smith'),
(103, 'Emily Clark');

-- New table after split that shows the orderdeatils
CREATE TABLE orderdetails (
    OrderID INT,
    Product VARCHAR(100),
    Quantity INT,
    PRIMARY KEY (OrderID, Product),
    FOREIGN KEY (OrderID) REFERENCES orders(OrderID)
);

INSERT INTO orderdetails (OrderID, Product, Quantity) VALUES
(101, 'Laptop', 2),
(101, 'Mouse', 1),
(102, 'Tablet', 3),
(102, 'Keyboard', 1),
(102, 'Mouse', 2),
(103, 'Phone', 1);

