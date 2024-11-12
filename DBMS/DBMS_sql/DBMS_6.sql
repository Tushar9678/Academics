-- assignment 6

show databases;

create database ass6;
use ass6;

create table stud_marks(
rollno int(11),
name varchar(10),
total_marks int(11)
);
desc stud_marks;

create table new_stud_marks( rollno int(11) , grade char(10));
desc new_stud_marks;

insert into stud_marks 
(rollno,name,total_marks)
values
('1','tushar','80'),
('2','anurag','90'),
('3','shivam','70'),
('4','kapil','60'),
('5','vedant','50');
select * from stud_marks;

delimiter //
create procedure set_cursor6()
begin
declare roll_no integer;
declare marks integer;
declare flag integer;
declare c1 cursor for select rollno, total_marks from stud_marks;
open c1;
ll:loop
fetch c1 into roll_no, marks;
set flag=0;
select rollno into flag from new_stud_marks where new_stud_marks.rollno = roll_no;
if flag=0 then
if marks <= 100 and marks >= 65 then insert into new_stud_marks values (roll_no,'dist');
end if;
if marks < 65 and marks >= 60 then insert into new_stud_marks values (roll_no,'fc');
end if;
if marks < 60 and marks >=50 then insert into new_stud_marks values (roll_no,'sc');
end if;
if marks < 50 and marks >= 40 then insert into new_stud_marks values (roll_no,'pc');
end if;
if marks < 40 then insert into new_stud_marks values (rollno,'fail');
end if;
end if;
end loop ll;
close c1;
end;
//

call set_cursor6; //

select * from new_stud_marks; //
