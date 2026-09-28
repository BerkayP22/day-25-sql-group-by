-- SQL Server için örnek veri
CREATE TABLE Customers (Id int PRIMARY KEY, Name nvarchar(50) NOT NULL);
CREATE TABLE Products (Id int PRIMARY KEY, Name nvarchar(50) NOT NULL, Category nvarchar(50) NOT NULL, Price decimal(10,2) NOT NULL);
CREATE TABLE Orders (Id int PRIMARY KEY, CustomerId int NOT NULL REFERENCES Customers(Id), OrderDate date NOT NULL);
CREATE TABLE OrderItems (OrderId int NOT NULL REFERENCES Orders(Id), ProductId int NOT NULL REFERENCES Products(Id), Quantity int NOT NULL, PRIMARY KEY (OrderId, ProductId));
INSERT INTO Customers VALUES (1, N'Ayşe'), (2, N'Berkay'), (3, N'Deniz');
INSERT INTO Products VALUES (1, N'Defter', N'Kırtasiye', 40), (2, N'Kalem', N'Kırtasiye', 12), (3, N'Kupa', N'Ev', 65);
INSERT INTO Orders VALUES (1, 1, '2026-09-01'), (2, 2, '2026-09-02'), (3, 1, '2026-10-01');
INSERT INTO OrderItems VALUES (1, 1, 2), (1, 2, 1), (2, 3, 1), (3, 2, 3);
