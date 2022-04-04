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

-- task 5 Hiển thị ma_khach_hang, ho_ten, ten_loai_khach, ma_hop_dong, ten_dich_vu, ngay_lam_hop_dong, ngay_ket_thuc, tong_tien
--  (Với tổng tiền được tính theo công thức như sau: Chi Phí Thuê + Số Lượng * Giá, với Số Lượng và Giá là từ bảng dich_vu_di_kem, hop_dong_chi_tiet)
--  cho tất cả các khách hàng đã từng đặt phòng. (những khách hàng nào chưa từng đặt phòng cũng phải hiển thị ra).
select khach_hang.ma_khach_hang,
khach_hang.ho_ten,
loai_khach.ten_loai_khach,
hop_dong.ma_hop_dong,
dich_vu.ten_dich_vu,
hop_dong.ngay_lam_hop_dong,
hop_dong.ngay_ket_thuc,
if (hop_dong_chi_tiet.so_luong is null, dich_vu.chi_phi_thue, 
sum(dich_vu.chi_phi_thue + (hop_dong_chi_tiet.so_luong * dich_vu_di_kem.gia))) as "số tiền"
from khach_hang
left join loai_khach on khach_hang.ma_loai_khach = loai_khach.ma_loai_khach
left join hop_dong on khach_hang.ma_khach_hang = hop_dong.ma_khach_hang
left join dich_vu on hop_dong.ma_dich_vu =  dich_vu.ma_dich_vu
left join hop_dong_chi_tiet on hop_dong.ma_hop_dong = hop_dong_chi_tiet.ma_hop_dong
left join dich_vu_di_kem on hop_dong_chi_tiet.ma_dich_vu_di_kem = dich_vu_di_kem.ma_dich_vu_di_kem
group by hop_dong.ma_hop_dong
order by  khach_hang.ma_khach_hang , hop_dong.ma_hop_dong desc ;

 -- task 6 Hiển thị ma_dich_vu, ten_dich_vu, dien_tich, chi_phi_thue, ten_loai_dich_vu 
--  của tất cả các loại dịch vụ chưa từng được khách hàng thực hiện đặt từ quý 1 của năm 2021 (Quý 1 là tháng 1, 2, 3).
select dich_vu.ma_dich_vu, dich_vu.ten_dich_vu, dich_vu.dien_tich, dich_vu.chi_phi_thue, loai_dich_vu.ten_loai_dich_vu
from dich_vu left join loai_dich_vu on dich_vu.ma_loai_dich_vu = loai_dich_vu.ma_loai_dich_vu
left join hop_dong on dich_vu.ma_dich_vu = hop_dong.ma_dich_vu
where  dich_vu.ten_dich_vu
not in(select dich_vu.ten_dich_vu
from dich_vu join hop_dong on dich_vu.ma_dich_vu = hop_dong.ma_dich_vu
where  hop_dong.ngay_lam_hop_dong
between "2021/01/01" and"2021/03/31")
group by ma_dich_vu order by chi_phi_thue desc; 

-- task 7: Hiển thị thông tin ma_dich_vu, ten_dich_vu, dien_tich, so_nguoi_toi_da, chi_phi_thue, ten_loai_dich_vu 
-- của tất cả các loại dịch vụ đã từng được khách hàng đặt phòng trong năm 2020 nhưng chưa từng được khách hàng đặt phòng trong năm 2021.
 select 
 dich_vu.ma_dich_vu,
 dich_vu.ten_dich_vu,
 dich_vu.dien_tich,
 dich_vu.so_nguoi_toi_da,
 dich_vu.chi_phi_thue,
 loai_dich_vu.ten_loai_dich_vu
 from dich_vu
 join loai_dich_vu on loai_dich_vu.ma_loai_dich_vu = dich_vu.ma_loai_dich_vu
 join hop_dong on hop_dong.ma_dich_vu= dich_vu.ma_dich_vu 
where (hop_dong.ngay_lam_hop_dong between '2020-1-1' and '2020-12-31')
and (hop_dong.ngay_lam_hop_dong not between '2021-1-1 ' and '2021-12-31')
group by dich_vu.ma_dich_vu;

-- task 8	Hiển thị thông tin ho_ten khách hàng có trong hệ thống, với yêu cầu ho_ten không trùng nhau.
-- cách 1: 
select  khach_hang.ho_ten from khach_hang
union 
select  khach_hang.ho_ten from khach_hang;
-- cách 2: 
 select distinct khach_hang.ho_ten from khach_hang;
 -- cách 3 :
 select 
khach_hang.ho_ten 
from khach_hang
group by ho_ten;

-- task 9 Thực hiện thống kê doanh thu theo tháng, 
-- nghĩa là tương ứng với mỗi tháng trong năm 2021 thì sẽ có bao nhiêu khách hàng thực hiện đặt phòng.
select 
month(ngay_lam_hop_dong) thang,
count(month(ngay_lam_hop_dong)) so_luong_khach_hang
from
	hop_dong
    where year(ngay_lam_hop_dong)= 2021
    group by month(ngay_lam_hop_dong)
    order by month(ngay_lam_hop_dong) asc ;
    
    
-- task 10 Hiển thị thông tin tương ứng với từng hợp đồng thì đã sử dụng bao nhiêu dịch vụ đi kèm.
--  Kết quả hiển thị bao gồm ma_hop_dong, ngay_lam_hop_dong, ngay_ket_thuc, tien_dat_coc, so_luong_dich_vu_di_kem 
--  (được tính dựa trên việc sum so_luong ở dich_vu_di_kem).
select 
hop_dong.ma_hop_dong,
ngay_lam_hop_dong,
ngay_ket_thuc,
tien_dat_coc,
sum(ifnull(so_luong,0)) as so_luong_dich_vu_di_kem
from
 hop_dong
 left join hop_dong_chi_tiet on hop_dong_chi_tiet.ma_hop_dong = hop_dong.ma_hop_dong
 group by ma_hop_dong;
 
 -- task11 Hiển thị thông tin các dịch vụ đi kèm đã được sử dụng bởi những khách hàng có 
--  ten_loai_khach là “Diamond” và có dia_chi ở “Vinh” hoặc “Quảng Ngãi”.
 SELECT 
    dvdk.ma_dich_vu_di_kem,
    dvdk.ten_dich_vu_di_kem
FROM
dich_vu_di_kem as dvdk join hop_dong_chi_tiet as hdct on hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
join hop_dong as hd on hdct.ma_hop_dong = hd.ma_hop_dong
join khach_hang as kh on kh.ma_khach_hang = hd.ma_khach_hang
join loai_khach as lk on lk.ma_loai_khach = kh.ma_loai_khach
where
    (lk.ten_loai_khach = 'Diamond') and (kh.dia_chi like '%Vinh'
        or kh.dia_chi like '%Quảng Ngãi');
        
-- task 12 	Hiển thị thông tin ma_hop_dong, ho_ten (nhân viên), ho_ten (khách hàng), 
-- so_dien_thoai (khách hàng), ten_dich_vu, so_luong_dich_vu_di_kem 
-- (được tính dựa trên việc sum so_luong ở dich_vu_di_kem),
--  tien_dat_coc của tất cả các dịch vụ đã từng được khách hàng đặt vào 3 tháng cuối năm 2020 
--  nhưng chưa từng được khách hàng đặt vào 6 tháng đầu năm 2021.

-- task 13 Hiển thị thông tin các Dịch vụ đi kèm được sử dụng nhiều nhất bởi các Khách hàng đã đặt phòng
-- . (Lưu ý là có thể có nhiều dịch vụ có số lần sử dụng nhiều như nhau).
select 
 dich_vu_di_kem.ma_dich_vu_di_kem ,
dich_vu_di_kem.ten_dich_vu_di_kem ,
sum(hop_dong_chi_tiet.so_luong) as so_luong_dich_vu_di_kem
from dich_vu_di_kem
join hop_dong_chi_tiet on dich_vu_di_kem.ma_dich_vu_di_kem = hop_dong_chi_tiet.ma_dich_vu_di_kem
group by hop_dong_chi_tiet.ma_dich_vu_di_kem
having so_luong_dich_vu_di_kem >= all(select so_luong 
from hop_dong_chi_tiet);

-- task 14 	Hiển thị thông tin tất cả các Dịch vụ đi kèm chỉ mới được sử dụng một lần duy nhất.
--  Thông tin hiển thị bao gồm ma_hop_dong, ten_loai_dich_vu, ten_dich_vu_di_kem, so_lan_su_dung
--  (được tính dựa trên việc count các ma_dich_vu_di_kem). 
select hop_dong.ma_hop_dong , loai_dich_vu.ten_loai_dich_vu , dich_vu_di_kem.ten_dich_vu_di_kem, count(dich_vu_di_kem.ma_dich_vu_di_kem)
from hop_dong 
inner join dich_vu on hop_dong.ma_dich_vu=dich_vu.ma_dich_vu
inner join loai_dich_vu on  dich_vu.ma_loai_dich_vu= loai_dich_vu.ma_loai_dich_vu
inner join hop_dong_chi_tiet on hop_dong.ma_hop_dong = hop_dong_chi_tiet.ma_hop_dong
inner join dich_vu_di_kem on  hop_dong_chi_tiet.ma_dich_vu_di_kem= dich_vu_di_kem.ma_dich_vu_di_kem
group by dich_vu_di_kem.ma_dich_vu_di_kem
having
count(dich_vu_di_kem.ma_dich_vu_di_kem)=1
order by hop_dong.ma_hop_dong asc
; 

-- task 15 Hiển thi thông tin của tất cả nhân viên bao gồm
--  ma_nhan_vien, ho_ten, ten_trinh_do, ten_bo_phan, so_dien_thoai, dia_chi mới chỉ lập được tối đa 3 hợp đồng từ năm 2020 đến 2021.
select nhan_vien.ma_nhan_vien,nhan_vien.ho_ten, trinh_do.ten_trinh_do , bo_phan.ten_bo_phan, nhan_vien.so_dien_thoai, nhan_vien.dia_chi
from nhan_vien
inner join vi_tri on nhan_vien.ma_vi_tri=vi_tri.ma_vi_tri
inner join trinh_do on nhan_vien.ma_trinh_do = trinh_do.ma_trinh_do
inner join bo_phan on nhan_vien.ma_bo_phan=bo_phan.ma_bo_phan
left join hop_dong on nhan_vien.ma_nhan_vien = hop_dong.ma_nhan_vien
where (year(hop_dong.ngay_lam_hop_dong) between 2020 and 2021) 
group by nhan_vien.ma_nhan_vien 
having
count(hop_dong.ngay_lam_hop_dong) < 4;

-- task 16 Xóa những Nhân viên chưa từng lập được hợp đồng nào từ năm 2019 đến năm 2021.
select nhan_vien.ma_nhan_vien, nhan_vien.ho_ten
from nhan_vien
inner join hop_dong on nhan_vien.ma_hop_dong=hop_dong.ma_hop_dong
inner join 

-- -- task 17 Cập nhật thông tin những khách hàng có ten_loai_khach từ Platinum lên Diamond, 
-- -- chỉ cập nhật những khách hàng đã từng đặt phòng với Tổng Tiền thanh toán trong năm 2021 là lớn hơn 10.000.000 VNĐ.
-- select loai_khach.ma_loai_khach, loai_khach.ten_loai_khach
-- from loai_khach 

 



 