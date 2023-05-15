-- creating tables in assignment sql pdf

create database casestudy;
use casestudy;

-- location table
create table LOCATION
( Location_id int primary key ,
City varchar(10)
);

-- inserting data into location table
insert into LOCATION values
(122,'New York'),
(123,'Dallas'),
(124,'Chicago'),
(167,'Boston');

-- selecting all the data
select *from LOCATION;

-- Departments table
create table DEPARTMENT
(Department_Id int primary key,
Name varchar(15),
Location_id int
);
 
alter table DEPARTMENT
add constraint foreign key (Location_id) references LOCATION(Location_id);

insert into DEPARTMENT values
(10, 'Accounting', 122),
(20, 'Sales' , 124),
(30, 'Research', 123),
(40, 'Operations', 167);

select *from DEPARTMENT;

-- job table
create table JOB
(Job_ID int primary key,
Designation varchar(20)
);
insert into JOB values
(667, 'Clerk'),
(668, 'Staff'),
(669, 'Analyst'),
(670, 'Sales Person'),
(671, 'Manager'),
(672, 'President'
);
select * from JOB;

-- employee table

create table Employee
(Employee_id int,
 Last_Name varchar(20),
 First_Name varchar(20),
 Middle_Name varchar(20),
 Job_Id int,
 Manager_Id int,
 Hire_Date date,
Salary int,
Comm varchar(10),
Department_Id int,
foreign key (Job_Id) references JOB(Job_Id),
foreign key (Department_Id) references DEPARTMENT(Department_Id)
);
SET FOREIGN_KEY_CHECKS=0;

insert into Employee values 
(7369, 'SMITH', 'JOHN', 'Q', 667, 7902, '1984-12-17', 800, 'NULL', 20),
(7499, 'ALLEN', 'KEVIN', 'J', 670, 7698, '1985-02-20', 1600, '300', 30),
(7505, 'DOYLE', 'JEAN', 'K', 671, 7839, '1985-04-04', 2850, 'NULL', 30),
(7506, 'DENNIS', 'LYNN', 'S', 671, 7839, '1985-05-15', 2750, 'NULL', 30),
(7507, 'BAKER', 'LESLIE', 'D', 671, 7839, '1985-06-10', 2200, 'NULL', 40),
(7521, 'WARK', 'CYNTHIA', 'D', 670, 7698, '1985-02-22', 1250, '500', 30
);


-- queries

select * from Employee;
select * from DEPARTMENT;
select * from JOB;
select * from LOCATION;
select First_Name, Last_Name, Salary, Comm from Employee;
/* 6. LIST OUT EMPLOYEEID,LAST NAME, DEPARTMENT ID FOR ALL EMPLOYEES AND ALIAS
EMPLOYEEID AS "ID OF THE EMPLOYEE", LAST NAME AS "NAME OF THE EMPLOYEE",
DEPARTMENTID AS "DEP_ID". */

select Employee_id as ID_OF_THE_EMPLOYEE ,Last_Name as NAME_OF_THE_EMPLOYEE,
Department_Id as DEP_ID from Employee;

-- 7 LIST OUT THE EMPLOYEES ANNUAL SALARY WITH THEIR NAMES ONLY.
select salary*12 as Annual_salary ,Last_Name,First_Name,Middle_Name from Employee;

-- WHERE CONDITION: 1. LIST THE DETAILS ABOUT "SMITH
select * from Employee where Last_Name='SMITH';

-- 2 . LIST OUT THE EMPLOYEES WHO ARE WORKING IN DEPARTMENT 20.
select * from Employee where Department_Id=20;

-- 3. LIST OUT THE EMPLOYEES WHO ARE EARNING SALARY BETWEEN 3000 AND 4500.
select * from Employee where salary between 3000 and 4500;
select * from Employee where salary between 2000 and 3500;

-- 4. LIST OUT THE EMPLOYEES WHO ARE WORKING IN DEPARTMENT 10 OR 20.
select * from Employee where Department_Id=10 or Department_Id=20;
select * from Employee where Department_Id in (10,20); 

-- 5. FIND OUT THE EMPLOYEES WHO ARE NOT WORKING IN DEPARTMENT 10 OR 30.
select * from Employee where Department_Id<>30 and Department_Id<>10 ;
select * from Employee where Department_Id not in (10,30);

-- 6. LIST OUT THE EMPLOYEES WHOSE NAME STARTS WITH 'S
select * from Employee where First_Name like'S%';
select * from Employee where Last_Name like'S%';

-- 7 LIST OUT THE EMPLOYEES WHOSE NAME STARTS WITH 'S' AND ENDS WITH 'H'
select * from Employee where Last_Name like'S%H';
select * from Employee where First_Name like'S%H';

-- 8. LIST OUT THE EMPLOYEES WHOSE NAME LENGTH IS 4 AND START WITH 'S'.
select * from Employee where First_Name like'S___';
select * from Employee where Last_Name like'S___';

-- 9.LIST OUT EMPLOYEES WHO ARE WORKING IN DEPARRTMENT 10 AND DRAW THE SALARIES MORE THAN 3500
select * from Employee where Department_Id=10 and salary>3500;

-- 10. LIST OUT THE EMPLOYEES WHO ARE NOT RECEVING COMMISSION.
select * from Employee where Comm='NULL';

-- ORDER BY CLAUSE

-- 1. LIST OUT THE EMPLOYEE ID, LAST NAME IN ASCENDING ORDER BASED ON THE EMPLOYEE ID.
select Employee_id ,Last_Name from Employee order by Employee_id,Last_Name;

-- 2. LIST OUT THE EMPLOYEE ID, NAME IN DESCENDING ORDER BASED ON SALARY.
select Employee_id ,First_Name, Last_Name from Employee order by salary desc;

-- 3. LIST OUT THE EMPLOYEE DETAILS ACCORDING TO THEIR LAST-NAME IN ASCENDING ORDER 
select * from Employee order by Last_Name;

/* 4. LIST OUT THE EMPLOYEE DETAILS ACCORDING TO THEIR LAST-NAME IN ASCENDING ORDER AND
THEN ON DEPARTMENT_ID IN DESCENDING ORDER.*/

select * from Employee order by  Last_Name, Department_Id desc;

-- GROUP BY & HAVING CLAUSE

-- 1. HOW MANY EMPLOYEES WHO ARE IN DIFFERENT DEPARTMENTS WISE IN THE ORGANIZATION.
select Department_Id Department_Wise ,count(Department_Id) No_Of_Employees from employee group by Department_Id ;

-- 2. LIST OUT THE DEPARTMENT WISE MAXIMUM SALARY, MINIMUM SALARY, AVERAGE SALARY OF THE EMPLOYEES.

select Department_Id Department_Wise ,max(salary),min(salary),avg(salary) from employee group by Department_Id ;

-- 3.LIST OUT JOB WISE MAXIMUM SALARY, MINIMUM SALARY, AVERAGE SALARIES OF THE EMPLOYEES.
select Job_Id Job_Wise ,max(salary),min(salary),avg(salary) from Employee group by Job_Id ;

-- 4.LIST OUT THE NUMBER OF EMPLOYEES JOINED IN EVERY MONTH IN ASCENDING ORDER
select month(Hire_Date) month,count(month(Hire_Date)) No_Of_Employees from Employee
	group by month(Hire_Date) order by month(Hire_Date);

-- 5. LIST OUT THE NUMBER OF EMPLOYEES FOR EACH MONTH AND YEAR, IN THE ASCENDING ORDER BASED ON THE YEAR, MONTH.
select year(Hire_Date) year,count(year(Hire_Date)) No_Of_Employees from Employee
	group by year(Hire_Date) order by year(Hire_Date);

-- 6. LIST OUT THE DEPARTMENT ID HAVING ATLEAST FOUR EMPLOYEES.
select Department_Id,count(*) No_Of_Employees from Employee group by Department_Id having count(*)>=4;

-- 7. HOW MANY EMPLOYEES JOINED IN JANUARY MONTH.
select month(Hire_Date) month,count(month(Hire_Date)) No_Of_Employees from Employee where month(Hire_Date)=01
 group by month(Hire_Date) ;

-- 8. HOW MANY EMPLOYEES JOINED IN JANUARY OR SEPTEMBER MONTH.
select month(Hire_Date) month,count(month(Hire_Date)) No_Of_Employees from Employee 
	where month(Hire_Date)=01 or month(Hire_Date)=09 group by month(Hire_Date) ;

-- 9. HOW MANY EMPLOYEES WERE JOINED IN 1985?
select year(Hire_Date) year,count(year(Hire_Date)) No_Of_Employees from Employee 
	 where year(Hire_Date)=1985  group by year(Hire_Date) ;
     
-- 10. HOW MANY EMPLOYEES WERE JOINED EACH MONTH IN 1985.
select month(Hire_Date) month ,count(Hire_Date) No_Of_Employees from employee
	where year(Hire_Date)=1985 group by month(Hire_Date);

-- 11. HOW MANY EMPLOYEES WERE JOINED IN MARCH 1985?
select count(*) No_Of_Employess from Employee where year(Hire_Date)=1985 and month(Hire_Date)=03 ;


-- 12. WHICH IS THE DEPARTMENT ID, HAVING GREATER THAN OR EQUAL TO 3 EMPLOYEES JOINED IN APRIL 1985
select Department_Id,count(*) No_Of_Employees from Employee where hire_date like '1985-04%' 
	group by Department_Id having count(*)>=3;
							-- or
select Department_Id,count(*) No_Of_Employees from Employee where year(Hire_Date)=1985 and month(hire_date)=04
	group by Department_Id having count(*)>=3;
    
-- JOINS
-- 1. LIST OUT EMPLOYEES WITH THEIR DEPARTMENT NAMES.
select * from Employee e 
	inner join DEPARTMENT d 
    on e.Department_Id=d.Department_Id;

--  2. DISPLAY EMPLOYEES WITH THEIR DESIGNATIONS.
select * from Employee e 
	inner join JOB j
    on e.Job_Id=j.Job_Id;

-- 3. DISPLAY THE EMPLOYEES WITH THEIR DEPARTMENT NAMES AND REGIONAL GROUPS.
select Employee_id,Last_Name,e.Department_Id,salary,d.Name,l.Location_id,l.City as Regional_Groups
	from Employee e 
 inner join DEPARTMENT d 
    on e.Department_Id=d.Department_Id
    inner join LOCATION l
    on d.Location_Id=l.Location_Id;

-- 4. HOW MANY EMPLOYEES WHO ARE WORKING IN DIFFERENT DEPARTMENTS AND DISPLAY WITH DEPARTMENT NAMES.
select e.Department_Id,d.Name,count(*) No_Of_Employees from Employee e 
	inner join DEPARTMENT d 
    on e.Department_Id=d.Department_Id 
    group by e.Department_Id ;
    
-- 5. HOW MANY EMPLOYEES WHO ARE WORKING IN SALES DEPARTMENT.
select d.Name,count(*) No_Of_Employees from Employee e 
	inner join DEPARTMENT d 
    on e.Department_Id=d.Department_Id 
    group by e.Department_Id having d.Name='Sales';
    
-- 6. WHICH IS THE DEPARTMENT HAVING GREATER THAN OR EQUAL TO 5 EMPLOYEES AND DISPLAY THE DEPARTMENT NAMES IN ASCENDING ORDER.
select e.Department_Id,d.Name,count(*) No_Of_Employees from Employee e 
	inner join DEPARTMENT d 
    on e.Department_Id=d.Department_Id 
    group by e.Department_Id having count(*)>=5 order by Name ;
    
-- 7. HOW MANY JOBS IN THE ORGANIZATION WITH DESIGNATIONS.
select e.Job_Id,j.Designation ,count(*) No_Of_Jobs from Employee e
	inner join  JOB j
    on e.Job_Id=j.Job_Id 
    group by j.Job_Id;

-- 8. HOW MANY EMPLOYEES ARE WORKING IN "NEW YORK".
select count(*) No_Of_Employees,l.City from Employee e 
	inner join DEPARTMENT d 
    on e.Department_Id=d.Department_Id
    inner join LOCATION l
    on d.Location_Id=l.Location_Id 
    group by l.Location_Id
    having l.City='New York';

-- 9. DISPLAY THE EMPLOYEE DETAILS WITH SALARY GRADES.

/*10. LIST OUT THE NO. OF EMPLOYEES ON GRADE WISE.
11.DISPLAY THE EMPLOYEE SALARY GRADES AND NO. OF EMPLOYEES BETWEEN 2000 TO 5000 RANGE OF SALARY.
12. DISPLAY THE EMPLOYEE DETAILS WITH THEIR MANAGER NAMES.
13. DISPLAY THE EMPLOYEE DETAILS WHO EARN MORE THAN THEIR MANAGERS SALARIES.
14. SHOW THE NO. OF EMPLOYEES WORKING UNDER EVERY MANAGER.
15. DISPLAY EMPLOYEE DETAILS WITH THEIR MANAGER NAMES.*/

-- 16. DISPLAY ALL EMPLOYEES IN SALES OR OPERATION DEPARTMENTS
select e.Employee_id,e.Last_Name,e.First_Name,e.Department_Id,d.Name from Employee e
inner join DEPARTMENT d
on e.Department_Id=d.Department_Id
where d.Name='Sales' or d.Name='Operations';

-- SET OPERATORS
-- 1. LIST OUT THE DISTINCT JOBS IN SALES AND ACCOUNTING DEPARTMENTS.
select distinct e.Department_Id,e.Job_Id  ,d.Name,j.Designation
	from Employee e
    join DEPARTMENT d
    on e.Department_Id=d.Department_Id
	join JOB j
    on e.Job_Id=j.Job_Id
    where d.Name='Sales' or  d.Name='Accounting';

select *from JOB where Job_Id in(select Job_Id from Employee 
where Department_Id=(select Department_Id from DEPARTMENT where Name='Sales') )
UNION
SELECT * FROM JOB WHERE Job_Id in(select Job_Id from Employee
where Department_Id=(select Department_Id from DEPARTMENT where Name='Accounting'));

-- 2. LIST OUT ALL THE JOBS IN SALES AND ACCOUNTING DEPARTMENTS.
select *from JOB where Job_Id in(select Job_Id from Employee 
where Department_Id=(select Department_Id from DEPARTMENT where Name='Sales') )
UNION ALL
SELECT * FROM JOB WHERE Job_Id in(select Job_Id from Employee
where Department_Id=(select Department_Id from DEPARTMENT where Name='Accounting'));

--  doubt 3. LIST OUT THE COMMON JOBS IN RESEARCH AND ACCOUNTING DEPARTMENTS IN ASCENDING ORDER.*/
select *from JOB where Job_Id in(select Job_Id from Employee 
where Department_Id=(select Department_Id from DEPARTMENT where Name='Research') )
UNION
SELECT * FROM JOB WHERE Job_Id in(select Job_Id from Employee
where Department_Id=(select Department_Id from DEPARTMENT where Name='Accounting'));

-- SUB QUERIES
-- 1. DISPLAY THE EMPLOYEES LIST WHO GOT THE MAXIMUM SALARY.
select * from Employee where salary =(select max(salary) from Employee );

-- 2. DISPLAY THE EMPLOYEES WHO ARE WORKING IN SALES DEPARTMENT.
select * from Employee where Department_Id =(select Department_Id from DEPARTMENT where Name='Sales');

-- 3. DISPLAY THE EMPLOYEES WHO ARE WORKING AS 'CLERCK'.
select * from Employee where Job_Id in(select JOb_Id from JOB where Designation='Clerk');

-- 4. DISPLAY THE LIST OF EMPLOYEES WHO ARE LIVING IN "NEW YORK".
select * from Employee where Department_Id in
(select d.Department_Id from LOCATION l Join DEPARTMENT d on l.Location_Id=d.Location_Id where City='New York');

-- 5. FIND OUT NO. OF EMPLOYEES WORKING IN "SALES" DEPARTMENT.
select count(*) No_Of_Employees from Employee where Department_Id in (select Department_Id from DEPARTMENT where Name='Sales');

-- 6. UPDATE THE EMPLOYEES SALARIES, WHO ARE WORKING AS CLERK ON THE BASIS OF 10%.
update Employee set salary=salary*0.1 where Job_Id in(select Job_Id from JOB where Designation='Clerk');
select * from Employee ;

-- 7. DELETE THE EMPLOYEES WHO ARE WORKING IN ACCOUNTING DEPARTMENT.
delete from Employee where Department_Id in(select Department_Id from DEPARTMENT where Name='Accounting');

-- 8. DISPLAY THE SECOND HIGHEST SALARY DRAWING EMPLOYEE DETAILS.
select * from Employee where salary<(select max(salary) from Employee ) order by Salary Desc limit 1;

-- 9. DISPLAY THE N'TH HIGHEST SALARY DRAWING EMPLOYEE DETAILS.
select * from Employee where salary in(select max(salary) from Employee) order by salary desc limit 1;

-- 10. LIST OUT THE EMPLOYEES WHO EARN MORE THAN EVERY EMPLOYEE IN DEPARTMENT 30.
select count(*) No_Of_Employees from Employee where salary>all(select salary from Employee where Department_Id=30);
select count(*) No_Of_Employees from Employee where salary>(select max(salary) from Employee where Department_Id=30);

-- 11. LIST OUT THE EMPLOYEES WHO EARN MORE THAN THE LOWEST SALARY IN DEPARTMENT 30.
select count(*) No_Of_Employees from Employee where salary>(select min(salary) from Employee where Department_Id=30);
select count(*) No_Of_Employees from Employee where salary>any(select salary from Employee where Department_Id=30);

-- 12. FIND OUT WHOSE DEPARTMENT HAS NOT EMPLOYEES.
select Department_Id,Name from DEPARTMENT where Department_Id not in(select Department_Id from Employee);


-- 13. FIND OUT WHICH DEPARTMENT DOES NOT HAVE ANY EMPLOYEES.
select Name from DEPARTMENT where Department_Id not in(select Department_Id from Employee);

-- 14. FIND OUT THE EMPLOYEES WHO EARN GREATER THAN THE AVERAGE SALARY FOR THEIR DEPARTMENT.
select * from Employee where salary>(select Avg(salary) from Employee e join DEPARTMENT d on e.Department_Id=d.Department_Id);
select * from Employee where salary>(select Avg(salary) from Employee);

   select * from employee e where salary>(select avg(salary) from employee where department_id=e.department_id);