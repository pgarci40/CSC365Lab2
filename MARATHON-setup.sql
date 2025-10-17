-- Priscilla Garcia pgarci40@calpoly.edu --
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
