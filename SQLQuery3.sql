--Create tables

CREATE TABLE dbo.Customers

(

Id INT identity(1,1) NOT NULL primary Key,

FirstName NVARCHAR(100) NOT NULL,

LastName NVARCHAR(100) NOT NULL,

BillingAddress NVARCHAR(100) NOT NULL,

BillingZip VARCHAR(10) NOT NULL,

BillingCity NVARCHAR(50) NOT NULL,

DeliveryAddress NVARCHAR(100) NOT NULL,

DeliveryZip VARCHAR(10) NOT NULL,

DeliveryCity NVARCHAR(50) NOT NULL,

EmailAddress NVARCHAR(255) NOT NULL,

Phone VARCHAR(25) NOT NULL

)

CREATE TABLE dbo.Orders

(

Id INT identity(1,1) NOT NULL PRIMARY KEY,

OrderDate DATETIME NOT NULL,

CustomerId INT NOT NULL,

constraint FK_Orders_Customers foreign key (CustomerId) references dbo.Customers(Id)

)

CREATE TABLE dbo.Movies

(

Id INT identity NOT NULL PRIMARY KEY,

Title NVARCHAR(50) NOT NULL,

Director NVARCHAR(100) NOT NULL,

ReleaseYear INT NOT NULL,

Price MONEY NULL DEFAULT 149

)

CREATE TABLE dbo.OrderRecords

(

Id INT identity(1,1) NOT NULL PRIMARY KEY,

OrderId INT NOT NULL,

MovieId INT NOT NULL,

Price MONEY NOT NULL,

constraint FK_ORD_Orders foreign key (OrderId) references dbo.Orders(Id),

constraint FK_ORD_Movies foreign key (MovieId) references dbo.Movies(Id)

)

--Insert seed data

INSERT INTO Customers(FirstName,LastName,BillingAddress, BillingZip, BillingCity,DeliveryAddress,DeliveryZip,DeliveryCity, EmailAddress, Phone )
VALUES ('Jonas', 'Gray','23 Green Corner Street','56743','Birmingham','23 Green Corner Street', '56743', 'Brimingham','jonas.gray@hotmail.com','0708123456'  );

INSERT INTO Customers(FirstName,LastName,BillingAddress, BillingZip, BillingCity,DeliveryAddress,DeliveryZip,DeliveryCity, EmailAddress, Phone )
VALUES ('Jane', 'Harolds','10 West Street','43213','London','10 West Street', '43213', 'London','jane_h77@gmail.com','0701245512'  );


INSERT INTO Customers(FirstName,LastName,BillingAddress, BillingZip, BillingCity,DeliveryAddress,DeliveryZip,DeliveryCity, EmailAddress, Phone )
VALUES ('Peter', 'Birro','12 Fox Street','45681','New York','89 Moose Plaza','45321','Seattle','peter_the_great@hotmail.com','739484322'  );


--Exercise 3 - INSERT
INSERT INTO Orders (CustomerId, OrderDate)
values ((Select Id from Customers where Id = 1002), '2015-01-01');

INSERT INTO OrderRecords(OrderId, MovieId, Price)
VALUES((select MAX(Id) from Orders),(select Id from Movies where Id = 1), 179);
INSERT INTO OrderRecords(OrderId, MovieId, Price)
VALUES((select MAX(Id) from Orders),(select Id from Movies where Id = 4), 49);


INSERT INTO Orders (CustomerId, OrderDate)
values ((Select Id from Customers where Id = 1008), '2015-01-15');

INSERT INTO OrderRecords(OrderId, MovieId, Price)
VALUES((select MAX(Id) from Orders),(select Id from Movies where Id = 3), 119),
       ((select MAX(Id) from Orders),(select Id from Movies where Id = 3), 119);


INSERT INTO Orders (CustomerId, OrderDate)
values ((Select Id from Customers where Id = 1002), '2014-12-20');
INSERT INTO OrderRecords(OrderId, MovieId, Price)
VALUES((select MAX(Id) from Orders),(select Id from Movies where Id = 3), 179);


--Exercise 4 – UPDATE
UPDATE Movies
SET Price = 169
WHERE ReleaseYear = 2014;

--Exercise 5 – SELECT
SELECT DISTINCT FirstName, LastName, EmailAddress, Phone from Customers

SELECT *
FROM Movies
ORDER BY ReleaseYear DESC;


SELECT Title, Price
FROM Movies
ORDER BY Price ASC;

Select DISTINCT Id, FirstName, LastName, DeliveryAddress, DeliveryZip, DeliveryCity
From Customers
where Id = (Select CustomerId From Orders Where Id = 
( Select OrderId From OrderRecords Where Id = 
(select Id from Movies where Title = 'The Wolf of Wall Street' )))


select o.id, (c.FirstName +' '+ c.LastName) AS Customer, sum(Price) AS 'Total Cost'
from Customers c

Join Orders o ON c.Id = o.CustomerId
join OrderRecords r On o.Id = r.OrderId
group by o.Id, c.FirstName, c.LastName


--Exercise 6
ALTER TABLE Customers
ADD CellNo Numeric;


Update Customers
set CellNo = Phone

ALTER TABLE Customers
ALTER COLUMN Phone Varchar(max);

Update Customers
set Phone = ''

select * from Customers