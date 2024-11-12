show databases;

create database ass7;
use ass7;

create table stud_marks(roll_no int primary key, name varchar(10), total_marks int);
create table result( roll_no int(10), name varchar(10), class char(10));

insert into stud_marks (roll_no,name,total_marks)
values
(101,'abc',933),
(102,'xyz',356),
(103,'mnk',450),
(104,'pqr',675),
(105,'snk',1300),
(106,'jnk',250);

select * from stud_marks;

delimiter //
create procedure proc_grade(in marks int(10),out class char(10))
begin
if marks<=1500 and marks>=990 then set class='dist';
end if;
if marks<=989 and marks>=900 then set class='fc';
end if;
if marks<=899 and marks>=825 then set class='hsc';
end if;
if marks<=824 and marks>=750 then set class='sc';
end if;
if marks<=749 and marks>=651 then set class='pc';
end if;
if marks<=650 then set class= 'fail';
end if;
end;
//

delimiter //
create function find_result (roll_in int(5)) returns int deterministic
begin
declare fmarks int;
declare grade char(10);
declare stud_name char(10);
select stud_marks.total_marks,stud_marks.name into
fmarks,stud_name from
stud_marks where stud_marks.roll_no=roll_in;
call proc_grade(fmarks,@grade);
insert into result values (roll_in,stud_name,@grade);
return roll_in;
end;
//

select find_result(104); //
select * from result ; //

select find_result(101); //
select * from result ; //

select find_result(106); //
select * from result ; //

select find_result(102); //
select * from result ; //

select find_result(103); //
select * from result ; //

select find_result(105); //
select * from result ; //










