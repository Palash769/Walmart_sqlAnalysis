SELECT 
    t1.`Customer ID`,
    t1.`Date` AS FirstPurchaseDate,
    t2.`Date` AS RepeatPurchaseDate,
    DATEDIFF(STR_TO_DATE(t2.Date, '%d-%m-%Y'), STR_TO_DATE(t1.Date, '%d-%m-%Y')) AS DaysBetween
FROM 
    walmart t1
JOIN 
    walmart t2 ON t1.`Customer ID` = t2.`Customer ID`
                     AND t1.`Invoice ID` != t2.`Invoice ID`
                     AND DATEDIFF(STR_TO_DATE(t2.Date, '%d-%m-%Y'), STR_TO_DATE(t1.Date, '%d-%m-%Y')) BETWEEN 1 AND 30
ORDER BY 
    t1.`Customer ID`, DaysBetween;
    