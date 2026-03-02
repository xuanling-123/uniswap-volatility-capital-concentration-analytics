-- SELECT * FROM prices.day LIMIT 5

WITH eth_prices AS (
    SELECT
        timestamp AS day,
        AVG(price) AS daily_price
    FROM prices.day
    WHERE symbol = 'ETH'
      AND timestamp >= DATE '2025-09-01'
    GROUP BY 1
),

returns AS (
    SELECT
        day,
        daily_price,
        daily_price / LAG(daily_price) OVER (ORDER BY day) - 1 AS daily_return
    FROM eth_prices
)

SELECT
    day,
    daily_price,
    daily_return,
    ABS(daily_return) AS abs_return,
    STDDEV(daily_return) OVER (
        ORDER BY day
        ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
    ) AS rolling_7d_vol
FROM returns
ORDER BY day;