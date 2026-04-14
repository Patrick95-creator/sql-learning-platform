-- =====================================
-- SQL Learning Platform Project
-- Schema Definition
-- =====================================

-- Drop tables (optional, for re-running the script safely)
DROP TABLE IF EXISTS Review;
DROP TABLE IF EXISTS Teaches;
DROP TABLE IF EXISTS Enrollment;
DROP TABLE IF EXISTS Users;
DROP TABLE IF EXISTS Course;
DROP TABLE IF EXISTS Instructor;


-- Users table
CREATE TABLE Users (
    UserID INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Birthdate DATE NOT NULL,
    Level INT NOT NULL
);


-- Course table
CREATE TABLE Course (
    CourseID INT PRIMARY KEY,
    Title VARCHAR(200) NOT NULL,
    Price DECIMAL(10,2)
);


-- Instructor table
CREATE TABLE Instructor (
    InstructorID INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Office VARCHAR(50)
);


-- Enrollment (many-to-many between Users and Course)
CREATE TABLE Enrollment (
    UserID INT,
    CourseID INT,
    PRIMARY KEY (UserID, CourseID),
    FOREIGN KEY (UserID) REFERENCES Users(UserID),
    FOREIGN KEY (CourseID) REFERENCES Course(CourseID)
);


-- Teaches (Instructor teaches Course)
CREATE TABLE Teaches (
    InstructorID INT,
    CourseID INT,
    PRIMARY KEY (InstructorID, CourseID),
    FOREIGN KEY (InstructorID) REFERENCES Instructor(InstructorID),
    FOREIGN KEY (CourseID) REFERENCES Course(CourseID)
);


-- Review (User reviews a course / instructor)
CREATE TABLE Review (
    InstructorID INT,
    CourseID INT,
    UserID INT,
    Rating DECIMAL(2,1), -- e.g. 1.0 to 5.0
    PRIMARY KEY (InstructorID, CourseID, UserID),
    FOREIGN KEY (InstructorID) REFERENCES Instructor(InstructorID),
    FOREIGN KEY (CourseID) REFERENCES Course(CourseID),
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);