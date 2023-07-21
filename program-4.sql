create database Company;
use Company;

-- Employee Table
CREATE TABLE Employee(
    F_name VARCHAR(50),
    L_name VARCHAR(50), 
    Emp_id INTEGER, 
    Bdate DATE, 
    Address VARCHAR(100),
    Gender CHAR(1),
    Salary INTEGER,
    Super_Emp_id INTEGER,
    D_no INTEGER, 
    PRIMARY KEY (Emp_id)
);
    
-- Department Table
CREATE TABLE Department(
    D_name VARCHAR(50), 
    D_no INTEGER,
    D_Mgr_id INTEGER, 
    Mgr_start_date DATE,
    PRIMARY KEY (D_no),
    FOREIGN KEY (D_Mgr_id) REFERENCES Employee(Emp_id)
);
    
-- Dept_Location
CREATE TABLE Dept_Location(
    D_no INTEGER,
    D_location VARCHAR(50),
    PRIMARY KEY (D_no),
    FOREIGN KEY (D_no) REFERENCES Department(D_no)
);
    
-- Project Table
CREATE TABLE Project(
    P_name VARCHAR(50),
    P_number INTEGER,
    P_location VARCHAR(50),
    D_no INTEGER, 
    PRIMARY KEY (P_number),
    FOREIGN KEY (D_no) REFERENCES Department(D_no)
);
    
-- Works_on table
CREATE TABLE Works_on(
    Emp_id INTEGER,
    P_no INTEGER,
    Hours INTEGER,
    PRIMARY KEY (Emp_id, P_no),
    FOREIGN KEY (Emp_id) REFERENCES Employee(Emp_id),
    FOREIGN KEY (P_no) REFERENCES Project(P_number)
);

-- Dependent table
CREATE TABLE Dependent(
    Emp_id INTEGER,
    Dependent_name VARCHAR(100),
    Gender CHAR(1),
    Bdate DATE,
    Relationship VARCHAR(50), 
    PRIMARY KEY (Dependent_name),
    FOREIGN KEY (Emp_id) REFERENCES Employee(Emp_id)
);

-- Adding 10 records to the Employee table with region set to India
INSERT INTO Employee (F_name, L_name, Emp_id, Bdate, Address, Gender, Salary, Super_Emp_id, D_no)
VALUES
    ('John', 'Doe', 1, '1990-05-15', 'Address 1, India', 'M', 50000, NULL, 101),
    ('Jane', 'Smith', 2, '1992-09-22', 'Address 2, India', 'F', 45000, NULL, 102),
    ('Michael', 'Johnson', 3, '1988-12-10', 'Address 3, India', 'M', 55000, NULL, 103),
    ('Emily', 'Williams', 4, '1995-03-07', 'Address 4, India', 'F', 60000, 1, 101),
    ('David', 'Brown', 5, '1993-08-18', 'Address 5, India', 'M', 48000, 1, 102),
    ('Sarah', 'Miller', 6, '1987-11-25', 'Address 6, India', 'F', 52000, 2, 102),
    ('Robert', 'Taylor', 7, '1991-04-30', 'Address 7, India', 'M', 58000, 2, 103),
    ('Jessica', 'Anderson', 8, '1994-07-12', 'Address 8, India', 'F', 60000, 3, 103),
    ('William', 'Lee', 9, '1996-02-28', 'Address 9, India', 'M', 53000, 3, 101),
    ('Megan', 'Clark', 10, '1990-06-20', 'Address 10, India', 'F', 56000, 4, 101);

-- Adding 10 records to the Department table with region set to India
INSERT INTO Department (D_name, D_no, D_Mgr_id, Mgr_start_date)
VALUES
    ('Finance', 101, 1, '2018-02-15'),
    ('HR', 102, 2, '2017-09-10'),
    ('Engineering', 103, 3, '2019-05-22'),
    ('Marketing', 104, 4, '2016-11-30'),
    ('IT', 105, 5, '2018-08-18'),
    ('Sales', 106, 6, '2015-04-25'),
    ('Operations', 107, 7, '2017-07-12'),
    ('Research', 108, 8, '2020-02-28'),
    ('Legal', 109, 9, '2019-06-20'),
    ('Admin', 110, 10, '2016-12-31');

-- Adding 10 records to the Dept_Location table with region set to India
INSERT INTO Dept_Location (D_no, D_location)
VALUES
    (101, 'India'),
    (102, 'India'),
    (103, 'India'),
    (104, 'India'),
    (105, 'India'),
    (106, 'India'),
    (107, 'India'),
    (108, 'India'),
    (109, 'India'),
    (110, 'India');

-- Adding 10 records to the Project table with region set to India
INSERT INTO Project (P_name, P_number, P_location, D_no)
VALUES
    ('Project A', 1, 'Location 1, India', 101),
    ('Project B', 2, 'Location 2, India', 102),
    ('Project C', 3, 'Location 3, India', 103),
    ('Project D', 4, 'Location 4, India', 104),
    ('Project E', 5, 'Location 5, India', 105),
    ('Project F', 6, 'Location 6, India', 106),
    ('Project G', 7, 'Location 7, India', 107),
    ('Project H', 8, 'Location 8, India', 108),
    ('Project I', 9, 'Location 9, India', 109),
    ('Project J', 10, 'Location 10, India', 110);

-- Adding 10 records to the Works_on table with region set to India
INSERT INTO Works_on (Emp_id, P_no, Hours)
VALUES
    (1, 1, 40),
    (2, 2, 32),
    (3, 3, 45),
    (4, 4, 38),
    (5, 5, 41),
    (6, 6, 37),
    (7, 7, 42),
    (8, 8, 39),
    (9, 9, 35),
    (10, 10, 43);

-- Adding 10 records to the Dependent table with region set to India
INSERT INTO Dependent (Emp_id, Dependent_name, Gender, Bdate, Relationship)
VALUES
    (1, 'Dependent A', 'F', '1992-03-15', 'Spouse'),
    (2, 'Dependent B', 'M', '1995-09-10', 'Child'),
    (3, 'Dependent C', 'F', '2000-05-22', 'Child'),
    (4, 'Dependent D', 'M', '1998-11-30', 'Child'),
    (5, 'Dependent E', 'F', '1994-08-18', 'Spouse'),
    (6, 'Dependent F', 'M', '1996-04-25', 'Child'),
    (7, 'Dependent G', 'F', '2001-07-12', 'Child'),
    (8, 'Dependent H', 'M', '1999-02-28', 'Child'),
    (9, 'Dependent I', 'F', '1993-06-20', 'Spouse'),
    (10, 'Dependent J', 'M', '1997-12-31', 'Child');
-- c) Find the names and address of all employees who work on same department. 
select e.D_no,e.F_name,e.Address from Employee e,Department as d
where d.D_no = e.D_no order by e.D_no;

-- d) Retrieve a list of employees and the projects they are working on, ordered by department 
-- and, within each department, ordered alphabetically by last name, then first name. 
select * from Employee e,Project p,Department d
where e.D_no = d.D_no and d.D_no = p.D_no
order by e.L_name,e.F_name asc;
-- e) Create a view Dept_info that gives details of department name, Number of employees and 
-- total salary of each employee.
create view Dept_info as
select d.D_name,count(e.Emp_id)as No_of_Emp,sum(e.Salary )as Salary from Department d,Employee e
where e.D_no = d.D_no
group by d.D_name;
select * from Dept_info;


