-- drop database quan_li_sinh_vien;
create database quan_li_sinh_vien;
use quan_li_sinh_vien;
create table class(
class_id int auto_increment primary key,
class_name varchar(50) not null,
start_date date not null,
`status` bit not null
);

create table student (
student_id int auto_increment,
sutdent_name varchar (50) not null,
adress varchar(50) not null,
phone varchar(10) not null,
`status` bit not null,
class_id int,
primary key(student_id,class_id),
foreign key (class_id) references class(class_id)
);
create table `subject`(
sub_id int auto_increment primary key,
sub_name varchar(100) not null,
credit int not null,
`status` bit not null
);
create table mark(
mark_id int auto_increment ,
sub_id int,
student_id int,
mark int not null,
exam_times int not null,
primary key(mark_id,sub_id,student_id)
);

insert into class value (1,'A1','2000-04-22',1);
insert into class value (2,'A2','2001-06-25',1);
insert into class value (3,'B3',current_date,0);
insert into student value (1,'Trường','Đà Nẵng','090512456',1,1);
insert into student value (2,'HOa','Sài gòn','090512456',1,1);
insert into student value (3,'Ngọc','Đà Nẵng','090512456',0,2);
insert into `subject` value (1,'Math',5,1);
insert into `subject` value (2,'English',6,1);
insert into `subject` value (3,'Chemtry',7,0);
insert into mark (sub_id,student_id,mark,exam_times) value (1,2,8,4),(1,2,10,2),(2,1,12,5);