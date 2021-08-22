-- CRUD statements

-- Question 1: Return a list of employees with Job Titles and Department Names
select e.emp_nm, jt.job_title, d.department from Job j left join Employee e on j.emp_id=e.emp_id left join Job_Title jt on j.job_title_id=jt.job_title_id left join Department d on j.department_id=d.department_id;

-- Question 2: Insert Web Programmer as a new job title
insert into Job_Title(job_title) values ('Web Programmer');


-- Question 3: Correct the job title from web programmer to web developer
update Job_Title set job_title='Web Developer' where job_title='Web Programmer';


-- Question 4: Delete the job title Web Developer from the database
delete from Job_Title where job_title='Web Developer';

-- Question 5: How many employees are in each department?
select d.department, count(distinct j.emp_id) from Job j left join Department d on j.department_id=d.department_id group by d.department;
 
-- Question 6: Write a query that returns current and past jobs (include employee name, job title, department, manager name, start and end date for position) for employee Toni Lembeck.
select e.emp_nm, jt.job_title, d.department, m.emp_nm as manager, j.start_dt, j.end_dt from Job j left join Employee e on j.emp_id=e.emp_id left join Job_Title jt on j.job_title_id=jt.job_title_id left join Department d on j.department_id=d.department_id left join Employee m on j.manager=m.emp_id where e.emp_nm = 'Toni Lembeck';

-- Question 7: Describe how you would apply table security to restrict access to employee salaries using an SQL server.
I would grant access to Salary table to the HR & Management employees. Then, I would revoke access to Salary table for all other employees.
