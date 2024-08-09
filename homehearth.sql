/*
DROP TABLE contractors;
DROP TABLE clients;
DROP TABLE invoices;
DROP TABLE rate_plans;
DROP TABLE business_rules;
*/
/*
CREATE DATABASE fakedb;
CREATE USER 'fakeuser'@'localhost' IDENTIFIED BY 'somefakepassword';
GRANT ALL PRIVILEGES ON fakedb.* TO 'fakeuser'@'localhost';
FLUSH PRIVILEGES;
*/

CREATE TABLE IF NOT EXISTS contractors (
    id INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,       /* field required when using ORM */
    firstname VARCHAR(10) NOT NULL,
    lastname VARCHAR(20) NOT NULL,
    address1 VARCHAR(50) NOT NULL,
    address2 VARCHAR(50) NOT NULL,
    city VARCHAR(50) NOT NULL,
    zip VARCHAR(5) NOT NULL,
    state VARCHAR(2) NOT NULL,
    phone VARCHAR(15) NOT NULL,
    email VARCHAR(25),
    startdate date not null,
    UpdatedTime timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (id),
    UNIQUE KEY k_name (firstname, lastname)
);

/* seed data */
insert into contractors values (null, 'Bruce','Lee', '','','','','AR','','', now(), null);
insert into contractors values (null, 'Jet','Li', '','','','','AR','','', now(), null);
insert into contractors values (null, 'Tony','Jaa', '','','','','AR','','', now(), null);
