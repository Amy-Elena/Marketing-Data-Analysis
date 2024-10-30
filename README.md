# Marketing Data Project

## Project Overview
This project analyzes a marketing dataset to derive insights into campaign performance, engagement, and conversion trends across different channels, cities, and devices. The analysis employs SQL for data cleaning and extraction, while Power BI is used for visualizations to present findings.

## Data Description
The dataset comprises 9,900 rows and 18 columns, covering marketing performance from March 1, 2023, to November 30, 2023. Key variables include:
- **Campaign**: The marketing campaign under analysis.
- **Date**: The date of the data entry.
- **City_Location**: The city where the campaign was run.
- **Impressions**: The number of times the ad was displayed.
- **Clicks**: The number of times users clicked on the ad.
- **Conversions**: The number of successful conversions (e.g., purchases).
- **Daily_Average_CPC**: The average cost-per-click for the campaign.
- **Total_conversion_value_GBP**: The total revenue generated from conversions.
- **Device**: The device used by customers (Desktop or Mobile).

## Key Insights
- **Overall Campaign Performance**:
  - The **Fall Campaign** generated the highest total impressions (6,434,259), clicks (85,120), and conversions (14,886).
  - **Pinterest** demonstrated the highest **ROI** (2150.68), significantly outperforming other channels such as **Instagram** (980.15) and **Facebook** (475.85).

- **Geographical Performance**:
  - **Birmingham** achieved the highest conversion rate (32.22%), followed by **Manchester** (28.73%) and **London** (23.06%).

- **Device Effectiveness**:
  - **Desktop users** exhibited a higher conversion rate (36.74%) compared to **mobile users** (21.41%).

- **Ad-Level Analysis**:
  - The **Discount Ad** received the most impressions (6,719,121.70) and conversions (21,183), demonstrating effective engagement.
  - The **Collection Ad** had a total of 7,926,327.10 impressions and 19,069 conversions, indicating strong performance, but less effective than the Discount Ad.

- **Monthly Trends**:
  - **November** exhibited the highest engagement with 2,117,531 impressions and 5,331 conversions, suggesting a successful marketing push during this period.

## Methodology
1. **Data Cleaning**:
   - Imported the dataset into MySQL and renamed columns for consistency.
   - Handled missing values and converted data types where necessary (e.g., Date column).

2. **Data Analysis**:
   - Conducted exploratory data analysis (EDA) using SQL queries to derive summary statistics, conversion rates, and engagement metrics.

3. **Visualization**:
   - Developed visualizations in Power BI to present the findings effectively, including:
     - Conversion Rate by City (Map with Data Labels)
     - Spend vs. Conversion Value by Campaign (Scatter Plot)
     - Trends in Impressions, Clicks, and Conversions Over Time (Line Chart)

## Visualizations and Findings
- **Conversion Rate by City**: Highlights cities with the best conversion rates.
- **Spend vs. Conversion Value by Campaign**: Illustrates spending efficiency across campaigns.
- **Trends Over Time**: Analyzes how impressions, clicks, and conversions evolved over the project duration.

## Recommendations
- Optimize marketing strategies based on channel performance, focusing on high-ROI channels like Pinterest.
- Tailor campaigns to specific cities based on their conversion rates to improve overall performance.
- Continue monitoring trends to adapt strategies to changing consumer behavior.

## Conclusion
This project provided valuable insights into the effectiveness of marketing campaigns, helping to inform future strategies. The use of SQL for data manipulation and Power BI for visualization proved to be effective in deriving actionable insights.

