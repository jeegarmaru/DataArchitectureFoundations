-- Use ETL to populate all tables from the staging table
insert into Education_Level(education_level) select distinct education_lvl from proj_stg;

insert into Employee(emp_id, emp_nm, email, hire_dt, education_level_id)
select distinct s.emp_id, s.emp_nm, s.email, s.hire_dt, el.education_level_id from proj_stg s left join Education_Level el on s.education_lvl=el.education_level;

insert into Job_Title(job_title) select distinct job_title from proj_stg;

insert into Department(department) select distinct department_nm from proj_stg;

insert into Salary(salary) select distinct salary from proj_stg;

insert into Location(location, address, city, state) select distinct location, address, city, state from proj_stg;

insert into Job(emp_id, job_title_id, location_id, department_id, salary_id, manager, start_dt, end_dt)
select p.emp_id, jt.job_title_id, l.location_id, d.department_id, s.salary_id, e.emp_id, p.start_dt, p.end_dt from proj_stg p left join Job_Title jt on p.job_title=jt.job_title left join Location l on p.location=l.location left join Department d on p.department_nm=d.department left join Salary s on p.salary=s.salary left join Employee e on p.manager=e.emp_nm;


