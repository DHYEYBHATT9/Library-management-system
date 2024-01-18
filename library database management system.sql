-- Library database management system
-- ________________________________________________________________________________________________________________ --
-- Create and Use Database
CREATE DATABASE IF NOT EXISTS LibraryDatabase;
USE LibraryDatabase;

-- Access each table

-- 1. Books Table
SELECT * FROM Books;

-- 2. Authors Table
SELECT * FROM Authors;

-- 3. Customers Table
SELECT * FROM Customers;

-- 4. Payments Table
SELECT * FROM Payments;

-- 5. BookAuthors Table
SELECT * FROM Authors;

-- 6. CustomerBook Table
SELECT * FROM CustomerBook;



-- Create and Use Database
CREATE DATABASE IF NOT EXISTS LibraryDatabase;
USE LibraryDatabase;

-- Create Tables with Enhanced Constraints
CREATE TABLE Books (
    ISBN VARCHAR(13) UNIQUE,
    BookID INT PRIMARY KEY,
    Title VARCHAR(255) UNIQUE NOT NULL,
    Genre VARCHAR(255),
    CopiesAvailable INT DEFAULT 0 NOT NULL
);
  
CREATE TABLE Authors (
    AuthorID INT PRIMARY KEY,
    AuthorName VARCHAR(255) NOT NULL UNIQUE,
    DOB DATE,
    Nationality VARCHAR(255),
    Genre VARCHAR(255)
);

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    ContactInfo VARCHAR(255) NOT NULL,
    MembershipStatus VARCHAR(50) DEFAULT 'Active' NOT NULL
);

CREATE TABLE Payments (
    PaymentID INT PRIMARY KEY,
    CustomerID INT,
    Purpose VARCHAR(255),
    Amount DECIMAL(10, 2) DEFAULT 0.00,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

CREATE TABLE BookAuthors (
    BookID INT,
    AuthorID INT,
    PRIMARY KEY (BookID, AuthorID),
    FOREIGN KEY (BookID) REFERENCES Books(BookID),
    FOREIGN KEY (AuthorID) REFERENCES Authors(AuthorID)
);

CREATE TABLE CustomerPayments (
    CustomerID INT,
    PaymentID INT,
    PRIMARY KEY (CustomerID, PaymentID),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (PaymentID) REFERENCES Payments(PaymentID)
);

CREATE TABLE CustomerBook (
    CustomerID INT,
    BookID INT,
    BorrowDate DATE,
    ReturnDate DATE,
    Status VARCHAR(50),
    PRIMARY KEY (CustomerID, BookID),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (BookID) REFERENCES Books(BookID)
);

CREATE TABLE PaymentBook (
    PaymentID INT,
    BookID INT,
    Reason VARCHAR(255),
    PRIMARY KEY (PaymentID, BookID),
    FOREIGN KEY (PaymentID) REFERENCES Payments(PaymentID),
    FOREIGN KEY (BookID) REFERENCES Books(BookID)
);


-- Inserting data into CustomerBook table
INSERT INTO CustomerBook (CustomerID, BookID, BorrowDate, ReturnDate, Status)
VALUES
    (1, 1, '2023-01-15', '2023-02-05', 'Returned'),
    (2, 3, '2023-02-10', '2023-03-01', 'Returned'),
    (3, 2, '2023-03-05', NULL, 'On Loan'),
    (4, 4, '2023-04-01', NULL, 'On Loan');
    
    INSERT INTO Payments (PaymentID, CustomerID, Purpose, Amount)
VALUES
  (1, 1, 'Membership Fee', 20.00),
  (2, 2, 'Late Fee', 5.00),
  (3, 3, 'Book Purchase', 30.00),
  (4, 4, 'Membership Renewal', 25.00);


-- Insert Records
INSERT INTO Customers (CustomerID, ContactInfo, MembershipStatus)
VALUES
  (1, '123 Main St, Cityville, Email1@example.com', 'Active'),
  (2, '456 Oak St, Townsville, Email2@example.com', 'Active'),
  (3, '789 Pine St, Villagetown, Email3@example.com', 'Inactive'),
  (4, '101 Elm St, Hamletville, Email4@example.com', 'Active');

INSERT INTO Books (ISBN, BookID, Title, Genre, CopiesAvailable)
VALUES
  ('1234567890123', 1, 'The Adventure Begins', 'Adventure', 5),
  ('2345678901234', 2, 'Mystery Mansion', 'Mystery', 3),
  ('3456789012345', 3, 'Romantic Sunset', 'Romance', 7),
  ('4567890123456', 4, 'Sci-Fi Odyssey', 'Science Fiction', 2),
  ('5678901234567', 5, 'Cooking Delights', 'Cookbook', 10);

INSERT INTO Authors (AuthorID, AuthorName, DOB, Nationality, Genre)
VALUES
  (1, 'Amit Kumar', '1980-05-15', 'Indian', 'Adventure'),
  (2, 'Priya Patel', '1985-08-22', 'American', 'Mystery'),
  (3, 'Raj Singh', '1975-03-10', 'Spanish', 'Romance');


-- _____________________________________________________________________________________________________________________________________________                                                                                                           --

--  Add 15 more records for a total of 30

-- ... (Insert statements go here...)
INSERT INTO Customers (CustomerID, ContactInfo, MembershipStatus)
VALUES
  (22, '202 Pine St, Villagetown, Email5@example.com', 'Active'),
  (23, '303 Elm St, Hamletville, Email6@example.com', 'Active'),
  (24, '404 Maple St, Cityville, Email7@example.com', 'Inactive'),
  (25, '505 Birch St, Townsville, Email8@example.com', 'Active'),
  (26, '606 Cedar St, Cityville, Email9@example.com', 'Active'),
  (27, '707 Oak St, Villagetown, Email10@example.com', 'Inactive'),
  (28, '808 Pine St, Hamletville, Email11@example.com', 'Active'),
  (29, '909 Elm St, Townsville, Email12@example.com', 'Active'),
  (30, '1010 Maple St, Cityville, Email13@example.com', 'Inactive'),
  (31, '1111 Birch St, Villagetown, Email14@example.com', 'Active'),
  (309, '1212 Cedar St, Hamletville, Email15@example.com', 'Active'),
  (33, '1313 Oak St, Townsville, Email16@example.com', 'Inactive'),
  (34, '1414 Pine St, Cityville, Email17@example.com', 'Active'),
  (54, '1515 Elm St, Villagetown, Email18@example.com', 'Active'),
  (32, '1616 Maple St, Hamletville, Email19@example.com', 'Inactive');

INSERT INTO Books (ISBN, BookID, Title, Genre, CopiesAvailable)
VALUES
  ('5353546464666', 6, 'Historical Chronicles', 'History', 8),
  ('5545945498489', 7, 'Fictional Dreams', 'Fiction', 5),
  ('0006464504646', 8, 'Thrilling Adventures', 'Adventure', 3),
  ('4644646464646', 9, 'Poetry Collection', 'Poetry', 10),
  ('5405495494964', 10, 'Epic Fantasy', 'Fantasy', 6),
  ('6460464064864', 11, 'Natures Wonders', 'Nature', 2),
  ('3535353535353', 12, 'Space Explorations', 'Science Fiction', 4),
  ('5353535353535', 13, 'Tech Innovations', 'Technology', 7),
  ('1111222424224', 14, 'Travel Diaries', 'Travel', 9),
  ('6657575757577', 15, 'Health & Wellness', 'Health', 12),
  ('7475657577543', 16, 'Culinary Delights', 'Cookbook', 15),
  ('2224435353532', 17, 'Romantic Escapes', 'Romance', 5),
  ('6969495949553', 18, 'Political Dramas', 'Politics', 3),
  ('3343535364666', 19, 'Artistic Inspirations', 'Art', 6);

INSERT INTO Authors (AuthorID, AuthorName, DOB, Nationality, Genre)
VALUES
  (4, 'Neha Sharma', '1982-07-18', 'Indian', 'History'),
  (5, 'Michael Johnson', '1979-04-25', 'American', 'Fiction'),
  (6, 'Elena Rodriguez', '1988-11-12', 'Spanish', 'Adventure'),
  (7, 'Rahul Kapoor', '1985-02-28', 'Indian', 'Poetry'),
  (8, 'Sara Thompson', '1989-09-08', 'American', 'Fantasy'),
  (9, 'Juan Garcia', '1976-06-15', 'Spanish', 'Nature'),
  (10, 'Priya Malik', '1984-03-20', 'Indian', 'Science Fiction'),
  (11, 'David Wilson', '1977-10-10', 'American', 'Technology'),
  (12, 'Anika Patel', '1983-01-30', 'Indian', 'Travel'),
  (13, 'Carlos Fernandez', '1986-08-22', 'Spanish', 'Health'),
  (14, 'Amit Bansal', '1981-05-05', 'Indian', 'Cookbook'),
  (15, 'Isabella Lopez', '1978-12-14', 'Spanish', 'Romance'),
  (16, 'Alex Turner', '1987-06-29', 'American', 'Politics'),
  (17, 'Mia Patel', '1980-01-12', 'Indian', 'Art');
  
-- Update Queries with Subqueries
-- Query 1: Update the genre for all books written by a specific author
UPDATE Books
SET Genre = 'Fantasy'
WHERE BookID IN (SELECT BookID FROM BookAuthors WHERE AuthorID = 1);

-- Query 2: Update the membership status of customers who made payments over $50
UPDATE Customers
SET MembershipStatus = 'Premium'
WHERE CustomerID IN (SELECT CustomerID FROM Payments WHERE Amount > 50);

-- Delete Queries with Subqueries
-- Query 1: Delete all books written by a specific author
DELETE FROM Books
WHERE BookID IN (SELECT BookID FROM BookAuthors WHERE AuthorID = 2);

-- Query 2: Delete customers who have not made any payments
SET SQL_SAFE_UPDATES = 0;
DELETE FROM Customers
WHERE CustomerID NOT IN (SELECT DISTINCT CustomerID FROM Payments);

-- Select Queries

-- Query a) Joins of at least three tables
SELECT
    Customers.CustomerID,
    Customers.ContactInfo,
    COUNT(CustomerBook.BookID) AS TotalBooksBorrowed
FROM
    Customers
LEFT JOIN
    CustomerBook ON Customers.CustomerID = CustomerBook.CustomerID
GROUP BY
    Customers.CustomerID, Customers.ContactInfo
ORDER BY
    TotalBooksBorrowed DESC;
    
    
-- b ) Second query using aggregate functions and having clause --  
    
   SELECT
    Customers.CustomerID,
    Customers.ContactInfo,
    AVG(DATEDIFF(CustomerBook.ReturnDate, CustomerBook.BorrowDate)) AS AverageBorrowingDuration
FROM
    Customers
JOIN
    CustomerBook ON Customers.CustomerID = CustomerBook.CustomerID
WHERE
    CustomerBook.ReturnDate IS NOT NULL -- Exclude ongoing loans
GROUP BY
    Customers.CustomerID, Customers.ContactInfo
HAVING
    AverageBorrowingDuration > 15
ORDER BY
    AverageBorrowingDuration DESC;
    
    
    -- C  query using nested subqueries
SELECT
    Customers.CustomerID,
    Customers.ContactInfo
FROM
    Customers
WHERE
    Customers.CustomerID IN (
        -- Subquery 1: Customers who have borrowed books
        SELECT DISTINCT CustomerBook.CustomerID
        FROM CustomerBook
    )
    AND
    Customers.CustomerID NOT IN (
        -- Subquery 2: Customers who have made payments
        SELECT DISTINCT CustomerPayments.CustomerID
        FROM CustomerPayments
    );
    

 -- D query using either union, intersect or minus
 
 -- Query to find books in the "Mystery" genre or with more than 5 copies available

-- First Query: Books in the "Mystery" genre
SELECT
    BookID,
    Title,
    Genre,
    CopiesAvailable
FROM
    Books
WHERE
    Genre = 'Mystery'

UNION

-- Second Query: Books with more than 5 copies available
SELECT
    BookID,
    Title,
    Genre,
    CopiesAvailable
FROM
    Books
WHERE
    CopiesAvailable > 5;
    
    
-- E-- Query to find the total number of books borrowed by each customer

SELECT
    Customers.CustomerID,
    Customers.ContactInfo,
    COUNT(CustomerBook.BookID) AS TotalBooksBorrowed
FROM
    Customers
LEFT JOIN
    CustomerBook ON Customers.CustomerID = CustomerBook.CustomerID
GROUP BY
    Customers.CustomerID, Customers.ContactInfo
ORDER BY
    TotalBooksBorrowed DESC;