USE [NWDbFinalSpring2025]
GO
/****** Object:  StoredProcedure [dbo].[sp_AddProduct]    Script Date: 5/6/2025 10:58:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_AddProduct]
    -- Add the parameters for the stored procedure here
    @ProductCode NVARCHAR(50),
    @ProductName NVARCHAR(100),
    @Description NVARCHAR(MAX) = NULL,
    @CategoryID INT,
    @StandardCost DECIMAL(19, 4),
    @ListPrice DECIMAL(19, 4),
    @ReorderLevel INT = NULL,
    @TargetLevel INT = NULL,
    @Discontinued BIT,
    @SupplierID INT = NULL, -- Assuming SupplierID can be null
    @AvailableQty INT,
    @Reordered BIT = 0, -- Default to false if not supplied
    @ProdImage NVARCHAR(255) = NULL
AS
BEGIN
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON;

    -- Insert statements for procedure here
    INSERT INTO dbo.Products (
        ProductCode,
        ProductName,
        Description,
        CategoryID,
        StandardCost,
        ListPrice,
        ReorderLevel,
        TargetLevel,
        Discontinued,
        SupplierID,
        AvailableQty,
        Reordered,
        ProdImage
    )
    VALUES (
        @ProductCode,
        @ProductName,
        @Description,
        @CategoryID,
        @StandardCost,
        @ListPrice,
        @ReorderLevel,
        @TargetLevel,
        @Discontinued,
        @SupplierID,
        @AvailableQty,
        @Reordered,
        @ProdImage
    );

    -- Optionally, you can return the ProductID of the newly inserted product
    -- SELECT SCOPE_IDENTITY() AS NewProductID;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_DeleteProduct]    Script Date: 5/6/2025 10:58:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_DeleteProduct]
    @ProductID INT
AS
BEGIN
    SET NOCOUNT ON;

    -- Before deleting, you might want to check for related records
    -- in other tables (e.g., OrderItems, ShoppingCart) if you have
    -- foreign key constraints that would prevent deletion or if you
    -- need to handle cascading deletes or set nulls.

    -- For simplicity, this SP directly deletes the product.
    -- Consider adding error handling or checks if the product exists.

    DELETE FROM dbo.Products
    WHERE ProductID = @ProductID;

    -- Optionally, check if any row was affected
    -- IF @@ROWCOUNT = 0
    -- BEGIN
    --     -- Product not found or already deleted, handle as needed
    --     -- RAISERROR('Product with ID %d not found.', 16, 1, @ProductID);
    --     RETURN; -- Or return a status code
    -- END
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetAllProducts]    Script Date: 5/6/2025 10:58:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   proc [dbo].[sp_GetAllProducts]
as
begin
	select * from Products
end;
GO
/****** Object:  StoredProcedure [dbo].[sp_GetProductDetails]    Script Date: 5/6/2025 10:58:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROC [dbo].[sp_GetProductDetails]
@ProductID int
as
begin
	select * from Products
	where @ProductID = ProductID
end;
GO
/****** Object:  StoredProcedure [dbo].[sp_GetProductsByCategory]    Script Date: 5/6/2025 10:58:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROC [dbo].[sp_GetProductsByCategory]
    @CategoryID INT = 0
AS
BEGIN
    SELECT
        *
    FROM dbo.Products AS p
    LEFT JOIN dbo.Category AS c
        ON p.CategoryID = c.CategoryID
    WHERE @CategoryID = 0 OR p.CategoryID = @CategoryID;
END;
GO
/****** Object:  StoredProcedure [dbo].[spAddPurchaseOrderDetail]    Script Date: 5/6/2025 10:58:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create proc [dbo].[spAddPurchaseOrderDetail]
(@PurchaseOrderID int,
@ProductID int,
@Quantity int,
@UnitCost money, -- should be named ListPrice in table
@OrderDetailID int out)

AS
BEGIN
	Insert into PurchaseOrderDetails (PurchaseOrderID, ProductID, Quantity, UnitCost)
	Values (@PurchaseOrderID, @ProductID, @Quantity, @UnitCost);
	
	set @orderDetailID = scope_identity();
END

GO
/****** Object:  StoredProcedure [dbo].[spAddToInventory]    Script Date: 5/6/2025 10:58:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spAddToInventory]
(@prodid int)
AS

BEGIN

	declare @quantity int
	declare @purchaseorderid int

	select @quantity = quantity, @purchaseorderid = purchaseorderid
	from purchaseorderdetails
	where productid = @prodid

	insert into inventorytransactions (productid, quantity, purchaseorderid, comments)
	values (@prodid, @quantity, @purchaseorderid, 'none')
	
	declare @transactionid int = scope_identity()


	update PurchaseOrderDetails
	set postedtoinventory = 1, inventoryid = @transactionid
	where ProductID = @prodid

	update products
	set reordered = 0, availableqty = availableqty + @quantity
	where productid = @prodid




END
GO
/****** Object:  StoredProcedure [dbo].[spAddUserInfoToDB]    Script Date: 5/6/2025 10:58:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[spAddUserInfoToDB]
@UserName nvarchar(50),
@EmpId char(36)
AS

	insert into Employees(EmpId, Username)
	values (@EmpId, @UserName)
GO
/****** Object:  StoredProcedure [dbo].[spCalcFinalPriceForOrderDetail]    Script Date: 5/6/2025 10:58:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[spCalcFinalPriceForOrderDetail]
(@OrderDetailID int)
AS

BEGIN
	Select (quantity * unitcost) 
	from PurchaseOrderDetails
	where OrderDetailID = @OrderDetailID
	
END

GO
/****** Object:  StoredProcedure [dbo].[spCalcOrderTotal]    Script Date: 5/6/2025 10:58:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[spCalcOrderTotal]
(@PurchaseOrderID int)

AS
BEGIN

	select sum(Quantity *  UnitCost) from PurchaseOrderDetails
	where purchaseorderID = @PurchaseOrderID

END

GO
/****** Object:  StoredProcedure [dbo].[spCreatePurchaseOrder]    Script Date: 5/6/2025 10:58:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[spCreatePurchaseOrder]

(@CartID char(36), @EmpID char(36))

AS
BEGIN
	/* Insert a new record into Orders */
	DECLARE @PurchaseOrderID int
	INSERT INTO PurchaseOrders (EmpID) VALUES (@EmpID)
	
	/* Save the new Order ID */
	SET @PurchaseOrderID = scope_identity()
	
	/* Add the order details to OrderDetail */
	INSERT INTO PurchaseOrderDetails
	(PurchaseOrderID, ProductID, ProductName, Quantity, UnitCost)
	
	SELECT
	@PurchaseOrderID, ProductID, ProductName, QuantityToOrder, StandardCost
	FROM ShoppingCart
	WHERE CartID = @CartID

	/* Clear the shopping cart */
	DELETE FROM ShoppingCart
	WHERE CartID = @CartID

	

END



GO
/****** Object:  StoredProcedure [dbo].[spDeletePurchaseOrderDetail]    Script Date: 5/6/2025 10:58:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[spDeletePurchaseOrderDetail]
(@OrderDetailID int)
AS

BEGIN
	Delete from PurchaseOrderDetails
	where OrderDetailID = @OrderDetailID

END

GO
/****** Object:  StoredProcedure [dbo].[spGetAllCategories]    Script Date: 5/6/2025 10:58:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[spGetAllCategories]
as
begin 
	select categoryID, CategoryName
	from category
end

GO
/****** Object:  StoredProcedure [dbo].[spGetEmployeeID]    Script Date: 5/6/2025 10:58:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[spGetEmployeeID]
		@UserName nvarchar(50),
		@EmpID nvarchar output
		AS

			select @EmpID = EmpID from Employees
			where username = @UserName
GO
/****** Object:  StoredProcedure [dbo].[spGetProductsByCategoryID]    Script Date: 5/6/2025 10:58:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[spGetProductsByCategoryID]
( @categoryID int )
as

begin
	select p.productID, name, 
	case 
		when len(description) <= 60 then description
		else SUBSTRING(description, 1, 60) + '...'
	end as description,
	price, thumbnail, image, promofront, promodept
	from products P inner join ProductCategory PC
	on P.productID = PC.ProductID
	where categoryid = @categoryID

end

GO
/****** Object:  StoredProcedure [dbo].[spShoppingCartAdditem]    Script Date: 5/6/2025 10:58:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[spShoppingCartAdditem]
(@cartid char(36),
@prodid int
)
AS

BEGIN

	if Not exists
	(Select Cartid from shoppingcart 
	where cartid=@cartid and productid=@prodid)
	
	begin
			declare @productname nvarchar(100)
			declare @standardcost money
			declare @quantitytoorder int

			Select @productname = productname, @standardcost = standardcost,
			@quantitytoorder = targetlevel - availableqty
			from products 
			where productid = @prodid

			insert into shoppingcart (cartID, ProductID, ProductName, StandardCost, QuantityToOrder)
			values(@cartID, @prodID, @productname, @standardcost, @quantitytoorder)

			Update Products
			set Reordered = 1
			where productid = @prodid
	end

END

GO
/****** Object:  StoredProcedure [dbo].[spShoppingCartAddItem2]    Script Date: 5/6/2025 10:58:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[spShoppingCartAddItem2]
    @cartid CHAR(36),
    @prodid INT
AS
BEGIN
    IF NOT EXISTS (SELECT Cartid FROM shoppingcart WHERE cartid = @cartid AND productid = @prodid)
    BEGIN
        DECLARE @productname NVARCHAR(100);
        DECLARE @standardcost MONEY;
        -- DECLARE @quantitytoorder INT; -- No longer needed to select from products table for quantity

        SELECT @productname = productname, @standardcost = standardcost
        FROM products
        WHERE productid = @prodid;

        -- Set quantity to 1 for a new cart item
        INSERT INTO shoppingcart (cartID, ProductID, ProductName, StandardCost, QuantityToOrder)
        VALUES (@cartID, @prodid, @productname, @standardcost, 1); -- Set QuantityToOrder to 1

        UPDATE Products
        SET Reordered = 1 -- This logic might also need review depending on its purpose
        WHERE productid = @prodid;
    END
    -- ELSE
    -- BEGIN
        -- Optionally, if the item already exists, you could increment the quantity:
        -- UPDATE shoppingcart
        -- SET QuantityToOrder = QuantityToOrder + 1
        -- WHERE cartid = @cartid AND productid = @prodid;
    -- END
END
GO
/****** Object:  StoredProcedure [dbo].[spShoppingCartGetItemCount]    Script Date: 5/6/2025 10:58:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[spShoppingCartGetItemCount]
    @CartID CHAR(36)
AS
BEGIN
    SET NOCOUNT ON;

    SELECT ISNULL(SUM(QuantityToOrder), 0)
    FROM dbo.ShoppingCart
    WHERE CartID = @CartID;
END
GO
/****** Object:  StoredProcedure [dbo].[spShoppingCartGetItems]    Script Date: 5/6/2025 10:58:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spShoppingCartGetItems]
    @CartID CHAR(36)
AS
BEGIN
    SET NOCOUNT ON;

    SELECT
		sc.CartID,
        sc.ProductID,
        sc.ProductName,
        sc.StandardCost, -- Using StandardCost from ShoppingCart table
        sc.QuantityToOrder,
        sc.Subtotal, -- Using the computed Subtotal column from ShoppingCart table
        p.prodimage AS ProductImage
    FROM dbo.ShoppingCart sc
    INNER JOIN dbo.Products p ON sc.ProductID = p.ProductID
    WHERE sc.CartID = @CartID;
END
GO
/****** Object:  StoredProcedure [dbo].[spShoppingCartGetTotal]    Script Date: 5/6/2025 10:58:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spShoppingCartGetTotal]
    @CartID CHAR(36)
AS
BEGIN
    SET NOCOUNT ON;

    SELECT ISNULL(SUM(Subtotal), 0) -- Using the computed Subtotal column from ShoppingCart table
    FROM dbo.ShoppingCart as sc
    WHERE sc.CartID = @CartID;
END
GO
/****** Object:  StoredProcedure [dbo].[spShoppingCartRemoveItem]    Script Date: 5/6/2025 10:58:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[spShoppingCartRemoveItem]
    @CartID CHAR(36),
    @ProductID INT
AS
BEGIN
    SET NOCOUNT ON;

    DELETE FROM dbo.ShoppingCart
    WHERE CartID = @CartID AND ProductID = @ProductID;

    -- Update the Reordered flag on the Products table
    -- Set Reordered to 0 only if this product is not in any other user's cart for reordering.
    -- This might be too simplistic if multiple users can reorder the same product.
    -- For this scenario, we assume an item being removed from cart means it's no longer "marked" for reorder *by this cart*.
    -- If the product is not in any shopping cart (for this specific cart ID or potentially across all carts if logic demands)
    -- then we can reset its Reordered status.
    -- A safer approach for Reordered flag might be to manage it based on actual Purchase Orders or Inventory levels.
    -- For now, we will assume that if a product is removed from the cart, the intention to reorder (via this cart) is removed.
    UPDATE Products
    SET Reordered = 0
    WHERE ProductID = @ProductID
    AND NOT EXISTS (SELECT 1 FROM ShoppingCart sc WHERE sc.ProductID = @ProductID AND sc.CartID = @CartID); -- check if it exists in current cart for other reasons
    -- A more robust logic for `Reordered` flag might be needed depending on overall system design.
    -- The current spShoppingCartAddItem sets it to 1. This SP can set it to 0.
END
GO
/****** Object:  StoredProcedure [dbo].[spShoppingCartUpdateItem]    Script Date: 5/6/2025 10:58:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[spShoppingCartUpdateItem]
    @CartID CHAR(36),
    @ProductID INT,
    @Quantity INT
AS
BEGIN
    SET NOCOUNT ON;

    IF @Quantity > 0
    BEGIN
        UPDATE dbo.ShoppingCart
        SET QuantityToOrder = @Quantity
        WHERE CartID = @CartID AND ProductID = @ProductID;
    END
    ELSE
    BEGIN
        -- If quantity is zero or less, remove the item
        DELETE FROM dbo.ShoppingCart
        WHERE CartID = @CartID AND ProductID = @ProductID;

        -- Optionally, update the Reordered flag on the Products table
        -- if your business logic requires it when an item is removed by zeroing quantity
        -- For now, spShoppingCartRemoveItem handles the Reordered flag explicitly
        -- Consider if setting Reordered to 0 here is appropriate
        -- Update Products set Reordered = 0 where ProductID = @ProductID
        -- AND NOT EXISTS (SELECT 1 FROM ShoppingCart WHERE ProductID = @ProductID AND CartID = @CartID)
    END
END
GO
