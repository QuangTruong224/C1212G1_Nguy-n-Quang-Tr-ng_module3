create database quan_li_khu_nghi_duong_furama;
use quan_li_khu_nghi_duong_furama;
create table nhan_vien(
ma_nv int auto_increment primary key,
ho_ten varchar(45) not null,
ngay_sinh date not null,
so_cmnd varchar(45) not null,
luong double not null,
so_dt varchar(45) not null,
email varchar(45),
dia_chi varchar(45)
);
create table vi_tri (
ma_vt int auto_increment primary key,
ten_vt varchar(45)
);
create table trinh_do(
ma_td int auto_increment primary key,
ten_td varchar(45)
);

 create table bo_phan(
 ma_bp int auto_increment primary key,
 ten_bp varchar(45)
 );

create table khach_hang(
ma_kh int auto_increment primary key,
ho_ten varchar(45) not null,
ngay_sinh date not null,
gioi_tinh bit(1) not null,
so_cmnd varchar(45) not null,
so_dt varchar(45) not null,
email varchar(45),
dia_chi varchar(45)
);

create table loai_khach(
ma_lk int auto_increment primary key,
ten_lk varchar(45)
);

create table  hop_dong(
ma_hd int auto_increment primary key,
ngay_lam_hop_dong datetime not null,
ngay_ket_thuc datetime not null,
tien_dat_coc double
);

create table dich_vu(
ma_dv int auto_increment primary key,
ten_dv varchar(45) not null,
dien_tich int,
chi_phi_thue double,
so_nguoi_toi_da int,
tieu_chuan_phong varchar(45),
to_ta_tien_nghi_khac varchar(45),
dien_tich_ho_boi double,
so_tang int
);

create table kieu_thue(
ma_kieu_thue int auto_increment primary key,
ten_kieu_thue varchar(45)
);

create table loai_dich_vu(
ma_loai_dich_vu int auto_increment primary key,
ten_loai_dich_vu varchar(45)
);
create table hop_dong_chi_tiet(
ma_hop_dong_chi_tiet int auto_increment primary key,
so_luong int 
);
create table dich_vu_di_kem(
ma_dich_vu_di_kem int auto_increment primary key,
ten_dich_vu_di_kem varchar(45) not null,
gia double not null,
don_vi varchar(10) not null,
trang_thai varchar(45)
);






