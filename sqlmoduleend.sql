-- Create the database
CREATE DATABASE library;

-- Use the database
USE library;

-- Create the Branch table
CREATE TABLE Branch (
    Branch_no INT PRIMARY KEY,
    Manager_Id INT,
    Branch_address VARCHAR(255),
    Contact_no VARCHAR(15)
);

-- Create the Employee table
CREATE TABLE Employee (
    Emp_Id INT PRIMARY KEY,
    Emp_name VARCHAR(255),
    Position VARCHAR(255),
    Salary DECIMAL(10, 2),
    Branch_no INT,
    FOREIGN KEY (Branch_no) REFERENCES Branch(Branch_no)
);

-- Create the Books table
CREATE TABLE Books (
    ISBN VARCHAR(13) PRIMARY KEY,
    Book_title VARCHAR(255),
    Category VARCHAR(255),
    Rental_Price DECIMAL(10, 2),
    Status ENUM('yes', 'no'),
    Author VARCHAR(255),
    Publisher VARCHAR(255)
);

-- Create the Customer table
CREATE TABLE Customer (
    Customer_Id INT PRIMARY KEY,
    Customer_name VARCHAR(255),
    Customer_address VARCHAR(255),
    Reg_date DATE
);

-- Create the IssueStatus table
CREATE TABLE IssueStatus (
    Issue_Id INT PRIMARY KEY,
    Issued_cust INT,
    Issued_book_name VARCHAR(255),
    Issue_date DATE,
    Isbn_book VARCHAR(13),
    FOREIGN KEY (Issued_cust) REFERENCES Customer(Customer_Id),
    FOREIGN KEY (Isbn_book) REFERENCES Books(ISBN)
);

-- Create the ReturnStatus table
CREATE TABLE ReturnStatus (
    Return_Id INT PRIMARY KEY,
    Return_cust INT,
    Return_book_name VARCHAR(255),
    Return_date DATE,
    Isbn_book2 VARCHAR(13),
    FOREIGN KEY (Return_cust) REFERENCES Customer(Customer_Id),
    FOREIGN KEY (Isbn_book2) REFERENCES Books(ISBN)
);
 SHOW tables;
 -- Insert data into Branch table
INSERT INTO Branch (Branch_no, Manager_Id, Branch_address, Contact_no)
VALUES (1, 301, 'ABC', '9876543210'),
       (2, 302, 'DFE', '9123456789'),
       (3, 303, 'GHI', '9988776655'),
       (4, 304, 'JKL', '9871234567'),
       (5, 305, 'UVW', '9654321098'),
       (6, 306, 'XYZ', '9456781230');

-- Insert data into Employee table
INSERT INTO Employee (Emp_Id, Emp_name, Position, Salary, Branch_no)
VALUES (201, 'Smith Johnson', 'Librarian', 35000, 2),
       (202, 'Alison Smith', 'Library Manager', 65000, 1),
       (203, 'Shibu kunamkulam', 'Cashier', 36000, 5),
       (204, 'Diana Prince', 'Library Assistant', 47000, 1),
       (205, 'Eve Adams', 'Library Clerk', 41000, 2),
       (206, 'Cristiano Wright', 'Library Technician', 42000, 3),
       (207, 'Jamal Lee', 'Security', 27000, 4),
       (208, 'Hank Green', 'Library Clerk', 42000, 2),
       (209, 'Ivy Martin', 'Senior Librarian', 42000, 1),
       (210, 'Jack Ryan', 'Librarian', 32000, 3);

-- Insert data into Books table
INSERT INTO Books (ISBN, Book_title, Category, Rental_Price, Status, Author, Publisher)
VALUES ('131', 'To Kill a Mockingbird', 'Fiction Drama', 520, 'yes', 'Harper Lee', 'J.B. Lippincott & Co.'),
       ('132', 'Gone with the Wind', 'Historical Romance', 620, 'no', 'Margaret Mitchell', 'Macmillan Publishers'),
       ('133', 'The Great Gatsby', 'Classic Fiction', 430, 'yes', 'F. Scott Fitzgerald', 'Charles Scribner Sons'),
       ('134', 'Moby Dick', 'Adventure Fiction', 510, 'yes', 'Herman Melville', 'Harper & Brothers'),
       ('135', 'Atomic Habits', 'Self Help', 560, 'yes', 'James Clear', 'Penguin Random House'),
       ('136', 'War and Peace', 'Historical Fiction', 460, 'no', 'Leo Tolstoy', 'The Russian Messenger'),
       ('137', 'The History of the Peloponnesian War', 'History', 320, 'no', 'Thucydides', 'Oxford University Press');

-- Insert data into Customer table
INSERT INTO Customer (Customer_Id, Customer_name, Customer_address, Reg_date)
VALUES (201, 'Lolly Evans', '456 Def', '2023-04-18'),
       (202, 'James Potter', '789 Ghi', '2024-02-12'),
       (203, 'Shibu Black', '101 Jkl', '2022-10-15'),
       (204, 'Remus Lupin', '112 Mno', '2021-08-25'),
       (205, 'Peter Pettigrew', '134 Pqr', '2020-01-05'),
       (206, 'Severus Snape', '156 Stu', '2024-03-22'),
       (207, 'Albus Dumbledore', '178 Vwx', '2023-11-30');

-- Insert data into IssueStatus table
INSERT INTO IssueStatus (Issue_Id, Issued_cust, Issued_book_name, Issue_date, Isbn_book)
VALUES (1, 201, 'Gone with the Wind', '2021-03-15', '132'),
       (2, 202, 'War and Peace', '2022-05-30', '136'),
       (3, 203, 'Atomic Habits', '2021-06-20', '135'),
       (4, 204, 'The Great Gatsby', '2023-02-14', '133'),
       (5, 205, 'Moby Dick', '2020-04-10', '134'),
       (6, 206, 'To Kill a Mockingbird', '2020-05-15', '131'),
       (7, 201, 'Gone with the Wind', '2021-03-15', '132'),
       (8, 203, 'Atomic Habits', '2021-06-20', '135'),
       (9, 206, 'To Kill a Mockingbird', '2020-05-15', '131');

-- Insert data into ReturnStatus table
INSERT INTO ReturnStatus (Return_Id, Return_cust, Return_book_name, Return_date, Isbn_book2)
VALUES (1, 201, 'Atomic Habits', '2024-04-03', '135'),
       (2, 202, 'Moby Dick', '2024-04-15', '134'),
       (3, 203, 'Gone with the Wind', '2024-03-10', '132'),
       (4, 204, 'Atomic Habits', '2024-05-10', '135'),
       (5, 205, 'The Great Gatsby', '2024-04-25', '133'),
       (6, 206, 'Gone with the Wind', '2024-05-30', '132');
      -- Retrieve the book title, category, and rental price of all available books.
      SELECT Book_title, Category, Rental_Price
FROM Books
WHERE Status = 'yes';
-- List the employee names and their respective salaries in descending order of salary.
SELECT Emp_name, Salary
FROM Employee
ORDER BY Salary DESC;
-- Retrieve the book titles and the corresponding customers who have issued those books.
SELECT B.Book_title, C.Customer_name
FROM IssueStatus I
JOIN Books B ON I.Isbn_book = B.ISBN
JOIN Customer C ON I.Issued_cust = C.Customer_Id;
-- Display the total count of books in each category.
SELECT Category, COUNT(*) AS Total_Count
FROM Books
GROUP BY Category;
-- Retrieve the employee names and their positions for the employees whose salaries are above Rs.50,000.
SELECT Emp_name, Position
FROM Employee
WHERE Salary > 50000;
-- List the customer names who registered before 2022-01-01 and have not issued any books yet.
SELECT C.Customer_name
FROM Customer C
LEFT JOIN IssueStatus I ON C.Customer_Id = I.Issued_cust
WHERE C.Reg_date < '2022-01-01' AND I.Issue_Id IS NULL;
-- Display the branch numbers and the total count of employees in each branch.
SELECT Branch_no, COUNT(*) AS Total_Employees
FROM Employee
GROUP BY Branch_no;
-- Display the names of customers who have issued books in the month of June 2023.
SELECT DISTINCT C.Customer_name
FROM IssueStatus I
JOIN Customer C ON I.Issued_cust = C.Customer_Id
WHERE I.Issue_date BETWEEN '2023-06-01' AND '2023-06-30';
-- Retrieve book_title from book table containing history.
SELECT Book_title
FROM Books
WHERE Book_title LIKE '%history%';
-- Retrieve the branch numbers along with the count of employees for branches having more than 5 employees.
SELECT Branch_no, COUNT(*) AS Total_Employees
FROM Employee
GROUP BY Branch_no
HAVING COUNT(*) > 5;







