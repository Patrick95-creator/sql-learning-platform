-- =====================================
-- SQL Learning Platform Project
-- Sheet 7: Advanced Queries
-- Topics: Subqueries, NOT EXISTS, Recursion, Updates, Deletes
-- =====================================


-- 1a: Instructors who teach ALL courses with "AI" in the title
SELECT i.Name
FROM Instructor i
WHERE NOT EXISTS (
    SELECT c.CourseID
    FROM Course c
    WHERE c.Title LIKE 'AI%'
    AND NOT EXISTS (
        SELECT *
        FROM Teaches t
        WHERE t.InstructorID = i.InstructorID
        AND t.CourseID = c.CourseID
    )
);


-- 1b: Users who have not received any rating better than 3.0
SELECT u.Name
FROM Users u
WHERE NOT EXISTS (
    SELECT *
    FROM Review r
    WHERE r.UserID = u.UserID
    AND r.Rating < 3.0
);


-- 1c: Instructors sharing the same office
SELECT DISTINCT i1.Name
FROM Instructor i1
JOIN Instructor i2
  ON i1.Office = i2.Office
 AND i1.InstructorID <> i2.InstructorID;


-- 1d: Users connected through shared courses (starting from 'Smith')
WITH RECURSIVE ConnectedUsers AS (
    SELECT u.UserID, u.Name
    FROM Users u
    WHERE u.Name = 'Smith'

    UNION

    SELECT u2.UserID, u2.Name
    FROM ConnectedUsers cu
    JOIN Enrollment e1 ON cu.UserID = e1.UserID
    JOIN Enrollment e2 ON e1.CourseID = e2.CourseID
    JOIN Users u2 ON e2.UserID = u2.UserID
)
SELECT DISTINCT Name
FROM ConnectedUsers;


-- 2a: Increase level of all users by 1
UPDATE Users
SET Level = Level + 1;


-- 2b: Delete all teaching assignments of instructor "Müller"
DELETE FROM Teaches
WHERE InstructorID IN (
    SELECT InstructorID
    FROM Instructor
    WHERE Name = 'Müller'
);