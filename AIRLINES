-- Priscilla Garcia pgarci40@calpoly.edu --
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
