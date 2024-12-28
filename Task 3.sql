WITH Customer_Spend AS (
    SELECT
        `Customer ID`,
        SUM(Total) AS Total_Spend
    FROM
        walmart
    GROUP BY
        `Customer ID`
),
Spend_Ranks AS (
    SELECT
        `Customer ID`,
        Total_Spend,
        NTILE(3) OVER (ORDER BY Total_Spend DESC) AS Spend_Tier
    FROM
        Customer_Spend
)
SELECT
    `Customer ID`,
    Total_Spend,
    CASE
        WHEN Spend_Tier = 1 THEN 'High'
        WHEN Spend_Tier = 2 THEN 'Medium'
        WHEN Spend_Tier = 3 THEN 'Low'
    END AS Spending_Category
FROM
    Spend_Ranks
ORDER BY
    Total_Spend DESC;
    