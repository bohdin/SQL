USE Restaurant
--------------------------------------
SELECT * 
FROM Product

SELECT * 
FROM Dish

SELECT * 
FROM Position
--------------------------------------
SELECT DISTINCT FirstName, Surname, Patronymic, Salary 
FROM Employee
-----------------------------------------
SELECT DishName, Volume, IdDish 
From Dish
Where Price < 100
-------------------------------------------
SELECT FirstName, Surname, Patronymic, IdEmployee, BirthPlace 
From Employee
Where BirthPlace not like 'Київ%'
--------------------------------------------------------
SELECT FirstName, Surname, Patronymic, Salary, IdEmployee, BirthPlace 
From Employee
Where (Premium = 300 and  BirthPlace like 'Київ%') or BirthPlace like 'Житомир%'
------------------------------------------------------------------
SELECT FirstName, Surname, Patronymic, Salary, IdEmployee, BirthPlace 
From Employee
Where Premium = 300 and  (BirthPlace like 'Київ%' or BirthPlace like 'Житомир%')
--------------------------------------------------------------------
SELECT FirstName, Surname, Patronymic, BirthDay, IdEmployee 
From Employee
Where BirthDay not between '1989-01-01' and '1990-12-31'
------------------------------------------------------------------------
SELECT * 
From Score
Where IdEmployee in (4,6,3) and NumberTable in (1, 5)
----------------------------------------------------------------------------
SELECT * 
From Dish
Where DishName like 'Кар%'
--------------------------------------------------------------------------
SELECT *
FROM Score
Where ScoreDay like '2015-05-__' and ScoreSum >= 2000
--------------------------------------------------------------------------
SELECT *
FROM Employee
Where Patronymic is not null and Salary != 4000
-------------------------------------------------------------------------------
SELECT *
FROM Employee
Where Patronymic is null
---------------------------------------------------------------------
SELECT DISTINCT *
From Dish
Order by DishName desc, Price desc
-------------------------------------------------------------------------------
SELECT COUNT(IdProduct) as 'к-ть продуктів'
From Product
--------------------------------------------------------------------------------
SELECT COUNT(FirstName) as 'к-ть Імен Співробітників'
From Employee
------------------------------------------------------------------------------
SELECT COUNT(Patronymic) as 'к-ть По-батькові Співробітників'
From Employee
--------------------------------------------------------------------------------
SELECT COUNT(IdEmployee) as 'к-ть співробітників', min(Salary) as 'мінімальний оклад', max(Salary) as 'максимальний оклад', avg(Salary) as 'середній оклад'
From Employee
----------------------------------------------------------------------------------
SELECT p.PositionDescription as 'інформація про посаду', Count(e.IdEmployee) as 'к-ть співробітників', min(Salary) as 'мінімальний оклад', max(Salary) as 'максимальний оклад', avg(Salary) as 'середній оклад'
From Position p 
JOIN Employee e on p.IdPosition = e.IdPosition
Where e.PaymentDay like '_'
Group by p.PositionDescription
------------------------------------------------------------------------------------
SELECT COUNT(distinct Surname) as 'к-ть прізвищ Співробітників що не повторюються'
From Employee
----------------------------------------------------------------------------------------
SELECT COUNT(FirstName) as 'к-ть Імен Співробітників на літеру С'
From Employee
Where FirstName like 'С%'
--------------------------------------------------------------------
SELECT BirthPlace as 'Місто', COUNT(FirstName) as 'к-ть Імен Співробітників'
From Employee
Group by BirthPlace
-------------------------------------------------------------------
SElECT NumberTable as '№ столика', COUNT(IdEmployee) as 'кількість Співробітників', COUNT(ScoreSum) as 'кількість рахунків'
From Score
Group by NumberTable
-----------------------------------------------------------------------
SElECT NumberTable as '№ столика', COUNT(IdEmployee) as 'кількість Співробітників'
From Score 
Where ScoreSum = 500
Group by NumberTable
-------------------------------------------------------------
SELECT ScoreDay as 'Дата', Count(IdScore) as 'Кількість рахунків'
From Score
Group by ScoreDay
Order By ScoreDay
---------------------------------------------------------------
SELECT ScoreDay as 'Дата', Count(IdScore) as 'Кількість рахунків'
From Score
Group by ScoreDay
having Count(IdScore) >= 50
Order By ScoreDay
--------------------------------------------------------------
SELECT BirthPlace as 'Місто', avg(Salary) as 'середній оклад'
From Employee
where BirthDay between '1945-01-01' and '1965-12-31'
Group by BirthPlace
-----------------------------------------------------------------
select count(Patronymic) as 'к-ть по-батькові'
from Employee

select count(distinct Patronymic) as 'к-ть по-батькові що не повторюються'
from Employee

select count(Patronymic) as 'кількість людей, у яких відсутнє Побатькові'
from Employee
where Patronymic is null
---------------------------------------------------------------------
select IdOrder
From Orders
group by IdOrder
having avg(NumberDish) > 3
-----------------------------------------------------------------------
select avg(TotalMoney) as 'середні виплати'
from Employee
group by IdEmployee
having avg(TotalMoney) > 4500