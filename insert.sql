-- =====================================
-- SQL Learning Platform Project
-- Sample Data (INSERT statements)
-- =====================================

-- Users
INSERT INTO Users VALUES (1, 'Alice', '1995-03-15', 3);
INSERT INTO Users VALUES (2, 'Bob', '1988-07-22', 5);
INSERT INTO Users VALUES (3, 'Charlie', '2000-01-10', 1);
INSERT INTO Users VALUES (4, 'David', '1992-11-05', 8);
INSERT INTO Users VALUES (5, 'Emma', '1985-06-30', 12);
INSERT INTO Users VALUES (6, 'Smith', '1998-09-12', 4);

-- Courses
INSERT INTO Course VALUES (101, 'AI Basics', 49.99);
INSERT INTO Course VALUES (102, 'Advanced AI', 79.99);
INSERT INTO Course VALUES (103, 'SQL Fundamentals', 39.99);
INSERT INTO Course VALUES (104, 'Web Development', 59.99);
INSERT INTO Course VALUES (105, 'Data Science', 89.99);

-- Instructors
INSERT INTO Instructor VALUES (201, 'Dr. Müller', 'Room A');
INSERT INTO Instructor VALUES (202, 'Prof. Schmidt', 'Room B');
INSERT INTO Instructor VALUES (203, 'Dr. Weber', 'Room A');
INSERT INTO Instructor VALUES (204, 'Dr. Fischer', 'Room C');

-- Enrollment
INSERT INTO Enrollment VALUES (1, 101);
INSERT INTO Enrollment VALUES (1, 103);
INSERT INTO Enrollment VALUES (1, 104);

INSERT INTO Enrollment VALUES (2, 101);
INSERT INTO Enrollment VALUES (2, 102);
INSERT INTO Enrollment VALUES (2, 105);

INSERT INTO Enrollment VALUES (3, 103);

INSERT INTO Enrollment VALUES (4, 101);
INSERT INTO Enrollment VALUES (4, 102);
INSERT INTO Enrollment VALUES (4, 103);
INSERT INTO Enrollment VALUES (4, 104);

INSERT INTO Enrollment VALUES (5, 105);
INSERT INTO Enrollment VALUES (5, 102);
INSERT INTO Enrollment VALUES (5, 101);

INSERT INTO Enrollment VALUES (6, 103);
INSERT INTO Enrollment VALUES (6, 104);

-- Teaches
INSERT INTO Teaches VALUES (201, 101);
INSERT INTO Teaches VALUES (201, 102);

INSERT INTO Teaches VALUES (202, 103);
INSERT INTO Teaches VALUES (202, 104);

INSERT INTO Teaches VALUES (203, 105);

INSERT INTO Teaches VALUES (204, 104);

-- Reviews
INSERT INTO Review VALUES (201, 101, 1, 2.0);
INSERT INTO Review VALUES (201, 102, 2, 1.5);
INSERT INTO Review VALUES (202, 103, 3, 3.5);
INSERT INTO Review VALUES (202, 104, 4, 2.5);
INSERT INTO Review VALUES (203, 105, 5, 1.0);
INSERT INTO Review VALUES (202, 103, 6, 2.0);