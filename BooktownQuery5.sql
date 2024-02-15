SELECT a.Author_ID, a.First_Name, a.Last_Name
FROM Authors a
JOIN Books b ON a.Author_ID = b.Author_ID
JOIN Subjects s ON b.Subject_ID = s.Subject_ID
WHERE a.First_Name = 'J. K.' AND a.Last_Name = 'Rowling'
   OR EXISTS (
      SELECT DISTINCT s2.Subject_ID
      FROM Books b2
      JOIN Subjects s2 ON b2.Subject_ID = s2.Subject_ID
      WHERE a.Author_ID = b2.Author_ID
      GROUP BY s2.Subject_ID
      HAVING COUNT(DISTINCT b2.Book_ID) >= 1
         AND COUNT(DISTINCT s2.Subject_ID) = (
            SELECT COUNT(DISTINCT s3.Subject_ID)
            FROM Books b3
            JOIN Subjects s3 ON b3.Subject_ID = s3.Subject_ID
            JOIN Authors a3 ON b3.Author_ID = a3.Author_ID
            WHERE a3.First_Name = 'J. K.' AND a3.Last_Name = 'Rowling'
         )
   )
GROUP BY a.Author_ID, a.First_Name, a.Last_Name
ORDER BY a.Last_Name ASC, a.Author_ID DESC
