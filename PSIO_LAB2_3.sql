SELECT e.FirstName, e.LastName, e.Phone
FROM Employees  e
join [Employees in Branches] i on i.EmployeeID = e.EmployeeID
join Branches b on b.BranchID = i.BranchID
where b.BranchID between 2 and 6 and e.BirthDate > '1981-01-01'


		UNION all

SELECT e.FirstName, e.LastName, e.Phone
FROM Employees  e 
WHERE e.BirthDate > '1981-01-01'
