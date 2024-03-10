USE AdventureWorks2019;
GO

CREATE OR ALTER VIEW [vw_DIM|Product]
AS
SELECT P.[ProductID]
      ,P.[Name] AS [Product]
      ,P.[Color]
      ,P.[StandardCost]
      ,P.[ListPrice]
      ,P.[Size]
      ,P.[Weight]
      ,P.[ProductLine]
      ,P.[Class]
      ,P.[Style]
      ,P.[ProductSubcategoryID]
	  ,P.MakeFlag --
	  ,P.FinishedGoodsFlag --
	  ,P.SafetyStockLevel --
	  ,P.ReorderPoint --
	  ,P.DaysToManufacture --
	  ,PSC.[Name] [ProductSubCategory]
	  ,PC.ProductCategoryID
	  ,PC.[Name] [ProductCategory]
	  ,SUM(pi.Quantity) AS [Stock Quantity]
  FROM [Production].[Product] P
  LEFT JOIN [Production].[ProductSubcategory] PSC
  ON P.ProductSubcategoryID = PSC.ProductSubcategoryID
  LEFT JOIN [Production].[ProductCategory] PC
  ON PSC.ProductCategoryID = PC.ProductCategoryID
  LEFT JOIN Production.ProductInventory PI
  ON P.ProductID = PI.ProductID
  GROUP BY p.ProductID
	,P.[Name]
      ,P.[Color]
      ,P.[StandardCost]
      ,P.[ListPrice]
      ,P.[Size]
      ,P.[Weight]
      ,P.[ProductLine]
      ,P.[Class]
      ,P.[Style]
      ,P.[ProductSubcategoryID]
	  ,P.MakeFlag --
	  ,P.FinishedGoodsFlag --
	  ,P.SafetyStockLevel --
	  ,P.ReorderPoint --
	  ,P.DaysToManufacture --
	  ,PSC.[Name]
	  ,PC.ProductCategoryID
	  ,PC.[Name]

GO
  SELECT * FROM [vw_DIM|Product]
  WHERE productID = 1