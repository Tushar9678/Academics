-- assignment 8

create database library;
use library;

create table borrower(
rollno int(10),
name varchar(11),
dateofissue date,
nameofbook varchar(10),
status char(10)
);
desc borrower;

insert into borrower
(rollno,name,dateofissue,nameofbook,status)
values
('101','ram','2017-06-17','dbms','r'),
('102','sham','2017-07-20','iot','i'),
('103','sita','2017-07-15','se','r'),
('104','mita','2017-08-26','toc','i');

select * from borrower ;

create table library_audit(
rollno int(10) primary key,
name varchar(10),
dateofissue date,
nameofbook varchar(10),
status char(2),
ts timestamp
);
desc library_audit;

delimiter //
create trigger after_trigger after insert on borrower for each row
begin
insert into library_audit
values(new.rollno,new.name,new.dateofissue,new.nameofbook,new.status,current_timestamp);
end; //

select * from library_audit; //

insert into borrower values('106','gita','2017-08-27','dbms','i'); //
select * from borrower; //

select * from library_audit; //

create trigger after_delete after delete on borrower for each row
begin
insert into library_audit
values(old.rollno,old.name,old.dateofissue,old.nameofbook,old.status,current_timestamp);
end; //

set sql_safe_updates =0;

delete from borrower where rollno=104; //
select * from library_audit; //

create trigger after_update after update on borrower for each row
begin
insert into library_audit
values(new.rollno,new.name,new.dateofissue,new.nameofbook,new.status,current_timestamp);
end; //

update borrower set status='r' where borrower.rollno='102';//
select * from library_audit; //

delimiter //
create trigger before_insert before insert on borrower for each row
begin
insert into library_audit
values(new.rollno,new.name,new.dateofissue,new.nameofbook,new.status,current_timestamp);
end; //

insert into borrower values('107','tush','2017--09-17','cns','r'); //
select * from library_audit; //

create trigger before_delete before delete on borrower for each row
begin
insert into library_audit
values(old.rollno,old.name,old.dateofissue,old.nameofbook,old.status,current_timestamp);
end; //

delete from borrower where rollno=103; //

select * from borrower;

select * from library_audit; //

create trigger before_update before update on borrower for each row
begin
insert into library_audit
values(new.rollno,new.name,new.dateofissue,new.nameofbook,new.status,current_timestamp);
end; //

update borrower set status='r' where borrower.rollno='106'//
select * from borrower;
select * from library_audit; //



