-- SELECT * FROM uniswap_v3_ethereum.trades LIMIT 5

WITH swaps AS (
    SELECT
        date_trunc('day', block_time) AS day,
        tx_hash,
        tx_from AS trader,
        amount_usd
    FROM uniswap_v3_ethereum.trades
    WHERE block_time >= TIMESTAMP '2026-03-01' - INTERVAL '180' DAY
      AND amount_usd IS NOT NULL
)

SELECT
    day,
    COUNT(*) AS swaps,
    COUNT(DISTINCT trader) AS unique_traders,
    SUM(amount_usd) AS total_volume_usd,
    SUM(amount_usd) / COUNT(*) AS avg_trade_size_usd
FROM swaps
GROUP BY 1
ORDER BY