USE AdventureWorksLT2022;
GO

CREATE OR ALTER VIEW SalesLT.CustomerAndAddress
AS
SELECT c.CustomerID,
      c.NameStyle,
      c.Title,
      c.FirstName,
      c.MiddleName,
      c.LastName,
      c.Suffix,
      c.CompanyName,
      c.SalesPerson,
      c.EmailAddress,
      c.Phone,
	  a.AddressID,
      a.AddressLine1,
      a.AddressLine2,
      a.City,
      a.StateProvince,
      a.CountryRegion,
      a.PostalCode
FROM SalesLT.Customer AS c
INNER JOIN SalesLT.CustomerAddress AS ca
	ON ca.CustomerID = c.CustomerID
INNER JOIN SalesLT.Address AS a
	ON a.AddressID = ca.AddressID
GO


CREATE OR ALTER VIEW SalesLT.ProductsAndCategories
AS
SELECT p.ProductID,
       p.Name AS ProductName,
	   c.ProductCategoryID,
       c.Name AS Category,
       c.ParentProductCategoryID,
	   pc.Name AS ParentCategory,	   
       p.ProductNumber,
       p.Color,
       p.StandardCost,
       p.ListPrice,
       p.Size,
       p.Weight,
       p.ProductModelID,
       p.SellStartDate,
       p.SellEndDate,
       p.DiscontinuedDate,
       p.ThumbNailPhoto,
       p.ThumbnailPhotoFileName
FROM SalesLT.ProductCategory AS c
INNER JOIN SalesLT.ProductCategory AS pc
	ON c.ParentProductCategoryID = pc.ProductCategoryID
INNER JOIN SalesLT.Product AS p
	ON p.ProductCategoryID = c.ProductCategoryID
GO


CREATE OR ALTER VIEW SalesLT.CustomerOrders
AS
SELECT c.CustomerID,
       c.NameStyle,
       c.Title,
       c.FirstName,
       c.MiddleName,
       c.LastName,
       c.Suffix,
       c.CompanyName,
       c.SalesPerson,
       c.EmailAddress,
       c.Phone,
       c.AddressID,
       c.AddressLine1,
       c.AddressLine2,
       c.City,
       c.StateProvince,
       c.CountryRegion,
       c.PostalCode,
	   soh.SalesOrderID,
       soh.OrderDate,
       soh.DueDate,
       soh.ShipDate,
       sod.SalesOrderDetailID,
       sod.OrderQty,
       sod.UnitPrice AS SalesPrice,
       sod.UnitPriceDiscount AS SalesPriceDiscount,
       sod.LineTotal,
	   pc.ProductID,
       pc.ProductName,
       pc.ProductCategoryID,
       pc.Category,
       pc.ParentProductCategoryID,
       pc.ParentCategory,
       pc.ProductNumber,
       pc.Color,
       pc.Size,
       pc.Weight,
       pc.ProductModelID
FROM SalesLT.CustomerAndAddress AS c
INNER JOIN SalesLT.SalesOrderHeader AS soh
	ON soh.CustomerID = c.CustomerID
INNER JOIN SalesLT.SalesOrderDetail AS sod
	ON sod.SalesOrderID = soh.SalesOrderID
INNER JOIN SalesLT.ProductsAndCategories AS pc
	ON pc.ProductID = sod.ProductID
GO

