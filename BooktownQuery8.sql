SELECT DISTINCT p.Publisher_ID, p.Name
FROM Publishers p
JOIN Editions e ON p.Publisher_ID = e.Publisher_ID
JOIN Books b ON e.Book_ID = b.Book_ID
JOIN (
    SELECT Author_ID
    FROM Books
    GROUP BY Author_ID
    HAVING COUNT(*) = 3
) authors_with_three_books ON b.Author_ID = authors_with_three_books.Author_ID
ORDER BY p.Publisher_ID DESC;
