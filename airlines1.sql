use airline
select * from airlinesprint

CREATE TABLE airline_customers (
    Customer_ID INT PRIMARY KEY,
    Gender VARCHAR(20),
    Age INT,
    Customer_Type VARCHAR(50),
    Type_of_Travel VARCHAR(50),
    Class VARCHAR(50),
    Flight_Distance INT,
    Seat_Comfort INT,
    Food_and_Drink INT,
    Online_Boarding INT,
    Inflight_Service INT,
    Cleanliness INT,
    Departure_Delay INT,
    Arrival_Delay INT,
    Satisfaction VARCHAR(20),
    Feedback TEXT
);

INSERT INTO airline_customers
(Customer_ID, Gender, Age, Customer_Type, Type_of_Travel, Class, Flight_Distance,
Seat_Comfort, Food_and_Drink, Online_Boarding, Inflight_Service, Cleanliness,
Departure_Delay, Arrival_Delay, Satisfaction, Feedback)
VALUES
(1, 'Female', 28, 'Loyal Customer', 'Business travel', 'Business', 850, 5, 4, 5, 5, 5, 10, 5, 'Satisfied', 'Great flight experience'),
(2, 'Male', 35, 'Disloyal Customer', 'Personal travel', 'Eco', 550, 3, 2, 3, 3, 4, 20, 25, 'Neutral', 'average experience');


SELECT COUNT(*) AS total_rows FROM airline_customers;

select * from airlinesprint;

SELECT Gender, COUNT(*) AS count
FROM airline_customers
GROUP BY Gender;

SELECT * FROM airline_customers ;
SELECT ac.Customer_ID, ac.Gender, ac.Satisfaction, fd.Airline_Name, fd.Destination
FROM airline_customers ac
INNER JOIN flight_details fd
ON ac.Customer_ID = fd.Customer_ID;


