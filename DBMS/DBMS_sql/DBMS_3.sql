-- Assignment 3

show databases;
use engg;

-- find the names of all client.
select name from client_master;

-- Retrive the contents of the client_master table. 
select * from client_master; 

-- Retrives the list of names,city,and the states of the clients.
select name,city,state from client_master; 

-- list the various products available from the product_master tabel. 
select description from product_master;

-- list all the client who are located in mumbai.
select * from client_master where city = "mumbai";

-- find the names of salesman who have a salary equal to rs. 3000.
select salesman_name from Sman_mast where sal_amt = '3000';

-- -----------------------------------------------------------------------------

-- change the city of clientno c00005 to 'bangalore'. 
update client_master set city='bangalore' where client_no = 'c00005'; 
select client_no,city from client_master where city = 'bangalore';

-- change the baldue of clientno c00001 to rs. 1000. 
update client_master set bal_due = 1000 where client_no = 'c00001';
select client_no,bal_due from client_master where bal_due = 1000;

-- change the cost price of trouser to rs.950.00.  -- set sql_safe_updates =0;
update product_master set cost_price = '950.00' where description ='trousers';
select description,cost_price from product_master where description = 'trousers';

-- change the city of the salesman to pune.
update Sman_mast set city='pune';
select city from Sman_mast;

-- -------------------------------------------------------------------

-- Delete all salesman from the salesman_master where salary are equal to rs. 3500. 
delete from Sman_mast where sal_amt = 3500;
select * from Sman_mast where sal_amt-3500;

-- delete all product from product_master where qty_on_hand is equal to 100.
delete from product_master where qty_on_hand = 100;

-- delete from client_master where the column sate holds the value'Tamilnadu'. 
delete from client_master where city='tamilnadu';
select * from client_master where city='tamilnadu';

-- ---------------------------------------------------------------------------------

-- list the name of all client having 'a' as the second letter in their names. 
select name from client_master where name like '_a%';

-- list the client who stay in the city whose first letter is 'M';
select name,city from client_master where city like 'M%';

-- list all clients who stays in 'bangalore' or 'manglore'.
select name,city from client_master where city like 'bangalore' or 'manglore';

-- list all the clients whose bal_due is greater than value 10000. 
select * from client_master where bal_due>10000;

-- list all the information from sales_order table for orders placed in month of june.(five _ )
select * from sales_order where order_date like'_____06%';

-- list the order information for clientno 'c00001' and 'c00002'. 
select * from sales_order where client_no in('c0001','c00002');

-- list the product whose selling price is greater than 500 and less than or equal to 750. 
select * from product_master where sell_price>500 and sell_price<=750;

-- list products whose selling price is more than 500 and less than or equal to 750.
select * from product_master where sell_price>500 and sell_price<=750;

-- list products whose selling price is more than 500.,calculate a new selling price as, original selling price*.15. 
-- rename the new column in the output of the above query as new_price.
select description,sell_price*0.15"new_price" from product_master where sell_price>500;

-- list the names,city,state of clients who are not in the state of 'maharashtra'. 
select name,city,state from client_master where state <> 'maharashtra';

-- count total number of all the products.
select count(*) "total_no_of_products" from product_master;

-- calculate the average price of all the products.
select avg(sell_price)"average_price" from product_master;

-- determine the maximum and minimum product prices. rename the output as max_price and min_price respectively.
select max(sell_price)"max_price" from product_master;
select min(sell_price)"max_price" from product_master;

-- count the number of products having price less than or equal to 500.
select count(sell_price) from product_master where sell_price<=500;

-- list all the products whose qtyonhand is less than reorder level. 
select description  from product_master where qty_on_hand<reorder_lvl;

-- ------------------------------------------------------------------------------------

-- list the order number and day on which clients placed their order.
select order_no , dayname(order_date) from sales_order;

-- list the months(in alphabhets) and date when the orders must be delivered. 
select order_no, monthname(dely_date), day(dely_date) from sales_order;

-- list the orderdate in the format 'dd-mm-yy'. eg. 12-february=02. 
select order_no,date_format(order_date,'%d-%m-%y') from sales_order;

-- list the date, 15 days after today's date
select curdate();
select date_add(curdate(),interval 15 day);













