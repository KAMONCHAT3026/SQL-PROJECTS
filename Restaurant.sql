-- Restaurant Owner
-- 5 Table
-- 1x Fact, 4x Dimension
-- search google, how to add foreign key
-- write SQL 3-5 queries analyze data
-- 1x subquery / with

-- การสร้าง Dimension : Owner ( 1 )
CREATE TABLE Owners (
    OwnerID INT PRIMARY KEY,
    OwnerName VARCHAR(100),
    ContactInfo VARCHAR(100)
);

INSERT INTO Owners VALUES
(1, 'Godric Gryffindor', 'godric@gryffindor.com'),
(2, 'Salazar Slytherin', 'salazar@slytherin.com'),
(3, 'Helga Hufflepuff', 'helga@hufflepuff.com'),
(4, 'Rowena Ravenclaw', 'rowena@ravenclaw.com');

-- การสร้าง Dimension : Restaurants ( 2 )
CREATE TABLE Restaurants (
    RestaurantID INT PRIMARY KEY,
    RestaurantName VARCHAR(100),
    OwnerID INT,
    Location VARCHAR(255),
    FOREIGN KEY (OwnerID) REFERENCES Owners(OwnerID)
);

INSERT INTO Restaurants VALUES
(1, 'KFC', 1, 'BKK.'),
(2, 'McDonald’s', 2, 'CMI.'),
(3, 'Burger King', 3, 'KKN.'),
(4, 'Subway', 4, 'PKT.'),
(5, 'Mister Donut', 1, 'CBI.');

-- การสร้าง Dimension : MenuItems ( 3 )
CREATE TABLE MenuItems (
    MenuItemID INT PRIMARY KEY,
    RestaurantID INT,
    ItemName VARCHAR(100),
    Price DECIMAL(10, 2),
    FOREIGN KEY (RestaurantID) REFERENCES Restaurants(RestaurantID)
);

INSERT INTO MenuItems VALUES
(1, 1, 'Chick N Share Nuggets & POP Team', 99),
(2, 1, 'The Box Signature', 179),
(3, 2, 'French Fries', 85),
(4, 2, 'Filet-O-Fish', 109),
(5, 3, 'Tom Yum Chicken with Rice', 69),
(6, 4, 'BBQ Chicken', 238),
(7, 5, 'Trio', 29);

-- การสร้าง Dimension : Customers ( 4 )
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(100),
    Phone VARCHAR(15)
);

INSERT INTO Customers VALUES
(1, 'Harry Potter', '081-234-5678'),
(2, 'Ron Weasley', '082-345-6789'),
(3, 'Hermione Granger', '083-456-7890');

-- การสร้าง Fact Table : Orders
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    RestaurantID INT,
    CustomerID INT,
    MenuItemID INT,
    OrderDate DATETIME,
    Quantity INT,
    FOREIGN KEY (RestaurantID) REFERENCES Restaurants(RestaurantID),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (MenuItemID) REFERENCES MenuItems(MenuItemID)
);

INSERT INTO Orders VALUES
(1, 1, 1, 1, '2024-10-01 13:00:00', 2),
(2, 2, 2, 3, '2024-10-02 14:00:00', 2),
(3, 3, 3, 5, '2024-10-03 15:00:00', 1),
(4, 4, 1, 6, '2024-10-04 16:00:00', 2),
(5, 5, 2, 7, '2024-10-05 17:00:00', 5);

-- การใช้ Query สำหรับการวิเคราะห์ข้อมูล ( Analyze Data )
-- 1.จงหายอดขายรวมของแต่ละร้านอาหาร
SELECT 
	r.RestaurantName,
	SUM(o.Quantity * m.Price) AS TotalSales
FROM 
	Orders o
JOIN 
	MenuItems m ON o.MenuItemID = m.MenuItemID
JOIN 
	Restaurants r ON o.RestaurantID = r.RestaurantID
GROUP BY 
	r.RestaurantName
ORDER BY 
	TotalSales DESC;

-- 2.จงหาเมนูอาหารที่ขายดีที่สุด
SELECT 
	m.ItemName,
	SUM(o.Quantity) AS TotalSold
FROM 
	Orders o
JOIN 
	MenuItems m ON o.MenuItemID = m.MenuItemID
GROUP BY 
	m.ItemName
ORDER BY 
	TotalSold DESC;

-- 3.จงหาลูกค้าที่ใช้จ่ายสูงสุดในร้านอาหาร
SELECT 
    c.CustomerName,
    SUM(m.Price * o.Quantity) AS total_spent
FROM 
    Customers c
JOIN 
    Orders o ON c.CustomerID = o.CustomerID
JOIN 
    MenuItems m ON o.MenuItemID = m.MenuItemID
GROUP BY 
    c.CustomerID, c.CustomerName
ORDER BY 
    total_spent DESC;

-- การใช้ Subquery เพื่อหา Owner ที่มีร้านอาหารมากที่สุด
SELECT 
	OwnerID,
	OwnerName
FROM 
	Owners
WHERE 
	OwnerID IN 
		(SELECT 
			OwnerID
		FROM 
			Restaurants
		GROUP BY 
			OwnerID
		HAVING 
			COUNT(RestaurantID) > 1);