create database  quan_li_ban_hang;
use quan_li_ban_hang;
create table `order`(
o_ID int auto_increment primary key,
c_ID int,
foreign key (c_ID) references `customer`(c_ID),
o_Date date,
o_total_price double
);

create table `customer`(
c_ID int auto_increment primary key,
c_Name varchar(50),
c_Age varchar(50)
);
create table `product` (
p_ID int auto_increment primary key,
p_Name varchar(50),
p_Price double
);
create table `order_detail`(
o_ID int,
p_ID int,
od_Qty int,
unique (o_ID , p_ID),
foreign key (o_ID) references `order` (o_ID),
foreign key (p_ID) references `product` (p_ID)
);
