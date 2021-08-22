-- Course 1 : Final project : Design an HR database

-- Create tables
CREATE TABLE Education_Level(
	education_level_id serial primary key,
	education_level varchar(100)
);

CREATE TABLE Employee(
	emp_id varchar(10) primary key,
	emp_nm varchar(100),
	email varchar(100),
	hire_dt date,
	education_level_id int references Education_Level(education_level_id)
);

CREATE TABLE Job_Title(
	job_title_id serial primary key,
	job_title varchar(100)
);

CREATE TABLE Department(
	department_id serial primary key,
	department varchar(100)
);

CREATE TABLE Salary(
	salary_id serial primary key,
	salary int
);

CREATE TABLE Location(
	location_id serial primary key,
	location varchar(100),
	address varchar(200),
	city varchar(100),
	state varchar(100)
);

CREATE TABLE Job(
	job_id serial primary key, 
	emp_id varchar(10) references Employee(emp_id),
	job_title_id int references Job_Title(job_title_id),
	location_id int references Location(location_id),
	department_id int references Department(department_id),
	salary_id int references Salary(salary_id),
	manager varchar(10) references Employee(emp_id),
	start_dt date,
	end_dt date
);
