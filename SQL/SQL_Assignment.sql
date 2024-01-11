SELECT isbn   -- Question 1
FROM Borrowed
WHERE dueDate < '2023-10-08';

SELECT Book.isbn -- Question 2 
FROM Book
JOIN Author ON Book.authorID = Author.authorID
WHERE Author.name = 'Yuval Noah' AND Author.surname = 'Harari';

SELECT Borrowed.studentID -- Question 3
FROM Borrowed
JOIN Book ON Borrowed.isbn = Book.isbn
WHERE Book.title = '1984';

SELECT DISTINCT studentID  --Question 4 
FROM Borrowed
JOIN Book ON Borrowed.isbn = Book.isbn
WHERE subject = 'Database'
AND studentID IN (
    SELECT studentID
    FROM Borrowed
    JOIN Book ON Borrowed.isbn = Book.isbn
    WHERE subject = 'Civilization'
);

SELECT DISTINCT Borrowed.studentID  -- Question 5 
FROM Borrowed
JOIN Book ON Borrowed.isbn = Book.isbn
JOIN Author ON Book.authorID = Author.authorID
WHERE Author.name = 'Michio';

SELECT b.isbn      -- Question 6
FROM Book b
JOIN Author a ON b.authorID = a.authorID
WHERE a.authorID = (
    SELECT authorID
    FROM Book
    WHERE title = 'Sapiens'
) AND b.title != 'Sapiens';


SELECT s.name, s.surname  -- Question 7
FROM Student s
JOIN Borrowed b ON s.studentID = b.studentID
GROUP BY s.studentID, s.name, s.surname
ORDER BY COUNT(b.isbn) DESC
LIMIT 1;

SELECT DISTINCT s.name, s.surname    -- Question 8
FROM Student s
WHERE NOT EXISTS (
    SELECT isbn
    FROM Borrowed
    WHERE studentID = (
        SELECT studentID
        FROM Student
        WHERE name = 'Emre'
    )
    EXCEPT
    SELECT isbn
    FROM Borrowed
    WHERE studentID = s.studentID
);





