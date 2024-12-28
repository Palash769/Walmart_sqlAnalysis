SELECT 
    `Customer type`,
    `Product line`,
    SUM(`Total`) AS TotalSales
FROM 
    walmart
GROUP BY 
    `Customer type`, `Product line`
ORDER BY 
    `Customer type`, TotalSales DESC;
    