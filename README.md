# employee_data-SQL-
<br>
# 🧠 SQL Project: Employee & Sales Analysis
<br>
This project demonstrates the use of SQL Server for analyzing employee and sales data. It includes table creation, data insertion, and a variety of SQL queries to extract business insights.
<br>
## 🗃️ Database Structure
<br>
### 🔹 Tables Created:
<br>
- `EmployeeSales` — Stores sales data by department and employee
<br>
- `Employees` — Contains employee personal and department info
<br>
- `Departments` — Department reference data
<br>
## 📌 Key SQL Concepts Demonstrated
<br>
- Table creation and data insertion
<br>
- Aggregate functions: `SUM()`, `AVG()`, `COUNT()`
<br>
- `GROUP BY`, `HAVING`, `JOIN`, `LEFT JOIN`
<br>
- Filtering and conditional logic
<br>
- Date-based grouping
<br>

---

## 🧪 SQL Queries & Insights
<br>

### 1. **Total Sales by Department**
sql
<br>
SELECT Department, SUM(SaleAmount) AS TotalSales
FROM EmployeeSales
GROUP BY Department;
<br>
Result:
<br>
Electronics | 1750.00  
Furniture   | 900.00
<br>
2. Sales Count by Employee
<br>
SELECT EmployeeID, COUNT(SaleID) AS SalesCount
FROM EmployeeSales
GROUP BY EmployeeID;
<br>
Result:
101 | 3  
102 | 2  
103 | 2  
104 | 1
<br>
3. Average Sale Amount by Department
<br>
SELECT Department, AVG(SaleAmount) AS AvgSale
FROM EmployeeSales
GROUP BY Department;
Result:
<br>
Electronics | 437.50  
Furniture   | 225.00
<br>
4. Employees with More Than One Sale
<br>
SELECT EmployeeID, SUM(SaleAmount) AS TotalSale
FROM EmployeeSales
GROUP BY EmployeeID
HAVING COUNT(SaleID) > 1;
Result:
<br>
101 | 1100.00  
102 | 1000.00  
103 | 350.00
<br>
5. Monthly Sales Summary (2023)
<br>
SELECT MONTH(SaleDate) AS Month, SUM(SaleAmount) AS TotalSales
FROM EmployeeSales
WHERE YEAR(SaleDate) = 2023
GROUP BY MONTH(SaleDate);
<br>
Result:
August | 2650.00
👥 Employee & Department Insights
<br>
1. Employee Names with Department
<br>
SELECT E.FirstName, E.LastName, D.DepartmentName  
FROM Employees E
JOIN Departments D ON E.DepartmentID = D.DepartmentID;
<br>
2. All Departments with Employees (even empty ones)
<br>
SELECT D.DepartmentName, E.FirstName, E.LastName  
FROM Departments D
LEFT JOIN Employees E ON E.DepartmentID = D.DepartmentID;
<br>
3. Employees Without a Department
<br>
SELECT E.FirstName, E.LastName
FROM Employees E
LEFT JOIN Departments D ON E.DepartmentID = D.DepartmentID
WHERE D.DepartmentID IS NULL;
<br>
4. Employees in the Same Department as 'Jane Doe'
<br>
SELECT E2.FirstName, E2.LastName  
FROM Employees E1
JOIN Employees E2 ON E1.DepartmentID = E2.DepartmentID
WHERE E1.FirstName = 'Jane' AND E1.LastName = 'Doe'
AND E2.EmployeeID <> E1.EmployeeID;
<br>
5. Department with Highest Total Salary
<b>
SELECT TOP 1 D.DepartmentName  
FROM Departments D
JOIN Employees E ON D.DepartmentID = E.DepartmentID
GROUP BY D.DepartmentName
ORDER BY SUM(E.Salary) DESC;
