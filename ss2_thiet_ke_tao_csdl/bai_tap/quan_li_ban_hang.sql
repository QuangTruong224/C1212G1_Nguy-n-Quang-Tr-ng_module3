create database  quan_li_ban_hang;
use quan_li_ban_hang;
create table `order`(
id_or int primary key,
id_cus int,
foreign key(id_cus) references customer(id_cus),
date_or date,
total_price_or double
);

create table customer(
id_cus int primary key,
name_cus varchar(45),
age_cus varchar(45)
);

create table product(
id_pro int primary key,
name_pro varchar(45),
price_pro double
);

create table `orderdetail`(
id_or int ,
id_pro int,
qty_odd int,
primary key(id_or,id_pro),
foreign key(id_or) references `order`(id_or),
foreign key(id_pro) references product(id_pro)
);