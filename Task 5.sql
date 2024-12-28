WITH Payment_Counts AS (
    SELECT
        `City`,
        `Payment`,
        COUNT(*) AS Payment_Count
    FROM
        walmart
    GROUP BY
        `City`, `Payment`
),
Max_Payment AS (
    SELECT
        `City`,
        MAX(Payment_Count) AS Max_Count
    FROM
        Payment_Counts
    GROUP BY
        City
)
SELECT
    pc.`City`,
    pc.`Payment` AS Most_Popular_Payment_Method,
    pc.Payment_Count
FROM
    Payment_Counts AS pc
JOIN
    Max_Payment AS mp ON pc.City = mp.City AND pc.Payment_Count = mp.Max_Count
ORDER BY
    pc.City;
    