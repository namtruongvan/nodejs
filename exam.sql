create table employeeDB
 use EmployeeDB;
 create table Department
 (
 DepartId int primary key , 
 DepartName varchar(50) not null,
 Description varchar(100) not  null,
 )
 create table Employee
 (
 EmpCode char(6) primary key,
 FirstName varchar(30) not null,
 LastName varchar(30) not null,
 Birthday date not null
 Gender Bit default 1,
 Address varchar(100),
 DepartID Int foreign key references Department(Id),
 Salary Money, 
 )

insert into Department values
(1,'Business Administration',' Description Business administration '),
(2,'Administration and Finance',' Description  Administration and Finance'),
(3,'Budgeting','Description Budgeting'),
(4,'Career Services','Description Career Services'), 

	 insert into Employee value
	 ('E1','Em','loyee 1','2010-11-13',1'New york',2,1000),
	 ('E2','Em','loyee 2','2009-12-25',0'Tokio',2,2500),
	 ('E3','Em','loyee 3','2002-07-13',1'Paris',2,1000),
	 ('E4','Em','loyee 4','2000-11-12',0'London',2,3000),
	 ('E5','Em','loyee 5','2005-05-13',1'London',1,800),
	 ('E6','Em','loyee 6','2004-11-10',1'New york',1,4000),
	 ('E7','Em','loyee 7','2020-08-03',1'New york',1,5000),
	 ('E8','Em','loyee 8','2006-09-28',1'New york',1,4000),
	 ('E9','Em','loyee 9','2001-10-10',0'Paris',3,8000),
	 ('E10','Em','loyee 10','2000-02-27',0'San Hok',3,14000),
	 ('E11','Em','loyee 11','2009-03-16',1'New Camp',2,10000),
	 ('E12','Em','loyee 12','2001-03-19',1'Real Marid',1,3000),
     ('E13','Em','loyee 13','1999-08-04',0'London',2,4000),

-- Chèn vào các bảng trên ít nhất 3 bản ghi cho mỗi bảng
-- Tăng lương cho tất cả nhân viên thêm 10% 

update Employee
set Salary = Salaery+(Salary*10/100);
-- Sử dụng câu lệnh ALTER TABLE để thêm ràng buộc vào bảng Nhân viên để đảm bảo rằng mức lương luôn lớn hơn 0 
alter table Salary
add constraint CK_Salary check(Salary>0)
-- Tạo trình kích hoạt có tên tg_chkBirthday để đảm bảo tuổi của Nhân viên lớn hơn 22, sử dụng giá trị ngày sinh để kiểm tra độ tuổi 
create trigger tg_chkBritday 
-- Tạo một chỉ mục duy nhất, không phân cụm có tên IX_DepartmentName trên cột DepartName trên bảng Department 
create index IX_DepartmentName on Department(DepartName);
-- Tạo một khung nhìn để hiển thị mã nhân viên, họ tên và tên bộ phận của tất cả nhân viên 
create view V_Epl_Dpm as 
select FirstName , LastName,DeparName from Employee as e join Department as d on .DepartID = d.Id
-- Tạo một thủ tục được lưu trữ có tên sp_getAllEmp chấp nhận ID Bộ phận làm tham số đầu vào đã cho và hiển thị tất cả nhân viên trong Bộ phận đó 
alter procedure sp_getAllemp @ID int as
select *from Employee where DepartID in 
(select Id from Department where Id = 
(SELECT DeparID from Employee where EmpCode =@ID))
exec sp_getAllEmp @ID = 'E1'
-- Tạo một thủ tục được lưu trữ có tên sp_delDept chấp nhận Id nhân viên làm tham số đầu vào đã cho để xóa một nhân viên :  
create procedure sp_delDept @ID char(6) as
delete from Employee where EmpCode = @ID
exec sp_delDept @ID = 'E1''

select * from Employee
select * from Department