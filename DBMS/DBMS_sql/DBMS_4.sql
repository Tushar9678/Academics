-- assignment 4 
use engg;

-- Find out the products. Which have been sold to 'Ivan Bayross'
select
name,
product_master.product_no,
description,
sales_order.order_no
from
client_master,
product_master,
sales_order,
sales_order_details
where
client_master.name = 'ivan bayross'
and
client_master.client_no = sales_order.client_no
and
sales_order.order_no = sales_order_details.order_no
and
sales_order_details.product_no = product_master.product_no;


-- Find out the products and their quantities that will have to be delivered in the current month. (ANS NOT SURE)
select 
dely_date, sales_order_details.product_no, qty_ordered, description 
from
sales_order,sales_order_details,product_master
where 
sales_order.order_no = sales_order_details.order_no
and 
sales_order_details.product_no = product_master.product_no 
and 
date_format(sales_order.dely_date,'mm') = date_format(sysdate(),'mm');


-- other ans
select
    sales_order.dely_date,
    sales_order_details.product_no,
    sales_order_details.qty_ordered,
    product_master.description
from
    sales_order
join
    sales_order_details on sales_order.order_no = sales_order_details.order_no
join
    product_master on sales_order_details.product_no = product_master.product_no
where
    month(sales_order.dely_date) = month(current_date);
    

-- List the ProductNo and description of constantly sold (i.e. rapidly moving) products.
select product_no 
from sales_order_details 
where 
product_rate = (select max(product_rate) from sales_order_details );

-- Find the names of the clients who have purchased 'Trousers'.
select distinct so.client_no, cm.name 
from 
sales_order_details sod, sales_order so, product_master pm, client_master cm 
where 
pm.product_no = sod.product_no 
and so.order_no = sod.order_no 
and cm.client_no = so.client_no and description = 'trousers';

-- List the products and orders from customers who have orderd less than 5 units of 'PullOvers'.
select product_master.product_no,order_no
from
product_master,sales_order_details 
where 
description = 'pull overs'
and
product_master.product_no = sales_order_details.product_no 
and qty_ordered<5;

-- Find the products and their quantities for the orders placed by ‘Ivan Bayross’ and ‘Mamta Muzumdar’.
select sod.product_no, pm.description, sum(qty_ordered) units_ordered
from 
sales_order_details sod, sales_order so, product_master pm,client_master cm 
where 
so.order_no = sod.order_no 
and pm.product_no = sod.product_no 
and cm.client_no = so.client_no 
and (cm.name = 'ivan bayross' or cm.name ='mamta muzumdar') 
group by sod.product_no, pm.description;

-- Find the products and their quantities for the orders placed by Client_No ‘C00001’ and ‘C00002’.
select so.client_no, sod.product_no, pm.description, sum(qty_ordered) units_ordered 
from 
sales_order so, sales_order_details sod, product_master pm, client_master cm 
where 
so.order_no = sod.order_no and sod.product_no = pm.product_no and so.client_no = cm.client_no 
group by 
so.client_no,sod.product_no, pm.description 
having 
so.client_no = 'c00001' or so.client_no ='c00002';

-- -----------------------------------------------------------------------------------------------------------------------------------

-- 1)Find the Product_No and Description of non-moving products i.e. Products not beign sold.
select product_no, description 
from product_master 
where
product_no not in(select product_no from sales_order_details);

-- List the customer name, address1, address2, city and pincode for the client who has placed Order_No ‘O19001’.
select name, address1,address2, city, state, pincode 
from client_master
where client_no in(select client_no from sales_order where order_no = 'o19001');

-- List the client names that have placed orders before the month of May’02.
select client_no, name 
from client_master 
where client_no in(select client_no from sales_order where date_format(order_date, 'mon,yy') < 'may,02');

-- List if the product ‘LYCRA TOP’ has been ordered by any client and print the Client_No, name to whom it was sold.
select client_no, name from client_master 
where 
client_no in(select client_no from sales_order where order_no in(select order_no from sales_order_details 
where product_no in(select product_no from product_master where description = 'lycra tops')));

-- List the names of clients who have placed orders worth Rs. 10000 or more.
select name from client_master 
where 
client_no in(select client_no from sales_order 
where order_no in(select order_no from sales_order_details where(qty_ordered * product_rate)>= 10000));

