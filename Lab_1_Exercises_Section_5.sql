CREATE DATABASE DDD;
--IT25100506
--LAB SHEET 1 KANDY UNI

create table emp_IT25100506
(
	eid integer primary key,
	ename varchar(25),
	age int,
	salary float
)

insert into emp_IT25100506 values(1000,'Lakmal',33,90000)
insert into emp_IT25100506 values(1001,'Nadeeka',24,28000)
insert into emp_IT25100506 values(1002,'Amila',26,35000)
insert into emp_IT25100506 values(1003,'Nishani',28,60000)
insert into emp_IT25100506 values(1004,'Krishan',36,95000)
insert into emp_IT25100506 values(1005,'Surangi',37,22000)
insert into emp_IT25100506 values(1006,'Shanika',24,18000)
insert into emp_IT25100506 values(1007,'Amali',21,20000)
insert into emp_IT25100506 values(1008,'Charith',28,35000)
insert into emp_IT25100506 values(1009,'Prasad',40,95000)

create table dept_IT25100506
(
did char(12) primary key,
budget float,
managerId int foreign key references emp_IT25100506
)

insert into dept_IT25100506 values('Academic',900000,1002)
insert into dept_IT25100506 values('Admin',120000,1000)
insert into dept_IT25100506 values('Finance',3000000,1008)
insert into dept_IT25100506 values('ITSD',4500000,1000)
insert into dept_IT25100506 values('Maintenance',40000,1004)
insert into dept_IT25100506 values('SESD',20000,1004)
insert into dept_IT25100506 values('Marketing',90000,1008)

create table works_IT25100506
(
eid int foreign key references emp_IT25100506,
did Char(12) foreign key references dept_IT25100506,
pct_time int,
primary key(eid,did)
)

insert into works_IT25100506 values(1000,'Admin',40)
insert into works_IT25100506 values(1000,'ITSD',50)
insert into works_IT25100506 values(1001,'Admin',100)
insert into works_IT25100506 values(1002,'Academic',100)
insert into works_IT25100506 values(1003,'Admin',20)
insert into works_IT25100506 values(1003,'Academic',30)
insert into works_IT25100506 values(1003,'ITSD',45)
insert into works_IT25100506 values(1004,'Admin',60)
insert into works_IT25100506 values(1004,'Finance',30)
insert into works_IT25100506 values(1006,'Finance',45)
insert into works_IT25100506 values(1006,'Maintenance',52)
insert into works_IT25100506 values(1008,'Maintenance',30)
insert into works_IT25100506 values(1008,'ITSD',30)
insert into works_IT25100506 values(1008,'Finance',35)
insert into works_IT25100506 values(1009,'Admin',100)

-- Question 1

-- a. Retrieve all information of all employees.
SELECT *
FROM emp_IT25100506;

-- b. Display the names and salaries of employees who earn more than 50,000.
SELECT ename, salary
FROM emp_IT25100506
WHERE salary > 50000;

-- c. Find employees whose names start with the letter 'A'.
SELECT *
FROM emp_IT25100506
WHERE ename LIKE 'A%';

-- d. List the names and ages of employees younger than 30.
SELECT ename, age
FROM emp_IT25100506
WHERE age < 30;

-- e. Find the employees whose salary is between 20,000 and 60,000.
SELECT *
FROM emp_IT25100506
WHERE salary BETWEEN 20000 AND 60000;

-- f. Show employee names whose names contain the letter 'a'.
SELECT ename
FROM emp_IT25100506
WHERE ename LIKE '%a%';

-- g. Display the employee ID and name of those who are either aged 24 or 28.
SELECT eid, ename
FROM emp_IT25100506
WHERE age = 24 OR age = 28;

-- h. Select employees whose age is not between 25 and 35.
SELECT *
FROM emp_IT25100506
WHERE age NOT BETWEEN 25 AND 35;

-- i. List all employees whose salary is not null.
SELECT *
FROM emp_IT25100506
WHERE salary IS NOT NULL;

-- Question 2

-- j. List all employees sorted by their name (ename).
SELECT *
FROM emp_IT25100506
ORDER BY ename;

-- a. Show all employees sorted in descending order of salary.
SELECT *
FROM emp_IT25100506
ORDER BY salary DESC;

-- b. Display employee details ordered ascending by age and descending by salary.
SELECT *
FROM emp_IT25100506
ORDER BY age ASC, salary DESC;

-- c. Show all departments sorted by budget in descending order.
SELECT *
FROM dept_IT25100506
ORDER BY budget DESC;

-- d. List all work assignments ordered by pct_time.
SELECT *
FROM works_IT25100506
ORDER BY pct_time;

-- Question 3

-- a. How many employees are in the organization?
SELECT COUNT(*) AS TotalEmployees
FROM emp_IT25100506;

-- b. What is the total salary paid to all employees?
SELECT SUM(salary) AS TotalSalary
FROM emp_IT25100506;

-- c. What is the highest salary and the lowest salary among all employees?
SELECT MAX(salary) AS HighestSalary,
       MIN(salary) AS LowestSalary
FROM emp_IT25100506;

-- d. What is the average salary of employees?
SELECT AVG(salary) AS AverageSalary
FROM emp_IT25100506;

-- e. How many employees are aged below 30?
SELECT COUNT(*) AS EmployeesBelow30
FROM emp_IT25100506
WHERE age < 30;

-- f. What is the total number of departments?
SELECT COUNT(*) AS TotalDepartments
FROM dept_IT25100506;

-- g. What is the maximum and minimum department budget?
SELECT MAX(budget) AS MaximumBudget,
       MIN(budget) AS MinimumBudget
FROM dept_IT25100506;

-- h. What is the total percentage of work assigned across all employees?
SELECT SUM(pct_time) AS TotalWorkPercentage
FROM works_IT25100506;

-- i. What is the average work time (pct_time) per employee?
SELECT AVG(pct_time) AS AverageWorkTime
FROM works_IT25100506;

-- Question 4

-- a. What is the total salary paid to employees of each age group?
SELECT age, SUM(salary) AS TotalSalary
FROM emp_IT25100506
GROUP BY age;

-- b. Count the number of employees working in each department.
-- Rename the count as 'Number of Employees'.
SELECT did, COUNT(eid) AS [Number of Employees]
FROM works_IT25100506
GROUP BY did;

-- c. How many employees earn a salary greater than 50,000?
SELECT COUNT(*) AS EmployeesAbove50000
FROM emp_IT25100506
WHERE salary > 50000;

-- d. List all employees who earn more than 50,000,
-- sorted by salary in ascending order.
SELECT *
FROM emp_IT25100506
WHERE salary > 50000
ORDER BY salary ASC;

-- Question 5

-- a. Display the department IDs where the number of employees is less than 3.
SELECT did
FROM works_IT25100506
GROUP BY did
HAVING COUNT(eid) < 3;

-- b. List each manager and the number of departments they manage.
-- Show only managers who manage more than 1 department.
-- Sort by the number of departments ascending.
SELECT managerId, COUNT(did) AS TotalDepartments
FROM dept_IT25100506
GROUP BY managerId
HAVING COUNT(did) > 1
ORDER BY TotalDepartments ASC;

-- c. Show each age group and the average salary of employees in that group.
-- Display only age groups where the average salary is greater than 40,000.
SELECT age, AVG(salary) AS AverageSalary
FROM emp_IT25100506
GROUP BY age
HAVING AVG(salary) > 40000;

-- d. Find the number of work assignments per employee.
-- Display employees with more than 2 assignments.
SELECT eid, COUNT(did) AS TotalAssignments
FROM works_IT25100506
GROUP BY eid
HAVING COUNT(did) > 2;

-- e. List departments with a total budget greater than 1,000,000.
SELECT did, budget
FROM dept_IT25100506
WHERE budget > 1000000;
