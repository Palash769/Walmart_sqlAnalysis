WITH Product_Profit AS (
    SELECT
        Branch,
        `Product line` AS Product_Line,
        SUM(`gross margin percentage` - cogs) AS Total_Profit
    FROM
        walmart
    GROUP BY
        Branch, Product_Line
),
Max_Profit AS (
    SELECT
        Branch,
        MAX(Total_Profit) AS Max_Total_Profit
    FROM
        Product_Profit
    GROUP BY
        Branch
)
SELECT
    pp.Branch,
    pp.Product_Line,
    pp.Total_Profit
FROM
    Product_Profit AS pp
JOIN
    Max_Profit AS mp ON pp.Branch = mp.Branch AND pp.Total_Profit = mp.Max_Total_Profit
ORDER BY
    pp.Branch;
    