# 📊 uniswap-volatility-capital-concentration-analytics
On-chain regime analysis of Uniswap V3 showing statistically significant increases in whale capital concentration during high-volatility periods.

## 📌 Executive Summary

This project investigates whether market volatility alters capital concentration on Uniswap V3.

Using on-chain swap data and ETH daily price data, I test whether whale wallets increase their dominance of trading volume during high-volatility periods.

Key finding:
Whale wallets consistently dominate Uniswap V3 volume (~95–97%), and their share increases statistically significantly during high-volatility regimes (p = 0.048).

This suggests that market stress amplifies capital asymmetry rather than redistributing trading power.

## 🎯 Research Question

Does market volatility change the distribution of trading capital on Uniswap V3?

More specifically:

Do whale wallets capture a larger share of total trading volume during high-volatility days?

## 🧠 Hypotheses

H1: High volatility increases overall trading activity (swap count).

H2: Whale volume share increases during high-volatility periods.

H3: Capital concentration is structurally high regardless of regime.

## 🗂 Data Sources

- Uniswap V3 Ethereum swap data (Dune Analytics curated tables)
- ETH daily price data (aggregated from `prices.day` table)
- Time window: September 2025 – March 2026 (fixed historical window)

All analysis conducted on Ethereum mainnet.

## ⚙️ Methodology

### 1. Daily Protocol Metrics
- Swap count
- Unique traders
- Total USD volume
- Average trade size

### 2. Volatility Definition
- Daily ETH return computed from aggregated daily price
- Absolute daily return used as volatility proxy
- High-volatility days defined as top 20% of absolute daily returns

### 3. Wallet Segmentation
Wallets segmented using rolling 30-day trading volume:

- Retail: < $10,000
- Mid: $10,000 – $100,000
- Whale: > $100,000

Whale volume share computed as:

WhaleShare_t = WhaleVolume_t / TotalVolume_t

## 📊 Results
### 🐳 1. Structural Whale Dominance

Across the full sample period:

- Whale wallets account for ~95–97% of daily Uniswap V3 trading volume.
- Capital concentration remains consistently high.
- Retail activity contributes minimally to aggregate capital flow.

This suggests liquidity provision and capital control are structurally concentrated among high-capital participants.

### 📈 v2. Volatility Regime Classification

ETH daily volatility was classified using the 80th percentile of absolute daily returns.

This produced clear high-volatility regimes corresponding to market stress periods.

### 📊 3. Statistical Test: Whale Share vs Volatility

A two-sample Welch t-test comparing whale volume share between high- and low-volatility days yielded:

- t-statistic = 2.02
- p-value = 0.048

At the 5% significance level, we reject the null hypothesis of equal means.

Whale volume share is statistically higher during high-volatility periods.

## 🧠 Interpretation

Market volatility increases capital concentration rather than redistributing it.

While trading activity rises during volatile periods, the relative share of capital controlled by whales increases.

This implies:

- Large-capital traders rebalance more aggressively during stress.
- Retail participation may increase in transaction count but not in capital weight.
- DeFi markets exhibit capital asymmetry amplification during turbulence.

## 🔍 Key Visualizations

1. Daily swap activity (with 7-day moving average)
2. ETH absolute daily return (volatility regime classification)
3. Whale volume share over time (smoothed)
4. Whale share during high-volatility regimes

All plots generated using Python (matplotlib).

## 🧪 Limitations

- Whale thresholds are fixed ($100k rolling 30D volume). A percentile-based segmentation may yield additional nuance.
- ETH volatility used as a proxy for broader crypto market stress.
- Analysis limited to Uniswap V3 on Ethereum mainnet.
- Gas fees and MEV activity not explicitly modeled.

## 🛠 Technical Stack

- SQL (Dune Analytics, Trino engine)
- Python (pandas, matplotlib, scipy)
- Statistical testing (Welch t-test)
- Rolling window time-series analysis




