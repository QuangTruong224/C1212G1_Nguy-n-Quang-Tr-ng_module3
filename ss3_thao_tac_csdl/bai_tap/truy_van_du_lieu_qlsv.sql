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
insert into `subject` value (1,'Math',5,1),(2,'English',6,1),(3,'Chemtry',7,0);
insert into mark (sub_id,student_id,mark,exam_times) value (1,2,8,4),(1,2,10,2),(2,1,12,5);
select * from student;
select * from student where `status`=true;
select * from `subject` where credit>5;
select student.student_id, student.sutdent_name,class.class_name 
from student  join class  on student.class_id =class.class_id;
select student.student_id, student.sutdent_name,class.class_name 
from student  join class  on student.class_id =class.class_id
where class.class_name= 'A1';

-- Hiển thị tất cả các sinh viên có tên bắt đầu bảng ký tự ‘h’
select * from student  where student.sutdent_name like 'h%';
-- Hiển thị các thông tin lớp học có thời gian bắt đầu vào tháng 12.
select * from class
where month(start_date)=6;
-- Hiển thị tất cả các thông tin môn học có credit trong khoảng từ 3-5.
select * from `subject` where credit>6 and credit<8;

-- Thay đổi mã lớp(ClassID) của sinh viên có tên ‘Hung’ là 2.
update student
set class_id=2
where student_id =1;
-- Hiển thị các thông tin: StudentName, SubName, Mark.
--  Dữ liệu sắp xếp theo điểm thi (mark) giảm dần. 
--  nếu trùng sắp theo tên tăng dần.
select sutdent_name,sub_name,mark
 from student , `subject` ,mark 
 order by mark desc,sutdent_name asc;


