-- SELECT * FROM uniswap_v3_ethereum.trades LIMIT 5

WITH daily_wallet_volume AS (
    SELECT
        date_trunc('day', block_time) AS day,
        tx_from AS wallet,
        SUM(amount_usd) AS daily_volume
    FROM uniswap_v3_ethereum.trades
    WHERE block_time >= TIMESTAMP '2026-03-01' - INTERVAL '210' DAY
      AND amount_usd IS NOT NULL
    GROUP BY 1, 2
),

rolling_volume AS (
    SELECT
        day,
        wallet,
        daily_volume,
        SUM(daily_volume) OVER (
            PARTITION BY wallet
            ORDER BY day
            ROWS BETWEEN 29 PRECEDING AND CURRENT ROW
        ) AS rolling_30d_volume
    FROM daily_wallet_volume
)

SELECT *
FROM rolling_volume
WHERE day >= TIMESTAMP '2026-03-01' - INTERVAL '180' DAY
ORDER BY day;
