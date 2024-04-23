USE classicmodels;

--1)
SELECT  count(employees.employeeNumber) as employee_count, employees.officeCode
FROM employees
INNER JOIN offices ON employees.officeCode = offices.officeCode
GROUP BY offices.officeCode ORDER BY employee_count DESC;

--2)

--a)
SELECT avg(keep.order_counter) as avg_orders, employees.officeCode as off_code
FROM(   
    SELECT count(orders.orderNumber) as order_counter, customers.salesRepEmployeeNumber as salesRep_N
    FROM orders
    INNER JOIN customers ON orders.customerNumber = customers.customerNumber
    GROUP BY salesRepEmployeeNumber) as keep
INNER JOIN employees ON keep.salesRep_N = employees.employeeNumber
GROUP BY off_code;

--b)
--cantidad ordenada de un customer
CREATE VIEW order_Q as ( 
SELECT count(orderdetails.quantityOrdered) as count_Q, orders.customerNumber as cust_N
FROM orderdetails 
INNER JOIN orders ON orderdetails.orderNumber = orders.orderNumber
GROUP BY cust_N);

--maximo de cantidad ordenada de un salesRep y agrupado en codigo de oficina
SELECT max(keep.ord_Q) as max_ord_Q, employees.officeCode as off_code
FROM(
    SELECT order_Q.count_Q as ord_Q, customers.salesRepEmployeeNumber as salesRep_N
    FROM order_Q
    INNER JOIN customers ON order_Q.cust_N = customers.customerNumber) as keep
INNER JOIN employees ON keep.salesRep_N = employees.employeeNumber
GROUP BY off_code ORDER BY max_ord_Q DESC LIMIT 1;

--3)
SELECT MONTH(paymentDate) as month, avg(amount) as avg_amount, max(amount) as max_amount, min(amount) as min_amount FROM payments 
GROUP BY month ORDER BY month ASC;


--4)

CREATE PROCEDURE update_credit(IN new_credit decimal(10,2), IN customer_id int(11))
    UPDATE customers SET creditLimit = new_credit
    WHERE customerNumber = customer_id;


--5)
    
CREATE VIEW premium_customers as
SELECT customers.customerName as name, customers.state as state, payments.amount
FROM customers
INNER JOIN payments on payments.customerNumber = customers.customerNumber
ORDER BY payments.amount DESC LIMIT 10;

--6)


CREATE FUNCTION employee_of_the_month (month smallint,year int)
RETURNS VARCHAR(50) DETERMINISTIC
BEGIN
 DECLARE full_name VARCHAR(50);
    SELECT CONCAT(employees.firstName, ' ' ,employees.lastName) into full_name FROM (
        SELECT count(orders.orderNumber) as cust_order_count, customers.salesRepEmployeeNumber as rep_number
        FROM customers
        INNER JOIN orders ON orders.customerNumber = customers.customerNumber 
        WHERE MONTH(orders.orderDate) = month AND YEAR(orders.orderDate) = year
        GROUP BY rep_number) as keep
    INNER JOIN employees ON keep.rep_number = employees.employeeNumber ORDER BY keep.cust_order_count DESC LIMIT 1;
    RETURN full_name;
END//

--7)
--HINT: uno a uno la fk en alguna de las tablas, uno a muchos la fk en la tabla de muchos, muchos a muchos se usa tabla intermedia

CREATE TABLE ProductRefillment (
    refillmentID INT AUTO_INCREMENT PRIMARY KEY,
    productCode VARCHAR(15) NOT NULL,
    orderDate DATE NOT NULL,
    quantity smallint(6) NOT NULL,
    FOREIGN KEY (productCode) REFERENCES products(productCode))ENGINE=InnoDB DEFAULT CHARSET=latin1;



--FALTAN : 2)


--8)

CREATE VIEW orderQ_orderS as (
SELECT orderdetails.ProductCode as prod_N, orderdetails.quantityOrdered as ordered_Q, products.quantityInStock as ordered_S 
FROM orderdetails
INNER JOIN products ON orderdetails.productCode = products.productCode);

CREATE TRIGGER Restock_product AFTER INSERT
ON orderdetails FOR EACH ROW
  IF  DIFF(orderQ_orderS.ordered_S,orderQ_orderS.ordered_Q) < 10 THEN
        INSERT INTO ProductRefillment (productCode,orderDate,quantity) VALUES (orderQ_orderS.prod_N,curdate(),10);
  END IF;

    



--9)

CREATE ROLE empleado;
GRANT SELECT ON ALL to empleado;
GRANT CREATE VIEW TO empleado;
