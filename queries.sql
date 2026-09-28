-- 1. Sipariş sayısı
SELECT COUNT(*) AS OrderCount FROM Orders;
-- 2. Müşteri başına sipariş
SELECT CustomerId, COUNT(*) AS OrderCount FROM Orders GROUP BY CustomerId;
-- 3. Kategori başına ürün
SELECT Category, COUNT(*) AS ProductCount FROM Products GROUP BY Category;
-- 4. Kategori başına ortalama fiyat
SELECT Category, AVG(Price) AS AveragePrice FROM Products GROUP BY Category;
-- 5. En düşük ve yüksek fiyat
SELECT MIN(Price) AS Lowest, MAX(Price) AS Highest FROM Products;
-- 6. Ürün başına satılan adet
SELECT ProductId, SUM(Quantity) AS Units FROM OrderItems GROUP BY ProductId;
-- 7. Müşteri başına satış tutarı
SELECT c.Name, SUM(oi.Quantity * p.Price) AS Sales FROM Customers c JOIN Orders o ON o.CustomerId = c.Id JOIN OrderItems oi ON oi.OrderId = o.Id JOIN Products p ON p.Id = oi.ProductId GROUP BY c.Name;
-- 8. Aylık toplam satış
SELECT YEAR(o.OrderDate) AS SalesYear, MONTH(o.OrderDate) AS SalesMonth, SUM(oi.Quantity * p.Price) AS Sales FROM Orders o JOIN OrderItems oi ON oi.OrderId = o.Id JOIN Products p ON p.Id = oi.ProductId GROUP BY YEAR(o.OrderDate), MONTH(o.OrderDate);
