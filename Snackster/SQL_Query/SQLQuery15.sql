Create Procedure Dashboard
@Action varchar(20) = null
as
BEGIN 

SET NOCOUNT ON;
  IF @Action='CATEGORY'
  BEGIN
    SELECT COUNT(*) FROM dbo.Categories
	END


	IF @Action='PRODUCT'
	BEGIN
	SELECT COUNT(*) FROM dbo.Products
	END


	IF @Action='ORDER'
	BEGIN
	SELECT COUNT(*) FROM dbo.Orders
	END


	IF @Action='DELIVERED'
	BEGIN
	SELECT COUNT(*) FROM dbo.Orders
	where status = 'Delivered'
	END

	IF @Action='PENDING'
	BEGIN
	SELECT COUNT(*) FROM dbo.Orders
	where Status IN('Pending','Dispatched')
	END

	IF @Action='USER'
	BEGIN
	SELECT COUNT(*) FROM dbo.Users
	END

	IF @Action='CONTACT'
	BEGIN
	SELECT COUNT(*) FROM dbo.Contact
	END

	IF @Action='SOLDAMOUNT'
	BEGIN
	 SELECT SUM(o.Quantity * p.Price) FROM Orders o
	 INNER JOIN Products p ON p.ProductId = o.ProductId
	END
END

