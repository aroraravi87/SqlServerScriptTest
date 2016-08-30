WITH CTE
AS
(SELECT o.CustomerID,p.ProductName,od.Quantity,o.ShipCountry,(od.Quantity*od.UnitPrice) AS COST FROM orders o
INNER JOIN [Order Details] od
ON o.OrderID=od.OrderID
INNER JOIN Products p
on od.ProductID=p.ProductID
), CTE2 AS
--Select * FROM CTE t
--=================================


(SELECT pvt.ShipCountry
,pvt.Tofu
,pvt.[Queso Cabrales]
,pvt.Chang
,pvt.Ikura
,(ISNULL(SUM(pvt.Tofu),0)+ISNULL(SUM(pvt.[Queso Cabrales]),0)+ISNULL(SUM(pvt.Chang),0)+ISNULL(Sum(pvt.Ikura),0)) AS TOTAL
FROM 

(Select t.ShipCountry,t.ProductName,t.COST AS COST
FROM CTE t) as dt
PIVOT
(
SUM(COST)
FOR ProductName IN ([Queso Cabrales],Tofu,Chang,Ikura)
) as pvt
GROUP BY 
pvt.ShipCountry
,pvt.Tofu
,pvt.[Queso Cabrales]
,pvt.Chang
,pvt.Ikura) 

SELECT t.ShipCountry,ISNULL(t.Tofu,0) AS Tofu ,ISNULL(t.[Queso Cabrales],0) AS [Queso Cabrales],ISNULL(t.Chang,0) AS Chang,ISNULL(t.Ikura,0) AS Ikura,t.TOTAL FROM CTE2 t
UNION ALL
SELECT 'G.Totals' AS GrandTotal,SUM(GT.Tofu) AS Tofu,SUM(GT.[Queso Cabrales]) AS [Queso Cabrales],SUM(GT.Chang) AS Chang,SUM(GT.Ikura) AS Ikura,SUM(GT.TOTAL) AS TOTAL
FROM
(
SELECT ISNULL(t.Tofu,0) AS Tofu ,ISNULL(t.[Queso Cabrales],0) AS [Queso Cabrales],ISNULL(t.Chang,0) AS Chang,ISNULL(t.Ikura,0) AS Ikura,ISNULL(t.TOTAL,0) AS TOTAL FROM CTE2 t 
) GT

