use quan_li_sinh_vien;
select adress ,count(student_id) as 'Số lượng học viên'
from  student
group by adress;

select s.student_id , s.sutdent_name , avg(mark) 
as 'Điểm trung bình'
from student s join mark m on s.student_id=m.student_id
group by s.student_id,s.sutdent_name;


select s.student_id,  s.sutdent_name, avg(mark)
as 'Điểm trung bình lớn hơn 10'
from student s join mark m on s.student_id=m.student_id
group by s.student_id,s.sutdent_name
having avg(mark) > 10;

select s.student_id, s.sutdent_name,avg(mark)
as 'Điểm trung bình lớn nhất'
from student s join mark m  on s.student_id=m.student_id
group by s.student_id, s. sutdent_name
having avg(mark) >= all (select avg(mark) from mark group by mark.student_id);