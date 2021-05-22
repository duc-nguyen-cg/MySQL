create database product_management;

use product_management;

create table customer (
	cID int not null auto_increment primary key,
	cName varchar(50) not null,
    cAge int
);

create table orders (
	oID int not null auto_increment primary key,
	cID int,
	oDate datetime not null,
    oTotalPrice int not null,
    foreign key (cID) references customer(cID)
);
