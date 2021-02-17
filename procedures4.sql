use amazonfinal
--=============================================================================================================
GO
create procedure logincheck
@emaill varchar(30), @passwordd varchar(30),
@out  int output
as 
begin
	set identity_insert users on
	set @out=-1

	if exists (select * from Users where Email=@emaill)
	begin	set @out=0   end

	if exists (select * from buyerslist where buyerslist.Email=@emaill and buyerslist.[Password]=@passwordd)
	BEGIN 
		set @out=1
		print 'buyers view'
	END
	if exists (select * from sellerslist where sellerslist.Email=@emaill and sellerslist.[Password]=@passwordd)
	BEGIN 
		set @out=2
		print 'sellers view'
	END
	if exists (select * from adminlist where adminlist.Email=@emaill and adminlist.[Password]=@passwordd)
	BEGIN 
		set @out=3
		print 'admins view'
	END	

	if @out=-1
	begin print 'user not found' end
	else if @out=0
	begin print 'incorrect password'   end
	set identity_insert users off
end

--GO
--declare @output1 int
--execute logincheck
--@emaill='sabaabbas23@gmail.com',
--@passwordd='Hiimba',
--@out=@output1 output
--select @output1 as existornot

--=============================================================================================================
GO
create procedure signup
@email varchar(25),@password varchar(30), @name varchar(30), @address varchar (max),
@city varchar (20), @country varchar (20), @usertype int,
@out  int output
as 
begin --1
	if(@usertype=3)
		begin set @out=3 print 'guest view'end
	
	ELSE BEGIN --2

	set @out=-1
	if exists (select * from users where users.Email=@email)
	BEGIN 
		set @out=1 --already signed up user
	END
	else 
	begin --3
		--SET IDENTITY_INSERT users ON
		insert into users([Name],[Address], City, Country, Email, [Password])
		    values(@name, @address, @city, @country, @email, @password)
		--SET IDENTITY_INSERT users Off
		set @out=2

		if @usertype=0
		begin
				declare @idd int
				set @idd = (select id from users where Email=@email)
				 insert into buyers values(@idd,100) 
	    end
		if @usertype=1
		begin
				declare @id2 int
				set @id2 = (select id from users where Email=@email)
				 insert into sellers values(@id2,100) 
	    end
	end --3
	if @out=1
	begin print 'User already exists. You need to login' end
	if @out=2
	begin print 'successfully signed up. welcome to your profile' end
	if @out=-1
	begin print 'unsuccessful signup. Try Again' end
	if @out=3
	begin print 'Continue to Guest Mode without signing up' end
	
	END --2
end --1

--GO
--declare @output1 int
--execute signup
--@email='archibald@gmail.com',
--@password='nate',
--@name='nate archibald',
--@address='new york',
--@city='ny',
--@country='us',
--@usertype=1,
--@out=@output1 output
--select @output1 as existornot

--=============================================================================================================
GO
create procedure showpopular
as
begin    
	 select p.ProductID, p.ProductName,C.CategoryName, p.SellerID, p.Price ,pop.Sales,
	 p.[Date] as DateAdded, p.Stock, isnull(avg(rating),0) as Rating
	 from products P inner join popularitems Pop on Pop.ProductID=P.ProductID 
	 inner join categories C on p.categoryid=C.categoryID left join Ratings on P.ProductID = Ratings.ProductID
	 where p.Stock>0					
	 group by p.ProductID, p.ProductName,C.CategoryName, p.SellerID, p.Price ,pop.Sales,
	 p.[Date], p.Stock
end
--GO
--execute showpopular

--=============================================================================================================
GO
create procedure searchbycategory
@cat varchar(25)
as
begin
	select SellerName, ProductName, ProductsList.ProductID, SellerID, Price, ProductsList.Stock, isnull(avg(rating),0) as Rating from productslist left join Ratings on ProductsList.ProductID = Ratings.ProductID
	where productslist.categoryname = @cat and  ProductsList.stock>0
	group by SellerName, ProductName, price,ProductsList.ProductID, SellerID,ProductsList.Stock  
end
--GO
--execute searchbycategory
--@cat="Electronics"

--=============================================================================================================
GO
create procedure searchbyname
@name varchar(25)
as
begin
	select productslist.ProductID, SellerID, SellerName, ProductName, Price,Stock, isnull(avg(rating),0) as Rating from productslist left join Ratings on ProductsList.ProductID = Ratings.ProductID
	where productslist.ProductName like ( '%'+@name + '%') and Stock>0
	group by SellerName, ProductName, price, ProductsList.ProductID, ProductsList.SellerID, Stock 
end

--=============================================================================================================
GO
create PROCEDURE [UpdateBuyersInfo]
@id int,
@NewName varchar(30),
@NewAddress varchar(50),
@NewCity varchar(30),
@NewCountry varchar(10),
@NewPassword varchar(30),
@NewAmount int
as
begin
	Update Users
	Set [Name]=@NewName, [Address]=@NewAddress,City=@NewCity, Country = @NewCountry,[Password]=@NewPassword
	where ID=@id

	update Buyers
	set BuyerAmount=@NewAmount
	where buyerid = @id
end

--=============================================================================================================
GO
create PROCEDURE [UpdateSellersInfo]
@id int,
@NewName varchar(30),
@NewAddress varchar(50),
@NewCity varchar(30),
@NewCountry varchar(10),
@NewPassword varchar(30),
@NewAmount int
as
begin
	Update Users
	Set [Name]=@NewName, [Address]=@NewAddress,City=@NewCity, Country = @NewCountry,[Password]=@NewPassword
	where ID=@id

	update Sellers
	set SellerAmount=@NewAmount
	where sellerid = @id
end

--=============================================================================================================
GO
create procedure BuyerDelete
@id int
as
begin
	delete from buyers where buyerid = @id
	delete from users where id = @id
end

--=============================================================================================================
GO
create procedure SellerDelete
@id int
as
begin
	delete from sellers where sellerid = @id
	delete from users where id = @id
end

--=============================================================================================================
GO
create procedure addadmin
@email varchar(25),@password varchar(30), @name varchar(30), @address varchar (max),
@city varchar (20), @country varchar (20),
@out int output
as 
begin --
	set @out=-1
	if exists (select * from users where users.Email=@email)
	BEGIN 
		set @out=1 --already signed up user
	END
	else 
	begin --3
		--SET IDENTITY_INSERT users ON
		insert into users([Name],[Address], City, Country, Email, [Password])
		    values(@name, @address, @city, @country, @email, @password)
		set @out=2
		declare @id2 int
		set @id2 = (select id from users where Email=@email)
		insert into admin values(@id2)
		--SET IDENTITY_INSERT users Off
	if @out=1
	begin print 'User already exists. You need to login' end
	if @out=2
	begin print 'Successfully signed up' end
	if @out=-1
	begin print 'Unsuccessful signup. Try Again' end
	
	END --2
end --1

--=============================================================================================================
GO
create procedure ProductDelete
@id int
as
begin
	delete from Products where productid = @id
end

--=============================================================================================================
GO
create PROCEDURE [ProductUpdate]
@id int,
@NewName varchar(30),
@price int,
@stock int
as
begin
	Update Products
	Set [ProductName]=@NewName, [Price]=@price, [Stock]=@stock
	where ProductID=@id
end

--=============================================================================================================
GO
create PROCEDURE [CategoryUpdate]
@id int,
@NewName varchar(30)
as
begin
	if not exists(select * from categories where CategoryName=@NewName)
	begin
		Update Categories
		Set [CategoryName]=@NewName
		where categoryID=@id
	end
end

--=============================================================================================================
GO
create PROCEDURE [AddCategory]
@id int,
@Name varchar(30),
@out int output
as
begin
	if exists (select CategoryID from Categories where CategoryName=@Name)
	begin
		 set @out=-1
	print 'This category already exists'
	end
	else
	begin
			insert into Categories values ( @id,@Name)
			set @out=1
			print 'Added Successfully'
	end
end

declare @o int
execute [AddCategory]
@id=2, @name='Cosmetics',
@out=@o output
select @o
	
--=============================================================================================================
GO
create procedure RatingDelete
@prodid int, @bid int
as
begin
	delete from ratings where productid = @prodid and buyerid = @bid
end

--=============================================================================================================
GO
create procedure GetAdminDetails
@emailid varchar(30)
as
begin
	select * from Adminlist where Email=@emailid
end

--=============================================================================================================
GO
create PROCEDURE [UpdateAdminInfo]
@id int,
@NewName varchar(30),
@NewAddress varchar(50),
@NewCity varchar(30),
@NewCountry varchar(10),
@NewPassword varchar(30)
as
begin
	Update Users
	Set [Name]=@NewName, [Address]=@NewAddress,City=@NewCity, Country = @NewCountry,[Password]=@NewPassword
	where ID=@id
end

--=============================================================================================================
GO
create procedure addProduct
@pname varchar(30),
@email varchar(30),
@price int,
@Stock int,
@catName varchar(30),
@out int output
as 
begin
		declare @cid int
		set @cid = (select categoryID from Categories where categoryname = @catname)
		declare @sid int
		set @sid = (select ID from SellersList where email = @email)
	if exists (select * from Sellers where @sid=SellerID) -- measn userid is of seller do the work
	begin
	set @out=1
	  --set identity_insert Products on
	  insert into Products (SellerID,ProductName,CategoryID,Price,Date,Stock) values (@sid,@pname,@cid,@price,getdate(),@Stock)
	  print 'prouduct added successfully '
	end
	else  
	begin
	print 'You are not a seller'
	set @out=-1
	--set identity_insert Products off

	end
end

--go
--declare @output int
--execute  addProduct
--@pname ='GossipGirl',
--@email = 'archibald@gmail.com',
--@catname = 'electronics',
--@price =1000,
--@Stock =3,
--@out = @output output
--select @output

--=============================================================================================================
GO
create procedure SellersOrderList
@Email varchar(30)
as
begin
declare @uid int
set @uid= (select ID from Users where Email=@Email)

select Products.ProductName,Products.ProductID,BuyerID,Quantity,Orders.[Date]
from Orders inner join Products on  Products.ProductID =Orders.ProductID
inner join Sellers on Sellers.SellerID=Products.SellerID
inner join Users on  Sellers.SellerID=Users.ID
where Sellers.SellerID=@uid
end

--go
--execute SellersOrderList
--@Email='jiyasheikh@gmail.com'
--go

--=============================================================================================================
GO
Create procedure BuyProduct
@pid int,
@quantity int,
@email varchar(30),
@out int output
as
begin

	if exists (select * from Products where ProductID=@pid)
	begin
		declare @sid int,
		@price int
		select @sid=SellerID from Products where ProductID=@pid
		select @price=Price from Products where ProductID=@pid
		if exists  (select Stock from Products where ProductID=@pid and Stock < @quantity)
		begin
			set @out=-1
			print 'Your required quantity is more than available stock'
		end
		else
		begin
			if exists(select * from BuyersList where Email=@email and BuyerAmount < (@quantity * @price))
			begin
				set @out=-2
				print 'You do not have enough balance to purchase this product'
			end
			else
				begin
					set @out=1
					declare @uid int
					set @uid= (select ID from BuyersList where email=@email)
					insert into Orders (ProductID,Quantity,BuyerID,[Date]) values (@pid,@quantity,@uid,getdate())
					update Sellers set SellerAmount=SellerAmount+(@quantity * @price) where SellerID=@sid
					update Buyers set BuyerAmount=BuyerAmount-(@quantity * @price) where BuyerID=@uid
					update Products set Stock=Stock-@quantity where ProductID=@pid
					print 'product bought successfuly'
				end
		end
	end
	else
		begin
			set @out=-3
		print 'This product does not exist'
	end
end


--go
--declare @myOut int
--execute BuyProduct
--@email='nehaakram12@gmail.com',
--@pid=8,
--@quantity =1,
--@out=@myOut Output
--Select @myOut

--=============================================================================================================
GO
create procedure sendordernotificationbuyer
@productname varchar(max),
@buyeremail varchar(max),
@quantity int,
@amount int
AS
BEGIN
begin
declare @bodycontent varchar(max)
set @bodycontent = 'Dear User, you have bought: ' + cast(@quantity as varchar(max)) + ' ' + @productname +'(s). Rs ' + cast(@amount as varchar(max)) +  ' have been deducted from your account. Please visit MyAmazon to find more exciting deals'
EXEC msdb..sp_send_dbmail
@recipients=@buyeremail,
@subject='Product Purchased',
@body=@bodycontent
end
END

--=============================================================================================================
GO
create procedure sendordernotificationseller
@productname varchar(max),
@selleremail varchar(max),
@quantity int,
@amount int
as
begin
declare @bodycontent varchar(max)
set @bodycontent = 'Dear User, a buyer has bought: ' + cast(@quantity as varchar(max)) + ' ' + @productname +'(s) from you. Rs ' + cast(@amount as varchar(max)) +  ' have been deposited to your account. Please visit MyAmazon for more details on your orders'
EXEC msdb..sp_send_dbmail
@recipients=@selleremail,
@subject='Product Sold',
@body=@bodycontent
end

--=============================================================================================================
GO
create trigger ordernotification
on orders
after insert
as
begin
declare 
@pname varchar(max),
@semail varchar(max),
@bemail varchar(max),
@pid int,
@pquantity int,
@pamount int
	set @pname = (select productname from inserted inner join products on inserted.productid = products.ProductID )
	set @pid = (select distinct productid from inserted)
	set @semail = (select distinct email from productslist inner join sellerslist on productslist.sellerid = SellersList.id where productid = @pid)
	set @bemail = (select distinct email from inserted inner join buyerslist on inserted.buyerid = buyersList.id where productid = @pid)
	set @pquantity = (select quantity from inserted)
	set @pamount = (select totalamount from inserted inner join orderdetails on inserted.orderno = orderdetails.orderno)

	execute sendordernotificationbuyer
	@productname = @pname,
	@buyeremail = @bemail,
	@quantity = @pquantity,
	@amount = @pamount

	execute sendordernotificationseller
	@productname = @pname,
	@selleremail = @semail,
	@quantity = @pquantity,
	@amount = @pamount
end
--=============================================================================================================
GO
create procedure BuyerOrders
@email varchar(max)
as
declare @id int
set @id = (select id from users where email = @email)
begin
select [Date],OrderDetails.OrderNo,orderdetails.ProductID,orderdetails.BuyerID,OrderDetails.ProductName,OrderDetails.SellerID,OrderDetails.SellersName, OrderDetails.Quantity, OrderDetails.PriceOfItem,OrderDetails.TotalAmount, coalesce(cast(ratings.Rating as varchar(max)),'Not rated') as Rating
from orderdetails 
left join ratings on OrderDetails.ProductID = Ratings.ProductID and OrderDetails.BuyerID = Ratings.BuyerID 
where orderdetails.buyerid = @id
end
--=============================================================================================================
go
create procedure AddRating
@pid int,
@bid int,
@rating int,
@out int output
as
begin
	if @rating > 5 or @rating < 1
	set @out = -1
	else if exists (select * from ratings where productid = @pid and buyerid = @bid)
	begin
		update ratings set rating = @rating where ProductID=@pid and BuyerID=@bid
		set @out = 2
	end
	else 
	begin
		insert into ratings values (@pid,@bid,@rating)
		set @out = 1
	end
end
--=============================================================================================================
