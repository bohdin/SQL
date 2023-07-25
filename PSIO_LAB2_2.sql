
select two.ProductName, two.CategoryName, two.TotalQuantity
from (SELECT stor.ProductID, stor.ProductName, stor.CategoryName, stor.TotalQuantity, new.[Shipper name], new.[Supplier name]
	  FROM (OrderDetails  od 
	  INNER JOIN (
		SELECT pod.SupplierContractID, ship.CompanyName as [Shipper name], sup.CompanyName as [Supplier name]
		FROM PaymentOrderDetails pod
		INNER JOIN Shipper ship ON pod.ShipperID = ship.ShipperID
		INNER JOIN Supplier sup ON pod.SupplierID = sup.SupplierID
		WHERE ship.CompanyName LIKE 'S%' AND sup.CompanyName LIKE 'F%'
	  ) as new ON od.SupplierContractID = new.SupplierContractID)
			INNER JOIN (
			SELECT st.ProductID, st.ProductName, c.CategoryName, st.TotalQuantity
			FROM Storage st 
			INNER JOIN Category c ON st.CategoryID = c.CategoryID
			WHERE st.TotalQuantity > 20 AND c.CategoryName LIKE 'D%'
			) as stor ON od.ProductID = stor.ProductID) one

full JOIN 
(SELECT st.ProductID, st.ProductName, c.CategoryName, st.TotalQuantity
FROM Storage st 
JOIN Category c ON st.CategoryID = c.CategoryID
WHERE st.TotalQuantity > 20) two on one.ProductID = two.ProductID
