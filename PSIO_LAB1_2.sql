CREATE DATABASE "TypicalBranch"


set quoted_identifier on


SET DATEFORMAT mdy

USE "TypicalBranch"


CREATE TABLE "Employees" (
	"EmployeeID" INT IDENTITY (1, 1) PRIMARY KEY,
	"LastName" NVARCHAR (20) NOT NULL ,
	"FirstName" NVARCHAR (10) NOT NULL ,
	"BirthDate" DATETIME NULL ,
	"Address" NVARCHAR (200) NULL ,
	"PostalCode" NVARCHAR (10) NULL ,
	"Phone" NVARCHAR (24) NULL ,
	"Notes" NVARCHAR NULL ,
	CONSTRAINT "CK_Birthdate" CHECK (BirthDate < getdate()),
)

CREATE TABLE "Financial reports" (
	"FinancialReportID" INT IDENTITY (1, 1) PRIMARY KEY ,
	"EmployeeID" int foreign key references "Employees"("EmployeeID") ON DELETE CASCADE ON UPDATE CASCADE,
	"Title" NVARCHAR (40) NOT NULL ,
	"Date" DATETIME NOT NULL,
	"Description" NVARCHAR (1200) NULL ,
	"Total income" MONEY not NULL ,
	"Total expenses" MONEY  not NULL,
	"Profit" as "Total income" - "Total expenses"
)

CREATE TABLE "Employment contracts" (
	"EmploymentContractID" INT IDENTITY (1, 1) PRIMARY KEY,
	"EmployeeID" INT foreign key references "Employees"("EmployeeID") ON DELETE CASCADE ON UPDATE CASCADE ,
	"Position" NVARCHAR (10) NOT NULL ,
	"HireDate" DATETIME NULL
)

CREATE TABLE "Salary documentation details" (
	"EmploymentContractID" INT foreign key references "Employment contracts"("EmploymentContractID") ON DELETE CASCADE ON UPDATE CASCADE ,
	"PaymentDate" DATETIME NULL ,
	"Salary" MONEY NOT NULL
)

CREATE TABLE "Orders" (
	"OrderID" INT IDENTITY (1, 1) PRIMARY KEY,
	"EmployeeID" INT,
	"OrderDate" DATETIME NOT NULL,
	FOREIGN KEY ("EmployeeID") REFERENCES "Employees" ("EmployeeID") ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE "Category" (
  "CategoryID" INT IDENTITY (1, 1) PRIMARY KEY,
  "CategoryName" NVARCHAR (20) NOT NULL,
  "CategoryDescription" NVARCHAR (300) NULL
);

CREATE TABLE "Storage"(
  "ProductID" INT IDENTITY (1, 1) PRIMARY KEY,
  "CategoryID" INT FOREIGN KEY REFERENCES "Category"("CategoryID") ON DELETE CASCADE ON UPDATE CASCADE,
  "ProductName" NVARCHAR (20) NOT NULL,
  "TotalQuantity" INT NOT NULL,
);

CREATE TABLE "Product" (
  "ProductSalesID" INT IDENTITY (1, 1) PRIMARY KEY,
  "ProductID" INT FOREIGN KEY REFERENCES "Storage"("ProductID") ON DELETE CASCADE ON UPDATE CASCADE,
  "Quantity" SMALLINT NOT NULL,
  "UnitPrice" MONEY NOT NULL,
  "ProductValue" AS ("UnitPrice" * "Quantity")
);

CREATE TABLE "OrderDetails" (
	"OrderID" INT,
	"ProductID" INT,
	FOREIGN KEY ("OrderID") REFERENCES "Orders" ("OrderID") ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY ("ProductID") REFERENCES "Product" ("ProductSalesID") ON DELETE CASCADE ON UPDATE CASCADE
);


