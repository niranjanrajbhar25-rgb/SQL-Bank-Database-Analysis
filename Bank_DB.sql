create database Bank_DB;
use bank_DB;
select * from customers;
select * from customers where firstname like "n%";
-- 1. Customers table
CREATE TABLE Customers (CustomerID INT AUTO_INCREMENT PRIMARY KEY,
FirstName VARCHAR(50) NOT NULL,
LastName VARCHAR(50) NOT NULL,
DateOfBirth DATE,
Email VARCHAR(100) UNIQUE,
Phone VARCHAR(15),
Address VARCHAR(255));

INSERT INTO Customers (FirstName, LastName, DateOfBirth, Email, Phone, Address) VALUES
('Niranjan', 'Rajbhar', '2003-05-20', 'niranjan.raj@gmail.com', '9876783210', '120 station road'),
('Suraj', 'Kumar', '1995-07-24', 'suraj.kumar@gmail.com', '9876543698', '45 moti nagar'),
('Radhika', 'Prajapati', '1985-11-03', 'radhika.praj@gmail.com', '8876540202', '7 link road'),
('Urmila', 'Singh', '1985-05-21', 'urmila.singh@gmail.com', '9870543217', '32 Gautam nagar'),
('Rajesh', 'shah', '1992-09-15', 'rajesh.shah@gmail.com', '9875543814', '60 marve Apt'),
('Manish', 'Gupta', '1997-01-30', 'manish.gupta@gmail.com', '9876573205', '9 ashok bldg'),
('Nehal', 'khan', '1995-12-10', 'nehal.khan@gmail.com', '9876543516', '14 ganesh deval'),
('Vicky', 'Maurya', '2002-06-18', 'vicky.maurya@gmail.com', '9876543285', '60 feet road');


-- 2. Accounts table
CREATE TABLE Accounts (AccountID INT AUTO_INCREMENT PRIMARY KEY,
CustomerID INT,
AccountType VARCHAR(20) NOT NULL, 
Balance DECIMAL(15,2) DEFAULT 0.00,
CreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID));

INSERT INTO Accounts (CustomerID, AccountType, Balance) VALUES
(1, 'Savings', 5000.00),
(2, 'Current', 12000.50),
(3, 'Savings', 8000.00),
(4, 'Current', 1500.00),
(5, 'Savings', 22000.75),
(6, 'Current', 7000.00),
(7, 'Savings', 3000.25),
(8, 'Current', 10000.00);


-- 3. Transactions table
CREATE TABLE Transactions (TransactionID INT AUTO_INCREMENT PRIMARY KEY,
AccountID INT,
TransactionType VARCHAR(20), 
Amount DECIMAL(15,2) NOT NULL,
TransactionDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
FOREIGN KEY (AccountID) REFERENCES Accounts(AccountID));

INSERT INTO Transactions (AccountID, TransactionType, Amount) VALUES
(9, 'Deposit', 2000.00),
(10, 'Withdrawal', 1500.50),
(11, 'Deposit', 3000.00),
(12, 'Withdrawal', 500.00),
(13, 'Deposit', 7000.75),
(14, 'Withdrawal', 2000.00),
(15, 'Deposit', 1000.25),
(16, 'Withdrawal', 2500.00);


-- 4. Employees table
CREATE TABLE Employees (EmployeeID INT AUTO_INCREMENT PRIMARY KEY,
FirstName VARCHAR(50),
LastName VARCHAR(50),
Position VARCHAR(50),
HireDate DATE,
Salary DECIMAL(10,2));

INSERT INTO Employees (FirstName, LastName, Position, HireDate, Salary) VALUES
('Sonu', 'Kuamr', 'Manager', '2010-06-12', 60000.00),
('Mona', 'Tiwari', 'Cashier', '2015-03-10', 35000.00),
('Ankit', 'Shah', 'Teller', '2018-01-05', 30000.00),
('Aksh', 'Jain', 'Loan Officer', '2012-07-22', 45000.00),
('Payal', 'Rathore', 'Manager', '2011-11-15', 65000.00),
('Annu', 'Malik', 'Teller', '2019-09-09', 32000.00),
('Riya', 'Yadav', 'Cashier', '2016-05-18', 34000.00),
('Khushi', 'Singh', 'Loan Officer', '2013-12-01', 47000.00);


-- 5. Loans table
CREATE TABLE Loans (LoanID INT AUTO_INCREMENT PRIMARY KEY,                    
CustomerID INT,
LoanType VARCHAR(50),
LoanAmount DECIMAL(15,2),
InterestRate DECIMAL(5,2),
StartDate DATE,
EndDate DATE,
FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID));

INSERT INTO Loans (CustomerID, LoanType, LoanAmount, InterestRate, StartDate, EndDate) VALUES
(1, 'Home Loan', 500000.00, 6.5, '2020-01-01', '2030-01-01'),
(2, 'Car Loan', 200000.00, 7.0, '2021-03-15', '2026-03-15'),
(3, 'Personal Loan', 100000.00, 10.0, '2019-07-01', '2024-07-01'),
(4, 'Home Loan', 600000.00, 6.0, '2018-05-20', '2028-05-20'),
(5, 'Education Loan', 150000.00, 5.5, '2022-09-01', '2027-09-01'),
(6, 'Car Loan', 250000.00, 7.2, '2020-11-11', '2025-11-11'),
(7, 'Personal Loan', 80000.00, 10.5, '2021-12-05', '2026-12-05'),
(8, 'Home Loan', 700000.00, 6.8, '2017-04-10', '2027-04-10');


-- 6. CreditCards table
CREATE TABLE CreditCards (CardID INT AUTO_INCREMENT PRIMARY KEY,
CustomerID INT,
CardNumber VARCHAR(16) UNIQUE,
ExpiryDate DATE,
CVV VARCHAR(4),
CreditLimit DECIMAL(15,2),
FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID));

INSERT INTO CreditCards (CustomerID, CardNumber, ExpiryDate, CVV, CreditLimit) VALUES
(1, '4111111111111111', '2026-12-31', '123', 50000.00),
(2, '4222222222222222', '2025-11-30', '234', 40000.00),
(3, '4333333333333333', '2027-01-31', '345', 30000.00),
(4, '4444444444444444', '2026-06-30', '456', 45000.00),
(5, '4555555555555555', '2025-09-30', '567', 35000.00),
(6, '4666666666666666', '2027-03-31', '678', 60000.00),
(7, '4777777777777777', '2026-08-31', '789', 25000.00),
(8, '4888888888888888', '2025-10-31', '890', 55000.00);


-- 7. CardTransactions table
CREATE TABLE CardTransactions (CardTransactionID INT AUTO_INCREMENT PRIMARY KEY,
CardID INT,
TransactionDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
Amount DECIMAL(15,2),
Merchant VARCHAR(100),
FOREIGN KEY (CardID) REFERENCES CreditCards(CardID));

INSERT INTO CardTransactions (CardID, TransactionDate, Amount, Merchant) VALUES
(1, '2023-01-05', 2000.00, 'Amazon'),
(2, '2023-02-10', 1500.50, 'Flipkart'),
(3, '2023-03-12', 3000.00, 'Walmart'),
(4, '2023-04-15', 500.00, 'Starbucks'),
(5, '2023-05-20', 700.75, 'Messo'),
(6, '2023-06-18', 2000.00, 'Messo'),
(7, '2023-07-22', 1000.25, 'Amazon'),
(8, '2023-08-30', 2500.00, 'Flipkart');

-- view table
-- Simple View
create view Customer_View as
select FirstName, LastName, Email
from Customers;

-- 2. Complex View
Create view Customer_Account_Balances as
select c.CustomerID, c.FirstName, c.LastName, a.AccountID, a.AccountType, a.Balance
from Customers as c
inner join  Accounts as a 
on c.CustomerID = a.CustomerID; 






























