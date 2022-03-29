create database quan_li_sinh_vien;
use quan_li_sinh_vien;
create table class(
ClassID int auto_increment primary key,
ClassName varchar(60) not null,
StartDate date not null,
status bit
);
create table student (
StudentID int auto_increment primary key,
StudentName varchar(30) not null,
Adress varchar(50),
Phone varchar (20),
Status bit,
ClassID int not null,
foreign key (ClassID) references class(ClassID)
);
create table subject(
SubId  int auto_increment primary key,
SubName varchar(30) not null,
Credit tinyint not null
default  1 , check(Credit >=1),
status bit default 1
);
create table mark(
MarkID int auto_increment primary key,
SubID int  ,
StudentID int ,
Mark float 
default 0 ,check(Mark between 0 and 100),
ExamTimes tinyint default 1 ,
unique(SubID,StudentID),
foreign key (SubID) references Class(ClassID),
foreign key (StudentID) references Student(StudentID)
);