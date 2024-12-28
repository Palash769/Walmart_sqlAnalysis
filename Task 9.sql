SELECT 
`Customer ID`,
SUM(`Total`) AS TotalRevenue
FROM
walmart
GROUP BY
`Customer ID`
ORDER BY
TotalRevenue DESC
LIMIT 5;
