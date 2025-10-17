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
