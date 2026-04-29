# Modeling Nurse Staffing and Cost Analysis During COVID-19

This project models **nurse shortages and staffing strategies** during COVID-19 using real-world Alberta data. It evaluates how **redeployment and overtime policies impact hospital costs and workforce capacity** under different epidemic conditions.

The objective is to estimate:
- Nurse infection risk
- Staffing shortages
- Cost implications under different pandemic conditions

---

## 📌 Project Overview

During COVID-19 waves, hospitals experienced:
- Rapid increases in hospitalizations
- Nurse shortages due to infection
- Increased operational costs

This project integrates:
- **Real-world hospitalization data**
- **Serological infection data**
- **Mathematical modeling**
- **Cost analysis**

to evaluate staffing strategies under pandemic pressure.

---

## 📊 Data Sources

This project uses **two real-world datasets**, each serving a different purpose:

### 1. Hospitalization Data (Demand Side)

Source:
- [Esri Canada COVID-19 Resources Hub](https://resources-covid19canada.hub.arcgis.com/datasets/provincial-daily-totals/explore?showTable=true)

Description:
- Provides daily net new COVID-19 cases and hospitalization data by province
- Covers April 2020 – April 2022

Usage in Project:
- Extracted **Alberta hospitalization data**
- Visualized pandemic waves
- Selected two key periods:
  - **Alpha wave:** Aug 12 – Dec 30, 2020 (~20 weeks)
  - **Omicron wave:** Dec 28, 2021 – Feb 2, 2022 (~7 weeks)

Purpose:
- Capture **peak healthcare demand**
- Compare:
  - Gradual increase (Alpha)
  - Rapid surge (Omicron)
- Estimate **maximum nurse requirements**

---

### 2. Serology Data (Infection Risk)

Source:
- [COVID-19 Immunity Task Force](https://www.covid19immunitytaskforce.ca/seroprevalence-in-canada/)

Description:
- Provides seroprevalence data indicating community infection levels

Usage in Project:
- Estimated **weekly community infection risk**
- Modeled probability of **nurse infection over time**

Purpose:
- Link community transmission → healthcare workforce risk

---

## ⚙️ Methodology

### 1. Data Cleaning & Preprocessing
- Cleaned and structured hospitalization and serology datasets
- Filtered Alberta-specific data
- Aggregated weekly trends
- Identified key pandemic periods (Alpha & Omicron)

### 2. Wave Selection & Analysis
- Visualized hospitalization curves
- Selected periods capturing **rising phases to peak demand**
- Compared:
  - Long gradual wave (Alpha)
  - Short intense wave (Omicron)

### 3. Infection Risk Modeling
- Used serology data to estimate weekly infection probability
- Modeled expected number of infected nurses

### 4. Staffing & Cost Modeling
- Estimated staffing shortages due to infections
- Evaluated:
  - Replacement costs
  - Workforce gaps
- Compared cost impact across different waves

### 5. Sensitivity Analysis
- Tested model robustness under varying parameters
- Identified key drivers of:
  - Infection spread
  - Cost escalation
 
### 6. Power BI Dashboard
- Developed interactive dashboards for healthcare workforce analysis
- Visualized:
  - Alberta hospitalization trends
  - Alpha vs Omicron wave comparisons
  - Weekly infection risk trends
  - Staffing shortage projections
  - Cost impacts under different staffing strategies
- Added interactive filtering and data exploration features
- Improved communication of complex modeling results
- Supported:
  - Data-driven healthcare decision-making
  - Visual storytelling and reporting
  - Accessibility of analytical insights

---
## 🛠️ Tools & Technologies

- Python (Pandas, NumPy, Matplotlib)
- MATLAB (modeling & simulations)
- Jupyter Notebook
- Power BI (Visulaization)
- Real-world epidemiological datasets

---

## 👩‍💻 My Contributions

My main contributions focused on **data, modeling, and analysis**:

### 🔹 Data Cleaning & Preparation
- Processed real-world hospitalization and serology datasets
- Extracted and structured Alberta-specific data
- Identified and justified key analysis periods (Alpha & Omicron waves)

### 🔹 Data-Driven Wave Selection
- Analyzed hospitalization trends to determine meaningful time windows
- Compared different wave dynamics (gradual vs rapid surge)

### 🔹 Mathematical Modeling
- Contributed to infection risk modeling using serology data
- Helped translate real-world data into model parameters

### 🔹 Cost Analysis
- Developed and implemented cost evaluation framework
- Analyzed financial impact of nurse shortages and replacement strategies

### 🔹 Power BI Dashboard Development
- Added interactive Power BI visualizations
- Built dashboards to present staffing, infection, and cost trends
- Improved accessibility and communication of analytical insights

### 🔹 Team Support
- Assisted teammates across modeling, debugging, and analysis tasks

---

## 📈 Key Insights

- Rapid infection waves (Omicron) create **more severe short-term staffing pressure**
- Community infection risk strongly influences **healthcare workforce availability**
- Small increases in infection probability can significantly increase costs
- Wave duration and shape critically affect staffing strategies
- When community infection risk is low, **full redeployment (100%) is the most cost-effective strategy**, as fewer nurses are infected and staffing gaps are manageable. However, this approach may require additional **training costs** for redeployed staff.
- In contrast, during periods of higher infection risk, a **hybrid strategy (50% redeployment + 50% overtime)** performs better. This approach reduces the need for extensive training while maintaining workforce flexibility and minimizing overall disruption.
---

## 👥 Team
 
- Saung Hnin Phyu
- Samara Pires  
- Anna Tam Ly
- Yuke Hou
- Xiangwen Gao
