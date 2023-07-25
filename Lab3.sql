use Restaurant
----------------1------------------------
Select *
from Product
where ProductName like '������'
------------------2---------------------
select *
from Position
where Nomination like '��������'
-----------------3--------------------
select Surname as '�������', FirstName as '��`�', Patronymic as '��-�������'
from Employee
------------------4---------------------
select NumberTable as '� �������', ScoreDay as '���� ����������', IdEmployee '������������� �����������'
from Score
Order by NumberTable desc
-----------------5------------------------
select *
from Employee 
cross join Position 
Order by Employee.FirstName
----------------6-------------------------
select *
from Dish
cross join Product
Order by Dish.DishName
----------------7-------------------------------
select d.DishName as '����� ������', d.IdDish as '������������� ������', d.Volume as '��''��', d.Measure as '����������', d.Price as '����', p.IdProduct as '������������� ��������', p.ProductName as '����� ��������', p.ProductDescription as '���� ��������'
from Dish d
cross join Product p
Order by d.DishName
--------------8----------------------------
select Employee.Surname as '�������', Employee.FirstName as '��`�', Employee.Patronymic as '��-�������', Position.Nomination as '������'
from Employee, Position
where Employee.IdPosition = Position.IdPosition

select Employee.Surname as '�������', Employee.FirstName as '��`�', Employee.Patronymic as '��-�������', Position.Nomination as '������'
from Employee
join Position on Employee.IdPosition = Position.IdPosition
----------------9---------------------------
select Employee.Surname as '�������', Employee.FirstName as '��`�', Employee.Patronymic as '��-�������', Score.NumberTable as '������ �'
from Employee, Score
where Employee.IdEmployee = Score.IdEmployee and Score.NumberTable = 1

select Employee.Surname as '�������', Employee.FirstName as '��`�', Employee.Patronymic as '��-�������', Score.NumberTable as '������ �'
from Employee
join Score on Employee.IdEmployee = Score.IdEmployee
where Score.NumberTable = 1
-------------------10--------------------------
select Employee.Surname, Employee.FirstName, Employee.Patronymic, Position.Nomination, Employee.BirthPlace, Employee.Salary
from Employee
join Position on Position.IdPosition = Employee.IdPosition
where Employee.BirthPlace like '���' or Employee.BirthPlace like '������'
Order by Employee.Surname
-------------------11--------------------------------
select Employee.Surname, Employee.FirstName, Employee.Patronymic, Position.Nomination, Employee.BirthPlace, Employee.BirthDay, Employee.Premium
from Employee
join Position on Position.IdPosition = Employee.IdPosition
where Employee.Premium between 620 and 800 or Employee.Premium is null
Order by Employee.Surname, Employee.Premium
-----------------12----------------------------------
select d.DishName, o.NumberDish, s.ScoreDay, e.Surname, e.FirstName, e.Patronymic, p.Nomination
from Orders o
join Score s on o.IdScore = s.IdScore
join Dish d on d.IdDish = o.IdDish
join Employee e on e.IdEmployee = s.IdEmployee
join Position p on p.IdPosition = e.IdPosition
Order by e.Surname
----------------13---------------------------------
select d.DishName, o.NumberDish, s.NumberTable, s.ScoreSum, s.ScoreDay
from Orders o
join Score s on o.IdScore = s.IdScore
join Dish d on d.IdDish = o.IdDish
Where s.ScoreSum > 2500 and s.ScoreDay between '2015-03-01' and '2015-06-01'
---------------14-----------------------------------
select Employee.Surname, Employee.FirstName, Employee.Patronymic, Position.Nomination, Score.ScoreDay, Score.NumberTable
from Employee
join Score on Employee.IdEmployee = Score.IdEmployee
join Position on Employee.IdPosition = Position.IdPosition
where Score.NumberTable not in (1, 2)
------------15--------------------------------------
select Employee.Surname, Employee.FirstName, Employee.Patronymic, Position.Nomination, Score.NumberTable, Orders.NumberDish, Product.ProductName
from Employee
join Score on Employee.IdEmployee = Score.IdEmployee
join Position on Employee.IdPosition = Position.IdPosition
join Orders on Score.IdScore = Orders.IdScore
join Dish on Dish.IdDish = Orders.IdDish
join Composition on Composition.IdDish = Dish.IdDish
join Product on Product.IdProduct = Composition.IdProduct
Order by Employee.Surname
-------------------16---------------------------------
select p.Nomination as '����� ������', COUNT(e.IdEmployee) as 'ʳ������ �����������'
from Position p
join Employee e on p.IdPosition = e.IdPosition
group by p.Nomination
--------------------17-------------------------------------
select p.ProductName, Count(d.IdDish)
from Product p
join Composition on Composition.IdProduct = p.IdProduct
join Dish d on d.IdDish = Composition.IdDish
where d.Price = 570
group by p.ProductName
--------------------18---------------------------------------
select Employee.Surname, Employee.FirstName, Employee.Patronymic, Position.Nomination, Score.NumberTable, Orders.NumberDish, Count(Composition.IdProduct)
from Employee
join Score on Employee.IdEmployee = Score.IdEmployee
join Position on Employee.IdPosition = Position.IdPosition
join Orders on Score.IdScore = Orders.IdScore
join Dish on Dish.IdDish = Orders.IdDish
join Composition on Composition.IdDish = Dish.IdDish
join Product on Product.IdProduct = Composition.IdProduct
where Position.Nomination like '��������'
group by Employee.Surname, Employee.FirstName, Employee.Patronymic, Position.Nomination, Composition.IdDish, Score.NumberTable, Orders.NumberDish
-----------------------19--------------------------------
select d.DishName, e.Surname, e.FirstName, e.Patronymic, s.ScoreDay
from Dish d
join Orders o on o.IdDish = d.IdDish
join Score s on s.IdScore = o.IdScore
join Employee e on e.IdEmployee = s.IdEmployee
where s.ScoreDay Between '2022-06-01' and '2022-06-07'
order by d.DishName, e.Surname
-----------------------------------20---------------------
select Position.Nomination, Employee.FirstName
from Position
left join Employee on Position.IdPosition = Employee.IdPosition
---------------------------21----------------------------------
select e.FirstName, e.Surname, e.Patronymic, s.NumberTable
from Employee e
left join Score s on s.IdEmployee = e.IdEmployee 