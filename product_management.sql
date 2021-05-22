create database product_management;

use product_management;

create table customer (
	cID int not null auto_increment primary key,
	cName varchar(50) not null,
    cAge int not null
);

create table orders (
	oID int not null auto_increment primary key,
	cID int,
	oDate datetime not null,
    oTotalPrice int ,
    foreign key (cID) references customer(cID)
);

create table product (
	pID int not null auto_increment primary key,
    pName varchar(50) not null,
    pPrice int not null
);    

create table orderDetail (
	oID int not null,
    pID int not null,
    odQTY int check (odQTY > 0),
	unique (oID, pID),
    foreign key (oID) references orders(oID),
    foreign key (pID) references product(pID)
)