USE ULHT_DB26
GO

create table HR.employee_training (
    employee_id int not null,
    course_code varchar(12) not null,
    completed_on date null,
    score decimal(5,2) null
);

select table_schema, table_name, table_type
from information_schema.tables
where table_schema = 'hr' and table_name = 'employee_training';

select column_name, data_type, is_nullable
from information_schema.columns
where table_schema = 'hr' and table_name = 'employee_training'
order by ordinal_position;

alter table HR.employee_training
add delivery_mode varchar(12) null;

alter table HR.employee_training
alter column delivery_mode varchar(20) null;

select column_name, character_maximum_length, is_nullable
from information_schema.columns
where table_schema = 'hr' and table_name = 'employee_training' and column_name = 'delivery_mode';

select employee_id, course_code, completed_on
from HR.employee_training
where completed_on is null;

alter table HR.employee_training
alter column completed_on date not null;

alter table HR.employee_training
drop delivery_mode;

GO
create or alter view HR.job_salary_summary as select job_id, 
    min(salary) as min_salary, 
    avg(salary) as avg_salary,
    count(*) as num_employees
from HR.employees
group by job_id;
GO

select * from HR.job_salary_summary;

select employee_id, concat(first_name, ' ', last_name) as full_name, hire_date
into hr.employee_directory
from hr.employees
where employee_id <= 110;

select * from hr.employee_directory;

select count(*) as copied_rows from hr.employee_directory;

create table hr.recent_hire_copy (
    employee_id int not null,
    full_name nvarchar(60) not null,
    hire_date date not null
);

insert into hr.recent_hire_copy
    (employee_id, full_name, hire_date)
select employee_id, concat(first_name, ' ', last_name), hire_date from hr.employees
where hire_date >= '2007-01-01';

select * from hr.recent_hire_copy;