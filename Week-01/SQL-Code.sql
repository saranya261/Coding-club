```sql
CREATE DATABASE LibraryLendingSystem;

USE LibraryLendingSystem;


-- ============================================
-- 1. BOOK TABLE
-- ============================================

CREATE TABLE Book (
    ISBN VARCHAR(20) PRIMARY KEY,
    Title VARCHAR(200) NOT NULL,
    Author VARCHAR(150) NOT NULL,
    Publisher VARCHAR(150),
    Publication_Year INT,
    Category VARCHAR(100)
);


-- ============================================
-- 2. MEMBER TABLE
-- ============================================

CREATE TABLE Member (
    Member_ID INT PRIMARY KEY AUTO_INCREMENT,
    First_Name VARCHAR(50) NOT NULL,
    Last_Name VARCHAR(50) NOT NULL,
    Address VARCHAR(255),
    Phone VARCHAR(20),
    Email VARCHAR(100) UNIQUE,
    Membership_Date DATE NOT NULL
);


-- ============================================
-- 3. LIBRARIAN TABLE
-- ============================================

CREATE TABLE Librarian (
    Librarian_ID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE,
    Hire_Date DATE NOT NULL
);


-- ============================================
-- 4. BOOK_COPY TABLE
-- Stores individual physical copies of books
-- ============================================

CREATE TABLE Book_Copy (
    Copy_ID INT PRIMARY KEY AUTO_INCREMENT,
    ISBN VARCHAR(20) NOT NULL,
    Available BOOLEAN NOT NULL DEFAULT TRUE,

    FOREIGN KEY (ISBN)
        REFERENCES Book(ISBN)
);


-- ============================================
-- 5. LOAN TABLE
-- Stores borrowing and returning history
-- ============================================

CREATE TABLE Loan (
    Loan_ID INT PRIMARY KEY AUTO_INCREMENT,
    Copy_ID INT NOT NULL,
    Member_ID INT NOT NULL,
    Librarian_ID INT,
    Borrow_Date DATE NOT NULL,
    Due_Date DATE NOT NULL,
    Return_Date DATE,
    Status VARCHAR(20) NOT NULL DEFAULT 'borrowed',

    FOREIGN KEY (Copy_ID)
        REFERENCES Book_Copy(Copy_ID),

    FOREIGN KEY (Member_ID)
        REFERENCES Member(Member_ID),

    FOREIGN KEY (Librarian_ID)
        REFERENCES Librarian(Librarian_ID),

    CHECK (Return_Date IS NULL OR Return_Date >= Borrow_Date),

    CHECK (Status IN ('borrowed', 'returned', 'overdue'))
);


-- ============================================
-- SAMPLE QUERIES
-- ============================================


-- 1. ISSUE A BOOK
-- First check whether a copy is available

SELECT Copy_ID
FROM Book_Copy
WHERE ISBN = '978123456'
AND Available = TRUE;

-- Issue the available copy

INSERT INTO Loan
(Copy_ID, Member_ID, Librarian_ID, Borrow_Date, Due_Date, Status)
VALUES
(1, 101, 5, CURRENT_DATE,
 DATE_ADD(CURRENT_DATE, INTERVAL 14 DAY),
 'borrowed');

-- Mark the copy as unavailable

UPDATE Book_Copy
SET Available = FALSE
WHERE Copy_ID = 1;


-- 2. RETURN A BOOK

UPDATE Loan
SET
    Return_Date = CURRENT_DATE,
    Status = 'returned'
WHERE Loan_ID = 1;

-- Mark the copy as available again

UPDATE Book_Copy
SET Available = TRUE
WHERE Copy_ID = 1;


-- 3. FIND OVERDUE BOOKS

SELECT
    Loan.Loan_ID,
    Book.Title,
    Member.First_Name,
    Member.Last_Name,
    Loan.Due_Date
FROM Loan
JOIN Book_Copy
    ON Loan.Copy_ID = Book_Copy.Copy_ID
JOIN Book
    ON Book_Copy.ISBN = Book.ISBN
JOIN Member
    ON Loan.Member_ID = Member.Member_ID
WHERE Loan.Due_Date < CURRENT_DATE
AND Loan.Return_Date IS NULL;


-- 4. FIND CURRENTLY AVAILABLE BOOKS

SELECT
    Book.ISBN,
    Book.Title,
    Book_Copy.Copy_ID
FROM Book
JOIN Book_Copy
    ON Book.ISBN = Book_Copy.ISBN
WHERE Book_Copy.Available = TRUE;


-- 5. FIND BORROWING HISTORY OF A MEMBER

SELECT
    Member.Member_ID,
    Member.First_Name,
    Member.Last_Name,
    Book.Title,
    Loan.Borrow_Date,
    Loan.Due_Date,
    Loan.Return_Date,
    Loan.Status
FROM Loan
JOIN Member
    ON Loan.Member_ID = Member.Member_ID
JOIN Book_Copy
    ON Loan.Copy_ID = Book_Copy.Copy_ID
JOIN Book
    ON Book_Copy.ISBN = Book.ISBN
WHERE Member.Member_ID = 101
ORDER BY Loan.Borrow_Date DESC;
```
