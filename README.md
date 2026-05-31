# Rainfall Forecasting Using MATLAB (SARIMA)

## Overview

This project focuses on forecasting monthly rainfall in Hyderabad using the Seasonal AutoRegressive Integrated Moving Average (SARIMA) model. Historical rainfall data from 2015 to 2025 was analyzed to identify seasonal trends and rainfall patterns. The trained model was then used to predict rainfall for the years 2026 and 2027.

The project also compares SARIMA forecasts with Exponential Smoothing and Moving Average techniques to evaluate forecasting performance and reliability.

---

## Objectives

- Analyze Hyderabad's monthly rainfall data from 2015–2025.
- Identify seasonal rainfall trends and patterns.
- Develop a SARIMA-based forecasting model in MATLAB.
- Compare SARIMA with Exponential Smoothing and Moving Average methods.
- Forecast monthly rainfall for 2026 and 2027.
- Visualize and export prediction results.

---

## Dataset

**Location:** Hyderabad, India

**Period Covered:** 2015–2025

**Frequency:** Monthly Rainfall Data

**Forecast Horizon:** 2026–2027

---

## Methodology

### 1. Data Preprocessing
- Imported and cleaned rainfall data.
- Converted data into a time-series format.
- Prepared dataset for forecasting analysis.

### 2. Seasonal Trend Analysis
- Examined annual and monthly rainfall patterns.
- Identified recurring seasonal components.

### 3. Forecasting Models

#### SARIMA Model
Model Used:

SARIMA(1,1,1)(1,0,1)₁₂

The SARIMA model was selected to capture both trend and seasonal characteristics present in Hyderabad rainfall data.

#### Comparative Models
- Exponential Smoothing (α = 0.3)
- 7-Month Moving Average

### 4. Forecast Generation
Generated monthly rainfall predictions for:
- 2026
- 2027

### 5. Visualization & Reporting
- Automated rainfall forecast plots.
- Exported monthly predictions to Excel reports.
- Generated comparison graphs between actual and predicted values.

---

## Results

| Metric | Value |
|----------|----------|
| Model | SARIMA(1,1,1)(1,0,1)₁₂ |
| Training Data | 2015–2025 |
| Forecast Period | 2026–2027 |
| R² Score | 0.54 |
| Residual Standard Deviation | ±21 mm |

### Key Findings

- Successfully captured seasonal rainfall patterns in Hyderabad.
- SARIMA outperformed basic smoothing techniques in preserving seasonal behavior.
- Generated reliable long-term rainfall forecasts for 2026 and 2027.
- Automated forecast generation and reporting workflow using MATLAB.

---

## Technologies Used

- MATLAB
- Time Series Analysis
- SARIMA Modeling
- Exponential Smoothing
- Moving Average Forecasting
- Data Visualization

---



## How to Run

1. Open MATLAB.
2. Load the Hyderabad rainfall dataset.
3. Execute the SARIMA forecasting script.

```matlab
run('rainfall_forecasting_sarima.m')
```

4. View generated plots and forecast reports.

---

## Applications

- Rainfall forecasting
- Agricultural planning
- Water resource management
- Climate trend analysis
- Environmental monitoring

---

## Future Improvements

- Integrate temperature and humidity data.
- Develop hybrid SARIMA-LSTM forecasting models.
- Implement automated real-time weather data updates.
- Build an interactive forecasting dashboard.

---

## Resume Highlights

- Developed a SARIMA(1,1,1)(1,0,1)₁₂ time-series model in MATLAB using 10+ years of Hyderabad rainfall data to forecast monthly rainfall for 2026–2027.
- Compared SARIMA, Exponential Smoothing (α = 0.3), and 7-Month Moving Average techniques for seasonal rainfall prediction.
- Achieved an R² score of 0.54 with a residual standard deviation of approximately ±21 mm.
- Automated forecast visualization and Excel report generation using MATLAB.

---

## Author

**Sai Teja**

B.Tech in Electronics and Communication Engineering (ECE)
