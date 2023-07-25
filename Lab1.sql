Use Restaurant__

EXEC sp_helpdb Restaurant__

ALTER DATABASE Restaurant__
Modify Name = Restaurant;  

Use Restaurant

EXEC sp_helpdb Restaurant

CREATE TABLE Position
(
IdPosition INT NOT NULL PRIMARY KEY,
Nomination NVARCHAR(50) NOT NULL, 
PositionDescription NVARCHAR(300) NOT NULL
)

CREATE TABLE Employee
(
IdEmployee INT NOT NULL PRIMARY KEY,
Surname NVARCHAR(50) NOT NULL, 
FirstName NVARCHAR(50) NOT NULL, 
Patronymic NVARCHAR(50) NOT NULL, 
BirthDay Date NOT NULL,
BirthPlace NVARCHAR(50) NOT NULL,
IdPosition INT NOT NULL FOREIGN KEY REFERENCES Position(IdPosition),
Salary INT NOT NULL,
Premium INT NOT NULL,
PaymentDay NVARCHAR(2) NOT NULL
)

CREATE TABLE Score
(
IdScore INT NOT NULL PRIMARY KEY,
IdEmployee INT NOT NULL FOREIGN KEY REFERENCES Employee(IdEmployee),
NumberTable INT NOT NULL,
ScoreDay DATE NOT NULL,
ScoreTime TIME NOT NULL,
ScoreSum INT NOT NULL
)

CREATE TABLE Dish
(
IdDish INT NOT NULL PRIMARY KEY,
DishName NVARCHAR(50) NOT NULL, 
Volume FLOAT NOT NULL,
Measure NVARCHAR(50) NOT NULL,
Price INT NOT NULL
)

CREATE TABLE Product
(
IdProduct INT NOT NULL PRIMARY KEY,
ProductName NVARCHAR(50) NOT NULL, 
ProductDescription NVARCHAR(300) NOT NULL
)

CREATE TABLE Composition
(
IdComposition INT NOT NULL PRIMARY KEY,
IdProduct INT NOT NULL FOREIGN KEY REFERENCES Product(IdProduct),
IdDish INT NOT NULL FOREIGN KEY REFERENCES Dish(IdDish),
Number INT NOT NULL,
Measure INT NOT NULL,
)

CREATE TABLE Orders
(
IdOrder INT NOT NULL PRIMARY KEY,
IdScore INT NOT NULL FOREIGN KEY REFERENCES Score(IdScore),
IdDish INT NOT NULL FOREIGN KEY REFERENCES Dish(IdDish),
NumberDish INT NOT NULL
)


ALTER TABLE Employee
ADD TotalMoney AS Salary + Premium persisted

INSERT INTO Position
Values (1, 'Менеджер', 'відповідає за ресторан'),
(2, 'Адміністратор', 'відповідає за практичну економію ресторану'),
(3, 'Офіціант', 'відповідають за доставку замовлень на кухню та доставку страв, коли вони будуть готові'),
(4, 'Бігун', 'спеціально відповідають за подачу страв до столу'),
(5, 'Ресепшн', 'це особа, яка відповідає за прийом відвідувачів і перевірку їх бронювання - також регулює їх вхід та дрес -код'),
(6, 'Баріста', 'це людина, яка займається приготуванням напоїв, таких як кава, інші настої, коктейлі, смузі тощо'),
(7, 'Кухар', 'відповідає за виконання всіх замовлень')

ALTER TABLE Employee
ALTER COLUMN PaymentDay NVARCHAR(2);

INSERT INTO Employee
Values (1,'Джошуа','Вілсон','Вінтер','3-27-1998','Київ',1,19061,705,'22'),
(2,'Уоллес','Пауерс','Джошуа','4-6-1982','Харків',2,12207,1494,'20'),
(3,'Гектор','Грант','Рут','4-5-1999','Одесcа',3,4172,788,'6'),
(4,'Івонна','Сандовал','Ташья','1-20-1982','Дніпро',4,3039,549,'19'),
(5,'Йоланда','Осборн','Кей','6-18-1995','Львів',3,8266,514,'2'),
(6,'Оуен','Каннінгем','Томас','10-2-1996','Львів',5,7163,811,'10'),
(7,'Брок','Майерс','Саманта','6-20-1995','Київ',3,6554,746,'24'),
(8,'Міра','Браунінг','Карлі','2-23-1990','Херсон',4,3804,1310,'9'),
(9,'Ульрік','Гарсія','Елвіс','4-18-1993','Суми',6,9643,644,'25'),
(10,'Частіті','Дікерсон','Майлз','4-6-1990','Житомир',7,14651,1105,'9')

INSERT INTO Product
Values (1, 'Картопля', 'вид рослин родини пасльонових, поширена сільськогосподарська культура'),
(2, 'Цибуля', 'цибулини і листя використовуються як приправа в консервній промисловості, до салатів, вінегретів, грибів, овочевих і м’ясних страв, а також як пряно-вітамінна закуска і смакова добавка до супів, соусів, підливи, фаршів.'),
(3, 'Сіль', 'кухонна сіль використовується в кулінарії'),
(4, 'Макарони', 'популярна страва з тіста'),
(5, 'Капуста', 'капуста є одним з найдоступніших і найуніверсальніших овочів у приготуванні — її можна смажити, тушкувати, запікати, засолювати та багато іншого'),
(6, 'Курка', 'курку можна готувати різними способами'),
(7, 'Морква', 'морква - це овочі, які ростуть під землею, переважно споживається корінь і в ньому переважають складні вуглеводи зараз близько 2,5% клітковина'),
(8, 'Яблуко', 'одне яблуко в день позитивно впливає на всі види обміну речовин'),
(9, 'Вівсянка', 'каша, що готується з вівсяних пластівців (або вівсяного борошна)'),
(10, 'Яйце', 'яйце складається з білка та жовтка. Жовток містить білки, а також жири й холестерин')

INSERT INTO Dish
Values (1, 'Пісні котлети', 471.94,'грам', 953),
(2, 'Запечені спагетті', 380.68,'грам', 599),
(3, 'Пиріжки з капустою', 390.96,'грам', 654),
(4, 'Макарона запіканка з овочами', 549.54,'грам', 328),
(5, 'Вінігрет', 414.47,'грам', 249),
(6, 'Вітаміний перекус', 748.65,'грам', 865),
(7, 'Оладки', 110.34,'грам', 205),
(8, 'Суп', 887.78,'грам', 819),
(9, 'Гранола', 436.04,'грам', 636),
(10, 'Куряча запіканка', 350.23,'грам', 248)

INSERT INTO Composition
Values (1, 1, 1, 5, 'штук'),
(2, 1, 2, 2, 'штук'),
(3, 1, 3, 364, 'грам'),
(4, 2, 4, 346, 'грам'),
(5, 3, 5, 1, 'штук'),
(6, 4, 4, 226, 'грам'),
(7, 4, 10, 3, 'штук'),
(8, 4, 8, 328, 'грам'),
(9, 5, 1, 6, 'штук'),
(10, 6, 8, 565, 'грам'),
(11, 6, 9, 10, 'штук'),
(12, 7, 9, 12, 'штук'),
(13, 7, 10, 7, 'штук'),
(14, 8, 7, 4, 'штук'),
(15, 8, 1, 9, 'штук'),
(16, 8, 2, 2, 'штук'),
(17, 9, 8, 240, 'грам'),
(18, 9, 9, 5, 'штук'),
(19, 10, 6, 1, 'штук'),
(20, 10, 7, 5, 'штук'),
(21, 10, 2, 2, 'штук'),
(22, 10, 10, 2, 'штук')

INSERT INTO Score
Values (1, 7,5,'9-29-2022','2:53',2933),
(2, 3,7,'2-15-2022','11:49',3048),
(3, 8,11,'5-28-2022','3:49',2590),
(4, 6,9,'4-30-2023','4:12',3572),
(5, 7,7,'2-12-2022','12:14',1335),
(6, 3,3,'7-20-2022','5:00',2987),
(7, 6,3,'6-29-2022','8:19',2572),
(8, 5,4,'2-20-2022','11:33',3017),
(9, 6,9,'3-7-2022','5:58',1443),
(10, 7,6,'10-6-2023','7:31',2994)

INSERT INTO Orders 
Values (1, 6,1,1),
(2, 6,8,1),
(3, 3,9,2),
(4, 1,6,2),
(5, 1,2,2),
(6, 10,9,2),
(7, 1,4,2),
(8, 5,3,2),
(9, 4,5,1),
(10, 7,6,2),
(11, 2,4,2),
(12, 8,7,1),
(13, 9,4,3),
(14, 9,7,5),
(15, 3,10,4)