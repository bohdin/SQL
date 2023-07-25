use OBDZ;

create table FACULTY(
FacPK int Primary Key,
Name varchar(50) unique not null,
DeanFK int,
Building char(5),
Fund numeric(9,2),
CONSTRAINT FundCheck CHECK (Fund >= 100000),
CONSTRAINT BuildingCheck CHECK (Building in ('1', '2', '3', '4', '5', '6', '7', '8', '9', '10'))
)

create table DEPARTMENT(
DepPK int Primary Key,
FacFK int foreign key references FACULTY(FacPK) on DELETE no action,
Name varchar(50) not NULL,
HeadFK int,
Building char(5),
Fund numeric(8,2),
constraint Unique_FacFK_name Unique (FacFK, Name),
CONSTRAINT BuildingCheck CHECK (Building in ('1', '2', '3', '4', '5', '6', '7', '8', '9', '10')),
CONSTRAINT FundCheck CHECK (Fund between 20000 and 100000)
)

create table TEACHER(
TchPK int Primary Key,
DepFK int Foreign Key references DEPARTMENT(DepPK) on DELETE set null,
Name varchar(50) not NULL,
Post varchar(20),
Tel char(7),
Hiredate date not null,
Salary numeric(6,2) not null,
Commission numeric(6,2) DEFAULT 0,
ChiefFK int foreign key  references TEACHER(TchPK) on DELETE set NULL,
CONSTRAINT PostCheck CHECK (Post in('assistant', 'counselor', 'assistant professor', 'professor')),
CONSTRAINT HiredateCheck CHECK 

)