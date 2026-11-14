USE Northwind;
GO

DROP VIEW IF EXISTS CustomerOrders
GO

CREATE VIEW CustomerOrders 
AS
SELECT c.CustomerId
    , c.CompanyName
    , c.ContactName
    , c.City
    , c.Region AS [State]
    , c.PostalCode as Zip
    , c.Country
    , o.OrderId
    , o.OrderDate
    , cat.CategoryId
    , cat.CategoryName
    , od.ProductId
    , p.ProductName
    , p.UnitPrice as ListPrice
    , od.UnitPrice as SalesPrice
    , od.Quantity
    , od.Discount
FROM Customers as c
INNER JOIN Orders as o
    ON c.CustomerId = o.CustomerId
INNER JOIN OrderDetails od
    ON o.OrderId = od.OrderId
INNER JOIN Products as p
    ON od.ProductId = p.ProductId
INNER JOIN Categories as cat
    ON p.CategoryId = cat.CategoryId
