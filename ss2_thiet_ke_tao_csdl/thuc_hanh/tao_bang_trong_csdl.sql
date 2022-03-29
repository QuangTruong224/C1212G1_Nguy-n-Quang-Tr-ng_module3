create database `quan_li_diem_thi`;
use `quan_li_diem_thi`;
create table hoc_sinh (
`MaHS` int  auto_increment primary key ,
`TenHs` varchar(20) not  null,
`NgaySinh` datetime ,
`Lop` varchar(20) ,
`Gt` bit 
);
INSERT INTO quan_li_diem_thi.hoc_sinh (`TenHs`, `NgaySinh`, `Lop`, `Gt`) 
VALUES ('Trường', '2000-04-22 12:12:12', 'C1221G1', 1),('Ngọc', '2000-04-22', 'C1221G1', 0);

set sql_safe_updates=0;
delete from hoc_sinh where `TenHs` ="Trường";
set sql_safe_updates=1;
create table mon_hoc(
`MaHH` varchar(20) primary key,
`TenHH` varchar(50)
);
insert into quan_li_diem_thi.mon_hoc(`MaHH`,`TenHH`) values('SS1','Cơ sở dữ liệu','C1221G1');
create table bang_diem(
`MaHS` int,
`MaHH` varchar(20),
`DiemThi` int,
`NgayKT` datetime,
primary key(`MaHS`,`MaHH`),
foreign key(`MaHS`) references hoc_sinh (`MaHS`),
foreign key(`MaHH`) references mon_hoc(`MaHH`)
);

create table giao_vien(
`MaGv` varchar(20) primary key,
`TenGv` varchar(20),
`Sdt` varchar(10)
);

alter table  mon_hoc add `MaGv` varchar(20);
alter table mon_hoc add constraint `FK_MaGv`foreign key(`MaGv`) references giao_vien(`MaGv`);


