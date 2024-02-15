SELECT DISTINCT a.First_Name, a.Last_Name
FROM Authors a
JOIN Books b ON a.Author_ID = b.Author_ID
JOIN Subjects s ON b.Subject_ID = s.Subject_ID
WHERE s.Subject IN ('Children/YA', 'Fiction')
GROUP BY a.Author_ID, a.First_Name, a.Last_Name
HAVING COUNT(DISTINCT CASE WHEN s.Subject = 'Children/YA' THEN b.Book_ID END) >= 1
AND COUNT(DISTINCT CASE WHEN s.Subject = 'Fiction' THEN b.Book_ID END) >= 1
ORDER BY a.First_Name ASC, a.Last_Name ASC;
