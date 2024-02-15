SELECT e.ISBN
FROM Editions e
JOIN Books b ON e.Book_ID = b.Book_ID
JOIN Authors a ON b.Author_ID = a.Author_ID
WHERE a.Last_Name = 'Christie' AND a.First_Name = 'Agatha'
ORDER BY e.ISBN DESC;

