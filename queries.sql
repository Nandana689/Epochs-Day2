SELECT
    p.ProductName,
    SUM(od.Quantity) AS TotalSold
FROM Products p
JOIN "Order Details" od
    ON p.ProductID = od.ProductID
GROUP BY p.ProductID, p.ProductName
ORDER BY TotalSold DESC
LIMIT 10;

SELECT
    c.CompanyName,
    ROUND(SUM(od.UnitPrice * od.Quantity * (1 - od.Discount)), 2) AS TotalRevenue
FROM Customers c
JOIN Orders o
    ON c.CustomerID = o.CustomerID
JOIN "Order Details" od
    ON o.OrderID = od.OrderID
GROUP BY c.CustomerID, c.CompanyName
ORDER BY TotalRevenue DESC
LIMIT 10;

SELECT
    strftime('%Y-%m', o.OrderDate) AS Month,
    ROUND(SUM(od.UnitPrice * od.Quantity * (1 - od.Discount)), 2) AS MonthlySales
FROM Orders o
JOIN "Order Details" od
    ON o.OrderID = od.OrderID
GROUP BY strftime('%Y-%m', o.OrderDate)
ORDER BY Month;

SELECT
    c.CategoryName,
    ROUND(SUM(od.UnitPrice * od.Quantity * (1 - od.Discount)), 2) AS TotalSales
FROM Categories c
JOIN Products p
    ON c.CategoryID = p.CategoryID
JOIN "Order Details" od
    ON p.ProductID = od.ProductID
GROUP BY c.CategoryID, c.CategoryName
ORDER BY TotalSales DESC;

SELECT
    c.CompanyName,
    COUNT(o.OrderID) AS TotalOrders
FROM Customers c
JOIN Orders o
    ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID, c.CompanyName
ORDER BY TotalOrders DESC;

