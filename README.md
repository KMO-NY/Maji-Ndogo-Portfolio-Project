# Maji Ndogo Project Proposal   

## Table of Contents
---
[Project Overview](#project-overview)

[Instructions](#instructions)

[1. Maji Ndogo's Water-related Data](#1-maji-ndogos-water-related-data)

[1.1. Data Sources](#11-data-sources)

[1.2. Tools](#12-tools)

[1.3. Data Cleaning/Preparations](#13-data-cleaningpreparations)

[1.3.1. Questions](#131-questions)

[1.3.2. Hypothesis](#132-hypothesis)

[1.3.3. Approach](#133-approach)

[1.4. EDA (Exploritory Data Analysis)](#14-eda-exploritory-data-analysis)

[1.4.1. SQL](#141-sql)

[1.4.2. Data Visualisation & Storytelliing with PowerBI](#142-data-visualisation--storytelliing-with-powerbi)

[1.5. Data Analysis](#15-data-analysis)

[1.5.1. SQL](#151-sql)

[1.5.2. Data Visualisation & Storytelliing with PowerBI](#152-data-visualisation--storytelliing-with-powerbi)

[1.6. Results/Findings](#16-resultsfindings)

[1.6.1 SQL](#161-sql)

[1.6.2 Data Visualisation & Storytelliing with PowerBI](#162-data-visualisation--storytelliing-with-powerbi)

[1.7. Recommendations](#17-recommendations)

[1.7.1. SQL](#171-sql)

[1.7.2 Data Visualisation & Storytelliing with PowerBI](#172-data-visualisation--storytelliing-with-powerbi)

[2. Maji Ndogo's Farming Data](#2-maji-ndogos-farming-data)

[2.1. Data Sources](#21-data-sources)

[2.2. Tools](#22-tools)

[2.3. Data Cleaning/Preparations](#23-data-cleaningpreparations)

[2.3.1. Questions](#231-questions)

[2.3.2. Hypothesis](#232-hypothesis)

[2.3.3. Approach](#233-approach)

[2.4. EDA (Exploritory Data Analysis)](#24-eda-exploritory-data-analysis)

[2.4.1. Python Packages](#241-python-packages)

[2.4.2. Regression](#242-regression)

[2.5. Data Analysis](#25-data-analysis)

[2.5.1. Python Packages](#251-python-packages)

[2.5.2. Regression](#252-regression)

[2.6. Results/Findings](#26-resultsfindings)

[2.6.1. Python Packages](#261-python-packages)

[2.6.2. Regression](#262-regression)

[2.7. Recommendations](#27-recommendations)

[2.7.1. Python Packages](#271-python-packages)

[2.7.2. Regression](#272-regression)


## Project Overview

Maji Ndogo is a fictional country designed to reflect real-world challenges encountered by many communities worldwide. This project aims to address various issues faced by Maji Ndogo, each highlighting a different aspect of data science skills.

The project will appeal to individuals and organizations interested in solving problems common in third-world, underdeveloped, and developing countries, as well as those working towards achieving the Sustainable Development Goals (SDGs). Additionally, it serves as a showcase of my skills and practical applications for roles in data analysis and data science.

### SQL:
The first area that is addressed is the state of the water sources in the country. This first part of the project is motivated by SDG Goal 6 (Clean Water and Sanitation). This is the goal that aims ensure availability and sustainable management of water and sanitation for all. Here I will clean, analyse and visualise 60 000 records that can be found in the Data sources section (1.1.1 and 1.1.2). This data will from here on be referred to as "Water Related Data"

**Key Findings:**

- Rural Dominance: Approximately 60% of water sources are located in rural areas.
- Shared Taps: 43% of citizens rely on shared taps, with an average of 2000 people per tap.
- Water Infrastructure: While 31% of the population has water infrastructure in their homes, 45% of this group face non-functional systems due to issues with pipes, pumps, and reservoirs.
- Well Usage: 18% of the population uses wells, but only 28% of these wells are clean.
- Wait Times: Citizens often experience long wait times for water, averaging more than 120 minutes.

**Implications:**

These findings highlight significant challenges related to water access and quality in Maji Ndogo, underscoring the urgent need for improved infrastructure and management strategies to ensure clean and sustainable water sources for all citizens.

### Data Visualisation & Storytelliing with PowerBI:
This phase of the project follows the SQL analysis and utilizes Microsoft Power BI Desktop to visualize a subset of the data (approximately 25,000 records) from the project_progress and related tables, sourced from Data sources 1.1.3 to 1.1.5. The goal is to extract additional insights and identify patterns that may have been overlooked during the SQL analysis.

**Key Findings:**

- Gender Disparity: 69% of water collectors are women, indicating a gender disparity in water-related responsibilities.
- Crime Victims: 64% of crime victims in water-related crimes are also women, highlighting a gender-specific impact of such crimes.
- Cost Disparity: It is nearly twice as expensive to improve a water source in rural areas compared to urban areas, suggesting significant cost disparities based on location.
- Budget Overshoot: The project is over budget in every province, indicating potential issues with budget management or project planning.

**Implications:**

These findings underscore the need for targeted interventions to address gender disparities in water-related responsibilities and crimes. Additionally, there is a clear need for more efficient budget management strategies, especially in rural areas where costs are significantly higher.


### Python Packages:
Secondly, the Agricultural sector will be analysed. This will be done with the goal of automating farming in Maji Ndogo, a place with diverse and challenging agricultural landscapes. The long-term goal is to have fully autonomous farming equipment that can intelligently manage and optimise agricultural processes. This part of the project aligns with multiple SDG goals, namely:
- Zero Hunger (Goal 2): End hunger, achieve food security and improved nutrition, and promote sustainable agriculture.
- Decent Work and Economic Growth (Goal 8): Promote sustained, inclusive, and sustainable economic growth, full and productive employment, and decent work for all.
- Industry, Innovation, and Infrastructure (Goal 9): Build resilient infrastructure, promote inclusive and sustainable industrialization, and foster innovation.
- Responsible Consumption and Production (Goal 12): Ensure sustainable consumption and production patterns.
  
Here, I will create .py files to do the cleaning of data. The packages will ingest data (from the web, databases), process data (field data and weather data). The packages are named:
- data_ingestion.py
- field_data_processor.py
- weather_data_processor.py 

**Key Findings:**

- Data Accuracy: The data captured from the farm survey is found to be 53% inaccurate, highlighting challenges in data quality.
- Crop Performance: No single feature can explain why a crop performs well. Weak correlations suggest that factors influencing crop success may not be linearly related, emphasizing the complexity of agricultural outcomes.

**Implications:**

- Data Quality Improvement: Addressing the 53% inaccuracy in farm survey data is crucial for making informed decisions. Efforts should be made to improve data collection methods and accuracy to ensure the reliability of analysis and decision-making processes.
- Complexity of Crop Performance: The finding that no single feature can explain crop success indicates the complexity of agricultural systems. This underscores the need for advanced analytical techniques, such as machine learning, to uncover non-linear relationships and identify key factors influencing crop performance.

*Kindly note that I am still working on this project. Certain portions may change depending on the results of my EDAs, my research and recommendations.

### Regression
Simple linear regression is a fundamental statistical method used to quantify the relationship between two variables. It allows us to predict an outcome (dependent variable) based on the value of one predictor (independent variable). In this challenge, we will apply simple linear regression to understand how different environmental factors affect the standardised yield of crops.

Our insights will not only help local farmers maximise their harvests but also contribute to the sustainable agriculture practices in Maji Ndogo.

**Key Findings:**

- Linear regression, for all its strengths, assumes a straightforward relationship between the predictor and the outcome.
- Factors influencing crop yields in Maji Ndogo—be it temperature, rainfall, or pollution—interact in complex, often nonlinear ways.
- The initial model with `Ave_temps` hinted at this complexity, suggesting that the effect of the average temperature on yields might follow a more intricate pattern than a straight line can depict (or no pattern at all).
- The yield also depends on more than just the pollution or the temperature, it depends on many of the factors.
- Not all crops are affected equally by pollution or temperature, so we could simplify our model if we remove the influence of the different crops.

**Implications:**

- Inadequacy of Linear Models: The assumption that the relationship between factors (e.g., temperature, rainfall, pollution) and crop yields is linear might oversimplify reality. These factors can interact in complex, nonlinear ways, suggesting that a linear regression may not capture the true underlying relationships between the variables.
- Potential Need for Nonlinear Models: The fact that temperature's effect on yields appears to be more intricate than linear regression suggests indicates the possibility of a nonlinear relationship. Models like polynomial regression, decision trees, or even machine learning techniques like random forests might be more appropriate to capture these complexities.
- Multifactorial Influences: Yield is influenced by more than one variable (temperature, pollution, rainfall, etc.), and these variables likely interact with each other. Linear regression, by focusing on individual factors, may miss the interaction effects. More advanced techniques like interaction terms or multivariate nonlinear models may be needed.
- Heterogeneity Across Crops: Different crops may respond differently to the same environmental conditions. Treating all crops the same in a linear model may mask important crop-specific effects. One solution might be to model different crops separately or use hierarchical/mixed-effects models to account for the variability across crops.
- Model Simplification: If the focus is on general trends or if specific crops do not react significantly to some variables (e.g., pollution), removing those variables or segmenting the data could simplify the model. However, this might also lead to a loss of important information if the effects are subtle but meaningful.

## Instructions:
This section is applicable to persons who wish to load the files of the project into their relevant IDEs. The section will cover things one should consider when doing so in order see the same results I saw when doing the project. Don't worry, the instructions are not complicated and will not take up a lot of your time!

### SQL:

For script 2: Replace my connection infomation with yours. Clear outputs after viewing as it can slow down your computer in you don't have a lot of space.

For script 3: Import the .csv file as a table before running the script.

### Data Visualisation & Storytelliing with PowerBI:

For all reports: Ensure that the paths for the .csv, .xlsx files are updated to the path on your local machine.

### Python Packages:

The data_ingestion.py and Maji_Ndogo_farm_survey_small.db must be in the same folder as the other .py files for the files to run. When using Google Colab, upload them to the runtime first or nothing will work.

## 1. Maji Ndogo's Water-related Data:

### 1.1. Data Sources

1.1.1. md_water_services.sql - A database containing the records captured from a water survey conducted in Maji Ndogo - accompanied by a data dictionary titled "Data_dictionary"
1.1.2. Auditor_report.csv - A table containing 1620 audited records from the water_quality table, quality scores - accompanied by a data dictionary titled "Data dictionary_ auditor_report"
1.1.3. Md_summary.csv - A summary informed by the ```project_progress``` table. Contains data of water sources that need to be fixed.
1.1.4. Md_water_services_data.xlsx - comes in variations Md_water_services_data, 2-Md_water_services_data, 3-Md_water_services_data, 4-Md_water_services_data. Updates ```project_progress``` and related tables up to 2027 (time period: 2022 - 2027). 
1.1.5. Md_queue_related_crime.csv - Records of crimes that can be tied to the water sources. Accompanies Md_summary.

### 1.2. Tools

- MySQL - version 8.0.36
    - [Download here](https://dev.mysql.com/)
- Anaconda Navigator - version 2.5.2
    - [Download here](https://www.anaconda.com/download)
    - Packages to install in Anaconda Navigator environment (Jupyter Notebook - v7.0.6; SQL alchemy - v1.4.4; SQLite - v3.41.2; pymysql - v1.0.2; ipython - v8.15.0)
- PowerBI - version 2.126.1261.0
    - [Download here](https://powerbi.microsoft.com/en-us/desktop/?WT.mc_id=Blog_Desktop_Update)

### 1.3. Data Cleaning/Preparations

#### 1.3.1. Questions

1.3.1.1. What percentage of the water sources is safe for public use and consumption?

1.3.1.2. How long are people standing in queues on average?

1.3.1.3. How many of the private taps are functioning and safe to consume?

1.3.1.4. What is the ratio of rural and urban water sources? 

1.3.1.5. Are the citizens able to safely collect water from public water sources?

1.3.1.6. Do factors such as age and gender affect a person's access to safe-to-consume water sources?


#### 1.3.2. Hypothesis

1.3.2.1. Less than half (50%) of the water from wells in Maji Ndogo is safe to consume.

1.3.2.2. The average queue time is around 200 minutes.

1.3.2.3. Out of all the private taps, Less than half (50%) are functioning and safe-to-consume.

1.3.2.4. There are more rural sources than there are urban sources. 

1.3.2.5. No, the citizens aren't able to safely collect water from public water sources.

1.3.2.6. Women have the hardest time collecting water.


#### 1.3.3. Approach

|No.| Features| Relationships| Metrics|
|---|---------|--------------|--------|
|1| subjective_quality_score, results, type_of_water_source| water_quality, water_source, well_pollution | unsafe_well_percent|  
|2| source_id, time_in_queue| well_pollution, water_source, visits| avg_queue_time_min|
|3| type_of_water_source| Features are in one table| broken_taps_percent|
|4| location_id, location_type| Features are in one table| rural_sources_percent|
|5| Crime_id, victim_gender, time_of_day| Features are in one table| Maji Ndogo Crime-related Data Report: Number of Crimes by hour of day|
|6| crime_type, victim_gender| Features are in one table| Maji Ndogo Crime-related Data Report: Gender Disparity Related to Water Collecters|

### 1.4. EDA (Exploritory Data Analysis)

#### 1.4.1. SQL:

The md_water_services.sql file was uploaded to MySQL as a database. It was cleaned and analysed. The Auditor_report.csv was added as a table to the database (see script 3). This data was used to better understand the water-related problems faced as well as identify the water sources that weren't functioning, polluted or that just made it harder for citizens to collect water (by ways of crimes and exccessive queues). 

![EER_Diagram-md_water_services-first_look](https://github.com/KMO-NY/Maji-Ndogo-Portfolio-Project/assets/83243036/f9056ffb-a4df-40dd-b1c2-3fed2f4ff144)


Finding out the  water source types:

```sql
SELECT DISTINCT
    type_of_water_source
FROM
    water_source;
```

![types_of_water_sources_in_Maji-1](https://github.com/KMO-NY/Maji-Ndogo-Portfolio-Project/assets/83243036/6d116f60-721b-45a6-9d3d-baa941f1a39b)


Looking for persons who have to queued for abnormal times (more than 500 minutes):

```sql
SELECT 
    *
FROM
    visits
WHERE
    time_in_queue > 500;
```
![queue_time_exceeds_500_min-1](https://github.com/KMO-NY/Maji-Ndogo-Portfolio-Project/assets/83243036/f1139744-6669-4496-bfd5-6d9e894307e6)


105 Records were returned! This means that 105 water sources had queue times of over 500 minutes.

Comparing polar opposites: Calling source IDs that had 0 minute queue times to compare with source IDs that had 500 miniute queue times, and looking at the water source type the sources belong to.
```sql
SELECT 
    *
FROM
    water_source
WHERE
    source_id IN ('KiRu26095224' , 'SoRu38869224',
        'HaZa21742224',
        'AmDa12214224');
```
![0vs500_queues-1](https://github.com/KMO-NY/Maji-Ndogo-Portfolio-Project/assets/83243036/cc11c2c1-df27-4cba-8ad6-adb842c0d9f5)


The 500 minute queue times were from "shared tap" water sources, whereas the 0 minute queue times were from "well" and "tap_in_home" water sources. 

#### 1.4.2. Data Visualisation & Storytelliing with PowerBI:

Md_summary and Md_queue_related_crime were uploaded to Power BI Desktop. I familiarised myself with the data by looking at the total number of people served by Location type, water source type; and how the total was spread across provinces; average queue times by days of the week, hour of day, gender and number of people; the number of crimes by crime type, victim gender and provinces. The results are in "Maji_Ndogo Familiarizing ourselves with the Data" and "Maji_Ndogo Familiarizing ourselves with the Data 2". Alternatively, open report 1 and two for a more interactive view.

Uploaded "Md_water_services_data" on to Power BI Desktop. Cleaned it by making sure features had their correct data types, and that the relationships were correct. Uploaded the variations and checked that the data was ready to be analysed.

### 1.5. Data Analysis

#### 1.5.1. SQL:

Created a well_pollution copy table to test update of errounously captured descriptions and results in well_pollution table:
```sql
CREATE TABLE md_water_services.well_pollution_copy AS (SELECT * FROM
    md_water_services.well_pollution);
```
```sql
UPDATE well_pollution_copy 
SET 
    description = 'Bacteria:E. coli'
WHERE
    description = 'Clean Bacteria: E. coli';
```
```sql
UPDATE well_pollution_copy 
SET 
    description = 'Bacteria: Giardia Lamblia'
WHERE
    description = 'Clean Bacteria: Giardia Lamblia';
```
```sql
UPDATE well_pollution_copy 
SET 
    results = 'Contaminated: Biological'
WHERE
    biological > 0.01 AND results = 'Clean';
```

Rank types of water sources by the number of people they serve (excluding functioning inhome taps) & prioritise the sources that need to be fixed within each source type
```sql
SELECT 
    type_of_water_source,
    source_id,
    number_of_people_served,
    RANK() OVER (PARTITION BY type_of_water_source ORDER BY number_of_people_served DESC) AS priority_rank
FROM 
    water_source
WHERE 
   type_of_water_source != 'tap_in_home'
ORDER BY 
    type_of_water_source, number_of_people_served DESC, priority_rank DESC;
```
Created a pivot table showing the time in queue by the hour of the day throughout the days of the week:
```sql
SELECT
TIME_FORMAT(TIME(time_of_record), '%H:00') AS hour_of_day,
-- Sunday
ROUND(AVG(
CASE
WHEN DAYNAME(time_of_record) = 'Sunday' THEN time_in_queue
ELSE NULL
END
),0) AS Sunday,
-- Monday
ROUND(AVG( 
CASE
WHEN DAYNAME(time_of_record) = 'Monday' THEN time_in_queue
ELSE NULL
END
),0) AS Monday,
-- Tuesday
ROUND(AVG(
CASE
WHEN DAYNAME(time_of_record) = 'Tuesday' THEN time_in_queue
ELSE NULL
END
),0) AS Tuesday,
-- Wednesday
ROUND(AVG(
CASE
WHEN DAYNAME(time_of_record) = 'Wednesday' THEN time_in_queue
ELSE NULL
END
),0) AS Wednesday,
-- Thursday
ROUND(AVG(
CASE
WHEN DAYNAME(time_of_record) = 'Thursday' THEN time_in_queue
ELSE NULL
END
),0) AS Thursday,
-- Friday
ROUND(AVG(
CASE
WHEN DAYNAME(time_of_record) = 'Friday' THEN time_in_queue
ELSE NULL
END
),0) AS Friday,
-- Saturday
ROUND(AVG(
CASE
WHEN DAYNAME(time_of_record) = 'Saturday' THEN time_in_queue
ELSE NULL
END
),0) AS Saturday
FROM
visits
WHERE
time_in_queue != 0 
GROUP BY
hour_of_day
ORDER BY
hour_of_day;
```

Created a view (Incorrect_records) to capture all incorrectly captured water source quality scores (where employee score and auditor score does not match)
```sql
CREATE VIEW Incorrect_records AS (
SELECT
auditor_report.location_id,
visits.record_id,
employee.employee_name,
auditor_report.true_water_source_score AS auditor_score,
wq.subjective_quality_score AS employee_score,
auditor_report.statements AS statements
FROM
auditor_report
JOIN
visits
ON auditor_report.location_id = visits.location_id
JOIN
water_quality AS wq
ON visits.record_id = wq.record_id
JOIN
employee
ON employee.assigned_employee_id = visits.assigned_employee_id
WHERE
visits.visit_count =1
AND auditor_report.true_water_source_score != wq.subjective_quality_score);
```
Created a CTEs (error_count, suspect_list) to identify the employees that made mistakes that were greater than the median score
```sql
WITH error_count AS ( 
SELECT
employee_name,
COUNT(employee_name) AS num_of_mistakes
FROM
Incorrect_records
GROUP BY
employee_name),
suspect_list AS (
SELECT
employee_name,
num_of_mistakes
FROM
error_count
WHERE
num_of_mistakes > (SELECT AVG(num_of_mistakes) FROM error_count))
-- This query filters all of the records where the "corrupt" employees gathered data.
SELECT
employee_name,
location_id,
statements
FROM
Incorrect_records
WHERE
employee_name in (SELECT employee_name FROM suspect_list);
```

Created a table (Project_progress) where our teams have the information they need to fix, upgrade and repair water sources
```sql
CREATE TABLE Project_progress (
Project_id SERIAL PRIMARY KEY,
source_id VARCHAR(20) NOT NULL REFERENCES water_source(source_id) ON DELETE CASCADE ON UPDATE CASCADE,
Address VARCHAR(50), 
Town VARCHAR(30),
Province VARCHAR(30),
Source_type VARCHAR(50),
Improvement VARCHAR(50), 
Source_status VARCHAR(50) DEFAULT 'Backlog' CHECK (Source_status IN ('Backlog', 'In progress', 'Complete')),
Date_of_completion DATE, 
Comments TEXT 
);
```
#### 1.5.2. Data Visualisation & Storytelliing with PowerBI:

Created data reports on:
- Crime-related data, 
- User reports for national and provincial stakeholders, and
- A dashboard that the public could access to know about what was done in their area and just how much more was left to do, as well as the associated costs and key influencers

### 1.6. Results/Findings

#### 1.6.1 SQL:

**Water Accessibility and infrastructure Summary Report:**

1. Most water sources are rural (60%).
2. 43% of our people are using shared taps. 2000 people often share one tap.
3. 31% of our population has water infrastructure in their homes, but within that group, 45% face non-functional systems due to issues with pipes, pumps, and reservoirs. 55% have functioning in-home taps.
4. 18% of our people are using wells, but within that, only 28% are clean.
5. Our citizens often face long wait times for water, averaging more than 120 minutes.
6. In terms of queues:
- Queues are very long on Saturdays.
- Queues are longer in the mornings and evenings.
- Wednesdays and Sundays have the shortest queues.
7. Sokoto has the largest population of people drinking river water. 
8. The majority of water from Amanzi comes from taps, but half of these in-home taps don't work because the infrastructure is broken. 

**Auditor report:**

An audit was conducted to assess the validity of the data - whether the current records were an accurate depiction of the country's water situation. The results were as follows:
Employees Zuriel Matembo, Malachi Mavuso, Bello Azibo and Lalitha Kaburi made more mistakes than their peers on average. And they all have incriminating statements made against them, and only them.

The sources the four employees assessed could have had their issues gone unrecognised and unsolved had there not been an audit.

#### 1.6.2 Data Visualisation & Storytelliing with PowerBI:

- 69% of water collectors are women
- 64% of crime victims in water related crimes are also women
- It is almost twice as expensive to improve a source in a rural area, compared to an urban area.
- Sokoto has a very high average cost of improvement, both rurally and in urban areas.
- We are over budget in every province.
- We underestimated the cost of rural improvements in Sokoto
- Some vendors spend more of the budget because they move around when fixing water sources instead of fixing the water sources that are next to each to other.

### 1.7. Recommendations

#### 1.7.1. SQL:

1. If communities are using rivers, we can dispatch trucks to those regions to provide water temporarily in the short term, while we send out
crews to drill for wells, providing a more permanent solution.
2. If communities are using wells, we can install filters to purify the water. For wells with biological contamination, we can install UV filters that kill microorganisms, and for *polluted wells*, we can install reverse osmosis filters. In the long term, we need to figure out why these sources are polluted.
3. For shared taps, in the short term, we can send additional water tankers to the busiest taps, on the busiest days. We can use the queue time
pivot table we made to send tankers at the busiest times. Meanwhile, we can start the work on installing extra taps where they are needed.
According to UN standards, the maximum acceptable wait time for water is 30 minutes. With this in mind, our aim is to install taps to get
queue times below 30 min.
4. Shared taps with short queue times (< 30 min) represent a logistical challenge to further reduce waiting times. The most effective solution,
installing taps in homes, is resource-intensive and better suited as a long-term goal.
5. Addressing broken infrastructure offers a significant impact even with just a single intervention. It is expensive to fix, but so many people
can benefit from repairing one facility. For example, fixing a reservoir or pipe that multiple taps are connected to. We will have to find the
commonly affected areas though to see where the problem actually is. 
6. Investigate corruption and create policies to combat it. This can involve division of duty and randomised check-ups on work done.

#### 1.7.2 Data Visualisation & Storytelliing with PowerBI:

1. Since a large percentage of water collectors and crime victims in water-related crimes are women, efforts should be made to ensure that water access and safety measures are gender-inclusive. This could include providing training and resources specifically tailored to women, ensuring their safety in water collection and usage.
2. Given the higher cost of improving water sources in rural areas, strategies should be developed to make these improvements more cost-effective. This might involve exploring alternative technologies or construction methods that are more suitable for rural environments.
3. With all provinces being over budget, a thorough review of the budget and expenses should be conducted. Identify areas where costs can be reduced or reallocated to stay within budget.
4. To address the issue of vendors moving around instead of focusing on nearby water sources, consider implementing stricter guidelines or incentives to encourage vendors to prioritize efficiency and cost-effectiveness in their work.
5. Since the cost of rural improvements in Sokoto was underestimated, a reassessment of the budget and project scope in Sokoto specifically is necessary. Adjustments should be made to ensure that adequate funding is allocated to complete the necessary improvements.
6. Continuously monitor and analyze data related to project costs, vendor activities, and gender-specific issues to identify trends and areas for improvement. This can help in making informed decisions and improving project efficiency over time.

## 2. Maji Ndogo's Farming Data:

### 2.1. Data Sources
2.1.1. Maji_Ndogo_farm_survey_small.db - Database file that contains data from the MD_agric_exam-4313.csv. Includes information on farm fields in Maji Ndogo and its related Geographic features, Weather features, Soil and crop features, and Farm management features  - accompanied by a data dictionary titled "Farming Data Dictionary" 
2.1.2. Weather_station_data - [click to view](https://raw.githubusercontent.com/Explore-AI/Public-Data/master/Maji_Ndogo/Weather_station_data.csv) - Contains the weather station unique ID and the message captured by its sensors - accompanied by a data dictionary titled "Farming Data Dictionary"
2.1.3. Weather_data_field_mapping - [click to view](https://raw.githubusercontent.com/Explore-AI/Public-Data/master/Maji_Ndogo/Weather_data_field_mapping.csv) - Comprised of the weather station unique ID and the Field IDs linked to the weather station - accompanied by a data dictionary titled "Farming Data Dictionary"


### 2.2. Tools
- Google Colab 
    - [Go to site](https://colab.google/)
- VSCode - version 1.88.0
    - [Download here](https://code.visualstudio.com/download)

### 2.3. Data Cleaning/Preparations

#### 2.3.1. Questions

2.3.1.1. What kind of crops does Maji Ndogo produce/farm?

2.3.1.2. What is the distributions of those feature variables per crop type?

2.3.1.3. Which of the areas/locations in Maji Ndogo, produce the most for each crop type?

2.3.1.4. What affects the `Standard_yield`?

2.3.1.5.  Is there a variety of soil types in Maji Ndogo?

2.3.1.6. How accurate is the data from the survey?


#### 2.3.2. Hypothesis

2.3.2.1. Maji Ndogo farms crops that require high rainfall.

2.3.2.2. They are evenly distributed.

2.3.2.3. High rainfall areas produce the most crops

2.3.2.4. All of the the feature variables have a strong effect on the target variable (`Standard_yield`)

2.3.2.5. Yes there is a variety of soil types in Maji Ndogo, the most common are the soil types that can receive large amounts of water (`Rainfall`)

2.3.2.6. The data is 70% accurate.

#### 2.3.3. Approach
<!-- /Describe in 5-6 sentences w​hat approach you are going to take in order to prove (or disprove) your hypotheses. Think about the following in your answer:  -->
<!-- W​hat features (fields/columns) are you going to look at first? -->
<!-- I​s there a relationship that exists that you want to explore? -->
<!-- W​hat metric/ evaluation measure will you use?/ -->
|No.| Features| Relationships| Metrics|
|---|---------|--------------|--------|
|1| Rainfall, Crop_type| Rainfall, Crop_type| Violin plot, KDE plot|
|2| ALL| ALL| Pairplots for each crop type|
|3| Location, Rainfall| Location, Rainfall| Table: Average Rainfall by  Location, Crosstab: Crop_type by Location|
|4| ALL| ALL| std_correlation_coeffs|
|5| Soil_type, Rainfall| Soil_type, Rainfall| KDE plot|
|6| Weather Station ID, Pollution_level, Temperature, Rainfall| Extracted Mean, Original Mean| Table: Weather Station ID, Extracted Mean, Original Mean, of Pollution_level, Temperature, Rainfall|

### 2.4. EDA (Exploritory Data Analysis)

#### 2.4.1. Python Packages:

The farm survey data source was read into a Data Frame and cleaned first:

- Columns that were switched (`Annual_yield`, `Crop_type_Temp`), where Identified and switched back

```python
MD_agric_df.rename(columns={'Annual_yield': 'Crop_type_Temp', 'Crop_type': 'Annual_yield'}, inplace=True)
MD_agric_df.rename(columns={'Crop_type_Temp': 'Crop_type'}, inplace=True)
``` 
- Certain entries of `Elevation` were negative (impossible), they were also fixed

```python
MD_agric_df['Elevation'] = MD_agric_df['Elevation'].abs()
```
- Certain `Crop_type` entries were incorrect
```python
def correct_crop_type(crop):
    crop = crop.strip()  # Remove trailing spaces
    corrections = {
        'cassaval': 'cassava',
        'wheatn': 'wheat',
        'teaa': 'tea'
    }
    return corrections.get(crop, crop)  # Get the corrected crop type, or return the original if not in corrections

# Apply the correction function to the Crop_type column
MD_agric_df['Crop_type'] = MD_agric_df['Crop_type'].apply(correct_crop_type)
```

Used df.info() or df.describe() to understand the data we have access to

```python
MD_agric_df.info()
```
![df info()-1](https://github.com/KMO-NY/Maji-Ndogo-Portfolio-Project/assets/83243036/039f8d61-bce7-4f1e-a83e-fbbfebc0a331)


```python
MD_agric_df.describe()
```
![df describe()-1](https://github.com/KMO-NY/Maji-Ndogo-Portfolio-Project/assets/83243036/0decfaba-5801-4ee9-9100-c5700b5702fb)

#### 2.4.2 Regression

Before diving into our analysis, it's crucial to ensure the integrity of our dataset and that the data is still as we expect it to be. Thisx is achieved through validating the data from the python packages section of the project.
```python
dataset.to_csv('sampled_field_df.csv', index=False)

!pytest validate_data.py -v

import os# Define the file paths
field_csv_path = 'sampled_field_df.csv'

# Delete sampled_field_df.csv if it exists
if os.path.exists(field_csv_path):
    os.remove(field_csv_path)
    print(f"Deleted {field_csv_path}")
else:
    print(f"{field_csv_path} does not exist.")
```
======================================= test session starts ========================================
platform linux -- Python 3.10.12, pytest-7.4.4, pluggy-1.4.0 -- /usr/bin/python3
cachedir: .pytest_cache
rootdir: /content
plugins: anyio-3.7.1
collected 4 items                                                                                  

validate_data.py::test_read_field_dataframe_shape PASSED                                     [ 25%]
validate_data.py::test_field_dataframe_columns PASSED                                        [ 50%]
validate_data.py::test_field_dataframe_non_negative_elevation PASSED                         [ 75%]
validate_data.py::test_crop_types_are_valid PASSED                                           [100%]

======================================== 4 passed in 0.54s =========================================
Deleted sampled_field_df.csv

### 2.5. Data Analysis

#### 2.5.1. Python Packages:

Created a KDE plot of rainfall distribution split by soil types

```python
plt.figure(figsize=(10, 6))
sns.kdeplot(data=MD_agric_df, x='Rainfall', hue='Soil_type', fill=True)
plt.title('Rainfall Distribution by Soil Types')
plt.xlabel('Rainfall')
plt.ylabel('Density')
plt.show()
```
![Rainfall_distribution_by_soil_type](https://github.com/KMO-NY/Maji-Ndogo-Portfolio-Project/assets/83243036/43e77320-ed4e-42e8-acfa-f356958cc229)

Created a KDE plot of the Rainfall column using hue.
```python
sns.kdeplot(data = MD_agric_df, x = 'Rainfall', hue= 'Crop_type')
```
![Rainfall_distribution_by-crop_type](https://github.com/KMO-NY/Maji-Ndogo-Portfolio-Project/assets/83243036/5e4a47a8-edfa-438d-a471-97d6d7b52c39)

Calculate the mean rainfall in each province.
```python
MD_agric_df.groupby('Location').mean(numeric_only = True)['Rainfall']
```
![rainfall_mean_by_location-1](https://github.com/KMO-NY/Maji-Ndogo-Portfolio-Project/assets/83243036/e2dbcf1f-337c-47fb-a2f7-e3ef919f4ed7)


Created a Violin plot of `Rainfall` distributions for various crop types

```python
# Changing dimensions
plt.figure( figsize =(5 ,10))

sns.violinplot(x='Crop_type', y='Rainfall', data=MD_agric_df)
plt.title("Rainfall Distribution for Various Crop Types")
plt.xlabel("Crop Type")
plt.ylabel("Rainfall")
plt.xticks(rotation=45)  # Rotate x-axis labels for better readability

plt.show()
```

A violin plot is a method of plotting numeric data and can be thought of as a combination of a box plot and a kernel density plot. It shows the distribution of the data across different levels of a categorical variable. 

In a violin plot, the width of the "violin" at any given point represents the density of the data at that value. Wider sections indicate a higher density of data points, while narrower sections indicate a lower density. 

Additionally, a central box plot is usually included within the violin, showing the interquartile range (IQR) of the data (the box spans the first quartile to the third quartile). The median is typically indicated by a horizontal line inside the box.

Violin plots are useful for comparing the distribution of data between different groups or categories, allowing for a visual assessment of differences in central tendency, spread, and shape of the distributions.

A Violin plot is similar to the KDE plot, but the distributions are split apart a bit so it is simpler to understand.

![Violin-Rainfall_distribution_by_crop_type](https://github.com/KMO-NY/Maji-Ndogo-Portfolio-Project/assets/83243036/71ab7311-915d-46de-836f-687343e2f1e0)


Used a Pandas tool called crosstab() to check the number of times categorical features co-existed.

```python
pd.crosstab(MD_agric_df['Location'],MD_agric_df['Crop_type'])
```
![count_crop_by_location_and_crop_type-1](https://github.com/KMO-NY/Maji-Ndogo-Portfolio-Project/assets/83243036/a64c9059-fdf0-4268-84c5-3e7574097c31)


Checked if variables are linearly correlated using the df.corr() method.

```python
# Calculate correlation coefficients
std_correlation_coeffs = MD_agric_df.corr()['Standard_yield'].sort_values(ascending= True)

# Print sorted correlation coefficients
print(std_correlation_coeffs)
```
![standard_yield_correlation-1](https://github.com/KMO-NY/Maji-Ndogo-Portfolio-Project/assets/83243036/055b9259-86f0-4570-b717-1b1570447cf4)

Created a DataFrame for only coffee crops (this was done for other crops as well), and then looked at the pairplot of this DataFrame to understand what affects the coffee crop. By doing this we can remove some of the complexity brought by the different crop types.

```python
coffee_df = MD_agric_df.query("Crop_type == 'coffee'")
coffee_df = coffee_df.drop(columns = ['Crop_type','Field_ID','Annual_yield'])
```
```python
sns.pairplot(coffee_df)
```
![coffee-pairplot](https://github.com/KMO-NY/Maji-Ndogo-Portfolio-Project/assets/83243036/03ffd592-a0a0-4d16-b683-a58f42bcc9da)


Calculated the means of the Weather_station_data (`weather_station_means`) and Weather_data_field_mapping (`MD_agric_df_weather_means`) then checked if the means are within 1.5% of one another.

```python
def within_tolerance_percentage(extracted, original, tolerance_pct):
    """
    Purpose: This function calculates the percentage difference between two values (extracted and original) and checks if this difference is within a specified tolerance percentage (tolerance_pct).

    Parameters:
    extracted: A numerical value representing the extracted or observed data point.
    original: A numerical value representing the original or expected data point.
    tolerance_pct: A numerical value representing the tolerance limit as a percentage.

    Returns: A Boolean value (True or False). It returns True if the percentage difference between extracted and original is less than or equal to tolerance_pct; otherwise, it returns False.

    Calculation: The percentage difference is calculated as abs((extracted - original) / original) * 100.
    """
    # Calculate the percentage difference
    percent_diff = abs((extracted - original) / original) * 100
    # Check if within tolerance
    return percent_diff <= tolerance_pct



def check_means(MD_agric_df_weather_means, weather_station_means):
    """"
    Purpose: This function iterates over two data frames (MD_agric_df_weather_means and weather_station_means), compares the mean values of corresponding entries, and checks if they are within a specified tolerance range using the within_tolerance_percentage function.

    Parameters:
    MD_agric_df_weather_means: A Pandas DataFrame containing original mean values for various measurements, indexed by weather station IDs.
    weather_station_means: A Pandas DataFrame containing extracted mean values for various measurements, indexed by weather station IDs.

    Functionality:
    Iterates through each row in weather_station_means.
    For each row, iterates through each measurement.
    Retrieves the extracted_mean from weather_station_means and the corresponding original_mean from MD_agric_df_weather_means.
    Uses the within_tolerance_percentage function to check if the extracted_mean is within the specified tolerance percentage of the original_mean.
    Keeps count of how many measurements are within and outside the tolerance range (true_count and false_count respectively).
    Prints detailed information for each measurement, including the weather station ID, measurement name, extracted mean, original mean, and whether it is within specification.

    Outputs: At the end, the function prints the total count of measurements that are within (True) and outside (False) the tolerance range.

    Note: The function assumes the existence of a global variable tolerance_pct that specifies the tolerance percentage.
    These functions appear to be particularly useful in data validation processes, where comparing data sets and ensuring their consistency within certain limits is crucial.
    """
    true_count = 0
    false_count = 0
    for index, row in weather_station_means.iterrows():

        print(f"Weather Station ID: {index}")
        for measurement in row.index:
            print (measurement)
            extracted_mean = row[measurement]
            original_mean = MD_agric_df_weather_means.loc[index, measurement]
            within_spec = within_tolerance_percentage(extracted_mean, original_mean, tolerance_pct)
            if  within_spec == True:
                true_count +=1
            else:
                false_count +=1
            print(f"  Measurement: {measurement}, Extracted Mean: {extracted_mean}, Original Mean: {original_mean}, Within Spec: {within_spec}")
            print(" ")
    print(f"True: {true_count}, False: {false_count}")



tolerance_pct = 1.5

check_means(MD_agric_df_weather_means, weather_station_means)
```
![means_compare-1](https://github.com/KMO-NY/Maji-Ndogo-Portfolio-Project/assets/83243036/2e669491-7d02-4349-8709-00aaf5a659d2)

#### 2.5.2 Regression

The goal is to determine whether any of the features in the dataset are influencing the Standard_yield of a farm. If we can figure out what these relationships are, then we can use them to start predicting what future yields will be, based on these features.

For this analysis, we want to find whether any features have a linear relationship with `Standard_yield` so that we can fit a linear regression model to the data. This is important because if we try and fit a linear regression model to non-linear data, our predictions won't be good.

Generating a scatter plot to visualise the relationship between `Ave_temps` and `Standard_yield`
```python
plt.scatter(dataset['Ave_temps'], dataset['Standard_yield'])
plt.xlabel('Average Temperature')
plt.ylabel('Standard Yield')
plt.title('Relationship between Average Temperature and Standard Yield')
plt.show()
```
![regression-ave_temp-yield](https://github.com/user-attachments/assets/0066fbe7-9942-40ab-a8b3-5f96ecb2c2e8)

```python
def get_correlation(df, col1, col2):
    """
    Takes a DataFrame and the names of the columns we want to determine the correlation for as parameters (Ave_temps and Standard_yield).
    Calculates the Pearson correlation coefficient between these two columns to quantify their linear relationship.
    Returns the Pearson correlation coefficient.
    """
    correlation, _ = pearsonr(df[col1], df[col2])
    return correlation
```
```python
correlation = get_correlation(dataset,'Ave_temps','Standard_yield')
print("Pearson correlation coefficient:", correlation)
```
RESULT: Pearson correlation coefficient: 0.006785950289020164

```python
def fit_linear_regression_model(df, pollution_col, yield_col):
    """
    Takes in a DataFrame and the names of the Pollution_level and Standard_yield columns.
    Fits a linear regression model to the data.
    Returns the model, the model predictions and the actual y-values.
    """
    X = df[[pollution_col]]
    y = df[yield_col]

    model = LinearRegression()
    model.fit(X, y)

    # Make predictions
    y_pred = model.predict(X)

    return model, y_pred, y
```

Generating a scatter plot to visualise the effect that pollution has on standard yield.
```python
X = dataset[['Pollution_level']]
y = dataset['Standard_yield']

plt.scatter(X, y, label='Actual data')
plt.plot(X, predictions, color='red', label='Regression line')
plt.xlabel('Pollution level')
plt.ylabel('Standard yield')
plt.title('Effect of Pollution on Standard Yield')
plt.legend()
plt.show()
```
![regression-pollution-yield](https://github.com/user-attachments/assets/c6714015-c195-4cfd-8b62-33e1f1c8f101)

Pearson correlation coefficient: -0.2857609646210543

```python
def get_slope_intercept(model):
    """
    Inputs the model we fitted and calculates the slope and intercept of the line of best fit.
    Returns the slope and intercept as a tuple.
    """
    slope = model.coef_[0]
    intercept = model.intercept_
    return slope, intercept
```
Slope: -0.1427617720986607
Intercept: 0.566268441539338

```python
def calculate_evaluation_metrics(predictions, y_values):
    """
    Calculates and returns the R-squared, Mean Absolute Error (MAE), Mean Squared Error (MSE), and Root Mean Squared Error (RMSE) of the model's performance.
    """
    r_squared = r2_score(y_values, predictions)
    mae = mean_absolute_error(y_values, predictions)
    mse = mean_squared_error(y_values, predictions)
    rmse = np.sqrt(mse)
    return r_squared, mae, mse, rmse
```
*Evaluation Metrics:*
R-squared: 0.08165932890115546
MAE: 0.08554642090904992
MSE: 0.011477732254034848
RMSE: 0.10713417873878928

Train-Test Split
```python
def data_train_test_split(df, pollution_col, yield_col):
    X = df[[pollution_col]]
    y = df[yield_col]

    X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=42)

    return X_train, X_test, y_train, y_test
```
```python
X_train, X_test, y_train, y_test = data_train_test_split(dataset, 'Pollution_level', 'Standard_yield')
print(f"X_train shape: {X_train.shape}, X_test shape: {X_test.shape}")
print(f"y_train shape: {y_train.shape}, y_test shape: {y_test.shape}")
```
X_train shape: (4523, 1), X_test shape: (1131, 1)
y_train shape: (4523,), y_test shape: (1131,)

```python
def train_split_linear_regression_model(X_train, X_test, y_train, y_test):
    """
    Trains a simple linear regression model on the training set.
    Uses the testing set to make predictions.
    Returns the model, the predictions and y_test (the actual y values in the testing set values) .
    """
    model = LinearRegression()
    model.fit(X_train, y_train)

    y_pred = model.predict(X_test)

    return model, y_pred, y_test
```
*Evaluation Metrics:*
R-squared: 0.08065722992150859
MAE:  0.08794942119747501
MSE: 0.012250634233355654
RMSE: 0.11068258324305434

Checking the residuals:

```python
residuals = y_test - predictions_test 

# Plot histogram of residuals
plt.hist(residuals, bins=20, edgecolor='black')
plt.xlabel('Residuals')
plt.ylabel('Frequency')
plt.title('Histogram of Residuals')
plt.show()
```
![residuals-regression](https://github.com/user-attachments/assets/7d27dd5a-fd17-4c6f-905f-bec2b183abed)

Created a scatter plot of residuals against the predicted values

```python
plt.scatter(predictions_test, residuals)
plt.axhline(y=0, color='r', linestyle='--')
plt.xlabel('Predicted Values')
plt.ylabel('Residuals')
plt.title('Residuals vs Predicted Values')
plt.show()
```
![regression-predicted-residuals](https://github.com/user-attachments/assets/dc91c02a-e168-4cae-abb7-0a2e0b806f79)

```python
def calculate_residuals_statistics(predictions, y_test):
    """
    Calculates the mean and standard deviation of the residuals.
    """
    residuals = y_test - predictions_test
    mean_residuals = np.mean(residuals)
    std_residuals = np.std(residuals)
    return mean_residuals, std_residuals
```
Mean: 0.0058580231923217015
Standard deviation: 0.11052745268770957

### 2.6. Results/Findings

#### 2.6.1. Python Packages:

- For rainfall distribution split by soil types: The distribution of the Slope variable is skewed a bit to the left, which means the mean value may not be the best measure of central tendency. Most values are below the mean, but because there are some extreme values influencing the mean calculation. 
- The KDE of Rainfall appears normal, but seems to have multiple peaks. This may indicate underlying patterns that are overlapping.
- Akatsi, on average has a higher rainfall number than Kilimani, and Amanzi's average rainfall is quite similar to Kilimani, so there is no difference really. 
- Amanzi is the province with the lowest average rainfall. Potatoes and maize seem to grow in lower rainfall regions. 
- Rice seems to grow mostly where there is about 1600 mm of annual rainfall, while Coffee can grow across a wide range of rainfall conditions. Coffee seems to be a more resilient crop than rice
- For Amanzi, potatoes, wheat and maize occur a lot more frequently than the other crops, this is because Amanzi has less rainfall, making these crops more viable.
- `Pollution_level` is inversely correlated (weak) with `Standard_yield`, so when places are polluted, crops produce less.
- `Min_temperature_C` is weakly correlated with `Standard_yield`. So when the minimum temperature is higher, crops produce more. So when it doesn't get too cold, crops grow better.
- No single feature can explain why a crop does well. There are many weak correlations and correlations only look at linear relationships, so features like `Rainfall` that have a low correlation, may just not be linearly correlated.
- Coffee crop yield has a positive correlation with rainfall, crop yields are best when there is a lot of rain.
- Coffee crop yield is higher when the soil is more fertile, so it seems coffee benefits a lot from rich soil.
- Highly polluted areas lower the crop output of coffee. Pollution has a significant effect on the crop yield.
- Location and Rainfall are connected
- Rainfall and Crop_type are connected
- Crops tend to be planted in places where they do well, but not always. Some crops prefer lower rainfall, and are therefore doing well in places with lower rainfall.
- When comparing means, it was discovered that more than half of our data did not match (not within 1,5% difference). The data might not reflect reality.

#### 2.6.2 Regression

- Linear regression, for all its strengths, assumes a straightforward relationship between the predictor and the outcome.
- Factors influencing crop yields in Maji Ndogo—be it temperature, rainfall, or pollution—interact in complex, often nonlinear ways.
- The initial model with `Ave_temps` hinted at this complexity, suggesting that the effect of the average temperature on yields might follow a more intricate pattern than a straight line can depict (or no pattern at all).
- The yield also depends on more than just the pollution or the temperature, it depends on many of the factors.
- Not all crops are affected equally by pollution or temperature, so we could simplify our model if we remove the influence of the different crops.


### 2.7. Recommendations

#### 2.7.1. Python Packages:

More data is needed: Create a data pipeline to process the different data from the different sources as it comes in for further analysis. 
Create the following: 

- data_ingestion.py
- field_data_processor.py
- weather_data_processor.py

#### 2.7.2 Regression

Attempt to use other models to find patterns and predict `standard yield`. A decision tree or better yet random forest might be the better option. Hyperparameter tuning is also advised.
