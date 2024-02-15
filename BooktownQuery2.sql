SELECT Subject
FROM Subjects
WHERE Subject_ID NOT IN (
    SELECT DISTINCT Subject_ID
    FROM Books
)
ORDER BY Subject ASC;
