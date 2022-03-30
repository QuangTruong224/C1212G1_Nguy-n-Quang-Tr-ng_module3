create database quan_li_vat_tu;
use quan_li_vat_tu;
create table phieu_xuat(
so_px int auto_increment primary key,
ngay_xuat date
);
create table chi_tiet_phieu_xuat(
dg_xuat int,
sl_xuat int,
so_px int,
ma_vtu int,
primary key(so_px,ma_vtu),
foreign key (so_px)references phieu_xuat(so_px),
foreign key (ma_vtu)references vat_tu(ma_vtu)
);
create table vat_tu(
ma_vtu int auto_increment primary key,
ten_vtu varchar(50)
);
create table chi_tiet_phieu_nhap(
dg_nhap varchar(50),
sl_nhap int,
ma_vtu int,
so_pn int,
primary key(ma_vtu,so_pn),
foreign key (ma_vtu) references vat_tu(ma_vtu),
foreign key (so_pn) references phieu_nhap(so_pn)
);
create table phieu_nhap(
so_pn int auto_increment primary key,
ngay_nhap date
);
create table don_dh(
so_dh int auto_increment primary key,
ngay_dh date	
);
create table chi_tiet_don_dat_hang(
ma_vtu int,
so_dh int,
primary key(so_dh,ma_vtu),
foreign key(ma_vtu) references vat_tu(ma_vtu),
foreign key(so_dh) references don_dh(so_dh)
);
create table nha_cc(
ma_ncc int auto_increment primary key,
ten_ncc varchar(50),
dia_chi varchar(50),
so_dt varchar(10),
unique(so_dt)
);
create table so_dt(
so_dt varchar(10) primary key,
foreign key (so_dt) references nha_cc(so_dt) 
);