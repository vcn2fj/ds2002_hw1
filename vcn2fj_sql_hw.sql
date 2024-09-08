# Elizabeth Wu vcn2fj

-- Part 1
#1
SELECT * FROM `country` WHERE Continent = 'South America';
#2
SELECT Population FROM `country` WHERE Name = 'Germany';
#3
SELECT Name FROM city WHERE CountryCode = 'JPN';

#4
SELECT * from country WHERE Region = 'Central Africa' ORDER BY Population DESC LIMIT 3;
#5
SELECT Name, LifeExpectancy from country WHERE Population BETWEEN 1000000 AND 5000000;
#6
SELECT country.Name FROM countrylanguage INNER JOIN country ON country.Code = countrylanguage.CountryCode WHERE Language = 'French';


#7
SELECT Title from Album WHERE ArtistID = '1';
#8
SELECT FirstName, LastName, Email from Customer WHERE Country = 'Brazil';
#9
SELECT * from Playlist;

#10
SELECT COUNT(*) FROM `Track` WHERE GenreID = '1';
#11
SELECT FirstName, LastName from Employee WHERE ReportsTo = '2';
#12
SELECT Customer.FirstName, Customer.LastName, SUM(Invoice.Total) FROM Invoice
INNER JOIN Customer ON Invoice.CustomerID = Customer.CustomerID
GROUP BY Customer.FirstName, Customer.LastName;


-- Part 2
USE vcn2fj;

-- five dunkin donuts stores in Fairfax VA
CREATE TABLE dunkin (
    store_id INT AUTO_INCREMENT PRIMARY KEY,
    address VARCHAR(50) NOT NULL UNIQUE,
    city VARCHAR(100) NOT NULL,
    number VARCHAR(255) NOT NULL);
    
INSERT INTO dunkin (address, city, number) 
VALUES ('10020 Main St', 'Fairfax', '(703) 537-0851'),
('10633 Braddock Rd', 'Fairfax', '(703) 691-4090'),
('10955 Fairfax Blvd', 'Fairfax', '(703) 279-1859'), 
('12701 Shoppes Ln', 'Fairfax', '(703) 818-7480'), 
('13061 Lee Jackson Memorial Hwy', 'Fairfax', '(703) 631-4503');

-- store hours
CREATE TABLE dunkin_hours (
    store_id INT AUTO_INCREMENT PRIMARY KEY,
    mon_hrs VARCHAR(50) NOT NULL,
    wed_hrs VARCHAR(100) NOT NULL,
    fri_hrs VARCHAR(255) NOT NULL);

INSERT INTO dunkin_hours (mon_hrs, wed_hrs, fri_hrs) 
VALUES ('5:00 AM - 7:00 PM', '5:00 AM - 7:00 PM', '5:00 AM - 7:00 PM'),
('5:00 AM - 7:00 PM', '5:00 AM - 7:00 PM', '5:00 AM - 7:00 PM'),
('5:00 AM - 9:00 PM', '5:00 AM - 9:00 PM', '5:00 AM - 9:00 PM'), 
('5:00 AM - 9:00 PM', '5:00 AM - 9:00 PM', '4:00 AM - 8:00 PM'), 
('4:00 AM - 8:00 PM', '4:00 AM - 8:00 PM', '7:00 AM - 6:00 PM');

-- store policies
CREATE TABLE dunkin_store (
    store_id INT AUTO_INCREMENT PRIMARY KEY,
    drive_thru VARCHAR(50) NOT NULL,
    mobile_order VARCHAR(100) NOT NULL,
    dunkin_card VARCHAR(255) NOT NULL);

INSERT INTO dunkin_store (drive_thru, mobile_order, dunkin_card) 
VALUES ('FALSE', 'TRUE', 'TRUE'),
('FALSE', 'TRUE', 'TRUE'),
('FALSE', 'TRUE', 'TRUE'), 
('FALSE', 'TRUE', 'TRUE'), 
('FALSE', 'FALSE', 'TRUE');


-- Show all friday hours for all stores
SELECT fri_hrs from dunkin_hours;

-- Show all numbers for all stores
SELECT number from dunkin;

-- Finding all addresses with mobile order availbility
SELECT dunkin.address FROM dunkin INNER JOIN dunkin_store on dunkin_store.store_ID = dunkin.store_ID WHERE dunkin_store.mobile_order = 'TRUE';



