USE sakila;

### LAB 5

###Instructions
### 1.Drop column picture from staff.

ALTER TABLE staff
DROP COLUMN picture; 

### 2. A new person is hired to help Jon. Her name is TAMMY SANDERS, and she is a customer. Update the database accordingly. (insert into)

SELECT * 
FROM staff
ORDER BY staff_id DESC
LIMIT 1;



SELECT *
FROM customer
WHERE first_name = 'TAMMY';

INSERT INTO staff VALUES (3, 'Tammy', 'Sanders', 79, 'TAMMY.SANDERS@sakilacustomer.org', 2, 1, null, null, "2006-02-15 04:57:20" ) ;

SELECT *
FROM staff
WHERE first_name= 'TAMMY';


###INSERT INTO staff VALUES (customer


### 3.Add rental for movie "Academy Dinosaur" by Charlotte Hunter from Mike Hillyer at Store 1. You can use current date for the rental_date column in the rental table. 
###Hint: Check the columns in the table rental and see what information you would need to add there. 
###You can query those pieces of information. For eg., you would notice that you need customer_id information as well. To get that you can use the following query:

select customer_id from sakila.customer
where first_name = 'CHARLOTTE' and last_name = 'HUNTER';

SELECT *
FROM rental
ORDER BY rental_id DESC
LIMIT 1;

SELECT * FROM STAFF
WHERE first_name= 'Mike';

SELECT * 
FROM film
WHERE title = 'Academy Dinosaur';

SELECT * 
FROM inventory
WHERE film_id= 1;

INSERT into rental values(16050, "2023-02-25 15:16:03", 1, 130, null, 1, "2006-02-15 21:30:53");

SELECT *
from rental
WHERE rental_id= 16050;
### Use similar method to get inventory_id, film_id, and staff_id.

### 4.Delete non-active users, but first, create a backup table deleted_users to store customer_id, email, and the date for the users that would be deleted. Follow these steps:

###Check if there are any non-active users
####Create a table backup table as suggested
###Insert the non active users in the table backup table
###Delete the non active users from the table customer


SELECT DISTINCT active from customer;

SELECT * from customer
WHERE active =0;

SELECT * 
FROM customer
ORDER by customer_id DESC;

CREATE TABLE backup_table(
customer_id int(5) default null,
email varchar(60) default null,
delete_date DATETIME NOT NULL
);

SELECT *
FROM backup_table;

INSERT INTO backup_table values

(16, "SANDRA.MARTIN@sakilacustomer.org","2023-02-25 12:37:00"),
(64,	"JUDITH.COX@sakilacustomer.org", "2023-02-25 12:37:00"),
(124, "SHEILA.WELLS@sakilacustomer.org", "2023-02-25 12:37:00"),
(169, "ERICA.MATTHEWS@sakilacustomer.org",	"2023-02-25 12:37:00"),
(241,"HEIDI.LARSON@sakilacustomer.org",	"2023-02-25 12:37:00"),
(271,	"PENNY.NEAL@sakilacustomer.org",	"2023-02-25 12:37:00"),
(315,	"KENNETH.GOODEN@sakilacustomer.org",	"2023-02-25 12:37:00"),
(368,	"HARRY.ARCE@sakilacustomer.org",	"2023-02-25 12:37:00"),
(406,	"NATHAN.RUNYON@sakilacustomer.org", "2023-02-25 12:37:00"),
(446,	"THEODORE.CULP@sakilacustomer.org", "2023-02-25 12:37:00"),
(482, "MAURICE.CRAWLEY@sakilacustomer.org",	"2023-02-25 12:37:00"),
(510, "BEN.EASTER@sakilacustomer.org", "2023-02-25 12:37:00"),
(534,	"CHRISTIAN.JUNG@sakilacustomer.org",	"2023-02-25 12:37:00"),
(558,	"JIMMIE.EGGLESTON@sakilacustomer.org",	"2023-02-25 12:37:00"),
(592,	"TERRANCE.ROUSH@sakilacustomer.org", "2023-02-25 12:37:00") 
;

SELECT * 
FROM backup_table
LIMIT 10;

SET FOREIGN_KEY_CHECKS=0; 

DELETE FROM customer
WHERE customer_id in (16, 64, 124, 169, 241, 271, 315, 368, 406, 446, 482, 510, 534, 558, 592);

SET FOREIGN_KEY_CHECKS=1; 

