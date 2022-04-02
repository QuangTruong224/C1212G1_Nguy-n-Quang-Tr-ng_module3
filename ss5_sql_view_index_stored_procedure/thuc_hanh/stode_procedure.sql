use classicmodels;
select * from customers where customerName = 'Land of Toys Inc.';
explain select * from customers where customerName= 'Land of Toys Inc.';
alter table customers add index idx_customerName(customerName);
explain select * from customers where customerName= 'Land of Toys Inc.';

-- possible_keys : Đưa ra những Index có thể sử dụng để query
-- key : và Index nào đang được sử dụng
-- key_len : Chiều dài của từng mục trong Index
-- ref : Cột nào đang sử dụng
-- rows : Số hàng (rows) mà MySQL dự đoán phải tìm
-- extra : Thông tin phụ, thật tệ nếu tại cột này là “using temporary” hay “using filesort” 

alter table customers add index idx_full_name(contactFirstName, contactLastName);
explain select * from customers where contactFirstName = 'Jean' or contactFirstName = 'King';
alter table customers drop index idx_full_name;

use classicmodels;

-- DELIMITER // dùng để phân cách bộ nhớ lưu trữ thủ tục Cache và mở ra một ô lưu trữ mới.

-- CREATE PROCEDURE findAllCustomers() dùng để khai báo tạo một Procedure mới, 
-- trong đó findAllCustomers chính là tên thủ tục còn hai từ đầu là từ khóa.

-- **BEGIN và END; // ** dùng để khai báo bắt đầu của Procedure và kết thúc Procedure
delimiter //
create procedure findAllCustomers()
begin 

select * from customers;

end //
delimiter ;
-- **DELIMITER ; ** đóng lại ô lưu trữ
call findALLCustomers();

delimiter //
drop procedure if exists `findAllCustomers` //
create procedure findAllCustomers()
begin 
select * from customers where customerNumber=175 ; 
end //
call findALLCustomers();

