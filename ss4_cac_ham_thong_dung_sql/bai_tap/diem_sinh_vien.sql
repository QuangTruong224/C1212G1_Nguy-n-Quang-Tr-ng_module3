use quan_li_sinh_vien;

--  Hiển thị tất cả các thông tin môn học (bảng subject) có credit lớn nhất.
select * from `subject` where credit= (select max(credit) from `subject`);

-- Hiển thị các thông tin môn học có điểm thi lớn nhất.
select `subject`.sub_id , `subject`.sub_name, mark.mark from `subject` 
join mark on `subject`.sub_id=mark.sub_id
where mark.mark = (select max(mark) from mark);

-- Hiển thị các thông tin sinh viên và điểm trung bình của mỗi sinh viên, xếp hạng theo thứ tự điểm giảm dần
select s.student_id, s.sutdent_name, avg(mark)
as 'Điểm trung bình'
from student s join mark m on
s.student_id=m.student_id
group by s.student_id,s.sutdent_name
order by mark desc;



