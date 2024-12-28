WITH Monthly_Sales AS (
    SELECT
        Branch,
        DATE_FORMAT(STR_TO_DATE(Date, '%d-%m-%Y'), '%Y-%m') AS Month,
        SUM(Total) AS Total_Sales
    FROM
        walmart
    GROUP BY
        Branch, Month
),
Sales_Growth AS (
    SELECT
        Branch,
        Month,
        Total_Sales,
        LAG(Total_Sales) OVER (PARTITION BY Branch ORDER BY Month) AS Prev_Month_Sales,
        (Total_Sales - LAG(Total_Sales) OVER (PARTITION BY Branch ORDER BY Month)) / 
        LAG(Total_Sales) OVER (PARTITION BY Branch ORDER BY Month) * 100 AS Growth_Rate
    FROM
        Monthly_Sales
)
SELECT
    Branch,
    AVG(Growth_Rate) AS Avg_Growth_Rate
FROM
    Sales_Growth
WHERE
    Growth_Rate IS NOT NULL
GROUP BY
    Branch
ORDER BY
    Avg_Growth_Rate DESC
LIMIT 1;