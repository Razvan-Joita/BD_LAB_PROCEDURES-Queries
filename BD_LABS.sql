CREATE DATABASE RESTAURANT

use Teil1_Lab3

--Assignment1-Datenbanken

CREATE TABLE MenuItem
(
	itemID SMALLINT NOT NULL,
	name VARCHAR(30) NOT NULL,
	price DECIMAL(6,2) NOT NULL,
	quantity DECIMAL(6,2) NOT NULL,
	PRIMARY KEY(itemID)
)

select * from MenuItem
INSERT INTO MenuItem(itemID,name,price,quantity) VALUES (1,'Spaghetti Carbonara',20.5,500)
INSERT INTO MenuItem(itemID,name,price,quantity) VALUES (2,'Pizza Margherita',32.0,400)
INSERT INTO MenuItem(itemID,name,price,quantity) VALUES (3,'Coca-Cola',3.5,330)
INSERT INTO MenuItem(itemID,name,price,quantity) VALUES (4,'Ursus',5.0,500)
INSERT INTO MenuItem(itemID,name,price,quantity) VALUES (5,'Crispy Strips',14.0,600)

CREATE TABLE Chef
(
	chefID SMALLINT NOT NULL,
	name VARCHAR(30) NOT NULL,
	rating DECIMAL(3,2),
	salary DECIMAL(6,2),
	phoneNumber CHAR(10),
	PRIMARY KEY(chefID)
)
select * from Chef

INSERT INTO Chef(chefID,name,rating,salary,phoneNumber) VALUES (1,'Popescu Ionut',3.5,1500.0,'0745345678')
INSERT INTO Chef(chefID,name,rating,salary,phoneNumber) VALUES (2,'Martino Giuseppe',4.8,2600.75,'0732539815')
INSERT INTO Chef(chefID,name,rating,salary,phoneNumber) VALUES (3,'John Smith',4.2,1850.0,'0745341228')
INSERT INTO Chef(chefID,name) VALUES (4,'Ionescu Costica')
INSERT INTO Chef(chefID,name) VALUES (5,'Georgescu Marian')
INSERT INTO Chef(chefID,name) VALUES (6,'Scarlatescu Monica')


drop table Chef
drop table MenuItem


CREATE TABLE Waiter
(
	waiterID SMALLINT NOT NULL,
	name VARCHAR(30) NOT NULL,
	rating DECIMAL(3,2),
	salary DECIMAL(6,2),
	phoneNumber CHAR(10),
	PRIMARY KEY(waiterID)
)

select *from Waiter

INSERT INTO Waiter(waiterID,name,rating,salary,phoneNumber) VALUES (1,'Gheorghiu Mihai',4.5,1200.0,'0749376287')
INSERT INTO Waiter(waiterID,name,rating,salary,phoneNumber) VALUES (2,'Bradescu Cosmina',4.8,1350.0,'0765234287')
INSERT INTO Waiter(waiterID,name,rating,salary,phoneNumber) VALUES (3,'Chelaru Dorina',3.2,1075.5,'0749372987')
INSERT INTO Waiter(waiterID,name) VALUES (4,'Badescu Nelu')
INSERT INTO Waiter(waiterID,name) VALUES (5,'Nemtescu Marian')

CREATE TABLE Delivery_People
(
	deliverID SMALLINT NOT NULL,
	name VARCHAR(30) NOT NULL,
	rating DECIMAL(3,2),
	salary DECIMAL(6,2),
	phoneNumber CHAR(10),
	PRIMARY KEY(deliverID)
)

select *from Delivery_People

INSERT INTO Delivery_People(deliverID,name,rating,salary,phoneNumber) VALUES (1,'Popa Andrei',4.5,1200.0,'0734542091')
INSERT INTO Delivery_People(deliverID,name,rating,salary,phoneNumber) VALUES (2,'Petrescu Paul',4.8,1350.0,'0723047239')
INSERT INTO Delivery_People(deliverID,name,rating,salary,phoneNumber) VALUES (3,'Enescu Bogdan',3.2,1075.5,'0745309802')
INSERT INTO Delivery_People(deliverID,name) VALUES (4,'Vranceanu Alex')
INSERT INTO Delivery_People(deliverID,name) VALUES (5,'Morar Maria')
INSERT INTO Delivery_People(deliverID,name) VALUES (6,'Doru Livratoru')

CREATE TABLE Customer
(
	customerID SMALLINT NOT NULL,
	name VARCHAR(30) NOT NULL,
	rating DECIMAL(3,2),
	address VARCHAR(50),
	phoneNumber CHAR(10),
	PRIMARY KEY(customerID)
)

select *from Customer

INSERT INTO Customer(customerID,name,rating,address,phoneNumber) VALUES (1,'Lovinescu Dorin',4.5,'Fabricii de Zahar 14',0745690021)
INSERT INTO Customer(customerID,name,rating,address,phoneNumber) VALUES (2,'Prisacaru Teodora',3.7,'Nicolae Grigorescu 4',0722759407)
INSERT INTO Customer(customerID,name,rating,address,phoneNumber) VALUES (3,'Andone Roxana',4.3,'Dumbrava Rosie 8',0729504102)
INSERT INTO Customer(customerID,name,rating,address,phoneNumber) VALUES (4,'Marin George',4.8,'Dunarii 20',0734257007)
INSERT INTO Customer(customerID,name,rating,address) VALUES (5,'Dornescu Vasile',2.1,'Intre Lacuri 16')

CREATE TABLE Order_Details
(
	orderID SMALLINT NOT NULL,
	itemID SMALLINT NOT NULL,
	quantity SMALLINT NOT NULL,
	PRIMARY KEY(orderID,itemID),
	FOREIGN KEY(itemID) REFERENCES MenuItem(itemID)
		ON DELETE CASCADE
)

select *from Order_Details

INSERT INTO Order_Details(orderID,itemID,quantity) VALUES (1,3,2);
INSERT INTO Order_Details(orderID,itemID,quantity) VALUES (1,2,2);
INSERT INTO Order_Details(orderID,itemID,quantity) VALUES (2,5,4);
INSERT INTO Order_Details(orderID,itemID,quantity) VALUES (2,4,3);
INSERT INTO Order_Details(orderID,itemID,quantity) VALUES (3,1,1);

select *from Order_Details

CREATE TABLE Reservations
(
	reservID SMALLINT NOT NULL,
	customerID SMALLINT NOT NULL,
	date DATETIME NOT NULL,
	tableID SMALLINT,
	PRIMARY KEY(reservID),
	FOREIGN KEY(customerID) REFERENCES Customer(customerID)
		ON DELETE CASCADE
)

SELECT * FROM Reservations


INSERT INTO Reservations(reservID,customerID,date,tableID) VALUES (1,2,'2020-09-20 20:00',1)
INSERT INTO Reservations(reservID,customerID,date,tableID) VALUES (2,2,'2020-10-18 20:30',2)
INSERT INTO Reservations(reservID,customerID,date,tableID) VALUES (3,3,'2020-09-20 16:00',6)
INSERT INTO Reservations(reservID,customerID,date) VALUES (4,1,'2020-11-08 17:45')
INSERT INTO Reservations(reservID,customerID,date) VALUES (5,2,'2020-04-10 22:30')


CREATE TABLE Bill
(
	billID SMALLINT NOT NULL,
	customerID SMALLINT NOT NULL,
	chefID SMALLINT NOT NULL,
	price SMALLINT NOT NULL,
	tips SMALLINT,
	paymentMethod VARCHAR(20) NOT NULL,
	PRIMARY KEY(billID),
	FOREIGN KEY(customerID) REFERENCES Customer(customerID)
		ON DELETE CASCADE,
	FOREIGN KEY(chefID) REFERENCES Chef(chefID)
)


CREATE TABLE Allergens
(
	allergID SMALLINT NOT NULL PRIMARY KEY,
	name VARCHAR(30) NOT NULL
)
select * from Allergens
SELECT allergID,name FROM Allergens
INSERT INTO Allergens(allergID,name) VALUES (1,'eggs')
INSERT INTO Allergens(allergID,name) VALUES (2,'milk')
INSERT INTO Allergens(allergID,name) VALUES (3,'nuts')
INSERT INTO Allergens(allergID,name) VALUES (4,'seafood')
INSERT INTO Allergens(allergID,name) VALUES (5,'soy')

CREATE TABLE Allergens_MenuItem
(
	allergID SMALLINT NOT NULL,
	itemID SMALLINT NOT NULL,
	PRIMARY KEY(allergID,itemID),
	FOREIGN KEY(allergID) REFERENCES Allergens(allergID)
		ON DELETE CASCADE,
	FOREIGN KEY(itemID) REFERENCES MenuItem(itemID)
		ON DELETE CASCADE
)

select *from Allergens_MenuItem

INSERT INTO Allergens_MenuItem(allergID,itemID) VALUES (1,1)
INSERT INTO Allergens_MenuItem(allergID,itemID) VALUES (1,2)
INSERT INTO Allergens_MenuItem(allergID,itemID) VALUES (2,1)
INSERT INTO Allergens_MenuItem(allergID,itemID) VALUES (2,2)
INSERT INTO Allergens_MenuItem(allergID,itemID) VALUES (3,5)

CREATE TABLE Order_DineIn
(
	orderID SMALLINT NOT NULL PRIMARY KEY,
	customerID SMALLINT NOT NULL,
	waiterID SMALLINT NOT NULL,
	chefID SMALLINT NOT NULL,
	tableID SMALLINT,
	price SMALLINT NOT NULL,
	tips SMALLINT,
	paymentMethod VARCHAR(30),
	FOREIGN KEY(customerID) REFERENCES Customer(customerID)
		ON DELETE CASCADE,
	FOREIGN KEY(waiterID) REFERENCES Waiter(waiterID)
		ON DELETE CASCADE,
	FOREIGN KEY(chefID) REFERENCES Chef(chefID)
		ON DELETE CASCADE
)

select *from Order_DineIn

ALTER TABLE Order_DineIn ALTER COLUMN price DECIMAL(6,2) NOT NULL
ALTER TABLE Order_DineIn ALTER COLUMN tips DECIMAL(6,2) 

INSERT INTO Order_DineIn(orderID,customerID,waiterID,chefID,tableID,price,tips,paymentMethod) VALUES (1,1,1,1,1,30.50,5.0,'cash')
INSERT INTO Order_DineIn(orderID,customerID,waiterID,chefID,tableID,price,tips,paymentMethod) VALUES (2,2,3,4,1,100.75,20.25,'card')
INSERT INTO Order_DineIn(orderID,customerID,waiterID,chefID,tableID,price,paymentMethod) VALUES (3,1,3,1,3,5.50,'cash')
INSERT INTO Order_DineIn(orderID,customerID,waiterID,chefID,tableID,price,tips,paymentMethod) VALUES (4,1,1,1,1,230.50,45.0,'cash')
INSERT INTO Order_DineIn(orderID,customerID,waiterID,chefID,tableID,price,paymentMethod) VALUES (5,2,2,2,5,18.25,'voucher')

SELECT * FROM Order_DineIn

select *from MenuItem

CREATE TABLE Order_Delivery
(
	orderID SMALLINT NOT NULL PRIMARY KEY,
	customerID SMALLINT NOT NULL,
	deliverID SMALLINT NOT NULL,
	chefID SMALLINT NOT NULL,
	price DECIMAL(6,2) NOT NULL,
	tips DECIMAL(6,2),
	paymentMethod VARCHAR(30),
	FOREIGN KEY(customerID) REFERENCES Customer(customerID)
		ON DELETE CASCADE,
	FOREIGN KEY(deliverID) REFERENCES Delivery_People(deliverID)
		ON DELETE CASCADE,
	FOREIGN KEY(chefID) REFERENCES Chef(chefID)
		ON DELETE CASCADE
)

select *from Order_Delivery

INSERT INTO Order_Delivery(orderID,customerID,deliverID,chefID,price,tips,paymentMethod) VALUES (1,2,2,2,30.50,2.0,'cash')
INSERT INTO Order_Delivery(orderID,customerID,deliverID,chefID,price,paymentMethod) VALUES (2,2,2,2,15.0,'cash')
INSERT INTO Order_Delivery(orderID,customerID,deliverID,chefID,price,tips,paymentMethod) VALUES (3,1,6,5,56.30,7.50,'card')

ALTER TABLE Order_Details ADD CONSTRAINT FK_Order FOREIGN KEY(orderID) REFERENCES Order_DineIn(orderID)
ALTER TABLE Order_Details ADD CONSTRAINT FK_Order2 FOREIGN KEY(orderID) REFERENCES Order_Delivery(orderID)


--Assignment2

ALTER TABLE Order_Details DROP CONSTRAINT FK_Order2

CREATE TABLE Order_Details2
(
	orderID SMALLINT NOT NULL,
	itemID SMALLINT NOT NULL,
	quantity SMALLINT NOT NULL,
	PRIMARY KEY(orderID,itemID),
	FOREIGN KEY(itemID) REFERENCES MenuItem(itemID)
		ON DELETE CASCADE,
	FOREIGN KEY(orderID) REFERENCES Order_Delivery(orderID)
		ON DELETE CASCADE

)

select *from Order_Details2

INSERT INTO Order_Details2(orderID,itemID,quantity) VALUES (1,3,2)
INSERT INTO Order_Details2(orderID,itemID,quantity) VALUES (1,2,2)
INSERT INTO Order_Details2(orderID,itemID,quantity) VALUES (2,5,4)
INSERT INTO Order_Details2(orderID,itemID,quantity) VALUES (2,4,3)
INSERT INTO Order_Details2(orderID,itemID,quantity) VALUES (3,1,1)

INSERT INTO Allergens_MenuItem(allergID,itemID) VALUES (1,5)
INSERT INTO Allergens_MenuItem(allergID,itemID) VALUES (2,4)
select *from Allergens_MenuItem
INSERT INTO Order_DineIn(orderID,customerID,waiterID,chefID,tableID,price,paymentMethod) VALUES (6,2,3,1,3,5.50,'cash')
INSERT INTO Order_DineIn(orderID,customerID,waiterID,chefID,tableID,price,tips,paymentMethod) VALUES (7,1,1,1,1,240.50,45.0,'cash')
INSERT INTO Order_DineIn(orderID,customerID,waiterID,chefID,tableID,price,tips,paymentMethod) VALUES (8,1,1,1,3,240.50,45.0,'card')
INSERT INTO Order_DineIn(orderID,customerID,waiterID,chefID,tableID,price,tips,paymentMethod) VALUES (9,1,1,1,3,240.50,4.0,'card')



INSERT INTO Customer(customerID,name,rating,address) VALUES (6,'Gradinaru Viorel',2.1,'Bucuresti 20')

select *from Customer


INSERT INTO Order_Details(orderID,itemID,quantity) VALUES (5,2,1)

select *from Order_Details

--insert that violates the referential integrity constraints
INSERT INTO Order_Details2(orderID,itemID,quantity) VALUES (6,7,6)

UPDATE Waiter
SET salary=1000
WHERE salary IS NULL

select *from Waiter

select *from Customer

UPDATE Customer
SET rating=NULL
WHERE rating<4.0

select *from Customer



UPDATE Reservations
SET tableID=10
WHERE tableID BETWEEN 2 AND 7

DELETE FROM Delivery_People
WHERE name LIKE '%_Paul%'

DELETE FROM MenuItem
WHERE itemID IN (1,3)

--UNION with OR: select all the allergens that appear in Pizza Margherita or Crispy Strips
SELECT DISTINCT A.name
FROM Allergens_MenuItem AM, MenuItem M, Allergens A
WHERE A.allergID=AM.allergID AND AM.itemID=M.itemID AND (M.name='Pizza Margherita' OR M.name='Crispy Strips')

--UNION with UNION: select all menu items that are in dine-in orders paid by card or voucher
SELECT M.name
FROM Order_DineIn D, Order_Details O, MenuItem M
WHERE M.itemID=O.itemID AND O.orderID=D.orderID AND D.paymentMethod='card'
UNION
SELECT M2.name
FROM Order_DineIn D2, Order_Details O2, MenuItem M2
WHERE M2.itemID=O2.itemID AND O2.orderID=D2.orderID AND D2.paymentMethod='voucher'
select *from MenuItem

select *from Allergens_MenuItem

--INTERSECTION with INTERSECT: select all allergens that appear in both Pizza Margherita and Crispy Strips
SELECT A.name
FROM Allergens A, MenuItem M, Allergens_MenuItem AM
WHERE A.allergID=AM.allergID AND AM.itemID=M.itemID AND M.name='Pizza Margherita'
INTERSECT
SELECT A2.name
FROM Allergens A2, MenuItem M2, Allergens_MenuItem AM2
WHERE A2.allergID=AM2.allergID AND AM2.itemID=M2.itemID AND M2.name='Crispy Strips'



SELECT A.name
FROM Allergens A 
INNER JOIN Allergens_MenuItem AM
on a.allergID = AM.allergID
INNER JOIN MenuItem M
on AM.itemID=M.itemID
WHERE M.name='Pizza Margherita'
INTERSECT
SELECT A2.name
from Allergens A2
INNER JOIN Allergens_MenuItem AM2
on a2.allergID = AM2.allergID
INNER JOIN MenuItem M2
on m2.itemID=AM2.itemID
WHERE M2.name='Ursus'






--INTERSECTION with INTERSECT: select all customers who have paid dine-in orders with both cash and card, as well as the total sum paid (price+tips) (arithmetic expression)
SELECT DISTINCT C.name,O.price+O.tips as totalPaid
FROM Customer C, Order_DineIn O
WHERE C.customerID=O.customerID AND O.paymentMethod='card' OR O.customerID IN
(
SELECT O2.customerID
FROM Order_DineIn O2
WHERE O2.paymentMethod='cash'
)


--DIFFERENCE with EXCEPT: select all chefs that have cooked for dine-in orders, but not delivery orders
SELECT C.name
FROM Chef C, Order_DineIn D
WHERE C.chefID=D.chefID
EXCEPT
SELECT C2.name
FROM Chef C2, Order_Delivery D2
WHERE C2.chefID=D2.chefID


select C.name
from Chef C
INNER JOIN Order_DineIn O
on C.chefID=O.orderID
EXCEPT
select C2.name
from Chef C2
INNER JOIN Order_Delivery O2
on C2.chefID=O2.chefID
where C2.chefID=O2.chefID



--DIFFERENCE with NOT IN: select all allergens that are in Crispy Strips, but not in Pizza Margherita
SELECT A.name
FROM Allergens A
INNER JOIN Allergens_MenuItem AM
on A.allergID=AM.allergID
INNER JOIN MenuItem M
on AM.itemID=M.itemID
WHERE  M.name='Crispy Strips' AND A.allergID NOT IN
(
SELECT A2.allergID
FROM Allergens A2, MenuItem M2, Allergens_MenuItem AM2
WHERE A2.allergID=AM2.allergID AND AM2.itemID=M2.itemID AND M2.name='Pizza Margherita'
)


select *from Allergens
select *from MenuItem
select *from Allergens_MenuItem
select *from Order_Details2



select A.name
from Allergens A
INNER JOIN MenuItem M
on A.allergID=M.itemID
INNER JOIN Allergens_MenuItem AM
on A.allergID=AM.allergID
where A.allergID=AM.allergID and AM.itemID=M.itemID 
order by A.name





select *from Waiter



--INNER JOIN: select top 5 waiters that serve all allergens,as well as their absolute rating (=rating/salary) (two m:n relationships used + arithmetic expression)
SELECT TOP 5 W.name,M.name,A.name,W.rating/W.salary AS absRating,W.waiterID
FROM Waiter W
INNER JOIN Order_DineIn O ON W.waiterID=O.waiterID and W.waiterID=3
INNER JOIN Order_Details D ON O.orderID=D.orderID
INNER JOIN MenuItem M ON D.itemID=M.itemID
INNER JOIN Allergens_MenuItem AM ON M.itemID=AM.itemID
INNER JOIN Allergens A ON AM.allergID=A.allergID 
order by W.phoneNumber





--LEFT JOIN: select the number of menu item delivered /deliver-person 
SELECT P.name,count(P.name) as "Delivers Made"
FROM Delivery_People P
INNER  JOIN Order_Delivery D ON P.deliverID=D.deliverID
INNER JOIN Order_Details OD ON D.orderID=OD.orderID
INNER JOIN MenuItem M ON OD.itemID=M.itemID
group by P.name

select *from Reservations


--RIGHT JOIN: select all customers and the tables they reserved, including those with no tables reserved, where the curstomer is either Prisacaru Teodora or Lovinescu Dorin (condition with OR)
SELECT R.tableID,R.date,C.name
FROM Reservations R
RIGHT JOIN Customer C ON C.customerID=R.customerID
RIGHT JOIN Waiter W on R.reservID=W.waiterID
WHERE C.name='Prisacaru Teodora' OR C.name='Lovinescu Dorin'



--FULL JOIN: select top 3 allergens that appear in all menu items, including allergens that don't appear in menu items and menu items without allergens (three tables used)
SELECT TOP 3 A.name, A.allergID, M.name
FROM Allergens A
FULL OUTER JOIN Allergens_MenuItem AM ON A.allergID=AM.allergID
FULL OUTER JOIN MenuItem M ON AM.itemID=M.itemID
order by A.name



select *from Customer
insert into Customer(customerID,name) values(7,'Vila Bogdan')


select *from Delivery_People
insert into Delivery_People(deliverID,name) values(7,'Vila Bogdan')


select *from Delivery_People d
INNER JOIN Customer c
on d.name=c.name



--IN operator in WHERE clause and a subclause: select all delivery people that have delivered orders
SELECT TOP 3 D.name
FROM Delivery_People D
WHERE D.deliverID IN 
(
SELECT O.deliverID
FROM Order_Delivery O
)
ORDER BY D.name

--IN operator in WHERE clause and two subclauses: select all allergens that appear in menu items that cost more than 10 or less than 5
SELECT A.name
FROM Allergens A
WHERE A.allergID IN
	(
		SELECT AM.itemID
		FROM Allergens_MenuItem AM
		WHERE AM.itemID IN
		(
			SELECT M.itemID
			FROM MenuItem M
			WHERE M.price>=10 OR M.price<=5
		)
)

--EXISTS operator and a subquery in the WHERE clause: select customers with reservations before 2020-10-01 00:00:00 (condition with AND)
SELECT DISTINCT C.name
FROM Customer C
WHERE EXISTS 
(
SELECT *
FROM Reservations R
WHERE R.customerID=C.customerID AND R.date<='2020-10-01 00:00:00'
)

--EXISTS operator and a subquery in the WHERE clause: select waiters who have served orders where the price was greater than 100 (condition with AND)
SELECT W.name
FROM Waiter W
WHERE EXISTS
(
SELECT *
FROM Order_DineIn O
WHERE O.waiterID=W.waiterID AND O.price>=100
)
--subquery in the FROM clause: select all menu items whose prices are higher than the average of all menu items, as well as the difference between their price and the average (arithmetic expression)
SELECT M.name, M.price, M.price-AveragePrice AS diffAvg
FROM (SELECT AVG(price) AS AveragePrice FROM MenuItem) AS A, MenuItem M
WHERE M.price>=AveragePrice

--subquery in the FROM clause: select all chefs whose phone numbers end in 8
SELECT C.name,C.phoneNumber
FROM (SELECT * FROM Chef WHERE phoneNumber LIKE '%8') AS CP, Chef C
WHERE C.chefID=CP.chefID

--GROUP BY: select the minimum price of a dine-in order, where the orders have been grouped by their payment method
SELECT MIN(O.price) AS minPrice,O.paymentMethod
FROM Order_DineIn O
GROUP BY O.paymentMethod

--GROUP BY and HAVING: select the number of dine-in orders at each table, where the table has been used for at least 2 orders
SELECT COUNT(*) AS timesUsed,O.tableID
FROM Order_DineIn O
GROUP BY O.tableID
HAVING COUNT(*)>=2

--GROUP BY and HAVING with subquery: select the sum of the prices of all delivery orders grouped by the delivery person, where the deliverID is valid (there exists a delivery person with that ID)
SELECT O.deliverID,SUM(O.price) AS sumPrice
FROM Order_Delivery O
GROUP BY O.deliverID
HAVING O.deliverID in (SELECT deliverID FROM Delivery_People)

--GROUP BY and HAVING with subquery: select the maximum price for a dine-in order grouped by the table, where each table has been reserved before
SELECT MAX(O.price) AS maxPrice,O.tableID
FROM Order_DineIn O
GROUP BY O.tableID
HAVING O.tableID IN (SELECT DISTINCT tableID FROM Reservations)


--ANY introduces subquery in WHERE clause: select all waiters whose salary is smaller than any of the delivery people's
SELECT W.name,W.salary
FROM Waiter W
WHERE W.salary < ANY (SELECT salary FROM Delivery_People)
ORDER BY W.salary


--rewritten with NOT IN
SELECT W.name,W.salary
FROM Waiter W
WHERE W.salary NOT IN (SELECT salary FROM Waiter WHERE salary>(SELECT MIN(salary) FROM Delivery_People))
ORDER BY W.salary


--ANY introduces subquery in WHERE clause: select all delivery people whose rating is smaller than any rating of any waiter
SELECT D.name,D.rating
FROM Delivery_People D
WHERE D.rating < ANY (SELECT rating FROM Waiter)
ORDER BY D.rating

--rewritten with aggregation operator MAX
SELECT D.name,D.rating
FROM Delivery_People D
WHERE D.rating < (SELECT MAX(rating) FROM Waiter)
ORDER BY D.rating


select D.name,D.salary
from Delivery_People D
INNER JOIN Waiter W
on D.deliverID=W.waiterID
where D.rating < ANY (SELECT rating FROM Waiter)
order by D.rating


--select top 2 customers who
SELECT TOP 2 C.name,M.name,A.name,C.rating AS absRating,C.customerID
FROM Customer C
INNER JOIN Order_DineIn O ON C.customerID=O.waiterID and C.customerID=3
INNER JOIN Order_Details D ON O.orderID=D.orderID
INNER JOIN MenuItem M ON D.itemID=M.itemID
INNER JOIN Allergens_MenuItem AM ON M.itemID=AM.itemID
INNER JOIN Allergens A ON AM.allergID=A.allergID 
order by C.address



--ALL introduces subquery in WHERE clause: select all dine-in orders IDs that received tips greater than all tips received for delivery orders

SELECT O.orderID,O.tips
FROM Order_DineIn O
WHERE O.tips < ALL (SELECT tips FROM Order_Delivery 
WHERE tips IS NOT NULL)

ORDER BY O.orderID
--rewritten with IN
SELECT O.orderID,O.tips
FROM Order_DineIn O
WHERE O.tips IN (SELECT tips FROM Order_DineIn WHERE tips<(SELECT MIN(tips) FROM Order_Delivery WHERE tips IS NOT NULL))
ORDER BY O.orderID





--ALL introduces subquery in WHERE clause: select all customers whose rating is smaller than all ratings of all chefs
SELECT C.name,C.rating
FROM Customer C
WHERE C.rating < ALL (SELECT rating FROM Chef WHERE rating IS NOT NULL)
ORDER BY C.rating

--rewritten with aggregation operator
SELECT C.name,C.rating
FROM Customer C
WHERE C.rating < (SELECT MIN(rating) FROM Chef WHERE rating IS NOT NULL)
ORDER BY C.rating

--ANY introduces subquery in WHERE clause: select all customers that have reservations
SELECT C.name
FROM Customer C
WHERE C.customerID = ANY (SELECT R.customerID FROM Reservations R)

--rewritten with IN:
SELECT C.name
FROM Customer C
WHERE C.customerID IN (SELECT R.customerID FROM Reservations R)

--ALL introduces subquery in WHERE clause: select all chefs that don't cook for dine-in orders
SELECT C.name
FROM Chef C
WHERE C.chefID <> ALL (SELECT O.chefID FROM Order_DineIn O)


--rewritten with NOT IN:
SELECT C.name
FROM Chef C
WHERE C.chefID NOT IN (SELECT O.chefID FROM Order_DineIn O)

select *from Allergens

select *from MenuItem
insert into MenuItem(itemID,name,price,quantity) values(6,'Pizza Quattro Stagioni',30,280)



--all products that were delivered and with price lower than any pizza
select M.price,M.name
from MenuItem M
INNER JOIN Order_Delivery O
on M.itemID=O.orderID
where M.price<all
(select M.price
from MenuItem M
where name like '%Pizza%')




select *from Customer
select *from Chef
select *from Delivery_People

select *from Customer
insert into Customer(customerID,name,rating) values(8,'Bront Andrei',6.8)

 



select 
	MAX(C.customerID) as 'MAXID'
from Customer C
INNER JOIN Delivery_People D
on C.customerID=D.deliverID 
INNER JOIN Chef C1
on C.customerID=C1.chefID
INNER JOIN Waiter W
on C.customerID=W.waiterID
where C.rating>any(select D.rating
from Delivery_People D) and C.rating>any(select C1.rating
from Chef C1) and C.rating>any(select W.rating
from Waiter W)
having count(*)<>1




CREATE TABLE Previous_Versions
(
	storedProcedure VARCHAR(50),
	versionFrom INT,
	versionTo INT,
	PRIMARY KEY(versionFrom,versionTo)
)
GO

select *from Previous_Versions
INSERT INTO Previous_Versions(storedProcedure,versionFrom,versionTo) VALUES ('changeCustomerRatingType',0,1)
INSERT INTO Previous_Versions(storedProcedure,versionFrom,versionTo) VALUES ('removeColumnPhoneNumberDeliveryPeople',1,2)
INSERT INTO Previous_Versions(storedProcedure,versionFrom,versionTo) VALUES ('addDefaultConstraintWaiterRating',2,3)
INSERT INTO Previous_Versions(storedProcedure,versionFrom,versionTo) VALUES ('dropPrimaryKeyQuickTestID',3,4)
INSERT INTO Previous_Versions(storedProcedure,versionFrom,versionTo) VALUES ('addCandidateKeyReservationIDTable',4,5)
INSERT INTO Previous_Versions(storedProcedure,versionFrom,versionTo) VALUES ('removeForeignKeyOrderDeliveryChefID',5,6)
INSERT INTO Previous_Versions(storedProcedure,versionFrom,versionTo) VALUES ('createTestTable',6,7)


--table2: keeps only the current version

CREATE TABLE Current_Version
(
	currentVersion INT DEFAULT 0
)
GO

select *from Current_Version
--procedure that modifies version

CREATE OR ALTER PROCEDURE modifyVersion (@version INT)
AS
BEGIN

	DECLARE @current INT;
	SET @current=(SELECT currentVersion FROM Current_Version)

	
		BEGIN
	
		IF @version<0 OR @version>7
		BEGIN
			DECLARE @errorMsg VARCHAR(200)
			SET @errorMsg='Version has to be between 0 and 7'
			PRINT @errorMsg
			RETURN 
		END

		ELSE
		IF @version=@current
		BEGIN
			PRINT 'Already on this version!'
			RETURN 
		END	

		ELSE

		IF @version<@current
		BEGIN
			DECLARE @query VARCHAR(200)
			DECLARE @proc VARCHAR(50)
			DECLARE @vTo INT

			DECLARE versionCursor CURSOR SCROLL FOR
			SELECT storedProcedure,versionTo
			FROM Previous_Versions

			OPEN versionCursor
			PRINT 'Cursor opened'

			FETCH LAST
			FROM versionCursor
			INTO @proc,@vTo
			PRINT 'Fetched last'

			WHILE @vTo>@version AND @@FETCH_STATUS=0
			BEGIN
				IF @vTo<=@current
					BEGIN
					SET @query='undo_'+@proc
					EXEC @query
					PRINT 'Undo executed'
				
					UPDATE Current_Version SET currentVersion=@vTo-1
					PRINT 'Updated version'
				END
			
				FETCH PRIOR
				FROM versionCursor
				INTO @proc,@vTo
				PRINT 'Fetched prior'

			END

			IF(@version=0)
			BEGIN
				SET @query='undo_'+(SELECT storedProcedure FROM Previous_Versions WHERE versionFrom=0)
				EXEC @query
			END

			CLOSE versionCursor
			DEALLOCATE versionCursor
			PRINT 'Cursor deallocated'
		END
			
		ELSE
		BEGIN
			DECLARE @query2 VARCHAR(200)
			DECLARE @proc2 VARCHAR(50)
			DECLARE @vTo2 INT
			DECLARE @vFrom2 INT

			DECLARE versionCursor2 CURSOR FOR
			SELECT storedProcedure,versionTo,versionFrom
			FROM Previous_Versions

			OPEN versionCursor2
			PRINT 'Cursor opened'

			FETCH NEXT
			FROM versionCursor2
			INTO @proc2,@vTo2,@vFrom2
			PRINT 'Fetched first'

			WHILE @vFrom2<@version AND @@FETCH_STATUS=0
			BEGIN
				IF @vFrom2>=@current
					BEGIN
					SET @query2=@proc2
					EXEC @query2
					PRINT 'Do executed'
				
					UPDATE Current_Version SET currentVersion=@vFrom2+1
					PRINT 'Updated version'
				END
			
				FETCH NEXT
				FROM versionCursor2
				INTO @proc2,@vTo2,@vFrom2
				PRINT 'Fetched next'

			END

			

			CLOSE versionCursor2
			DEALLOCATE versionCursor2
			PRINT 'Cursor deallocated'
		END
	END
END
GO

EXEC modifyVersion 0
GO

SELECT * FROM Previous_Versions
SELECT * FROM Current_Version
GO

--a. modify the type of a column+undo for this operation

select *from Waiter

create PROCEDURE changeCustomerRatingType_2(@table varchar(50),@column varchar(50),@type varchar(50))
AS
BEGIN
	declare @query as varchar(MAX)
	set @query='alter table ' + @table + ' alter column '+ @column + ' ' + @type 
	exec (@query)
END


EXEC changeCustomerRatingType_2 @table=N'Waiter',@column=N'rating',@type=N'char'
GO



create PROCEDURE changeCustomerRatingType_3(@table varchar(50),@column varchar(50),@type varchar(50))
AS
BEGIN
	declare @query as varchar(MAX)
	set @query='alter table ' + @table + ' alter column '+ @column + ' ' + @type 
	exec (@query)
END

EXEC changeCustomerRatingType_3 @table=N'Waiter',@column=N'rating',@type=N'decimal'





select *from Delivery_People
--b. add / remove a column

create or alter procedure DefaultConstraint_1(@tablename varchar(100),@column varchar(100),@defaultvalue varchar(50),@constraintname varchar(100))
as
begin
	declare @query as varchar(MAX)
	set @query = CONCAT('ALTER TABLE ',@tablename,' ADD CONSTRAINT ',@constraintname,' DEFAULT ',@defaultvalue, ' FOR ',@column)
	print(@query)
	exec(@query)
end


exec DefaultConstraint_1 @tablename=N'Delivery_People',@column=N'salary''',@defaultvalue=N'''1800',@constraintname=N'minim_salary'

insert into Delivery_People(deliverID,name,rating,phoneNumber) values(11,'Razvan',4.25,'0')

select *from Delivery_People


create or alter procedure Undo_DefaultConstraint(@tablename varchar(100),@constraintname varchar(100))
as
begin
	declare @query as varchar(100)
	set @query = CONCAT('ALTER TABLE ',@tablename,' DROP CONSTRAINT ',@constraintname)
	print(@query)
	exec (@query)
end


exec Undo_DefaultConstraint @tablename=N'Delivery_People',@constraintname=N'minim_salary'


--c)add and rollback operation for create table in sql

create or alter procedure addTable (@Tablename varchar(100), @ColumnName varchar(50), @ColumnDataType varchar(100), @Nullable varchar(100))
as
begin
    declare @query as varchar(100)
    set @query = CONCAT('create table ' , @TableName , '( '+@ColumnName+' ' + @ColumnDataType +' '+@Nullable +')')
    print(@query)
    exec (@query)
end

exec addTable 'ProcedureProbing', 'namecolumn', 'varchar(100)', 'not null'

select *from ProcedureProbing

create or alter procedure Undo_addTable (@Tablename varchar(100))
as
begin
    declare @query as varchar(100)
    set @query = CONCAT('DROP TABLE ' , @TableName )
    print(@query)
    exec (@query)
end

exec Undo_addTable @tablename=N'ProcedureProbing'

select *from ProcedureProbing

--d)procedure for adding a column and undo
create or alter procedure addColumn (@Tablename varchar(100), @ColumnName varchar(50), @ColumnDataType varchar(100), @Nullable varchar(100))
as
begin
    declare @query as varchar(100)
    set @query = CONCAT('ALTER TABLE ' , @TableName +' ADD '+@ColumnName+' ' + @ColumnDataType +' '+@Nullable )
    print(@query)
    exec (@query)
end


exec addColumn @Tablename=N'ProcedureProbing',@ColumnName=N'column1',@ColumnDataType=N'smallint',@Nullable=N'NOT NULL'

select *from ProcedureProbing

create or alter procedure Undo_addColumn (@Tablename varchar(100), @ColumnName varchar(50))
as
begin
    declare @query as varchar(100)
    set @query = CONCAT('ALTER TABLE ' , @TableName +' DROP COLUMN '+@ColumnName+' ')
    print(@query)
    exec (@query)
end

exec Undo_addColumn @Tablename=N'ProcedureProbing',@ColumnName=N'column1'

select *from ProcedureProbing

--e)foreign key procedure and undo for this operation

select *from Order_Delivery

select *from Chef

select *from ProcedureProbing

--create or alter procedure addForeignKey (@TabelName varchar(100), @ForeignTabelName varchar(100) , @ConstraintName varchar(100), @Column varchar(100), @ForeignColumn varchar(100))
--as
--begin
 --   declare @query as varchar(MAX)
   -- set @query = 'ALTER TABLE ' + @TabelName + ' ADD CONSTRAINT ' + @ConstraintName + ' FOREIGN KEY (' + @Column + ') REFERENCES ' + @ForeignTabelName + '(' + @ForeignColumn + ')'
   -- print(@query)
   -- exec(@query)
--end
--go



--exec addForeignKey 'ProcedureProbing', 'Delivery_People', 'ConstraintWithDeliveryPeople', 'namecolumn', 'ID'


--e)add and rollback function for foreign key procedure
create or alter procedure addForeignKey (@tabelname varchar(100), @foreigntabelname varchar(100) , @constraintname varchar(100), @column varchar(100), @foreigncolumn varchar(100))
as
begin
    declare @query as varchar(max)
    set @query = 'alter table ' + @tabelname + ' add constraint ' + @constraintname + ' foreign key (' + @column + ') references ' + @foreigntabelname + '(' + @foreigncolumn + ')'
    print(@query)
    exec(@query)
end
go

select * from ProcedureProbing
exec addForeignKey 'ProcedureProbing', 'Waiter', 'ConstraintWithWaiterID', 'column1', 'waiterID'

create or alter procedure deleteForeignKey (@tabelname varchar(100), @constraintname varchar(100))
as
begin
	declare @query as varchar(max)
	set @query = 'alter table ' + @tabelname + ' drop constraint ' + @constraintname
    print(@query)
    exec(@query)
end
go

exec deleteForeignKey 'ProcedureProbing', 'ConstraintWithWaiterID'

select *from Waiter


create or alter PROCEDURE newTable(@tableName varchar(20), @ID varchar(20))
as
    begin
    declare @sqlQuery as varchar(MAX)
    set @sqlQuery = 'create table ['+@tableName+'](['+@ID+'] SMALLINT PRIMARY KEY)'
        print (@sqlQuery)
    exec (@sqlQuery)
    end
go

select *from Table1
drop table Table1


--a)create a table procedure
exec newTable 'Table1','ID'
--b)create a table procedure
exec addColumn @Tablename=N'Table1',@ColumnName=N'name',@ColumnDataType=N'smallint',@Nullable=N'NOT NULL'
--c)create a foreig key procedure
exec addForeignKey 'Table1','Waiter','ConstraintWithWaiterID','name','waiterID'
--d)create a procedure to change the type of a column from a table
exec changeCustomerRatingType_2 @table=N'Table1',@column=N'name',@type=N'smallint'
--e)procedure to create a constraint default value
exec DefaultConstraint_1	'Table1','name','100','minim_name'

select *from Table1


exec DefaultConstraint_1 @tablename=N'Delivery_People',@column=N'salary',@defaultvalue=N'1800',@constraintname=N'minim_salary'
select *from Delivery_People
select *from Table1
insert into Table1(ID,column1,name) values(1,2,100)