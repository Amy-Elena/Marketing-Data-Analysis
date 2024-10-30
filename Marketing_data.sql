# Select Database
USE marketing;

# Data Cleaning and Exploration

# Check Structure of Data
DESCRIBE marketing_data;

# Preview Data
SELECT * FROM marketing_data;

# Count Total Rows
SELECT COUNT(*) AS total_rows FROM marketing_data;

# 9900 rows

# Number of Columns
SELECT COUNT(*) AS total_columns
FROM INFORMATION_SCHEMA.COLUMNS
WHERE table_name = 'marketing_data';

# 18 columns

/*
# Proper Naming Convention for Columns
ALTER TABLE marketing_data
CHANGE `Campaign` campaign TEXT;
ALTER TABLE marketing_data
CHANGE `Date` date TEXT;   
ALTER TABLE marketing_data
CHANGE `City/Location` city_Location TEXT;
ALTER TABLE marketing_data
CHANGE `Latitude` latitude DOUBLE;
ALTER TABLE marketing_data
CHANGE `Longitude` longitude DOUBLE;
ALTER TABLE marketing_data
CHANGE `Channel` channel TEXT;
ALTER TABLE marketing_data
CHANGE `Device` device TEXT;
ALTER TABLE marketing_data
CHANGE `Ad` ad TEXT;
ALTER TABLE marketing_data
CHANGE `Impressions` impressions DOUBLE;
ALTER TABLE marketing_data
CHANGE `CTR` ctr TEXT;
ALTER TABLE marketing_data
CHANGE `Clicks` clicks INT(11);
ALTER TABLE marketing_data
CHANGE `Daily Average CPC` daily_average_cpc DOUBLE;
ALTER TABLE marketing_data
CHANGE `Spend, GBP` spend_gbp INT(11);
ALTER TABLE marketing_data
CHANGE `Conversions` conversions INT(11);
ALTER TABLE marketing_data
CHANGE `Total conversion value, GBP` total_conversion_value_gbp DOUBLE;
ALTER TABLE marketing_data
CHANGE `Likes (Reactions)` likes_reactions INT(11);
ALTER TABLE marketing_data
CHANGE `Shares` shares INT(11);
ALTER TABLE marketing_data
CHANGE `Comments` comments INT(11);

# OR use this if just to change case and remove trailing or leading spaces:
UPDATE marketing_data
SET Campaign = TRIM(LOWER(Campaign)),
    City = TRIM(LOWER(City)),.......
    Ad = TRIM(LOWER(Ad));
*/

# Check for Missing Values
# SELECT COUNT(*) FROM marketing_data WHERE campaign IS NULL;     # do for all columns OR use code below
SELECT 
    SUM(CASE WHEN campaign IS NULL THEN 1 ELSE 0 END) AS missing_campaign,
    SUM(CASE WHEN date IS NULL THEN 1 ELSE 0 END) AS missing_date,
    SUM(CASE WHEN city_location IS NULL THEN 1 ELSE 0 END) AS missing_city,
    SUM(CASE WHEN latitude IS NULL THEN 1 ELSE 0 END) AS missing_latitude,
    SUM(CASE WHEN longitude IS NULL THEN 1 ELSE 0 END) AS missing_longitude,
    SUM(CASE WHEN channel IS NULL THEN 1 ELSE 0 END) AS missing_channel,
    SUM(CASE WHEN device IS NULL THEN 1 ELSE 0 END) AS missing_device,
    SUM(CASE WHEN ad IS NULL THEN 1 ELSE 0 END) AS missing_ad,
    SUM(CASE WHEN impressions IS NULL THEN 1 ELSE 0 END) AS missing_impressions,
    SUM(CASE WHEN ctr IS NULL THEN 1 ELSE 0 END) AS missing_ctr,
    SUM(CASE WHEN clicks IS NULL THEN 1 ELSE 0 END) AS missing_clicks,
    SUM(CASE WHEN daily_average_cpc IS NULL THEN 1 ELSE 0 END) AS missing_cpc,
    SUM(CASE WHEN Spend_gbp IS NULL THEN 1 ELSE 0 END) AS missing_spend,
    SUM(CASE WHEN conversions IS NULL THEN 1 ELSE 0 END) AS missing_conversions,
    SUM(CASE WHEN total_conversion_value_gbp IS NULL THEN 1 ELSE 0 END) AS missing_conversion_value,
    SUM(CASE WHEN likes_reactions IS NULL THEN 1 ELSE 0 END) AS missing_likes,
    SUM(CASE WHEN shares IS NULL THEN 1 ELSE 0 END) AS missing_shares,
    SUM(CASE WHEN comments IS NULL THEN 1 ELSE 0 END) AS missing_comments
FROM marketing_data;

# No null values


# Check for duplicate rows based on all columns
SELECT *, COUNT(*)
FROM marketing_data
GROUP BY Campaign, date, city_location, latitude, longitude, channel, device, ad, impressions, ctr, clicks, daily_average_cpc, spend_gbp, conversions, total_conversion_value_gbp, likes_reactions, shares, comments
HAVING COUNT(*) > 1;

# No rows returned


/*
-- Convert string dates to proper date format
SET SQL_SAFE_UPDATES = 0;   # disable safe mode, when using 'UPDATE'
SET SQL_SAFE_UPDATES = 1; # enable safe mode

-- Convert string dates to proper date format
UPDATE marketing_data
SET Date = STR_TO_DATE(Date, '%m/%d/%Y');

ALTER TABLE marketing_data
MODIFY COLUMN date DATE;
*/


-- View Data Ranges

-- Verify Date Range
SELECT MIN(Date) AS Min_Date, MAX(Date) AS Max_Date
FROM marketing_data;
	
#   Min_Date	Max_Date
	2023-03-01	2023-11-30


-- Verify Latitude and Longitude Ranges
-- Should be within the expected range (-90 to 90 for latitude, -180 to 180 for longitude).
SELECT MIN(Latitude) AS Min_Latitude, MAX(Latitude) AS Max_Latitude,
       MIN(Longitude) AS Min_Longitude, MAX(Longitude) AS Max_Longitude
FROM marketing_data;

#	Min_Latitude	Max_Latitude	Min_Longitude	Max_Longitude
	51.50735	    53.483959	    -2.244644	    -0.12776


-- Distinct Values for Categorical Columns

SELECT DISTINCT Channel 
FROM marketing_data;

#	Channel
	Facebook
	Instagram
	Pinterest

SELECT DISTINCT Device 
FROM marketing_data;

#	Device
	Desktop
	Mobile

SELECT DISTINCT Campaign 
FROM marketing_data;

#	Campaign
	Spring 
	Summer 
	Fall 

SELECT DISTINCT Ad 
FROM marketing_data;

#	Ad
	Collection
	Discount


-- Verify Ranges for all Numerical Columns

SELECT MIN(impressions) AS Min_Impressions, MAX(impressions) AS Max_Impressions,
       MIN(ctr) AS Min_CTR, MAX(ctr) AS Max_CTR,
       MIN(clicks) AS Min_Clicks, MAX(clicks) AS Max_Clicks,
       MIN(daily_average_cpc) AS Min_Daily_Average_CPC, MAX(daily_average_cpc) AS Max_Daily_Average_CPC,
       MIN(spend_gbp) AS Min_Spend_GBP, MAX(spend_gbp) AS Max_Spend_GBP,
       MIN(conversions) AS Min_Conversions, MAX(conversions) AS Max_Conversions,
       MIN(total_conversion_value_gbp) AS Min_Total_conversion_value_GBP, MAX(total_conversion_value_gbp) AS Max_Total_conversion_value_GBP,
       MIN(likes_reactions) AS Min_Likes_Reactions, MAX(likes_reactions) AS Max_Likes_Reactions,
       MIN(shares) AS Min_Shares, MAX(shares) AS Max_Shares,
       MIN(comments) AS Min_Comments, MAX(comments) AS Max_Comments
FROM marketing_data;

#	Min_Impressions	Max_Impressions	Min_CTR	Max_CTR	Min_Clicks	Max_Clicks	Min_Daily_Average_CPC	Max_Daily_Average_CPC	Min_Spend_GBP	Max_Spend_GBP	Min_Conversions	Max_Conversions	Min_Total_conversion_value_GBP	Max_Total_conversion_value_GBP	Min_Likes_Reactions	Max_Likes_Reactions	Min_Shares	Max_Shares	Min_Comments	Max_Comments
	1	            3847	        0.0%	2.6%	0	        62	        0	                    2.69	                0	            109	            0	            11	            0	                            939.6	                        0	                152             	0	        59	        0	            29


-- Descriptive Statistics and Data Overview of Key Metrics
SELECT
    AVG(impressions) AS Avg_Impressions,
    AVG(clicks) AS Avg_Clicks,
    AVG(daily_average_cpc) AS Avg_CPC,
    AVG(spend_gbp) AS Avg_Spend,
    AVG(conversions) AS Avg_Conversions
FROM marketing_data;

#	Avg_Impressions	    Avg_Clicks	Avg_CPC	            Avg_Spend	Avg_Conversions
	1479.3382626262637	18.3432	    0.904104040404046	16.4829	    4.0659
    

-- Evaluate Campaign Performance 
-- Determine which campaigns performed best in terms of Impressions, Clicks, and Conversions.
SELECT Campaign, 
       SUM(Impressions) AS Total_Impressions, 
       SUM(Clicks) AS Total_Clicks, 
       SUM(Conversions) AS Total_Conversions
FROM marketing_data
GROUP BY Campaign
ORDER BY Total_Conversions DESC;

#	Campaign	Total_Impressions	Total_Clicks	Total_Conversions
	Fall 	       6434259	        85120	         14886
	Summer 	3459578.399999996	 38816	         12753
	Spring 	4751611.400000003	 57662	         12613


-- Channel Effectiveness
-- Evaluate how each advertising channel (Facebook, Instagram, Pinterest) is performing, including Return on Investment (ROI).
SELECT Channel,
       SUM(Spend_GBP) AS Total_Spend,
       SUM(Total_conversion_value_GBP) AS Total_Conversion_Value,
       (SUM(Total_conversion_value_GBP) - SUM(Spend_GBP)) / SUM(Spend_GBP) * 100 AS ROI
FROM marketing_data
GROUP BY Channel
ORDER BY ROI DESC;

#	Channel	    Total_Spend	Total_Conversion_Value	ROI
	Pinterest	28201	    634713.8	            2150.6783447395483
	Instagram	63395	    684760.6800000016	    980.149349317772
	Facebook	71585	    412225.77999999956	    475.85496961653917
   

-- Geographical Insights
-- Identify the cities with the highest engagement (likes, shares, comments) and conversion rates
SELECT city_location, 
       SUM(likes_reactions) AS Total_Likes,
       SUM(shares) AS Total_Shares,
       SUM(comments) AS Total_Comments,
       SUM(conversions) / SUM(impressions) * 100 AS Conversion_Rate
FROM marketing_data
GROUP BY City_Location
ORDER BY Conversion_Rate DESC;

#	city_location	Total_Likes	Total_Shares	Total_Comments	Conversion_Rate
	Birmingham	    185364	    33426	        19084	        0.32223629876335647
	Manchester	    212915	    42970	        22274	        0.28733787119539195
	London	        210206	    44119	        31381	        0.23063267409064023
    

-- Device Performance
-- Understand how ads perform across different devices (mobile, desktop, tablet) 
-- and which device type generates the highest conversion rates.
SELECT Device, 
       SUM(clicks) AS Total_Clicks, 
       SUM(conversions) AS Total_Conversions,
       SUM(conversions) / SUM(impressions) * 100 AS Conversion_Rate
FROM marketing_data
GROUP BY device
ORDER BY Conversion_Rate DESC;

#	Device	Total_Clicks	Total_Conversions	Conversion_Rate
	Desktop	88832	        21310	            0.3674036704988706
	Mobile	92766	        18942	            0.21414789273702609
    

-- Ad-Level Analysis
-- Analyze individual ad performance to identify high-performing creatives.
SELECT Ad, 
       ROUND(SUM(impressions), 2) AS Total_Impressions, 
       SUM(Clicks) AS Total_Clicks, 
       SUM(Conversions) AS Total_Conversions
FROM marketing_data
GROUP BY Ad
ORDER BY Total_Conversions DESC;

#	Ad	        Total_Impressions	Total_Clicks	Total_Conversions
	Discount	6719121.70	        75638	        21183
	Collection	7926327.10	        105960	        19069


-- Time Series Analysis
-- Track performance trends over months to identify patterns or seasonal effects.
SELECT 
    DATE_FORMAT(date, '%b') AS Month,  -- Extracts month name (e.g., Jan, Feb)
    ROUND(SUM(impressions), 2) AS Total_Impressions,  -- Rounds Total_Impressions to 2 decimal places
    SUM(clicks) AS Total_Clicks, 
    SUM(conversions) AS Total_Conversions
FROM marketing_data
GROUP BY Month
ORDER BY Total_Conversions DESC;

#	Month	Total_Impressions	Total_Clicks	Total_Conversions
	Nov	    2117531.00	        27692	        5331
	Oct	    2203982.00	        29488	        5156
	Mar	    1597872.40	        19391	        4505
	Sep	    2112746.00	        27940	        4399
	Jun	    1125724.90	        12525	        4303
	Jul	    1168917.80	        13206	        4301
	Aug	    1164935.70	        13085	        4149
	Apr	    1545702.20	        18854	        4115
	May	    1608036.80	        19417	        3993














