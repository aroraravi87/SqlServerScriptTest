SELECT  1 AS TAG,NULL AS PARENT
,NULL AS[Customers!1]
,c.CustomerID AS[Customer!2!CustomerID]
,NULL AS [Orders!3]
,NULL AS[CustomersDetails!4]
,NULL AS[CustomersDetails!4!Address!ELEMENT]
,NULL AS[CustomersDetails!4!CompanyName!ELEMENT]
,NULL AS [Order!5!OrderID],
NULL AS [Order!5!Name!ELEMENT],
NULL AS [Order!5!Frieght!ELEMENT]
FROM Customers c INNER JOIN Orders o
ON o.CustomerID=c.CustomerID
UNION
SELECT  2 AS TAG,1 AS PARENT
,NULL
,c.CustomerID 
,NULL
,NULL
,NULL
,NULL
,NULL
,NULL
,NULL
FROM Customers c INNER JOIN Orders o
ON c.CustomerID=o.CustomerID
UNION
SELECT  3 AS TAG,2 AS PARENT
,NULL
,c.CustomerID 
,NULL
,NULL
,NULL
,NULL
,NULL
,NULL
,NULL
FROM Customers c INNER JOIN Orders o
ON c.CustomerID=o.CustomerID
UNION
SELECT  4 AS TAG,2 AS PARENT
,NULL 
,c.CustomerID 
,NULL
,NULL
,c.[Address]
,c.[CompanyName]
,NULL
,NULL
,NULL
FROM Customers c INNER JOIN Orders o
ON c.CustomerID=o.CustomerID 

UNION
SELECT  5 AS TAG,3 AS PARENT
,NULL
,c.CustomerID 
,NULL
,NULL
,NULL
,NULL
,o.OrderID
,o.ShipName
,o.Freight
FROM Customers c INNER JOIN Orders o
ON c.CustomerID=o.CustomerID


ORDER BY [Customers!1],[Customer!2!CustomerID],[Orders!3],[CustomersDetails!4],[CustomersDetails!4!Address!ELEMENT],[CustomersDetails!4!CompanyName!ELEMENT],[Order!5!Name!ELEMENT],[Order!5!Frieght!ELEMENT]
FOR XML EXPLICIT