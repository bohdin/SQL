use Taxi
DECLARE @integer INT, @fly_integer DECIMAL, @not_integer FLOAT
DECLARE @date_time DATETIME, @symbol CHAR, @bi BINARY
DECLARE @place GEOGRAPHY


DECLARE @middsalary int, @maxsalary int 
SElect @middsalary = Avg([AverageSalary]) 
from Driver
SElect @maxsalary = Max([AverageSalary]) 
from Driver
select @middsalary, @maxsalary


SET DATEFORMAT ymd
Declare @d Datetime
set @d = '2021.04.13 13:30:22' 
SET DATEFORMAT dmy
Declare @d2 Datetime
set @d2 = '13.12.2000 13:30:22'
select @d, @d2


declare @n int, @f float, @num Numeric(10,5), @f2 float
SEt @f = 200.51
set @num = 1245.345
set @n = cast(@f AS int)
set @f2 = cast(@num as float)
select @n, @f2

declare @str char(35)
IF @middsalary < 1500
begin
set @str = 'Середня зарплатння  =' + str(@middsalary)
select @str
end
else 
begin
set @str = 'Середня зарплатня > 1500'
select @str
end


declare @i int, @a int
set @a = (select count(IdCar) from Car)
set @i = @a
While @i<=20
Begin
if @i <= @a
set @i = @i+1
else
begin
insert into Car
values (@i, 10, 6, 'null', 'null', 'null', 'null', '2001-01-01');
set @i = @i+1
end
end


Declare @x int, @y float
set @x = 2
select @y = SIN(1-@x*@x)+(2*@x)/(1-@x)
select @y

