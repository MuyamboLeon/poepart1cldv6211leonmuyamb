-- DATABASE CREATION
USE master;

IF EXISTS (SELECT * FROM sys.databases WHERE name = 'EventEase')
    DROP DATABASE EventEase;

CREATE DATABASE EventEase;
USE EventEase;

-- TABLE CREATION
CREATE TABLE Venue (
    VenueID INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
    [VenueName] VARCHAR(250) NOT NULL,
    imageUrl VARCHAR(250) NOT NULL,
    Location VARCHAR(250) NOT NULL,
    Capacity INT
);

CREATE TABLE Event (
    EventID INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
    [EventName] VARCHAR(250) NOT NULL,
    EventDate DATE,
    Description VARCHAR(250) NOT NULL,
    VenueID INT,
    FOREIGN KEY (VenueID) REFERENCES Venue(VenueID) 
);

CREATE TABLE Booking (
    BookingID INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
    EventID INT,
    FOREIGN KEY (EventID) REFERENCES Event(EventID), 
    VenueID INT,
    FOREIGN KEY (VenueID) REFERENCES Venue(VenueID),
    BookingDate DATE
);

-- INSERT DATA
INSERT INTO Venue ([VenueName], imageUrl, Location, Capacity)
VALUES ('Tau', 'www.rendani.com', 'Si la', 50);

INSERT INTO Event ([EventName], EventDate, Description, VenueID)
VALUES ('21st BirthDayParty', '2025-03-10', 'Neque porro quisquam est qui dolorem ipsum quia dolor', 1);


INSERT INTO Booking (EventID, VenueID, BookingDate)
VALUES (1, 1, '2025-03-10');

-- SELECT STATEMENTS
SELECT * FROM Venue;
SELECT * FROM Event;
SELECT * FROM Booking;
