
CREATE DATABASE DDD_Lab_2_IT25100506_Q2;

create table emp_IT25100506_Lab_2_Q2
(
	eid integer primary key,
	ename varchar(25),
	age int ,
	salary float

);

insert into emp_IT25100506_Lab_2_Q2(eid,ename,age,salary) 
values
(1000,'Lakmal',33,90000),
(1001,'Nadeeka',24,28000),
(1002,'Amila',26,35000),
(1003,'Nishani',28,60000),
(1004,'Krishan',36,95000),
(1005,'Surangi',37,22000),
(1006,'Shanika',24,18000),
(1007,'Amali',21,20000),
(1008,'Charith',28,35000),
(1009,'Prasad',40,95000);

create table dept_IT25100506_Lab_2_Q2
(
did char(12) primary key,
budget float,
managerId int foreign key references emp_IT25100506_Lab_2_Q2
)

INSERT INTO dept_IT25100506_Lab_2_Q2 VALUES
('Academic',900000,1002),
('Admin',120000,1000),
('Finance',3000000,1008),
('ITSD',4500000,1000),
('Maintenance',40000,1004),
('SESD',20000,1004),
('Marketing',90000,1008);

create table works_IT25100506_Lab_2_Q2
(
eid int foreign key references emp_IT25100506_Lab_2_Q2,
did Char(12) foreign key references dept_IT25100506_Lab_2_Q2,
pct_time int,
primary key(eid,did)
)

INSERT INTO works_IT25100506_Lab_2_Q2 VALUES
(1000,'Admin',40),
(1000,'ITSD',50),
(1001,'Admin',100),
(1002,'Academic',100),
(1003,'Admin',20),
(1003,'Academic',30),
(1003,'ITSD',45),
(1004,'Admin',60),
(1004,'Finance',30),
(1006,'Finance',45),
(1006,'Maintenance',52),
(1008,'Maintenance',30),
(1008,'ITSD',30),
(1008,'Finance',35),
(1009,'Admin',100);

--Question2
--a. How many employees are working in each department? List the department ID and the number of employees.
SELECT did,COUNT(*) AS 'Number of Employess'
FROM works_IT25100506_Lab_2
GROUP BY did;

--b. How many employees are working in each department? List the department name and the number of employees.
SELECT did AS 'Department Name', COUNT(eid) AS 'Number of Employees'
FROM works_IT25100506_Lab_2
GROUP BY did;

--c. Which departments have more than 2 employees assigned to them? List the department IDs only.
SELECT did
FROM works_IT25100506_Lab_2
GROUP BY did
HAVING COUNT(eid) > 2;

--d. List all departments that have more than 2 employees assigned. Show the department name along with the number of employees and sort the result in ascending order of employee count.
SELECT did, COUNT(eid) AS 'Number of Emp'
FROM works_IT25100506_Lab_2
GROUP BY did
HAVING COUNT(eid) > 2
ORDER BY COUNT(eid) ASC;
