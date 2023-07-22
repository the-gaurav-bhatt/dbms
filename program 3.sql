create database airport;
use airport;
-- Flights table
CREATE TABLE Flights (
    flno INTEGER PRIMARY KEY,
    from_location VARCHAR(50),
    to_location VARCHAR(50),
    distance INTEGER,
    departs TIME,
    arrives TIME,
    price INTEGER
);

-- Aircraft table
CREATE TABLE Aircraft (
    aid INTEGER PRIMARY KEY,
    aname VARCHAR(50),
    cruisingrange INTEGER
);

-- Certified table
CREATE TABLE Certified (
    eid INTEGER,
    aid INTEGER,
    PRIMARY KEY (eid, aid),
    FOREIGN KEY (eid) REFERENCES Employees (eid),
    FOREIGN KEY (aid) REFERENCES Aircraft (aid)
);

-- Employees table
CREATE TABLE Employees (
    eid INTEGER PRIMARY KEY,
    ename VARCHAR(50),
    salary INTEGER
);
-- Flights table
INSERT INTO Flights (flno, from_location, to_location, distance, departs, arrives, price)
VALUES
    (1, 'New York', 'Los Angeles', 2500, '08:00', '11:30', 500),
    (2, 'Chicago', 'Houston', 1000, '09:15', '12:45', 350),
    (3, 'San Francisco', 'Seattle', 800, '11:30', '14:00', 300),
    (4, 'Los Angeles', 'New York', 2500, '16:00', '19:30', 550),
    (5, 'Houston', 'Chicago', 1000, '17:15', '20:45', 400),
    (6, 'Seattle', 'San Francisco', 800, '18:30', '21:00', 320),
    (7, 'Dallas', 'Miami', 1200, '10:00', '13:30', 420),
    (8, 'Miami', 'Dallas', 1200, '14:00', '17:30', 400),
    (9, 'Atlanta', 'Denver', 1500, '12:45', '15:30', 480),
    (10, 'Denver', 'Atlanta', 1500, '16:00', '18:45', 520);

-- Aircraft table
INSERT INTO Aircraft (aid, aname, cruisingrange)
VALUES
    (101, 'Boeing 737', 5000),
    (102, 'Airbus A320', 4500),
    (103, 'Boeing 777', 6000),
    (104, 'Embraer E190', 3000),
    (105, 'Airbus A330', 5500),
    (106, 'Boeing 787', 5800),
    (107, 'Airbus A380', 7000),
    (108, 'Bombardier CRJ900', 2800),
    (109, 'Boeing 747', 6500),
    (110, 'Embraer E195', 3200);

-- Certified table
INSERT INTO Certified (eid, aid)
VALUES
    (201, 101),
    (202, 102),
    (203, 103),
    (204, 104),
    (205, 105),
    (206, 106),
    (207, 107),
    (208, 108),
    (209, 109),
    (210, 110);

-- Employees table
INSERT INTO Employees (eid, ename, salary)
VALUES
    (201, 'John Smith', 80000),
    (202, 'Jane Doe', 75000),
    (203, 'Michael Johnson', 90000),
    (204, 'Emily Brown', 82000),
    (205, 'William Davis', 76000),
    (206, 'Sophia Lee', 92000),
    (207, 'James Wilson', 81000),
    (208, 'Emma Martinez', 75000),
    (209, 'Liam Anderson', 93000),
    (210, 'Olivia Garcia', 78000);
-- c) Find the names of aircraft such that all pilots certified to operate them earn more than 
-- 80,000. 
	select a.aname,e.salary from Aircraft as a
    join Certified as c on 
    a.aid = c.aid
    join Employees as e on
    e.eid = c.eid
    where e.salary > 80000;
    
-- d) For each pilot who is certified for more than three aircraft, find the eid and the maximum 
-- cruising range of the aircraft that he (or she) is certified for. 
-- select c.eid from Aircraft as a
-- join Certified as c on 
-- a.aid = c.aid
-- group by a.aid;
SELECT c.eid, a.cruisingrange
FROM Certified c
JOIN Aircraft a ON c.aid = a.aid
GROUP BY c.eid
HAVING COUNT(c.aid) > 3;
-- e)Find the names of pilots whose salary is less than the price of the cheapest route from Los 
-- Angeles to Honolulu. 
select e.ename,e.salary,f.price from Employees e,Flights f
where e.salary >(
select f.price from Flights as f
where f.from_location= 'Los Angeles' and f.to_location = 'New York'
);
-- f) Find the second highest salary of an employee.
select e.salary from Employees e
order by e.salary desc
limit 1 offset 1;
