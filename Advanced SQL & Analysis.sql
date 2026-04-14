-- =====================================
-- SQL Learning Platform Project
-- Sheet 8: Advanced SQL & Analysis
-- Topics: Self-Joins, Aggregation, Views, Query Equivalence
-- =====================================


-- 1a: For each user, show how many users are older
SELECT u1.Name,
       COUNT(u2.UserID) AS OlderUsers
FROM Users u1
LEFT JOIN Users u2
  ON u2.Birthdate < u1.Birthdate
GROUP BY u1.Name;


-- 1b: User with the best (lowest) average rating
SELECT u.Name
FROM Users u
JOIN Review r ON u.UserID = r.UserID
GROUP BY u.UserID, u.Name
ORDER BY AVG(r.Rating) ASC
LIMIT 1;


-- 1c: Best user per level (lowest average rating per level)
SELECT u.Level, u.Name
FROM Users u
JOIN Review r ON u.UserID = r.UserID
GROUP BY u.Level, u.UserID, u.Name
HAVING AVG(r.Rating) = (
    SELECT MIN(avg_rating)
    FROM (
        SELECT AVG(r2.Rating) AS avg_rating
        FROM Users u2
        JOIN Review r2 ON u2.UserID = r2.UserID
        WHERE u2.Level = u.Level
        GROUP BY u2.UserID
    ) sub
);


-- 2: Create a view showing total number of courses per user
CREATE VIEW UserCourseCount AS
SELECT u.Name, COUNT(e.CourseID) AS TotalCourses
FROM Users u
LEFT JOIN Enrollment e ON u.UserID = e.UserID
GROUP BY u.Name;


-- Note:
-- This view is NOT updatable because it contains aggregation (COUNT + GROUP BY)


-- 3: Query equivalence analysis (conceptual, not executable)
-- Q1 may return multiple rows
-- Q2 and Q3 both return the maximum value
-- Therefore:
-- Q2 ≡ Q3
-- Q1 is NOT equivalent