-- Lab 2 (Part 1) - SQL DDL, DML 
-- pgarci40
-- Oct 17, 2025

USE `pgarci40`;
-- Current User
-- This space is for you to explore your own database tables.
--ReadMe
--Priscilla Garcia
--CSC-365-02-2258;


USE `pgarci40`;
-- STUDENTS
-- Create and populate relational tables corresponding to the STUDENTS dataset (schema and data provided on Canvas).
DROP TABLE IF EXISTS List;
DROP TABLE IF EXISTS Teachers;

CREATE TABLE TEACHERS(
    LastName VARCHAR(50) NOT NULL,
    FirstName VARCHAR(50) NOT NULL,
    Classroom INT PRIMARY KEY
);

CREATE TABLE LIST(
    LastName VARCHAR(50) NOT NULL,
    FirstName VARCHAR(50) NOT NULL,
    Grade INT,
    Classroom INT NOT NULL,
    PRIMARY KEY (LastName, FirstName, Classroom),
    FOREIGN KEY (Classroom) REFERENCES TEACHERS(Classroom)
);


USE `pgarci40`;
-- CSU
-- Create and populate relational tables corresponding to the CSU dataset (schema and data provided on Canvas)
DROP TABLE IF EXISTS DISCIPLINE_ENROLLMENTS;
DROP TABLE IF EXISTS ENROLLMENTS;
DROP TABLE IF EXISTS FACULTY;
DROP TABLE IF EXISTS DEGREES;
DROP TABLE IF EXISTS CSU_FEES;
DROP TABLE IF EXISTS DISCIPLINE;
DROP TABLE IF EXISTS CAMPUS;

CREATE TABLE CAMPUS(
    Id INT AUTO_INCREMENT PRIMARY KEY,
    Campus VARCHAR(100) NOT NULL,
    Location VARCHAR(50) NOT NULL,
    County VARCHAR(50),
    Year INT NOT NULL
);

CREATE TABLE DISCIPLINE(
    Id INT PRIMARY KEY,
    Name VARCHAR(50) NOT NULL
);

CREATE TABLE CSU_FEES(
    Campus INT NOT NULL,
    Year INT NOT NULL,
    CampusFee DOUBLE NOT NULL,
    PRIMARY KEY (Campus, Year),
    FOREIGN KEY (Campus) REFERENCES CAMPUS(Id)
);

CREATE TABLE DEGREES(
    Year INT NOT NULL,
    Campus INT NOT NULL,
    Degrees INT NOT NULL, 
    PRIMARY KEY (Campus, Year),
    CONSTRAINT fk_Campus_Id FOREIGN KEY (Campus) REFERENCES CAMPUS(Id)
);

CREATE TABLE DISCIPLINE_ENROLLMENTS(
    Campus INT NOT NULL,
    Discipline INT NOT NULL,
    Year INT NOT NULL,
    Undergraduate INT NOT NULL,
    Graduate INT,
    PRIMARY KEY (Campus, Discipline, Year),
    CONSTRAINT fk_Discipline_Enrollments_Campus_Id FOREIGN KEY (Campus) REFERENCES CAMPUS(Id),
    CONSTRAINT fk_Discipline_Enrollments_Discipline_Id FOREIGN KEY (Discipline) REFERENCES DISCIPLINE(Id)
);

CREATE TABLE ENROLLMENTS(
    Campus INT NOT NULL,
    Year INT NOT NULL,
    TotalEnrollmentAY INT NOT NULL,
    FIEAY INT NOT NULL,
    PRIMARY KEY (Campus, Year),
    CONSTRAINT fk_Enrollments_Campus_Id FOREIGN KEY (Campus) REFERENCES CAMPUS(Id)
);

CREATE TABLE FACULTY(
    Campus INT NOT NULL,
    Year INT NOT NULL,
    Faculty INT NOT NULL,
    PRIMARY KEY (Campus, Year),
    CONSTRAINT fk_Faculty_Campus_Id FOREIGN KEY (Campus) REFERENCES CAMPUS(Id)
);


USE `pgarci40`;
-- CARS
-- Create relational tables corresponding to the CARS dataset (schema and data provided on Canvas)
DROP TABLE IF EXISTS CAR_DATA;
DROP TABLE IF EXISTS CAR_NAMES;
DROP TABLE IF EXISTS MODEL_LIST;
DROP TABLE IF EXISTS CAR_MAKERS;
DROP TABLE IF EXISTS COUNTRY;
DROP TABLE IF EXISTS CONTINENTS;

CREATE TABLE CAR_MAKERS(
    Id INT PRIMARY KEY,
    Maker VARCHAR(50) NOT NULL,
    FullName VARCHAR(100) NOT NULL,
    Country INT NOT NULL
);

CREATE TABLE CAR_NAMES(
    MakeId INT PRIMARY KEY,
    Model VARCHAR(50) NOT NULL,
    MakeDescription VARCHAR(50) NOT NULL
);

CREATE TABLE CAR_DATA(
    Id INT PRIMARY KEY,
    MPG INT NOT NULL,
    Cylinders INT NOT NULL,
    Edispl INT NOT NULL,
    Horsepower INT NOT NULL,
    Weight DOUBLE NOT NULL,
    Accelerate DOUBLE NOT NULL,
    Year INT NOT NULL,
    FOREIGN KEY (Id) REFERENCES CAR_NAMES(MakeId)
);

CREATE TABLE CONTINENTS(
    ContId INT PRIMARY KEY,
    Continent VARCHAR(50)
);
CREATE TABLE COUNTRY(
    CountryId INT PRIMARY KEY,
    CountryName VARCHAR(50) NOT NULL,
    Continent INT NOT NULL,
    FOREIGN KEY (Continent) REFERENCES CONTINENTS(ContId)
);
CREATE TABLE MODEL_LIST(
    ModelId INT PRIMARY KEY,
    Maker INT NOT NULL,
    Model VARCHAR(50) NOT NULL,
    FOREIGN KEY (Maker) REFERENCES CAR_MAKERS(Id)
);


USE `pgarci40`;
-- AIRLINES
-- Create relational tables corresponding to the AIRLINES dataset (schema and data provided on Canvas)
DROP TABLE IF EXISTS FLIGHTS;
DROP TABLE IF EXISTS AIRPORT;
DROP TABLE IF EXISTS AIRLINES;

CREATE TABLE AIRLINES(
    Id INT AUTO_INCREMENT PRIMARY KEY,
    Airline VARCHAR(100) NOT NULL,
    Abbreviation VARCHAR(10) NOT NULL,
    Country VARCHAR(50) NOT NULL,
    UNIQUE (Abbreviation)
);

CREATE TABLE AIRPORT(
    City VARCHAR(100) NOT NULL,
    AirportCode CHAR(3) PRIMARY KEY,
    AirportName VARCHAR(100) NOT NULL,
    Country VARCHAR(50) NOT NULL,
    CountryAbbrev VARCHAR(50) NOT NULL
);

CREATE TABLE FLIGHTS(
    Airline INT NOT NULL,
    FlightNo INT NOT NULL,
    SourceAirport CHAR(3) NOT NULL,
    DestAirport CHAR(3) NOT NULL,
    PRIMARY KEY (Airline, FlightNo),
    CONSTRAINT fk_flights_airline FOREIGN KEY (Airline) REFERENCES AIRLINES(Id),
    CONSTRAINT fk_flights_source FOREIGN KEY (SourceAirport) REFERENCES AIRPORT(AirportCode),
    CONSTRAINT fk_flights_dest FOREIGN KEY (DestAirport) REFERENCES AIRPORT(AirportCode)
);


USE `pgarci40`;
-- WINE 
-- Create relational tables corresponding to the WINE dataset (schema and data provided on Canvas)
DROP TABLE IF EXISTS WINE;
DROP TABLE IF EXISTS GRAPES;
DROP TABLE IF EXISTS APPELLATION;

CREATE TABLE GRAPES(
    Id INT AUTO_INCREMENT PRIMARY KEY,
    Grape VARCHAR(50) NOT NULL,
    Color VARCHAR(50) NOT NULL,
    UNIQUE(Grape)
);

CREATE TABLE APPELLATION(
    No INT AUTO_INCREMENT PRIMARY KEY,
    Appellation VARCHAR(50) NOT NULL,
    County VARCHAR(50),
    State VARCHAR(50) NOT NULL,
    Area VARCHAR(50) NOT NULL,
    isAVA VARCHAR(50) NOT NULL,
    UNIQUE(Appellation)
);

CREATE TABLE WINE(
    WineId INT PRIMARY KEY,
    Grape VARCHAR(50) NOT NULL,
    Winery VARCHAR(50) NOT NULL,
    Name VARCHAR(50) NOT NULL,
    Appellation VARCHAR(50) NOT NULL,
    Year INT NOT NULL,
    Price DOUBLE NOT NULL,
    Score INT NOT NULL,
    Cases INT NOT NULL,
    CONSTRAINT fk_Wine_Grapes_Grape FOREIGN KEY (Grape) REFERENCES GRAPES(Grape),
    CONSTRAINT fk_Wine_Appellation_Appellation FOREIGN KEY (Appellation) REFERENCES APPELLATION(Appellation)
);


USE `pgarci40`;
-- KATZENJAMMER
-- Create relational tables corresponding to the KATZENJAMMER  dataset (schema and data provided on Canvas)
-- drop children first
DROP TABLE IF EXISTS TRACKLISTS;
DROP TABLE IF EXISTS VOCALS;
DROP TABLE IF EXISTS PERFORMANCE;
DROP TABLE IF EXISTS INSTRUMENTS;
DROP TABLE IF EXISTS SONGS;
DROP TABLE IF EXISTS BAND;
DROP TABLE IF EXISTS ALBUMS;

CREATE TABLE ALBUMS (
  AId   INT PRIMARY KEY,
  Title VARCHAR(100) NOT NULL,
  Year  VARCHAR(4)  NOT NULL,   
  Label VARCHAR(100) NOT NULL
);

CREATE TABLE BAND (
  Id INT PRIMARY KEY,
  Firstname VARCHAR(50) NOT NULL,
  Lastname VARCHAR(50) NOT NULL
);

CREATE TABLE SONGS (
  SongId INT PRIMARY KEY,
  Title  VARCHAR(100) NOT NULL
);

CREATE TABLE TRACKLISTS (
  AlbumId  INT NOT NULL,
  Position VARCHAR(10) NOT NULL, 
  SongId INT NOT NULL,
  PRIMARY KEY (AlbumId, Position),
  CONSTRAINT fk_tracklists_albums_aid FOREIGN KEY (AlbumId) REFERENCES ALBUMS(AId),
  CONSTRAINT fk_tracklists_songs_songid FOREIGN KEY (SongId)  REFERENCES SONGS(SongId)
);

CREATE TABLE INSTRUMENTS (
  SongId INT NOT NULL,
  BandmateId INT NOT NULL,
  Instrument VARCHAR(50) NOT NULL,
  PRIMARY KEY (SongId, BandmateId, Instrument),
  CONSTRAINT fk_instruments_songs_songid FOREIGN KEY (SongId) REFERENCES SONGS(SongId),
  CONSTRAINT fk_instruments_band_id FOREIGN KEY (BandmateId) REFERENCES BAND(Id)
);

CREATE TABLE PERFORMANCE (
  SongId INT NOT NULL,
  Bandmate INT NOT NULL,
  StagePosition VARCHAR(50) NOT NULL,
  PRIMARY KEY (SongId, StagePosition),
  CONSTRAINT fk_performance_songs_songid FOREIGN KEY (SongId) REFERENCES SONGS(SongId),
  CONSTRAINT fk_performance_band_id FOREIGN KEY (Bandmate) REFERENCES BAND(Id)
);

CREATE TABLE VOCALS (
  SongId INT NOT NULL,
  Bandmate INT NOT NULL,
  Type VARCHAR(50) NOT NULL,
  PRIMARY KEY (SongId, Type),
  CONSTRAINT fk_vocals_songs_songid FOREIGN KEY (SongId) REFERENCES SONGS(SongId),
  CONSTRAINT fk_vocals_band_id FOREIGN KEY (Bandmate) REFERENCES BAND(Id)
);


USE `pgarci40`;
-- BAKERY
-- Create relational tables corresponding to the BAKERY dataset (schema and data provided on Canvas)
DROP TABLE IF EXISTS CUSTOMERS;

CREATE TABLE CUSTOMERS(
    Id INT PRIMARY KEY,
    LastName VARCHAR(50) NOT NULL,
    FirstName VARCHAR(50) NOT NULL
);

CREATE TABLE GOODS(
    Id INT PRIMARY KEY,
    Flavor VARCHAR(50) NOT NULL,
    Food VARCHAR(50) NOT NULL,
    Price DOUBLE NOT NULL
);

CREATE TABLE ITEMS(
    Receipt INT PRIMARY KEY,
    Ordinal VARCHAR(50) NOT NULL,
    Item INT NOT NULL,
    FOREIGN KEY (Item) REFERENCES GOODS(Id)
);

CREATE TABLE RECEIPTS(
    RecieptNumber INT PRIMARY KEY,
    Date DATE NOT NULL,
    CustomerId INT NOT NULL,
    FOREIGN KEY (CustomerId) REFERENCES CUSTOMERS(Id)
);


USE `pgarci40`;
-- MARATHON
-- Create relational tables corresponding to the MARATHON dataset (schema and data provided on Canvas)
DROP TABLE IF EXISTS MARATHON;

CREATE TABLE MARATHON (
    Place INT PRIMARY KEY,
    Time VARCHAR(10) NOT NULL,
    Pace VARCHAR(10) NOT NULL,
    GroupPlace INT NOT NULL,
    GroupRange VARCHAR(50) NOT NULL,
    Age INT NOT NULL,
    Sex CHAR(1) NOT NULL,
    BIBNumber INT NOT NULL,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Town VARCHAR(50) NOT NULL,
    State CHAR(2) NOT NULL
);


USE `pgarci40`;
-- INN
-- Create relational tables corresponding to the INN dataset (schema and data provided on Canvas)
DROP TABLE IF EXISTS Reservations;
DROP TABLE IF EXISTS Rooms;

CREATE TABLE Rooms(
    RoomId CHAR(3) PRIMARY KEY,
    RoomName VARCHAR(50) NOT NULL,
    Beds INT NOT NULL,
    BedType VARCHAR(50) NOT NULL,
    MaxOccupancy INT NOT NULL,
    BasePrice DOUBLE NOT NULL,
    Decor VARCHAR(100) NOT NULL,
    UNIQUE(RoomName)
);

CREATE TABLE Reservations(
    Code INT PRIMARY KEY,
    Room CHAR(3) NOT NULL,
    CheckIn DATE NOT NULL,
    CheckOut DATE NOT NULL, 
    Rate DOUBLE NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    FirstName VARCHAR(50) NOT NULL,
    Adults INT NOT NULL,
    Kids INT NOT NULL,
    FOREIGN KEY (Room) REFERENCES Rooms(RoomId)
);


