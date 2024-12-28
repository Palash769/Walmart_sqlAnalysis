SELECT 
    DAYNAME(STR_TO_DATE(`Date`, '%d-%m-%Y')) AS DayOfWeek,
    SUM(`Total`) AS TotalSales
FROM 
    walmart
GROUP BY 
    DayOfWeek
ORDER BY 
    TotalSales DESC;
    