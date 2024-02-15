SELECT e.ISBN, b.Title, e.Publication_Date, a.Author_ID, a.First_Name, a.Last_Name
FROM Editions e
JOIN Books b ON e.Book_ID = b.Book_ID
JOIN Authors a ON b.Author_ID = a.Author_ID
WHERE EXISTS (
    SELECT 1
    FROM Editions e2
    JOIN Books b2 ON e2.Book_ID = b2.Book_ID
    WHERE a.Author_ID = b2.Author_ID
    AND e2.Publication_Date BETWEEN '2003-01-01' AND '2008-12-31'
)
ORDER BY a.Author_ID ASC, b.Title ASC, e.Publication_Date DESC;
