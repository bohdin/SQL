CREATE DATABASE "MainOffice"


set quoted_identifier on


SET DATEFORMAT mdy


USE "MainOffice"


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

CREATE TABLE "Supplier" (
  "SupplierID" INT IDENTITY (1, 1) PRIMARY KEY,
  "CompanyName" NVARCHAR (40) NOT NULL,
  "ContactName" NVARCHAR (40) NULL,
  "ContactTitle" NVARCHAR (40) NULL,
  "Address" NVARCHAR (200) NULL,
  "Phone" NVARCHAR (20) NOT NULL
);

CREATE TABLE "Shipper" (
  "ShipperID" INT IDENTITY (1, 1) PRIMARY KEY,
  "CompanyName" NVARCHAR (40) NOT NULL,
  "Email" NVARCHAR (20) NOT NULL
);

CREATE TABLE "PaymentOrder" (
  "PaymentOrderID" INT IDENTITY (1, 1) PRIMARY KEY,
  "Title" NVARCHAR (40) NOT NULL,
  "Description" NVARCHAR (1200) NULL,
  "CompanyName" NVARCHAR (40) NULL,
  "OrderDate" DATETIME NOT NULL,
  "PaymentAmount" MONEY NULL
);

CREATE TABLE "PaymentOrderDetails" (
  "SupplierContractID" INT PRIMARY KEY,
  "PaymentOrderID" INT FOREIGN KEY REFERENCES "PaymentOrder"("PaymentOrderID") ON DELETE CASCADE ON UPDATE CASCADE,
  "SupplierID" INT FOREIGN KEY REFERENCES "Supplier"("SupplierID") ON DELETE CASCADE ON UPDATE CASCADE,
  "ShipperID" INT FOREIGN KEY REFERENCES "Shipper"("ShipperID") ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE "OrderDetails" (
  "SupplierContractID" INT FOREIGN KEY REFERENCES "PaymentOrderDetails"("SupplierContractID") ON DELETE CASCADE ON UPDATE CASCADE,
  "ProductID" INT FOREIGN KEY REFERENCES "Storage"("ProductID") ON DELETE CASCADE ON UPDATE CASCADE
);
go

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

CREATE TABLE "Tax payment order" (
	"TaxPaymentOrderID" INT IDENTITY (1, 1) PRIMARY KEY,
	"FinancialReportID" int foreign key references "Financial reports"("FinancialReportID") ON DELETE CASCADE ON UPDATE CASCADE,
	"Title" NVARCHAR (40) NOT NULL ,
	"Date" DATETIME NOT NULL,
	"Description" NVARCHAR (1200) NULL ,
	"Payment amount" MONEY NULL
)

CREATE TABLE "Branches" (
	"BranchID" INT IDENTITY (1, 1) PRIMARY KEY,
	"BranchName" NVARCHAR (20) NOT NULL ,
	"Address" NVARCHAR (200) NOT NULL ,
)

Create table "Employees in Branches"(
	"BranchID" int foreign key references "Branches"("BranchID") ON DELETE CASCADE ON UPDATE CASCADE,
	"EmployeeID" int unique foreign key references "Employees"("EmployeeID") ON DELETE CASCADE ON UPDATE CASCADE,
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


