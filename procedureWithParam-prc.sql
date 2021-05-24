use classicmodels;

# parameter IN
DELIMITER //
create procedure getCustomerByID (IN cusNum int(11))
begin
    select * from customers where customerNumber = cusNum;
end //
DELIMITER ;

call getCustomerByID(175);


# parameter OUT
DELIMITER //
create procedure getCustomerCountByCity(IN in_city varchar(50), OUT total int)
begin
    select count(customerNumber) into total
    from customers
    where city = in_city;
end //
DELIMITER ;

call getCustomerCountByCity('Lyon', @total);
select @total;


#parameter INOUT
DELIMITER //
create procedure setCounter(INOUT counter int, IN increment int)
begin
    set counter = counter + increment;
end //
DELIMITER ;

set @counter = 1;
call SetCounter(@counter,1); -- 2
call SetCounter(@counter,1); -- 3
call SetCounter(@counter,5); -- 8
select @counter; -- 8