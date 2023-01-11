 Data Definition Language (DDL) Commands
 create, drop, alter & truncate

CREATE DATABASE EmployeeManagementEntities;
use EmployeeManagementEntities;

Creating EmpManagement table
Create Table Emp_Management (ID INT primary key identity(1,1), Name VARCHAR(150), Salary FLOAT, Start DATE);
create: create a table
Create table Employee_Manag(Id int, Name varchar(25), Dept varchar(25));

select * from Emp_Management;

alter: we can add columns to the existing table 
Alter table Employee_Manag add Address varchar(25)

drop: completely delete the table
Drop table Employee_Manag;

truncate: delete the data not the table
Truncate table Employee_Manag;

select * from Employee_Manag;

Data Manipulation Language (DML) Commands
Insert, Update & Delete

INSERT INTO Emp_Management( Name, Salary, Start) VALUES
('Reshma', 45000.00, '2017-05-12' ),
(  'Vahidha', 20000.00, '2018-06-01' ),
( 'Basith', 50000.00, '2019-07-16' );

select * from Emp_Management

Update Emp_Management set Name='Tanvir' where Name='Vahidha'

update Emp_Management set Email='reshma@gmail.com', Phone='8232323234', City='Kurnool', State='Andhra' where Name='Reshma'
update Emp_Management set Email='vahidha@gmail.com', Phone='7232323234', City='Hyd', State='Telangana' where Name='Vahidha'
update Emp_Management set Email='basith@gmail.com', Phone='9432323234', City='Kurnool', State='Andhra' where Name='Basith'

update Emp_Management set id=4 where Name='Rosy'
update Emp_Management set id=5 where Name='Chitti'

Retrieve Data from database
SELECT * FROM Emp_Management;

truncate table Emp_Management

INSERT INTO Emp_Management(id, Name, Salary, Start) VALUES
(1, 'Pinky', 45000.00, '2017-05-12' ),
(2, 'lilly', 20000.00, '2018-06-01' )

DELETE FROM Emp_Management WHERE id=1

5: Function: 
min(): min(column_name) from table_name
SELECT min(Salary) from Emp_Management;

max(): max(column_name) from table_name
SELECT max(Salary) from Emp_Management;

avg(): avg of that column
SELECT AVG(Salary) FROM Emp_Management

count(): print no. of rows present in table
SELECT COUNT(*) FROM Emp_Management;

First(): print in ascending(low to high) order
SELECT Name, Salary FROM Emp_Management ORDER BY Salary ASC

SELECT * FROM Emp_Management ORDER BY Salary ASC

Last(): high to low value
SELECT TOP 3 Name FROM Emp_Management
ORDER BY Salary DESC;

Sum(): sum of column
SELECT SUM(Salary) FROM Emp_Management;

GroupBy():
SELECT COUNT(ID)
FROM Emp_Management
GROUP BY State

Ucase(): make that column upper case
SELECT UPPER(Name) FROM Emp_Management;

Lcase(): make that column lower case
SELECT LOWER(Name) FROM Emp_Management;

CREATE FUNCTION dbo.helloworldfunc()
RETURNS varchar(20)
AS 
BEGIN
	 RETURN 'Hello world'
END

Select [dbo].helloworldfunc()

Stored Procedures:  

CREATE PROCEDURE HelloWorldprocedures
AS
PRINT 'Hello World'

Exec HelloWorldprocedures

6: 
Alter table Emp_Management add Email varchar(25),
							Phone varchar(20),
							City varchar(25),
							State varchar(25)

select * from Emp_Management;

create table Department (ID INT, Name VARCHAR(150), Dept varchar(25));

insert into Department (ID, Name, Dept) values (3, 'Pinky', 'Software'),
												(4, 'Reshma', 'Designer')
delete table Department
Views

CREATE VIEW DeptView AS  
SELECT Emp_Management.NAME, Emp_Management.Salary, Department.Dept  
FROM Emp_Management, Department  
WHERE Emp_Management.Name = Department.Name;

select * from DeptView

select * from Emp_Management

INSERT INTO Emp_Management(id, Name, Salary, Start, Email, Phone, City, State) VALUES
(4, 'Rosy', 35000.00, '2019-05-01', 'rosy@gmail.com', '7343434343','Kurnool', 'Andhra' ),
(5, 'Chitti', 22000.00, '2020-08-11', 'chitti@gmail.com', '7262626262','Anantapur', 'Andhra'),
(6, 'Chinni', 32000.00, '2021-01-05', 'chinni@gmail.com', '7232323256','Hyd', 'Telangana')

Insert into Department(ID, Name, Dept) values (3, 'Chitti', 'Developer'),
												(4, 'Chinna', 'Designer')


Triggers
CREATE TABLE student(Id integer PRIMARY KEY, first_name varchar(50), last_name varchar(50), full_name varchar(50));

create trigger student_name 
after INSERT 
on 
student 
for each row 
BEGIN 
   UPDATE student set full_name = first_name || ' ' || last_name;
END;

/* Create a few records in this table */
INSERT INTO student(id, first_name, last_name) VALUES(1,'Alvaro', 'Morte');
INSERT INTO student(id, first_name, last_name) VALUES(2,'Ursula', 'Corbero');
INSERT INTO student(id, first_name, last_name) VALUES(3,'Itziar', 'Ituno');
INSERT INTO student(id, first_name, last_name) VALUES(4,'Pedro', 'Alonso');
INSERT INTO student(id, first_name, last_name) VALUES(5,'Alba', 'Flores');

/* Display all the records from the table */
SELECT * FROM student;


CREATE TABLE Locations (LocationID int, LocName varchar(100))

CREATE TABLE LocationHist (LocationID int, ModifiedDate DATETIME)

CREATE TRIGGER TR_UPD_Locations ON Locations
FOR UPDATE 
NOT FOR REPLICATION 
AS
 
BEGIN
  INSERT INTO LocationHist
  SELECT LocationID
    ,getdate()
  FROM inserted
END

CREATE TABLE TableSchemaChanges (ChangeEvent xml, DateModified datetime)
 
CREATE TRIGGER TR_ALTERTABLE ON DATABASE
FOR ALTER_TABLE
AS
BEGIN
 
INSERT INTO TableSchemaChanges
SELECT EVENTDATA(),GETDATE()
 
END

Transactions:
Example of COMMIT Transaction

CREATE TABLE Product (  
 Product_id INT PRIMARY KEY,   
 Product_name VARCHAR(40),   
 Price INT,  
 Quantity INT  
)  

INSERT INTO Product VALUES(111, 'Mobile', 10000, 10),  
(112, 'Laptop', 20000, 15),  
(113, 'Mouse', 300, 20),  
(114, 'Hard Disk', 4000, 25),  
(115, 'Speaker', 3000, 20);  

select * from Product

-- Start a new transaction
BEGIN TRANSACTION  
-- SQL Statements  
 INSERT INTO Product VALUES(116, 'Headphone', 2000, 30)  
 UPDATE Product SET Price = 450 WHERE Product_id = 113  
 -- Commit changes   
COMMIT TRANSACTION 

Example of ROLLBACK Transaction: 
BEGIN TRANSACTION
UPDATE Product SET Price = 5000 WHERE Product_id = 114  
DELETE FROM Product WHERE Product_id = 116

ROLLBACK TRANSACTION  