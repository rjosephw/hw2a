SELECT s.SID, s.Name
FROM Students s
INNER JOIN Members m ON s.SID = m.SID
INNER JOIN Projects p ON m.PID = p.PID
INNER JOIN Members mp ON p.PID = mp.PID -- Join again for project partners
INNER JOIN Enrollments e ON mp.SID = e.SID
INNER JOIN Courses c ON e.CID = c.CID
WHERE c.C_Name IN ('EECS482', 'EECS483', 'EECS484', 'EECS485', 'EECS280')
AND m.SID <> mp.SID -- Exclude self-partnership
GROUP BY s.SID, s.Name
HAVING COUNT(DISTINCT mp.SID) >= 1 -- At least one partner in specified courses
ORDER BY s.Name DESC;
