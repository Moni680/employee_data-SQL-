create database pratice_assignment
use pratice_assignment

--Step 1) Create Table
CREATE TABLE EmployeeSales (
    SaleID INT PRIMARY KEY,
    EmployeeID INT,
    Department VARCHAR(50),
    SaleAmount DECIMAL(10, 2),
    SaleDate DATE
);

--Step 2) Insert records into the table
INSERT INTO EmployeeSales (SaleID, EmployeeID, Department, SaleAmount, SaleDate)
VALUES 
(1, 101, 'Electronics', 500.00, '2023-08-01'),
(2, 102, 'Electronics', 300.00, '2023-08-03'),
(3, 101, 'Furniture', 150.00, '2023-08-02'),
(4, 103, 'Electronics', 250.00, '2023-08-04'),
(5, 104, 'Furniture', 200.00, '2023-08-02'),
(6, 101, 'Furniture', 450.00, '2023-08-05'),
(7, 102, 'Electronics', 700.00, '2023-08-05'),
(8, 103, 'Furniture', 100.00, '2023-08-06');


select * from EmployeeSales

--1) Write a query to calculate the total sales amount for each department in the EmployeeSales table.
select Department,sum(SaleAmount) as totalsales from EmployeeSales
group by Department

--2) Write a query to count the number of sales made by each employee.
select EmployeeID,count(SaleID) as salescount from EmployeeSales
group by EmployeeID

--3) Write a query to calculate the average sale amount for each department.

select Department,avg(SaleAmount) as totalsales from EmployeeSales
group by Department

--4) Write a query to find the total sales amount for each employee, but only include employees who have made more than one sale.
select EmployeeID,sum(SaleAmount) as totalsale from EmployeeSales
group by EmployeeID
HAVING COUNT(SaleID) > 1;

select * from EmployeeSales

--5) Write a query to find the total sales for each month in 2023.
select month(SaleDate)as month,sum(SaleAmount) as totalsales from EmployeeSales
where year(SaleDate)=2023
group by month(SaleDate)

SELECT MONTH(SaleDate) AS Month, SUM(SaleAmount) AS TotalSales

FROM EmployeeSales

WHERE YEAR(SaleDate) = 2023

GROUP BY MONTH(SaleDate);


--------------------------------TABLE 2------------------------------------------------------------------------------------------------------


 CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName NVARCHAR(50),
    LastName NVARCHAR(50),
    Email NVARCHAR(100) UNIQUE,
    DepartmentID INT,
    HireDate DATE,
    Salary DECIMAL(10, 2)
);


INSERT INTO Employees (EmployeeID, FirstName, LastName, Email, DepartmentID, HireDate, Salary)
VALUES 
(1, 'John', 'Smith', 'john.smith@example.com', 101, '2021-06-15', 75000.00),
(2, 'Jane', 'Doe', 'jane.doe@example.com', 102, '2020-03-10', 85000.00),
(3, 'Michael', 'Johnson', 'michael.johnson@example.com', 101, '2019-11-22', 95000.00),
(4, 'Emily', 'Davis', 'emily.davis@example.com', 103, '2022-01-05', 68000.00),
(5, 'William', 'Brown', 'william.brown@example.com', 102, '2018-07-19', 80000.00);

select * from Employees

---1) Write a SQL query to find the names of employees who have a salary higher than the average salary of all employees.
select FirstName,LastName
from Employees
where Salary>(select avg(Salary) from Employees)

--2) Write a SQL query to list the employee names and their departments for employees who were hired after the oldest employee in the company.

select FirstName,LastName,DepartmentID
from Employees
where HireDate>(select min(HireDate) from Employees)

---3) write a SQL query to find the details of the employee(s) with the highest salary.
select * from Employees
where Salary=(select max(salary) from Employees)


---4) Write a SQL query to find the names of employees who work in the same department as 'John Smith'.
select FirstName, LastName
from Employees
where DepartmentID=(select DepartmentID from Employees where FirstName='John' and LastName='Smith')

---5) Write a SQL query to find the names of employees who do not belong to the department with the highest average salary.

SELECT FirstName, LastName
FROM Employees
WHERE DepartmentID NOT IN (
    SELECT TOP 1 DepartmentID
    FROM Employees
    GROUP BY DepartmentID
    ORDER BY AVG(Salary) DESC)

---1) Write a SQL query to find the names of employees whose first names start with the letter 'J'.
select FirstName,LastName from Employees
where FirstName like 'J%'


---2) Write a SQL query to find the names of employees whose last names end with the letter 'n'.
select FirstName, LastName from Employees
where LastName like '%n'


---3) Write a SQL query to find the email addresses of employees that contain the word "john".
select Email from Employees
where Email like '%john%'


---4) Write a SQL query to find the names of employees whose first names have exactly 5 characters.
select FirstName, LastName from Employees
where FirstName like '_____'

select FirstName, LastName from employees
where LastName like '_a%'


--------------------------------table 3-------------------------------------------------------------------------------------------------------------------
 
-- Creating the Departments table
CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName NVARCHAR(100)
);
-- Inserting data into the Departments table
INSERT INTO Departments (DepartmentID, DepartmentName)
VALUES
(101, 'Human Resources'),
(102, 'Finance'),
(103, 'IT');
select * from Departments

---1) Write a SQL query to list the names of employees along with the names of the departments they work in.
select E.FirstName, E.LastName, D.DepartmentName 
from Employees E
join Departments D
on E.DepartmentID=D.DepartmentID



---2) Write a SQL query to list all the departments and the employees working in them, including departments with no employees.
select D.DepartmentName, E.FirstName, E.LastName
from Departments D
left join Employees E
on E.DepartmentID=D.DepartmentID


---3) Write a SQL query to find the names of employees who do not belong to any department (i.e., no matching department ID).

select E.FirstName, E.LastName
from Employees E
 left join Departments D
on E.DepartmentID=D.DepartmentID
where D.DepartmentID is Null

---4) Write a SQL query to list the names of employees who work in the same department as 'Jane Doe'.

SELECT E2.FirstName, E2.LastName

FROM Employees E1

JOIN Employees E2

ON E1.DepartmentID = E2.DepartmentID

WHERE E1.FirstName = 'Jane' AND E1.LastName = 'Doe'

AND E2.EmployeeID <> E1.EmployeeID;

---5) Write a SQL query to find the department with the highest total salary paid to its employees.

select top 1 D.DepartmentName
from Departments D
join Employees E
on D.DepartmentID=E.EmployeeID
group by D.DepartmentName
order by sum(E.Salary) desc









































































































































--4) Write a query to find the total sales amount for each employee, but only include employees who have made more than one sale.

