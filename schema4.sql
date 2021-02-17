create database amazonfinal
go
use amazonfinal
GO

-----------------------------------------------USERS---------------------------------------------------
create Table Users(
ID int primary key Identity(1,1),
Name varchar(30) Not Null,
[Address] varchar (max),
City varchar (20),
Country varchar (20),
Email varchar (25) Not Null,
[Password] varchar(20) Not Null
)
GO
Insert into Users  values ('Saba','221 B baker Street UK','London','UK','sabaabbas23@gmail.com','Hiimsaba')
Insert into Users  values ('Sumayya','222 B baker Street UK','London','UK','l144363@lhr.nu.edu.pk','Hiimsumayya')
Insert into Users  values ('Nabeel','223 B baker Street UK','London','UK','nabeelmehmood@hotmail.com','Hiimnabeel')
Insert into Users  values ('Neha','224 B baker Street UK','London','UK','nehaakram12@gmail.com','Hiimneha')
Insert into Users  values ('Ramin','225 B baker Street UK','London','UK','ramin.ranaa@nu.edu.pk','Hiimramin')
GO
-----------------------------------------------ADMIN---------------------------------------------------
create Table [Admin]
(
ID int primary key,
)
GO
alter table [Admin] add constraint FK2 foreign key (ID) references Users (ID) on delete no action on update cascade
GO
insert into Admin values (1)   --saba sabaabbas23@gmail.com
GO
-----------------------------------------------SELLERS---------------------------------------------------
create Table Sellers(
SellerID int primary key ,
SellerAmount int Not Null,
)
GO
alter table Sellers add constraint FK foreign key ([SellerID]) references Users (ID) on delete cascade on update cascade
GO
insert into Sellers values (2,10000)	--sumayya l144363@lhr.nu.edu.pk
insert into Sellers values (3,9000)		--nabeel nabeelmehmood@gmail.com
GO

-----------------------------------------------BUYERS---------------------------------------------------
create Table Buyers
(
BuyerID int primary key,
BuyerAmount int Not Null,
)
GO
alter table Buyers add constraint FK1 foreign key (BuyerID) references Users (ID)on delete cascade on update cascade
GO
insert into Buyers values (4,90000)	--neha nehaaakram12@gmail.com
insert into Buyers values (5,99000)	--miss ramin	ramin.ranaa@nu.edu.pk
GO
-----------------------------------------------CATEGORIES---------------------------------------------------
create Table Categories(
CategoryID char (2)  primary key,
CategoryName varchar (30) Not Null,
)
GO
insert into Categories values ( 1,'Electronics')
insert into Categories values ( 2,'Cosmetics')
insert into Categories values ( 3,'Cellphones')
insert into Categories values ( 4,'Clothing')
insert into Categories values ( 5,'Mobile Accessories')

GO
-----------------------------------------------PRODUCTS---------------------------------------------------
create Table Products
(
ProductID int primary key identity(1,1),
SellerID int Not Null,
ProductName varchar (30) Not Null,
CategoryID char(2) Not Null,
Price int Not Null,
[Date] Date Not Null,
Stock int Not Null
-- Discount float
)
GO
alter table Products add constraint FK3 foreign key (CategoryID) references Categories (CategoryID) on delete cascade on update cascade
alter table Products add constraint FK4 foreign key (SellerID) references Sellers ([SellerID])on delete cascade on update cascade
GO
insert into Products values ( 2,'Washing Machine',1,20000,'2016-03-09',5)
insert into Products values ( 2,'Iphone 7',3, 80000,'2015-03-09',3)
insert into Products values (2,'Samsung Galaxy S7',3,60000,'2017-03-09',2)
insert into Products values (3, 'Dishwasher',1, 40000,'2014-03-09',3)
insert into Products values (3, 'Microwave Oven',1, 30000,'2016-03-09',6)
insert into Products values (2, 'Referigerator',1, 60000,'2014-11-22',8)
insert into Products values (3,'Samsung Galaxy S8',3,90000,'2017-04-12',9)
insert into Products values (3,'HTC Desire 626',3,22000,'2017-02-18',15)


GO
-----------------------------------------------RATINGS---------------------------------------------------
create Table Ratings
(
ProductID int,
BuyerID int,
Rating int ,
primary key (ProductID,BuyerID)
)
GO
alter table Ratings add constraint FK7 foreign key (ProductID) references Products (ProductID)on delete cascade on update cascade
alter table Ratings add constraint FK8 foreign key (BuyerID) references Buyers (BuyerID)on delete cascade on update cascade
GO
insert into Ratings values (1,4,5)
insert into ratings values (2,4,4)
insert into ratings values (1,5,1)
insert into ratings values (2,5,4)
GO
-----------------------------------------------ORDERS---------------------------------------------------
create Table Orders
(
OrderNo int primary key identity(1,1),
ProductID int Not Null,
Quantity int Not Null,
BuyerID int Not Null,
[Date] Date Not Null
)
GO
alter table Orders add constraint FK5 foreign key (ProductID) references Products (ProductID)on delete cascade on update cascade 
alter table Orders add constraint FK6 foreign key (BuyerID) references Buyers (BuyerID)on delete cascade on update cascade
GO
insert into Orders values ( 1,1,4,'2017-03-09' )
insert into Orders values ( 5,1,5,'2016-03-05' )
insert into Orders values ( 2,1,4,'2017-04-24' )
insert into Orders values ( 8,1,5,'2013-01-13' )
insert into Orders values ( 8,1,4,'2015-03-19' )


GO
-----------------------------------------------DISPLAYYYY---------------------------------------------------
select * from users
select * from Products
select * from Orders
select * from Categories
select * from Ratings
select * from Buyers
select * from Sellers
GO