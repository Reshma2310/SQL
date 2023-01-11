Create database EmpManagement;
use EmpManagement;

create table Employee(e_id int primary key,
					e_Name varchar(30) not null,
					e_FatherName varchar(30) not null,
					e_DOB date not null,
					e_phoneNo integer unique,
					e_JoinDate date not null,
					e_Status varchar(40) not null,
					e_MailId varchar(30) not null,
					e_Address varchar(60) unique,
					d_id integer not null, /*FK*/
					des_id integer not null, /*FK*/
					c_id integer not null, /*FK*/

					)
select * from Employee
					constraint department_id foreign key(d_id) references Department(d_id)
					constraint designation_id foreign key(des_id) references Designation(des_id)
					constraint category_id foreign key(c_id) references Category(c_id)

create table Department(d_id int primary key,
						d_Name varchar(30) not null)

create table Designation(des_id int primary key,
						des_Name varchar(30) not null)

create table Category(c_id int primary key,
					c_Name varchar(20) not null)

create table Experience(ex_id int primary key,
						ex_Title varchar(30) not null,
						ex_Date date not null,
						e_id integer
						)
						constraint employee_id foreign key (e_id) references Employee(e_id)
						
create table Salary(s_id int primary key,
					s_Date date not null,
					s_Amount decimal(18,3) not null,
					s_Status varchar(12) not null,
					e_id integer /*FK*/
					)
					constraint employee_id foreign key (e_id) references Employee(e_id)

create table Attendence(a_id int primary key,
						a_Status varchar(12) not null,
						a_Date date not null,
						a_InTime time not null,
						a_OutTime time not null,
						e_id integer /*FK*/
						)
						constraint employee_id foreign key (e_id) references Employee(e_id)

create table UserData(u_id int primary key,
				u_Name varchar(20) not null,
				u_Password varchar(39) not null,
				r_id integer /*FK*/
				)

				constraint rol_id foreign key (r_id) references Role(r_id)

create table Role(r_id int primary key,
				r_Name varchar(40) not null)



