DROP SCHEMA Lab1 CASCADE;
CREATE SCHEMA Lab1;

CREATE TABLE Movies (
	movieID INT PRIMARY KEY,
	name VARCHAR(30),
	year INT,
	rating CHARACTER(1),
	length INT,
	totalEarned NUMERIC(7,2)
);

CREATE TABLE Theaters (
	theaterID INT PRIMARY KEY,
	address VARCHAR(40),
	numSeats INT
);

CREATE TABLE TheaterSeats (
	theaterID INT REFERENCES Theaters(theaterID),
	seatNum INT,
	brokenSeat BOOLEAN,
	PRIMARY KEY (theaterID, seatNum)
);

CREATE TABLE Showings (
	theaterID INT REFERENCES Theaters(theaterID),
	showingDate DATE,
	startTime TIME,
	movieID INT REFERENCES Movies(movieID),
	priceCode CHAR(1),
	PRIMARY KEY (theaterID,showingDate,startTime)
);

CREATE TABLE Customers (
	customerID INT PRIMARY KEY,
	name VARCHAR(30),
	address VARCHAR(40),
	joinDate DATE,
	status CHAR(1)
);

CREATE TABLE Tickets (
	theaterID INT,
	seatNum INT,
	showingDate DATE,
	startTime TIME, 
	customerID INT REFERENCES Customers(customerID),
	ticketPrice NUMERIC(4,2),
	PRIMARY KEY (theaterID, seatNum, showingDate, startTime),
	FOREIGN KEY (theaterID, seatNum) REFERENCES TheaterSeats(theaterID, seatNum),
	FOREIGN KEY (theaterID,showingDate,startTime) REFERENCES Showings(theaterID,showingDate,startTime)
);
