SELECT DISTINCT s.SID
FROM Students s
INNER JOIN Enrollments e ON s.SID = e.SID
INNER JOIN Courses c ON e.CID = c.CID
WHERE (c.C_Name = 'EECS442' AND c.C_Name = 'EECS445' AND c.C_Name = 'EECS492')
OR (c.C_Name = 'EECS482' AND c.C_Name = 'EECS486')
OR c.C_Name = 'EECS281'
ORDER BY s.SID ASC;
