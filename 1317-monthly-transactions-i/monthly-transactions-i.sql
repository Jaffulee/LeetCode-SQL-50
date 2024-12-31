SELECT
    -- CAST(DATEPART(year,t.trans_date) AS VARCHAR(4)) +
    -- CASE WHEN MONTH(t.trans_date)<10 THEN '-0' ELSE '-' END +
    -- CAST(DATEPART(month,t.trans_date) AS VARCHAR(2)) AS month
    CAST(t.trans_date AS CHAR(7)) AS month --truncates date text and sets to string as an alternative to above
    ,t.country
    ,COUNT(*) AS trans_count
    ,SUM(CASE WHEN LEFT(t.state,1)='a' THEN 1 ELSE 0 END) AS approved_count
    ,SUM(t.amount) AS trans_total_amount
    ,SUM(CASE WHEN LEFT(t.state,1)='a' THEN t.amount ELSE 0 END) AS approved_total_amount
FROM Transactions AS t
GROUP BY CAST(t.trans_date AS CHAR(7)), t.country