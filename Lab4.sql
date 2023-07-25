use Restaurant
--------------------1----------------------
SELECT distinct Surname,FirstName 
From Employee
WHERE IdEmployee in (SELECT IdEmployee from Score)
Order by Surname asc
------------------2----------------------------
SELECT distinct Surname,FirstName 
From Employee
WHERE IdEmployee not in (SELECT IdEmployee from Score)
Order by Surname asc
----------------------3--------------------------------------------------------------
SELECT distinct ProductName 
from Product
where IdProduct not in (select IdProduct from Composition)
Order by ProductName asc
----------------------------------------4-----------------------------------
SELECT distinct p.Nomination
from Position p
join Employee e on p.IdPosition = e.IdPosition
WHERE e.IdEmployee in (SELECT IdEmployee from Score)
Order by p.Nomination asc
--------------------------5-----------------------------------------------------------
SELECT distinct DishName 
from Dish 
Where IdDish  not in (select IdDish from Orders)
Order by DishName asc
----------------------------6------------------------------------
select distinct e.Surname, e.FirstName, e.Patronymic, e.Salary, p.Nomination
from Employee e
join Position p on p.IdPosition = e.IdPosition
where IdEmployee in (	
						select IdEmployee
						from Score
						where NumberTable = 3
					)
Order by e.Surname asc
---------------------------7-------------------------------------------------------
SELECT DishName, Price 
from Dish
Where IdDish in (
					SELECT IdDish 
					from Composition 
					where IdProduct in (
										SELECT IdProduct 
										from Product 
										where ProductName='Капуста'
										)
				)

SELECT d.DishName, d.Price 
from Dish d
Join Composition c on d.IdDish=c.IdDish
Join Product p on c.IdProduct=p.IdProduct where ProductName='Капуста'
--------------------8-------------------------------------------------------------
select e.Surname, e.FirstName, e.Patronymic, e.Salary, e.Premium, p.Nomination
from Employee e 
join Position p on p.IdPosition = e.IdPosition
where e.Premium >= 800 and e.Salary > (
										select avg(Salary)
										from Employee
									  )
----------------------------9-------------------------------------------------------------
SELECT s.NumberTable ,s.ScoreDay, e.Surname, e.FirstName, e.Patronymic, s.ScoreSum 
from Score s
Join Employee e on e.IdEmployee=s.IdEmployee
where s.ScoreSum >= (select avg(ScoreSum) from Score)
-----------------------10------------------------------------------------
select e.FirstName
from Employee e
join Score s on e.IdEmployee = s.IdEmployee
Group by e.FirstName
Having avg(s.ScoreSum) > (
							select avg(ScoreSum)
							from Score
						 )
-----------------------------11-----------------------------------------------------------

SELECT * 
From Employee
where BirthPlace like (
						select BirthPlace 
						from Employee 
						where IdEmployee=12
					  )
----------------------------------------12--------------------------------
select distinct *
from Employee
where IdPosition = (
					select IdPosition
					from Employee
					where Patronymic like 'Іванов'
				   )
	  and Salary > (
					select avg(Salary)
					from Employee
				   )
Order by FirstName desc
------------------------------13-------------------------------------------------------------
Select s.NumberTable , s.IdEmployee 
from Score as s
where s.IdEmployee in (
						select s.IdEmployee 
						from Score as s 
						where s.NumberTable=3
					  )
-------------------------14-----------------------------------------------
select Count(f.IdPosition) as 'Кількість посад'
from (
		select IdPosition
		from Employee
		Group by IdPosition 
		Having Count(IdEmployee) > 4
	 ) f
-------------------------------15-------------------------------------------------------
select count(f.IdDish) as 'Кількість страв'
from (
		select IdDish 
		from Composition
		group by IdDish
		having count(IdProduct) > 8 
	 ) f
--------------------------------------16-------------------------------------
select Count(e.IdEmployee) as 'Кількість співробітників на посаді'
from (
		select Count(s.IdScore) as NumberScore, e.IdPosition, s.NumberTable
		from Employee e
		join Score s on e.IdEmployee = s.IdEmployee
		Group by e.IdPosition, s.NumberTable
		Having Count(s.IdScore) > 1
	 ) f
join Employee e on e.IdPosition = f.IdPosition
Group by e.IdPosition
---------------------------------17-------------------------------------------------------
select x.Surname , x.FirstName , x.AverageOnEmployee , x.Nomination , y.AverageOnPosition
from (
		select e.Surname, e.FirstName, p.Nomination , avg(s.ScoreSum) as AverageOnEmployee, e.IdPosition
		from Employee e
		Join Position p on p.IdPosition=e.IdPosition
		Join Score s on s.IdEmployee=e.IdEmployee
		group by e.Surname, e.FirstName, p.Nomination,  e.IdPosition
	  ) as x ,
	  (
		select avg(ScoreSum) as AverageOnPosition,  e.IdPosition, p.Nomination
		from Score s
		join Employee e on s.IdEmployee=e.IdEmployee
		Join Position p on p.IdPosition=e.IdPosition
		Group by e.IdPosition, p.Nomination
	  ) as y
where x.AverageOnEmployee > y.AverageOnPosition and x.IdPosition = y.IdPosition
------------------------------------18------------------------------
select round(avg(f.MaxScore), 2) as 'середня сума замовлень співробітника', e.FirstName, e.Surname, e.Patronymic, e.IdEmployee
from (
		select max(ScoreSum) as MaxScore, IdEmployee, ScoreDay
		from Score
		group by IdEmployee, ScoreDay
	 ) f
join Employee e on e.IdEmployee = f.IdEmployee
Group by e.IdEmployee, e.FirstName, e.Surname, e.Patronymic
---------------------------------19------------------------------------------------
select * 
from Employee as e
where e.IdEmployee in (
						select IdEmployee 
						from Score 
						where NumberTable = 5
						Group by IdEmployee 
						Having Count(NumberTable) = 1
					  )
-----------------------------20-------------------------------------------
select *
from Dish
where IdDish in (
					select IdDish
					from Composition
					where IdProduct in ( 
										select IdProduct
										from Product
										where ProductName like 'Помідор'
									   )
						 or IdProduct in ( 
											select IdProduct
											from Product
											where ProductName like 'Огірок'
										 )
			     )