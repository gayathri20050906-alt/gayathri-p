
CREATE DATABASE sqlproject;
USE sqlproject;

CREATE TABLE region (
    region_id INT PRIMARY KEY,
    region_name VARCHAR(25)
);

INSERT INTO region (region_id,region_name) VALUES
("1", "Europe"),
("2", "North America"),
("3", "Asia"),
("4", "South America"),
("5", "Africa");

SELECT * FROM region;

CREATE TABLE countries (
    country_id CHAR(2) PRIMARY KEY,
    country_name VARCHAR(40),
    region_id INT,
    FOREIGN KEY (region_id) REFERENCES region(region_id)
);

INSERT INTO countries (country_id, country_name, region_id) VALUES
("IN", "India", "3"),
("FR", "France","1"),
("BR", "Brazil","4"),
("KR", "Korea","3"),
("JP", "Japan","3");

SELECT * FROM countries;

CREATE TABLE locations (
    location_id INT PRIMARY KEY,
    city VARCHAR(30),
    country_id CHAR(2),
    FOREIGN KEY (country_id) REFERENCES countries(country_id)
);

INSERT INTO locations (location_id, city, country_id) VALUES
("809701", "Chennai", "IN"),
("809702", "Cuddalore", "IN"),
("809703", "Paris", "FR");

SELECT * FROM locations;

CREATE TABLE departments (
    dep_id INT PRIMARY KEY,
    dep_name VARCHAR(30),
    manager_id INT,
    location_id INT,
    FOREIGN KEY (location_id) REFERENCES locations(location_id)
);

INSERT INTO departments (dep_id, dep_name, manager_id, location_id) VALUES
(1, 'Data Science', 2001, 809701),
(2, 'Big Data', 2002, 809702),
(3, 'Data Analytics', 2003, 809703),
(4, 'Data Cleaning', 2004, 809701),
(5, 'UI/UX Design', 2005, 809702);

SELECT * FROM departments;

CREATE TABLE employee (
    emp_id INT PRIMARY KEY,
    first_name VARCHAR(20),
    last_name VARCHAR(25),
    email VARCHAR(25),
    contact VARCHAR(10),
    job_id VARCHAR(20),
    dep_id INT,
    salary INT,
    FOREIGN KEY (dep_id) REFERENCES departments(dep_id)
);

INSERT INTO employee (emp_id, first_name, last_name, email, contact, job_id, dep_id, salary) VALUES
("101","gayu","p","gayathri@gmail.com","6383249168","1001","1","100000"),
("102","kavi","p","kavi@gmail.com","8525888262","1002","2","200000"),
("103","bhuvi","p","bhuvi@gmail.com","9790673345","1003","3","300000"),
("104","nisha","a","nisha@gmail.com","8793457734","1004","4","400000"),
("105","priya","s","priya@gmail.com","9056342365","1005","5","500000");

SELECT * FROM employee;

SELECT e.emp_id, e.first_name, e.last_name, d.dep_name FROM employee e LEFT JOIN departments d ON e.dep_id = d.dep_id;

SELECT d.dep_id, d.dep_name, e.first_name, e.last_name FROM employee e RIGHT JOIN departments d ON e.dep_id = d.dep_id;

SELECT e.emp_id, e.first_name, e.last_name, d.dep_name FROM employee e INNER JOIN departments d ON e.dep_id = d.dep_id;

SELECT r.region_id, r.region_name, c.country_id, c.country_name FROM region r right JOIN countries c ON r.region_id = c.region_id;
 
 SELECT c.country_id, c.country_name, l.location_id, l.city FROM countries c left JOIN locations l ON c.country_id = l.country_id;

 SELECT d.dep_id, d.dep_name, e.emp_id, e.first_name, e.last_name FROM departments d JOIN employee e ON d.dep_id = e.dep_id;
 
(full join)
 
SELECT r.region_id, r.region_name,c.country_id, c.country_name,l.location_id, l.city FROM region r LEFT JOIN countries c ON r.region_id = c.region_id LEFT JOIN locations l ON c.country_id = l.country_id;

SELECT r.region_id, r.region_name,c.country_id, c.country_name,l.location_id, l.city,d.dep_id, d.dep_name,e.emp_id, e.first_name, e.last_name, e.salary FROM region r LEFT JOIN countries c ON r.region_id = c.region_id LEFT JOIN locations l ON c.country_id = l.country_id LEFT JOIN departments d ON l.location_id = d.location_id LEFT JOIN employee e ON d.dep_id = e.dep_id;
