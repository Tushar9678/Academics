-- Assignment 2

show databases;

create database engg;
use engg;

create table client_master(
client_no varchar(6) primary key,
name varchar(20) not null,
address1 varchar(30),
address2 varchar(30),
city varchar(15),
pincode int(8),
state varchar(15),
bal_due float(10,2)
);

desc client_master;

create table product_master(
product_no varchar(6) primary key,
description varchar(15) not null,
profit_percent float(4,2) not null,
unit_measure varchar(10) not null,
qty_on_hand int(8) not null,
reorder_lvl int not null,
sell_price float(8,2) not null,
cost_price float(8,2) not null
);

desc product_master;

create table salesman_master(
salesman_no varchar(6) primary key,
salesman_name varchar(20) not null,
address1 varchar(30) not null,
address2 varchar(30),
city varchar (20),
pincode float(8,2),
state varchar(20),
sal_amt float(8,2) not null,
tgt_to_get float(6,2) not null,
ytd_sales float(6,2) not null,
remarks varchar(60)
);

desc salesman_master;

create table sales_order(
order_no varchar(6) primary key,
client_no varchar(6), foreign key(client_no) references client_master(client_no),
order_date  date not null,
dely_addr varchar(25),
salesman_no varchar(6), foreign key(salesman_no) references salesman_master(salesman_no),
dele_type char(1),
bill_yn char(1),
dely_date date ,
order_status varchar(10)
);

desc sales_order;

create table sales_order_details(
order_no varchar(6) , foreign key(order_no) references sales_order(order_no),
product_no varchar(6), foreign key(product_no) references product_master(product_no),
qty_ordered int(8),
qty_disp int(8),
product_rate float(10,2)
);

desc sales_order_details;

insert into client_master 
(client_no,name,address1,address2,city,pincode,state,bal_due)
values
("c00001","Ivan Bayross","kalwan","deola","mumbai",400054,"maharashtra",15000),
("c00002","mamta muzumdar","nimani","cbs","madras",780001,"tamilnadu",0),
("c00003","chhaya bankar","dwaraka","ashoknagar","mumbai",400057,"maharashtra",5000),
("c00004","ashwini joshi","rk","shalimar","banglore",560001,"karnataka",0),
("c00005","hansel colaco","kopargoan","lasangoan","mumbai",400060,"maharashtra",2000),
("c00006","dipak sharma","vaijapur","vinchur","banglore",560050,"karnataka",0);

select * from client_master;

insert into product_master
(product_no,description,profit_percent,unit_measure,qty_on_hand,reorder_lvl,sell_price,cost_price)
values
('P0001','T-SHIRTS','5','PIECE','200','50','350','250'),
('P0345','SHIRTS','6','PIECE','150','50','500','350'),
('P06734','COTTON JEANS','5','PIECE','100','20','600','450'), 
('P07865','JEANS','5','PIECE','100','20','750','500'), 
('P07868','TROUSERS','2','PIECE','150','50','850','550'), 
('P07885','PULL OVERS','2.5','PIECE','80','30','700','450'), 
('P07965','DEIM SHIRTS','4','PIECE','100','40','350','250'), 
('P07975','LYCRA TOPS','5','PIECE','70','30','300','175'), 
('P08865','SKIRTS','5','PIECE','75','30','450','300');

select * from product_master;

insert into salesman_master
(salesman_no,salesman_name,address1,address2,city,pincode,state,sal_amt,tgt_to_get,ytd_sales,remarks) 
values
('S00001','AMAN','A/14','WORLI','MUMBAI','400002','MAHARSHTRA','3000','100','50','GOOD'), 
('S00002','OMKAR','65','NARIMAN','MUMBAI','400001','MAHARSHTRA','3000','200','100','GOOD'), 
('S00003','RAJ','P-7','BANDRA','MUMBAI','400032','MAHARSHTRA','3000','200','100','GOOD'), 
('S00004','ASHISH','A/5','JUHU','MUMBAI','400044','MAHARSHTRA','3000','200','150','GOOD');

select * from salesman_master;

insert into sales_order 
(order_no,client_no,order_date,dely_addr,salesman_no,dele_type,bill_yn,dely_date,order_status)
values
('O19001','C00001','04-06-12','NASHIK','S00001','F','N','02-07-20','In Process'),
('O19002','C00002','04-06-25','NASHIK','S00002','P','N','02-06-27','Cancelled'),
('O46865','C00003','04-02-18','NASHIK','S00003','F','Y','02-02-20','Fulfilled'),
('O19003','C00001','04-04-03','NASHIK','S00001','F','Y','02-04-07','Fulfilled'),
('O46866','C00004','04-05-20','NASHIK','S00002','P','N','02-05-22','Cancelled'),
('O19008','C00005','04-05-24','NASHIK','S00004','F','N','02-07-26','In Process');

select * from sales_order;

insert into sales_order_details
(order_no,product_no,qty_ordered,qty_disp,product_rate)
values
('O19001','P0001','4','4','525'),
('O19001','P07965','2','1','8400'),
('O19001','P07885','2','1','5250'), 
('O19002','P0001','10','0','525'),
('O46865','P07868','3','3','3150'),
('O46865','P07885','3','1','5250'),
('O46865','P0001','10','10','525'),
('O46865','P0345','4','4','1050'),
('O19003','P0345','2','2','1050'),
('O19003','P06734','1','1','12000'),
('O46866','P07965','1','0','8400'),
('O46866','P07975','1','0','1050'),
('O19008','P0001','10','5','525'),
('O19008','P07975','5','3','1050');

alter table client_master add telephone int(10);
desc client_master;

alter table product_master modify column sell_price float(10,2);
desc product_master;

drop table client_master;
desc client_master;

rename table salesman_master to Sman_mast;
show tables;

create index idx_Prod on product_master(cost_price);
show index from product_master;

create view vw_sal_ord as 
select s.order_no, s.order_date, sod.product_no,sod.product_rate,sod.qty_ordered,s.order_status
from sales_order s, sales_order_details sod where s.order_no = sod.order_no;
desc vw_sal_ord;
select * from vw_sal_ord;

