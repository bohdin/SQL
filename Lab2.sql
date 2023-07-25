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
Where BirthPlace not like '���%'
--------------------------------------------------------
SELECT FirstName, Surname, Patronymic, Salary, IdEmployee, BirthPlace 
From Employee
Where (Premium = 300 and  BirthPlace like '���%') or BirthPlace like '�������%'
------------------------------------------------------------------
SELECT FirstName, Surname, Patronymic, Salary, IdEmployee, BirthPlace 
From Employee
Where Premium = 300 and  (BirthPlace like '���%' or BirthPlace like '�������%')
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
Where DishName like '���%'
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
SELECT COUNT(IdProduct) as '�-�� ��������'
From Product
--------------------------------------------------------------------------------
SELECT COUNT(FirstName) as '�-�� ���� �����������'
From Employee
------------------------------------------------------------------------------
SELECT COUNT(Patronymic) as '�-�� ��-������� �����������'
From Employee
--------------------------------------------------------------------------------
SELECT COUNT(IdEmployee) as '�-�� �����������', min(Salary) as '��������� �����', max(Salary) as '������������ �����', avg(Salary) as '������� �����'
From Employee
----------------------------------------------------------------------------------
SELECT p.PositionDescription as '���������� ��� ������', Count(e.IdEmployee) as '�-�� �����������', min(Salary) as '��������� �����', max(Salary) as '������������ �����', avg(Salary) as '������� �����'
From Position p 
JOIN Employee e on p.IdPosition = e.IdPosition
Where e.PaymentDay like '_'
Group by p.PositionDescription
------------------------------------------------------------------------------------
SELECT COUNT(distinct Surname) as '�-�� ������ ����������� �� �� ������������'
From Employee
----------------------------------------------------------------------------------------
SELECT COUNT(FirstName) as '�-�� ���� ����������� �� ����� �'
From Employee
Where FirstName like '�%'
--------------------------------------------------------------------
SELECT BirthPlace as '̳���', COUNT(FirstName) as '�-�� ���� �����������'
From Employee
Group by BirthPlace
-------------------------------------------------------------------
SElECT NumberTable as '� �������', COUNT(IdEmployee) as '������� �����������', COUNT(ScoreSum) as '������� �������'
From Score
Group by NumberTable
-----------------------------------------------------------------------
SElECT NumberTable as '� �������', COUNT(IdEmployee) as '������� �����������'
From Score 
Where ScoreSum = 500
Group by NumberTable
-------------------------------------------------------------
SELECT ScoreDay as '����', Count(IdScore) as 'ʳ������ �������'
From Score
Group by ScoreDay
Order By ScoreDay
---------------------------------------------------------------
SELECT ScoreDay as '����', Count(IdScore) as 'ʳ������ �������'
From Score
Group by ScoreDay
having Count(IdScore) >= 50
Order By ScoreDay
--------------------------------------------------------------
SELECT BirthPlace as '̳���', avg(Salary) as '������� �����'
From Employee
where BirthDay between '1945-01-01' and '1965-12-31'
Group by BirthPlace
-----------------------------------------------------------------
select count(Patronymic) as '�-�� ��-�������'
from Employee

select count(distinct Patronymic) as '�-�� ��-������� �� �� ������������'
from Employee

select count(Patronymic) as '������� �����, � ���� ������ ���������'
from Employee
where Patronymic is null
---------------------------------------------------------------------
select IdOrder
From Orders
group by IdOrder
having avg(NumberDish) > 3
-----------------------------------------------------------------------
select avg(TotalMoney) as '������ �������'
from Employee
group by IdEmployee
having avg(TotalMoney) > 4500