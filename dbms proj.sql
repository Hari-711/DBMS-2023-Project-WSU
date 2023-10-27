drop database if exists testdb;
CREATE database testdb;
Use testdb;
drop table if exists User;
CREATE TABLE user (
     firstname varchar(50),
     email varchar(50),
     lastname varchar(50),
     password varchar(20),
     card varchar(12),
     address varchar(40),
     phone varchar(10)
);

insert into user(email, firstName, lastName, password, address, card, phone)
values ('susie@gmail.com', 'Susie ', 'Guzman', 'susie1234', '1234, whatever street, detroit, MI', '000000000001', '0000000000'),
('don@gmail.com', 'Don', 'Cumming
s','don123', '1000, hi street, MO','000000000002', '0000000000'),
('margarita@gmail.com', 'Margarita', 'Lawson','margarita1234', '1234, ivan street, tata, CO', '000000000003', '0000000000'),
('jo@gmail.com', 'Jo', 'Brady','jo1234', '3214, marko street, brat, DU', '000000000004', '0000000000') ;

SELECT * from user; 
drop table if exists Trees;
-- Create the Trees table
CREATE TABLE Trees (
    TreeID INT PRIMARY KEY AUTO_INCREMENT,
    Size VARCHAR(50),
    Height DECIMAL(5,2),
    ProximityToHouses VARCHAR(255),
    TypeOfTree VARCHAR(100)
);

-- Create the Quotes table
CREATE TABLE Quotes (
    QuoteID INT PRIMARY KEY AUTO_INCREMENT,
    Price DECIMAL(10,2),
    TimeForWork TIME,
    AdditionalNotesFromContractor TEXT
);

-- Create the Request for Quote table
CREATE TABLE RequestForQuote (
    QuoteID INT,
    DateOfRequest DATE,
    AdditionalNotesFromClient TEXT,
    FOREIGN KEY (QuoteID) REFERENCES Quotes(QuoteID)
);

-- Create the Orders of Work table
CREATE TABLE OrdersOfWork (
    QuoteID INT,
    DateOfOrder DATE,
    Price DECIMAL(10,2),
    TimeWindowForWork TIME,
    Status VARCHAR(50), -- e.g., 'Pending', 'In Progress', 'Completed'
    FOREIGN KEY (QuoteID) REFERENCES Quotes(QuoteID)
);

-- Create the Bills table
CREATE TABLE Bills (
    QuoteID INT,
    DateOfBill DATE,
    AmountDue DECIMAL(10,2),
    Status VARCHAR(50), -- e.g., 'Paid', 'Unpaid', 'Disputed'
    FOREIGN KEY (QuoteID) REFERENCES OrdersOfWork(QuoteID)
);

SELECT * FROM Trees;
SELECT * FROM Quotes;
SELECT * FROM RequestForQuote;
SELECT * FROM OrdersOfWork;
SELECT * FROM Bills;