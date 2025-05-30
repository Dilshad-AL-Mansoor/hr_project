--databse create
create database hr_analytics;

--check Database create or not
show databases;

--connect Database
use hr_analytics;

--Table Check create or not
show Tables;


--Table Descraption Check

desc hr_employee;

--specific column Value Check
select age,attrition,education,gender from hr_employee;

--check Total Number Of Employee
select count(*) from hr_employee;

--check Total Number Of Employee Attrition
select  SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS employees_left from hr_employee;

--Attrition Rate=(Employees who left/Total Employees)*100
--Attrition Rate Of All Department
select count(*) as total_employee,
sum(case when Attrition='Yes' then 1 else 0 end)as employee_left,
ROUND(100.0 * SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*),2)as attrition_rate_percent 
from hr_employee;

--Attrition Rate Of All Department Wise
select department,ROUND(100.0 * SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*),2)as attrition_rate_percent
from hr_employee group by department;


--Attrition Rate of All JobRole Wise
select JobRole,ROUND(100.0 * SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*),2)as attrition_rate_percent
from hr_employee group by jobRole;
