use product_management;

insert into customer
values (1, 'Minh Quan', 10),
	   (2, 'Ngoc Oanh', 20),
       (3, 'Hong Ha', 50);

insert into orders
values (1, 1, '2006-3-21', null),
	   (2, 2, '2006-3-23', null),
       (3, 1, '2006-3-16', null);
       
insert into product
values (1, 'May Giat', 3),
       (2, 'Tu Lanh', 5),
       (3, 'Dieu Hoa', 7),
       (4, 'Quat' , 1),
       (5, 'Bep Dien', 2);
       
insert into orderdetail
values (1, 1, 3), (1,3,7), (1,4,2), (2,1,1), (3,1,8), (2,5,4), (2,3,3);

select oID, oDate, oTotalPrice from orders;

# Display all customers who buy at least 1 product
select customer.cID, customer.cName, customer.cAge, orders.oDate, product.pName, product.pPrice, orderdetail.odQTY, orders.oTotalPrice
from customer
join orders on customer.cID = orders.cID
join orderdetail on orders.oID  = orderdetail.oID
join product on orderdetail.pID = product.pID;

# Display all customers who did not buy
select *
from customer
where cID not in (select cID from orders);

# Display receipts
select orders.oID, orders.oDate, product.pName, product.pPrice, orderdetail.odQTY, odQTY * pPrice as TotalPrice 
from orders
join orderdetail on orders.oID = orderdetail.oID
join product on orderdetail.pID = product.pID;