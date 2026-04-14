-- =====================================
-- SQL Learning Platform Project
-- Sheet 6: Basic SQL Queries
-- Topics: Filtering, Aggregation, Subqueries
-- =====================================


-- 1a: Show all users except beginners (Level = 1), sorted by level descending
SELECT Name, Level
FROM Users
WHERE Level > 1
ORDER BY Level DESC;


-- 1b: Show each user with the number of courses they are enrolled in
SELECT u.Name, COUNT(e.CourseID) AS CourseCount
FROM Users u
LEFT JOIN Enrollment e ON u.UserID = e.UserID
GROUP BY u.Name;


-- 1c: Same as above, but exclude beginners
SELECT u.Name, COUNT(e.CourseID) AS CourseCount
FROM Users u
LEFT JOIN Enrollment e ON u.UserID = e.UserID
WHERE u.Level > 1
GROUP BY u.Name;


-- 1d: Show only users who are enrolled in at least 3 courses
SELECT u.Name, COUNT(e.CourseID) AS CourseCount
FROM Users u
JOIN Enrollment e ON u.UserID = e.UserID
GROUP BY u.Name
HAVING COUNT(e.CourseID) >= 3;


-- 1e: Show users born before 1990 or with level greater than 10
SELECT Name
FROM Users
WHERE Birthdate < '1990-01-01'
   OR Level > 10;


-- 1f: Show the user with the median birthdate
SELECT u1.Name
FROM Users u1
WHERE (
    SELECT COUNT(*) 
    FROM Users u2 
    WHERE u2.Birthdate < u1.Birthdate
) =
(
    SELECT COUNT(*) 
    FROM Users u3 
    WHERE u3.Birthdate > u1.Birthdate
);


-- 2a: Show users with the earliest birthdate (using ALL)
SELECT Name
FROM Users
WHERE Birthdate <= ALL (SELECT Birthdate FROM Users);


-- 2b: Show users with the earliest birthdate (using MIN)
SELECT Name
FROM Users
WHERE Birthdate = (SELECT MIN(Birthdate) FROM Users);