use Restaurant
----------------1------------------------
Select *
from Product
where ProductName like 'морква'
------------------2---------------------
select *
from Position
where Nomination like 'офіціант'
-----------------3--------------------
select Surname as 'прізвище', FirstName as 'ім`я', Patronymic as 'по-батькові'
from Employee
------------------4---------------------
select NumberTable as '№ столику', ScoreDay as 'дата замовлення', IdEmployee 'ідентифікатор співробітника'
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
select d.DishName as 'назва страви', d.IdDish as 'індетифікатор страви', d.Volume as 'об''єм', d.Measure as 'вимірювання', d.Price as 'ціна', p.IdProduct as 'індетифікатор продукту', p.ProductName as 'назва продукту', p.ProductDescription as 'опис продукту'
from Dish d
cross join Product p
Order by d.DishName
--------------8----------------------------
select Employee.Surname as 'прізвище', Employee.FirstName as 'ім`я', Employee.Patronymic as 'по-батькові', Position.Nomination as 'посада'
from Employee, Position
where Employee.IdPosition = Position.IdPosition

select Employee.Surname as 'прізвище', Employee.FirstName as 'ім`я', Employee.Patronymic as 'по-батькові', Position.Nomination as 'посада'
from Employee
join Position on Employee.IdPosition = Position.IdPosition
----------------9---------------------------
select Employee.Surname as 'прізвище', Employee.FirstName as 'ім`я', Employee.Patronymic as 'по-батькові', Score.NumberTable as 'Столик №'
from Employee, Score
where Employee.IdEmployee = Score.IdEmployee and Score.NumberTable = 1

select Employee.Surname as 'прізвище', Employee.FirstName as 'ім`я', Employee.Patronymic as 'по-батькові', Score.NumberTable as 'Столик №'
from Employee
join Score on Employee.IdEmployee = Score.IdEmployee
where Score.NumberTable = 1
-------------------10--------------------------
select Employee.Surname, Employee.FirstName, Employee.Patronymic, Position.Nomination, Employee.BirthPlace, Employee.Salary
from Employee
join Position on Position.IdPosition = Employee.IdPosition
where Employee.BirthPlace like 'київ' or Employee.BirthPlace like 'одесса'
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
select p.Nomination as 'Назва посади', COUNT(e.IdEmployee) as 'Кількість співробітників'
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
where Position.Nomination like 'офіціант'
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