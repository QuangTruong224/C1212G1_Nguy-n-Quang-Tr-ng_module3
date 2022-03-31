use quan_li_khu_nghi_duong_furama;

-- task 2 	Hiển thị thông tin của tất cả nhân viên có trong hệ thống 
-- có tên bắt đầu là một trong các ký tự “H”, “T” hoặc “K” và có tối đa 15 kí tự.
select * from nhan_vien 
where ( nhan_vien.ho_ten  like "H%" or ho_ten like "K%" or ho_ten like "T%" )
and (char_length(ho_ten )<15 );

-- task 3 	Hiển thị thông tin của tất cả khách hàng 
-- có độ tuổi từ 18 đến 50 tuổi và có địa chỉ ở “Đà Nẵng” hoặc “Quảng Trị”.
select * from khach_hang
where (year(current_timestamp)- year(ngay_sinh)) between 18 and 50
and (dia_chi like "%Đà Nẵng" or dia_chi like "%Quảng Trị") ;

-- task 4 Đếm xem tương ứng với mỗi khách hàng
--  đã từng đặt phòng bao nhiêu lần.
--  Kết quả hiển thị được sắp xếp tăng dần theo số lần đặt phòng của khách hàng.
--  Chỉ đếm những khách hàng nào có Tên loại khách hàng là “Diamond”.
select hop_dong.ma_khach_hang,khach_hang.ho_ten, count(ma_hop_dong) as 'Sô lần đặt phòng'
from  hop_dong 
join khach_hang on hop_dong.ma_khach_hang = khach_hang.ma_khach_hang
join loai_khach on khach_hang.ma_loai_khach = loai_khach.ma_loai_khach
where ten_loai_khach like "Diamond"
group by hop_dong.ma_khach_hang
order by (ma_hop_dong) asc ;

-- task 8	Hiển thị thông tin ho_ten khách hàng có trong hệ thống, với yêu cầu ho_ten không trùng nhau.
select  khach_hang.ho_ten from khach_hang
union 
select  khach_hang.ho_ten from khach_hang;