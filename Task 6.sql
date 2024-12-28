SELECT 
    YEAR(STR_TO_DATE(Date, '%d-%m-%Y')) AS Year,
    MONTH(STR_TO_DATE(Date, '%d-%m-%Y')) AS Month,
    `Gender`,
    SUM(`Total`) AS MonthlyTotalSales
FROM 
    walmart
GROUP BY 
    Year, Month, `Gender`
ORDER BY 
    Year, Month, `Gender`;
    