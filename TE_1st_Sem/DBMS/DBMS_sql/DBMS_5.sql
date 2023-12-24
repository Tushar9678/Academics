-- Assignment 5

show databases;

create database ass5;
use ass5;

create table borrower(
rollno int(10),
name varchar(30),
dateofissue varchar(15),
nameofbook varchar(30),
status char(5)
);

desc borrower;

insert into borrower 
(rollno,name,dateofissue,nameofbook,status)
values
(101,'ram','2017-06-17','dbms','r'),
(102,'sham','2017-07-20','spos','r'),
(103,'sita','2017-07-15','iot','r'),
(106,'gita','2017--08-27','dbms','i'),
(107,'qqq','2017-08-17','cn','i'),
(108,'sssqqq','2017-08-1','dbms','i');

select * from borrower;

delimiter //
create procedure doissuebook(p1 int,p2 varchar(30),p3 varchar (15),p4 varchar(30))
x:begin
set @p3val = str_to_date(p3,'%d/%m/%y');
set @p5val = 'i';
set @errormsg = '';
if p1 <= 0 then
begin
set @errormsg = 'wrong roll no specified';
select @errormsg;
leave x;
end;
end if;
if length(p4) <= 0 then
begin
set @errormsg = 'wrong book';
select @errormsg;
leave x;
end;
end if;
insert into borrower (name,dateofissue,nameofbook,status,rollno)
values(p2,@p3val,p4,@p5val,p1);
end //

create procedure doreturn(rno integer(10),bookname varchar(30))
begin
set @numdays = 0;
set @fineamt = 0.0;
set @numrec = 0;
select datediff(curdate(),dateofissue) from borrower where
rollno = rno and nameofbook = bookname into @numdays;
select count(*) from borrower where rollno = rno and nameofbook = bookname into @numrec;
if @numdays >= 15 and @numdays <= 30 then set @fineamt=(@numdays-15)*5;
elseif @numdays > 30 then set @fineamt = ((15*5)+(@numdays-30)*50);
else set @fineamt = 0;
end if;
if @numrec > 0 then
update borrower set status = 'r' where rollno = rno and nameofbook = bookname;
insert into fine(rollno,date,amt) values (rno,curdate(),@fineamt);
end if;
end;
//

create table fine(
rollno int(10),
date date,
amt decimal(10,2)
);

desc fine;

call doissuebook (106,'gita','2017-08-27',''); //

call doissuebook (0,'gita','2017-08-27','dbms'); //

-- set sql_safe_updates =0;

call doreturn (106,'dbms'); //
select * from fine; //
select * from borrower; //

call doreturn(107,'cn'); //
select * from borrower; //
select * from fine; //



