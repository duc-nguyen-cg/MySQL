use classicmodels;

# create a procedure and call
DELIMITER //
create procedure findAllCustomers()
begin
    select * from customers;
end //
DELIMITER ;

call findAllCustomers();


# drop old procedure and create new one
DELIMITER //
drop procedure if exists findAllCustomers //

create procedure findAllCustomers()
begin
    select * from customers where customerNumber = 175;
end //
DELIMITER ;

call findAllCustomers();

