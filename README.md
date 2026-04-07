# 🏀 NBA Spatial Efficiency & Predictive Modeling
![Python](https://img.shields.io/badge/Python-3.14-blue.svg) ![R](https://img.shields.io/badge/R-4.x-blue.svg) ![ML](https://img.shields.io/badge/ML-Logistic%20Regression-orange.svg)

An end-to-end data science pipeline analyzing **Stephen Curry's** shot selection and offensive value-add during the 2023-24 NBA Season.

---

## 📈 Final Visualization
![Stephen Curry Shot Analysis](Curry_Portfolio_Final.jpg)
*Visualizing "Market Alpha": Red zones indicate areas where performance exceeds the league average.*

---

## 🚀 Project Overview
As an **Economics & Statistics** double major, I built this project to explore the "Efficiency Frontier" of modern basketball. This pipeline handles everything from raw API extraction to predictive modeling.

### 🛠️ Technical Stack
* **Data Engineering (Python):** Utilized `nba_api` to build an ETL pipeline for shot-log data and league benchmarks.
* **Statistical Analysis (R):** Benchmarked individual field goal percentages against league averages using `tidyverse` and `hexbin`.
* **Predictive Modeling (Python):** Developed a Logistic Regression model to predict shot success based on spatial coordinates.

## 📊 Key Results
* **Predictive Power:** The Logistic Regression model achieved a **60.90% accuracy** rate, significantly outperforming a baseline coin-flip model.
* **Economic Alpha:** Identified significant outperformance in the "rim-and-arc" bimodal distribution, consistent with modern basketball economic theory.

## 📂 Repository Structure
* `/data`: Contains raw and processed CSV shot logs.
* `/scripts`: Includes `get_shots.py` (ETL/ML) and `analyze_shots.R` (Visualization).
* `Curry_Portfolio_Final.jpg`: The final production-ready graphic.

---
*Created by Jeremy Brown — University of the West Indies*
