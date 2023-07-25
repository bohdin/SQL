use Restaurant
-------------------------1--------------------------
select d.DishName , d.Price from Dish as d
union all
select p.ProductName, p.Price from Product as p
----------------------------2-------------------------
select d.DishName , d.Price from Dish as d
union
select p.ProductName, p.Price from Product as p
------------------------------3-------------------------
select day(s.ScoreDay) from Score as s
except
select e.PaymentDay from Employee as e
---------------------------4------------------------------
select day(s.ScoreDay) from Score as s
union
select e.PaymentDay from Employee as e
-------------------------------5------------------------------
select d.IdDish, d.DishName 
From Dish as d
join Composition c on c.IdDish=d.IdDish
join Product p on p.IdProduct=c.IdProduct
where p.ProductName like 'Капуста'
intersect
select d.IdDish, d.DishName 
From Dish as d
join Composition c on c.IdDish=d.IdDish
join Product p on p.IdProduct=c.IdProduct
where p.ProductName like 'Картопля'
--------------------------INSERT------------------------------
--------------------------6---------------------------
create database zkMyCopyRestaurant

use zkMyCopyRestaurant

CREATE TABLE ProductCopyA
(
IdProduct INT NOT NULL PRIMARY KEY,
ProductName NVARCHAR(50) NOT NULL, 
ProductDescription NVARCHAR(300) NOT NULL,
Price INT NOT NULL
)

CREATE TABLE ProductCopyB
(
IdProduct INT NOT NULL PRIMARY KEY,
ProductName NVARCHAR(50) NOT NULL, 
ProductDescription NVARCHAR(300) NOT NULL,
Price INT NOT NULL,
ProductNumber INT 
)

CREATE TABLE ProductCopyC
(
IdProduct INT NOT NULL PRIMARY KEY,
ProductName NVARCHAR(50) NOT NULL, 
ProductDescription NVARCHAR(300) NOT NULL,
Price INT NOT NULL
)
insert into ProductCopyA
select *
From Restaurant.dbo.Product

insert into ProductCopyB (IdProduct, ProductName, ProductDescription, Price)
select *
From Restaurant.dbo.Product
----------------------------------7----------------------------------------
insert into ProductCopyC
select *
From Restaurant.dbo.Product
where IdProduct > 4
--------------------------------8---------------------------------------
CREATE TABLE DishCopy
(
IdDish INT NOT NULL PRIMARY KEY,
DishName NVARCHAR(50) NOT NULL, 
Volume FLOAT NOT NULL,
Measure NVARCHAR(50) NOT NULL,
Price INT NOT NULL
)
Insert into DishCopy
select *
From Restaurant.dbo.Dish
where IdDish > 4 and IdDish < 8
-------------------------------9-----------------------------------------
CREATE TABLE ScoreCopy
(
IdScore INT NOT NULL PRIMARY KEY,
IdEmployee INT NOT NULL,
NumberTable INT NOT NULL,
ScoreDay DATE NOT NULL,
ScoreTime TIME NOT NULL,
ScoreSum INT NOT NULL
)
insert into ScoreCopy
select *
From Restaurant.dbo.Score
where NumberTable = 3
-------------------------------------10-----------------------------------
CREATE TABLE DishCopyNew
(
IdDish INT NOT NULL PRIMARY KEY,
DishName NVARCHAR(50) NOT NULL, 
Volume FLOAT NOT NULL,
Measure NVARCHAR(50) NOT NULL,
Price INT NOT NULL
)
insert into DishCopyNew
select *
from DishCopy
-----------------------------UPDATE-------------------------------------------
use Restaurant
------------------------11-------------------------------------------------------
UPDATE Employee
SET PaymentDay='05'
where Surname like 'Персиков'
--------------------------12----------------------------------------------
UPDATE Employee
SET BirthPlace='Одесса'
where IdEmployee between 5 and 10
------------------------------13------------------------------------------
Update Employee
SET Salary=Salary+Salary*0.25
where IdPosition in (select IdPosition from Position
					where Nomination like 'офіціант' or Nomination like 'бармен')
----------------------------14-------------------------------------------------
UPDATE Employee
SET Salary=Salary*1.7
Where Salary = (select min(Salary) from Employee)
-------------------------------15-------------------------------------------
UPDATE Employee
SET Salary=Salary*2
Where Salary = (select max(Salary) from Employee)
------------------------------16---------------------------------------------------------
alter table Employee
add DateOfEmploy date

update Employee
set DateOfEmploy = '2003-09-01'

update Employee
set DateOfEmploy = '2005-09-01'
where IdPosition in (select IdPosition from Position
					    where Nomination like 'Офіціант')
----------------------------------DELETE-----------------------------------------
----------------------------17-------------------------------------------------
delete from Score
where IdEmployee>3 and IdEmployee<5
----------------------------18----------------------------------------
delete from Score
WHERE IdEmployee in (select IdEmployee from Employee
						where BirthPlace like 'Одесса')
----------------------------19----------------------------------------------
delete from Employee
where IdEmployee > 4 and IdEmployee < 8