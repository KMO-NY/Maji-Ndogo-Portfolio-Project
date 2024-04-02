# Maji Ndogo Project Proposal   

## Table of Contents
---
[Project Overview](#project-overview)

[Data Sources](#data-sources)

[Tools](#tools)

[Data Cleaning/Preparations](#data-cleaningpreparations)

[EDA (Exploratory Data Analysis)](#eda-exploritory-data-analysis)

[Data Analysis](#data-analysis)

[Results/Findings](#resultsfindings)

[Recommendations](#recommendations)


### Project Overview

Maji Ndogo is a fictional country with problems that mimic real-world issues that are faced by many people in many places across the globe. Multiple areas/fictionala issues will be addressed throughout the course of this project. This project will appeal to persons and organisations that are interested in finding solutions to problems that plaugue a lot of 3rd world/under developed and developing countries as well as persons and organisations that wish for the SDG goals to be reached.

#### SQL:
The first area that is addressed is the state of the water sources in the country. This first part of the project is motivated by SDG Goal 6: Clean Water and Sanitation. This is the goal that aims ensure availability and sustainable management of water and sanitation for all. Here I will clean, analyse and visualise 60 000 records that can be found in Data sources one (1) and two (2). This data will from here on be referred to as "Water Related Data"

*Key Findings:  Most water sources are rural (60%); 43% of citizens are using shared taps (2000 people per tap); 31% of our population has water infrastructure in their homes, but within that group, 45% face non-functional systems due to issues with pipes, pumps, and reservoirs; 18% of our people are using wells, but within that, only 28% are clean; Citizens often face long wait times for water, averaging more than 120 minutes.* 

#### Data Visualisation & Storytelliing with PowerBI:
Miscrosoft PowerBI Desktop is used to visualise the data from the SQL part of the project in order to gain more insights and identify patterns that would have otherwise gone unnoticed. 
Visualisations from approx. 25 000 records from the `project_progress` and related tables - uses data sources 3 to 5.

*Key Findings: 69% of water collectors are women; 64% of crime victims in water related crimes are also women; It is almost twice as expensive to improve a source in a rural area, compared to an urban area; We are over budget in every province.*  

#### Python Packages:
Secondly, the Agricultural sector will be analysed. This will be done with the goal of automating farming in Maji Ndogo, a place with diverse and challenging agricultural landscapes. The long-term goal is to have fully autonomous farming equipment that can intelligently manage and optimise agricultural processes. This part of the project aligns with multiple SDG goals, namely:
- Zero Hunger (Goal 2): End hunger, achieve food security and improved nutrition, and promote sustainable agriculture.
- Decent Work and Economic Growth (Goal 8): Promote sustained, inclusive, and sustainable economic growth, full and productive employment, and decent work for all.
- Industry, Innovation, and Infrastructure (Goal 9): Build resilient infrastructure, promote inclusive and sustainable industrialization, and foster innovation.
- Responsible Consumption and Production (Goal 12): Ensure sustainable consumption and production patterns.
  
Here, I will create .py files to do the cleaning of data. The packages will ingest data (from the web, databases), process data (field data and weather data). The packages are named:
- data_ingestion.py
- field_data_processor.py
- weather_data_processor.py 


*Kindly note that I am still working on this project. Certain portions may change depending on the results of my EDAs, my research and recommendations.

### Data Sources

1. md_water_services.sql - A database containing the records captured from a water survey conducted in Maji Ndogo - accompanied by a data dictionary titled "Data_dictionary"
2. Auditor_report.csv - A table containing 1620 audited records from the water_quality table, quality scores - accompanied by a data dictionary titled "Data dictionary_ auditor_report"
3. Md_summary.csv - A summary informed by the ```project_progress``` table. Contains data of water sources that need to be fixed.
4. Md_water_services_data.xlsx - comes in variations Md_water_services_data, 2-Md_water_services_data, 3-Md_water_services_data, 4-Md_water_services_data. Updates ```project_progress``` and related tables up to 2027 (time period: 2022 - 2027). 
5. Md_queue_related_crime.csv - Records of crimes that can be tied to the water sources. Accompanies Md_summary.
6. Maji_Ndogo_farm_survey_small.db - Database file that contains data from the MD_agric_exam-4313.csv. Includes information on farm fields in Maji Ndogo and its related Geographic features, Weather features, Soil and crop features, and Farm management features  - accompanied by a data dictionary titled "Farming Data Dictionary" 
7. Weather_station_data - [click to view]([link]"https://raw.githubusercontent.com/Explore-AI/Public-Data/master/Maji_Ndogo/Weather_station_data.csv") - Contains the weather station unique ID and the message captured by its sensors - accompanied by a data dictionary titled "Farming Data Dictionary"
8. Weather_data_field_mapping - [click to view]([link]"https://raw.githubusercontent.com/Explore-AI/Public-Data/master/Maji_Ndogo/Weather_data_field_mapping.csv") - Comprised of the weather station unique ID and the Field IDs linked to the weather station - accompanied by a data dictionary titled "Farming Data Dictionary"


### Tools

- MySQL - version
    - [Download here]([link](https://dev.mysql.com/))
- Jupyter Notebooks - version
    - [Download here](link)
- PowerBI - version
    - [Download here]([link](https://powerbi.microsoft.com/en-us/desktop/?WT.mc_id=Blog_Desktop_Update))
- Google Colab - version
    - [Go to site]([link](https://colab.google/))
- VSCode - version
    - [Download here]([link](https://code.visualstudio.com/download))

### Data Cleaning/Preparations

#### Questions

For Water Related Data:

1. What percentage of the water sources is safe for public use and consumption?
2. How long are people standing in queues on average?
3. How many of the private taps are functioning and safe to consume?
4. What is the ratio of rural and urban water sources? PowerBI
5. Are the citizens able to safely collect water from public water sources?
6. Do factors such as age and gender affect a person's access to safe-to-consume water sources?

#### Hypothesis

For Water Related Data:  

1. Less than half (50%) of the water from wells in Maji Ndogo is safe to consume.
2. The average queue time is around 200 minutes.
3. Out of all the private taps, Less than half (50%) are functioning and safe-to-consume.
4. There are more rural sources than there are urban sources. 
5. No, the citizens aren't able to safely collect water from public water sources.
6. Women have the hardest time collecting water.


#### Approach

For Water Related Data: 

|No.| Features| Relationships| Metrics|
|---|---------|--------------|--------|
|1| subjective_quality_score, results, type_of_water_source| water_quality, water_source, well_pollution | unsafe_well_percent|  
|2| source_id, time_in_queue| well_pollution, water_source, visits| avg_queue_time_min|
|3| type_of_water_source| Features are in one table| broken_taps_percent|
|4| location_id, location_type| Features are in one table| rural_sources_percent|
|5| Crime_id, victim_gender, time_of_day| Features are in one table| Maji Ndogo Crime-related Data Report: Number of Crimes by hour of day|
|6| crime_type, victim_gender| Features are in one table| Maji Ndogo Crime-related Data Report: Gender Disparity Related to Water Collecters|


### EDA (Exploritory Data Analysis)

#### SQL:

The md_water_services.sql file was uploaded to MySQL as a database. It was cleaned and analysed. The Auditor_report.csv was added as a table to the database. This data was used to better understand the water-related problems faced as well as identify the water sources that weren't functioning, polluted or that just made it harder for citizens to collect water (by ways of crimes and exccessive queues). 

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

#### Data Visualisation & Storytelliing with PowerBI:

Md_summary and Md_queue_related_crime were uploaded to Power BI Desktop. I familiarised myself with the data by looking at the total number of people served by Location type, water source type; and how the total was spread across provinces; average queue times by days of the week, hour of day, gender and number of people; the number of crimes by crime type, victim gender and provinces. The results are in "Maji_Ndogo Familiarizing ourselves with the Data" and "Maji_Ndogo Familiarizing ourselves with the Data 2".

Uploaded "Md_water_services_data" on to Power BI Desktop. Cleaned it by making sure features had their correct data types, and that the relationships were correct. Uploaded the variations and checked that the data was ready to be analysed.


#### Python Packages:

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


### Data Analysis

#### SQL:

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
#### Data Visualisation & Storytelliing with PowerBI:

Created data reports on Crime-related data, User reports for national and provincial stakeholders, and a dashboard that the public could access to know about what was done in their area and just how much more was left to do, as well as the associated costs and key influencers.
<!-- FIX -->

#### Python Packages:

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


Created a DataFrame for only coffee crops, and then looked at the pairplot of this DataFrame to understand what affects the coffee crop. By doing this we can remove some of the complexity brought by the different crop types.

```python
coffee_df = MD_agric_df.query("Crop_type == 'coffee'")
coffee_df = coffee_df.drop(columns = ['Crop_type','Field_ID','Annual_yield'])
```
```python
sns.pairplot(coffee_df)
```
![coffee-pairplot](https://github.com/KMO-NY/Maji-Ndogo-Portfolio-Project/assets/83243036/03ffd592-a0a0-4d16-b683-a58f42bcc9da)


### Results/Findings

#### SQL:

Water Accessibility and infrastructure Summary Report:
---
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

Auditor report:
---
An audit was conducted to assess the validity of the data - whether the current records were an accurate depiction of the country's water situation. The results were as follows:
Employees Zuriel Matembo, Malachi Mavuso, Bello Azibo and Lalitha Kaburi made more mistakes than their peers on average. And they all have incriminating statements made against them, and only them.

The sources the four employees assessed could have had their issues gone unrecognised and unsolved had there not been an audit.

#### Data Visualisation & Storytelliing with PowerBI:

- It is almost twice as expensive to improve a source in a rural area, compared to an urban area.
- Sokoto has a very high average cost of improvement, both rurally and in urban areas.
- We are over budget in every province.
- We underestimated the cost of rural improvements in Sokoto

#### Python Packages:

- Location and Rainfall are connected, and that Rainfall and Crop_type are connected
- one of the big takeaways from this analysis is that crops tend to be planted in places where they do well, but not always. Some crops prefer lower rainfall, and are therefore doing well in places with lower rainfall.
- Answer questions like, what makes tea grow well?

### Recommendations

<!-- For Water Related Issues (Project Water for Everyone): -->

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
commonly affected areas though to see where the problem actually is. --fix!
6. Investigate corruption and create policies to combat it. This can involve division of duty 

**Data Visualisation & Storytelling:**

