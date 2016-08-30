

DECLARE @cols NVARCHAR(MAX), @Query NVARCHAR(MAX)

;WITH CTE (ShipCountry,ProductName,Quantity,Total)
AS
(

SELECT ISNULL(o.ShipCountry,'xTotals') AS ShipCountry ,p.ProductName,SUM(od.Quantity) AS Quantity,SUM(od.Quantity*od.UnitPrice) AS Total  FROM orders o
INNER JOIN [Order Details] od
ON o.OrderID=od.OrderID
INNER JOIN Products p
on od.ProductID=p.ProductID
GROUP BY ROLLUP(p.ProductName,o.ShipCountry)
)

SELECT @cols = STUFF((SELECT DISTINCT  ',' + QUOTENAME(t.ShipCountry) 
            FROM CTE t
            FOR XML PATH(''), TYPE
            ).value('.', 'NVARCHAR(MAX)') 
        ,1,1,'')

--PRINT @cols

SET @Query='SELECT pvt.ProductName,' + @cols + ' FROM 

(Select t.ShipCountry,t.ProductName,t.Total AS COST
FROM CTE t) as dt
PIVOT
(
SUM(COST)
FOR ShipCountry IN ('+@cols+')
) as pvt'

EXEC sp_executesql  @Query





