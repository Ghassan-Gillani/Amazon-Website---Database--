use amazonfinal

--=============================================================================================================
GO
create view SellersList
as
select users.ID, users.[Name], users.Email, users.[Password], users.[Address], users.City, Users.Country, Sellers.SellerAmount 
from users inner join sellers on users.id = sellers.sellerid
--=============================================================================================================
GO
create view AdminList
as
select users.ID, users.[Name], users.Email, users.[Password], users.[Address], users.City, Users.Country from users inner join [admin] on users.id = [admin].id
--=============================================================================================================
GO
create view BuyersList
as
select users.ID, users.[Name], users.Email, users.[Password], users.[Address], users.City, Users.Country, buyers.BuyerAmount 
from users inner join buyers on users.id = buyers.buyerid
--=============================================================================================================
GO
create view LoginDetails
as
select ID as UserID, Email, [Password] from users  
--=============================================================================================================
GO
create view ProductsList
as
select products.ProductID, products.SellerID, users.[Name] as SellerName, categories.CategoryID, categories.CategoryName, products.ProductName, products.Price ,products.Stock, products.[Date] as DateAdded
from products inner join categories on products.categoryid = categories.categoryid
inner join users on products.sellerID = users.ID
--=============================================================================================================
GO
create view OrderDetails
as
select orders.[Date], Orders.OrderNo, orders.BuyerID, buyerslist.[Name] as BuyersName, products.SellerID, sellerslist.[name] as SellersName, orders.ProductID, products.ProductName, products.Price as [PriceOfItem], orders.Quantity , (Price * quantity) as TotalAmount
from orders inner join products on products.productid = orders.productid
inner join buyerslist on orders.buyerid = buyerslist.id
inner join sellerslist on products.sellerid = sellerslist.id
--=============================================================================================================
GO
create view ListRatings
as
select ratings.ProductID, products.SellerID, products.ProductName, ratings.BuyerID, ratings.Rating from ratings
inner join products on ratings.ProductID = products.ProductID
--=============================================================================================================
GO
create view AverageProductRatings
as
select ratings.ProductID, products.SellerID, products.ProductName, avg(ratings.Rating) as AverageRating from ratings inner join products on ratings.productid = products.productID 
group by ratings.ProductID, products.ProductName, products.SellerID
--=============================================================================================================
GO
create view PopularItems as
select top 2 productid,count(productID) as sales from orderdetails group by productid order by count(productid) desc
--=============================================================================================================
GO
create view CategoriesList
as
select categories.CategoryID,categories.CategoryName, count(isnull(products.ProductID,0)) as NumberOfProducts from products left join categories on products.CategoryID = Categories.CategoryID
group by Categories.CategoryID, Categories.CategoryName
--=============================================================================================================
GO
create view CategoryInterest
as
select distinct Email,categoryname from orderdetails inner join ProductsList on OrderDetails.ProductID = ProductsList.ProductID
inner join buyerslist on BuyersList.id = OrderDetails.buyerid
go
--=============================================================================================================

select * from sellerslist
select * from buyerslist
select * from adminlist
select * from logindetails
select * from productslist
select * from OrderDetails
select * from listratings
select * from AverageProductRatings
select * from PopularItems
select * from CategoriesList
select * from CategoryInterest
--=============================================================================================================
GO