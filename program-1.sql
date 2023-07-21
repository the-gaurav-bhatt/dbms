CREATE DATABASE IF NOT EXISTS `Student Library`;
USE `Student Library`;

CREATE TABLE IF NOT EXISTS Student(
Stud_no INT PRIMARY KEY,
Stud_name VARCHAR(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS Membership(
Mem_no INT PRIMARY KEY,
Stud_no INT, 
FOREIGN KEY (Stud_no) REFERENCES Student(Stud_no)
);

CREATE TABLE IF NOT EXISTS Book(
book_no INT PRIMARY KEY,
book_name VARCHAR(255) NOT NULL,
author VARCHAR(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS Iss_rec(
iss_no INT PRIMARY KEY,
iss_date DATE NOT NULL,
Mem_no INT,
book_no INT,
FOREIGN KEY (Mem_no) REFERENCES Membership(Mem_no),
FOREIGN KEY (book_no) REFERENCES Book(book_no)
);

INSERT INTO Student (Stud_no, Stud_name)
VALUES 
(1,'Adam'),
(2,'Brian'),
(3,'Charlie'),
(4,'David'),
(5,'Edward'),
(6,'Frank'),
(7,'George'),
(8,'Harry'),
(9,'Ian'),
(10,'John');

INSERT INTO Membership (Mem_no, Stud_no)
VALUES 
(1,1),
(2,2),
(3,3),
(4,4),
(5,5),
(6,6),
(7,7),
(8,8),
(9,9),
(10,10);

INSERT INTO Book (book_no, book_name, author)
VALUES 
(1, 'Book 1', 'Author 1'),
(2, 'Book 2', 'Author 2'),
(3, 'Book 3', 'Author 3'),
(4, 'Book 4', 'Author 4'),
(5, 'Book 5', 'Author 5'),
(6, 'Book 6', 'Author 6'),
(7, 'Book 7', 'Author 7'),
(8, 'Book 8', 'Author 8'),
(9, 'Book 9', 'Author 9'),
(10, 'Book 10', 'Author 10');

INSERT INTO Iss_rec (iss_no, iss_date, Mem_no, book_no)
VALUES 
(1, '2019-01-01', 1, 1),
(2, '2019-02-01', 2, 2),
(3, '2019-03-01', 3, 3),
(4, '2019-04-01', 4, 4),
(5, '2019-05-01', 5, 5),
(6, '2019-06-01', 6, 6),
(7, '2019-07-01', 7, 7),
(8, '2019-08-01', 8, 8),
(9, '2019-09-01', 9, 9),
(10, '2019-10-01', 10, 10);
-- c) List all the student names with their membership numbers
select s.Stud_name, m.Mem_no from Student as s,Membership as m
where m.Stud_no = s.Stud_no;
-- d) List all the issues for the current date with student and Book names
 select s.Stud_name, b.book_name from Student as s,Book as b,Iss_rec as i,Membership as m
 where s.Stud_no = m.stud_no and b.book_no = i.book_no and m.Mem_no=i.Mem_no and i.iss_date = '2019-09-01'; 

-- e) Give a count of how many books have been bought by each student 
SELECT S.Stud_name, COUNT(B.book_no) AS Books_issued
FROM Iss_rec I
JOIN Student S ON S.Stud_no = (SELECT M.Stud_no FROM Membership M WHERE M.Mem_no=I.Mem_no)
JOIN Book B ON B.book_no = I.book_no
GROUP BY S.Stud_name;
-- f) Give a list of books taken by student with stud_no as 5
SELECT B.book_name
FROM Iss_rec I
JOIN Student S ON S.Stud_no = (SELECT M.Stud_no FROM Membership M WHERE M.Mem_no=I.Mem_no)
JOIN Book B ON B.book_no = I.book_no
WHERE S.Stud_no = 5;
SELECT B.book_name
FROM Iss_rec I
INNER JOIN Membership M ON I.Mem_no = M.Mem_no
INNER JOIN Book B ON I.book_no = B.book_no
WHERE M.Stud_no = 5;

