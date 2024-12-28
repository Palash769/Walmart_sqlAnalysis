WITH Product_Statistics AS (
    SELECT
        `Product line` AS Product_Line,
        AVG(Total) AS Avg_Sales,
        STDDEV(Total) AS Sales_StdDev
    FROM
	 walmart
    GROUP BY
        `Product line`
)
SELECT
    sd.`Invoice ID`,
    sd.Branch,
    sd.`Product line`,
    sd.Total AS Transaction_Sales,
    ps.Avg_Sales,
    ps.Sales_StdDev,
    CASE
        WHEN sd.Total > (ps.Avg_Sales + 2 * ps.Sales_StdDev) THEN 'High Anomaly'
        WHEN sd.Total < (ps.Avg_Sales - 2 * ps.Sales_StdDev) THEN 'Low Anomaly'
        ELSE 'Normal'
    END AS Anomaly_Type
FROM
    walmart AS sd
JOIN
    Product_Statistics AS ps ON sd.`Product line` = ps.Product_Line
WHERE
    sd.Total > (ps.Avg_Sales + 2 * ps.Sales_StdDev)
    OR sd.Total < (ps.Avg_Sales - 2 * ps.Sales_StdDev)
ORDER BY
    sd.`Product line`, sd.Total DESC;