create database demo;

use demo;

create table Products(
    id int auto_increment primary key,
    productCode varchar(10) not null unique,
    productName varchar(50) not null,
    productPrice float not null check (productPrice > 0),
    productAmount int not null check (productAmount > 0),
    productDescription varchar(100) not null,
    productStatus bit
);


insert into Products(productCode, productName, productPrice, productAmount, productDescription, productStatus)
values ('A1', 'Phone', 100.5, 10, 'iPhone X', 1),
       ('B3', 'Laptop', 249.99, 25, 'Dell', 0),
       ('C5', 'Book', 49.99, 500, 'Berserk', 1);


# add index
create unique index idx_productCode on Products (productCode);
explain select * from products where productCode = 'C5';

create index idx_name_price on Products (productName, productPrice);
explain select * from products where productName = 'phone';  -- 1 row
explain select * from products where productPrice = 49.99;   -- 3 rows
explain select * from products where productName = 'phone' and productPrice = 49.99;  -- 1 row
# =>  if the search query does not contain all columns in the where clause, it can only use the left-most index


# add, alter and drop view
create view product_info as
    select productCode, productName, productPrice, productStatus from products;

update product_info
    set productName = 'Manga' where productCode = 'C5';

drop view product_info;


# display all products
DELIMITER //
create procedure displayAllProducts()
begin
    select * from products;
end //
DELIMITER ;

call displayAllProducts();


# add a new product
DELIMITER //
create procedure addProduct(IN code varchar(10), IN name varchar(50), IN price float, IN amount int, IN description varchar(50), IN status bit)
begin
    insert into products(productCode, productName, productPrice, productAmount, productDescription, productStatus)
    values (code, name, price, amount, description, status);
end //
DELIMITER ;

call addProduct('A#4', 'Music Sheet', 9.97, 15, 'Pop', 1 );


# edit a product by ID
DELIMITER //
create procedure editProcedure(IN editId int,
                               IN code varchar(10), IN name varchar(50), IN price float, IN amount int, IN description varchar(50), IN status bit)
begin
    update products
        set productCode = code, productName = name, productPrice = price, productAmount = amount, productDescription = description, productStatus = status
        where id = editId;
end //
DELIMITER ;

call editProcedure(10, 'Bb2', 'Dominator', 50, 2, 'Sybil System', 0);


# delete a product by ID
DELIMITER //
create procedure deleteProduct(IN deleteID int)
begin
    delete from products where id = deleteID;
end //
DELIMITER ;

call deleteProduct(9);