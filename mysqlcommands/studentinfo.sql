create database student_info;

use student_info;

create table students(
id int auto_increment primary key,
first_name varchar(15) not null,
last_name varchar(15) not null,
email varchar(30) not null unique,
exp_grad year
);

create table program_requirements(
id int auto_increment primary key,
c_id int not null,
course varchar(12) not null
);

select * from program_requirements;

insert into students(first_name, last_name, exp_grad, email)
values('Mohammed', 'Mamun', 2019, 'momamun@yahoo.com');
insert into students(first_name, last_name, exp_grad, email)
values('Robert', 'Clay', 2019, 'robertclay@gmail.com');

insert into program_requirements (course_id, course_name)
values(101, 'Programming');
insert into program_requirements (course_id, course_name)
values(172, 'Data Mining');
insert into program_requirements (course_id, course_name)
values(103, 'Alogrithms');
insert into program_requirements (course_id, course_name)
values(133, 'Adv English');

create table enrollment(
	id int auto_increment primary key,
	student_id int references students(id),
    course_id int references courses(id),
    completed bool default false
);

select * from enrollment;
insert into enrollment (student_id, course_id)
values(1, 1), (1, 2), (2,2);

select first_name, last_name, concat(course_name, ' ', courses.course_id) as course
from students 
join enrollment on 
enrollment.student_id = students.id
join courses on 
courses.id = enrollment.course_id;

drop table students;
drop table enrollment;
drop table program_requirements;
