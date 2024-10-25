-- Vehicle Table
CREATE TABLE Vehicle (
    VehicleID INTEGER PRIMARY KEY,
    ModelName TEXT,
    VehicleType TEXT,
    Price REAL,
    FuelType TEXT
);

-- Salesperson Table
CREATE TABLE Salesperson (
    SalespersonID INTEGER PRIMARY KEY,
    FirstName TEXT,
    LastName TEXT
);

-- Sales Transaction Table
CREATE TABLE SalesTransaction (
    TransactionID INTEGER PRIMARY KEY,
    VehicleID INTEGER,
    SalespersonID INTEGER,
    SaleDate DATE,
    FOREIGN KEY (VehicleID) REFERENCES Vehicle(VehicleID),
    FOREIGN KEY (SalespersonID) REFERENCES Salesperson(SalespersonID)
);

-- Data for Vehicle Table
INSERT INTO Vehicle (ModelName, VehicleType, Price, FuelType) VALUES
('Sedan A', 'Sedan', 1200000, 'Petrol'),
('SUV X', 'SUV', 1500000, 'Electric'),
('Hatchback B', 'Hatchback', 800000, 'Petrol'),
('Sedan C', 'Sedan', 900000, 'Electric'),
('Truck Y', 'Truck', 2000000, 'Diesel'),
('SUV A', 'SUV', 1700000, 'Electric'),
('SUV Y', 'SUV', 1800000, 'Electric'),
('SUV Z', 'SUV', 1700000, 'Electric'),
('Hatchback C', 'Hatchback', 2100000, 'Petrol'),
('Sedan X', 'Sedan', 1500000, 'Petrol'),
('SUV B', 'SUV', 1300000, 'Electric');

-- Data for Salesperson Table
INSERT INTO Salesperson (FirstName, LastName) VALUES
('John', 'Doe'),
('Jane', 'Smith'),
('Bob', 'Johnson');

-- Data for Sales Transaction Table
INSERT INTO SalesTransaction (VehicleID, SalespersonID, SaleDate) VALUES
(1, 1, '2023-03-01'),
(2, 2, '2023-03-02'),
(3, 1, '2023-03-03'),
(4, 3, '2023-03-03'),
(5, 2, '2023-03-04'),
(6, 2, '2023-03-04'),
(7, 2, '2024-03-04'),
(8, 3, '2024-03-04'),
(9, 3, '2024-03-04'),
(10, 2, '2024-03-04'),
(11, 1, '2024-03-04'),
(12, 2, '2024-03-04');

-- RUN PREVIEW
.print #######################
.print #### SQL Challenge ####
.print #######################

.print \n Vehicle table
.mode box
select * from Vehicle limit 5;

.print \n Salesperson table
.mode box
select * from Salesperson limit 5;

.print \n SalesTransaction table
.mode box
select * from SalesTransaction limit 5;