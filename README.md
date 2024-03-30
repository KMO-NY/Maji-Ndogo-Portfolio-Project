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
[Limitations](#limitations)
[References](#references)

### Project Overview
<!-- /Write a 5-6 sentence paragraph describing your project; include who might be interested to learn about your findings. Who might be your audience?/ -->

Maji Ndogo is a fictional country with problems that mimic real-world issues that are faced by many people in many places across the globe. The first area that is addressed is the state of the water sources in the country. Here I will clean, analyse and visualise 60 000 records that can be found in Data sources 1 - 5. Secondly, the Agricultural sector will be analysed. 
<!-- -!-!-!  Review! -->
This project will appeal to persons and organisations that are interested in finding solutions to problems that plaugue a lot of 3rd world/under developed and developing countries as well persons and organisations that wish for the SDG goals to be reached. 

### Data Sources

1. md_water_services.sql - A database containing the records captured from a water survey conducted in Maji Ndogo - accompanied by a data dictionary titled "Data_dictionary"
2. Auditor_report.csv - A table containing 1620 audited records from the water_quality table, quality scores - accompanied by a data dictionary titled "Data dictionary_ auditor_report"
3. Md_summary.csv - A summary informed by the ```project_progress``` table. Contains data of water sources that need to be fixed.
4. Md_water_services_data.xlsx - comes in variations Md_water_services_data, 2-Md_water_services_data, 3-Md_water_services_data, 4-Md_water_services_data. Updates ```project_progress``` and related tables up to 2027 (time period: 2022 - 2027). 
5. Md_queue_related_crime.csv - Records crimes that can be tied to water sources. Accompanies Md_summary.
<!-- 6. Maji_Ndogo_farm_survey_small.db - explanation - accompanied by a data dictionary titled "-" -->


### Tools

- MySQL - explaination
    - [Download here](link)
- Jupyter Notebooks - explaination
    - [Download here](link)
- PowerBI - explaination
    - [Download here](link)
- Google Colab - explaination
    - [Go to site](link)

### Data Cleaning/Preparations

#### Questions
<!-- /Create 2-3 questions that you want to answer with the data: -->
<!-- T​his will be easier to answer once you've had an opportunity to look at the data and do some initial exploration. -->
<!-- D​on't get carried away on the analysis piece at this stage as there will be more analysis later. -->
<!-- D​o focus on key data elements that are present. For instance: What are they, when are they, who are they about? Do they connect? How do they connect? Jot down ideas as you brainstorm./ -->

<!-- For Water Related Data:  -->

1. What percentage of the water sources is safe for public use and consumption?
2. How long are people standing in queues on average?
3. How many of the private taps are functioning and safe to consume?
4. What is the ratio of rural and urban water sources? PowerBI
5. Are the citizens able to safely collect water from public water sources?
6. Do factors such as age and gender affect a person's access to safe-to-consume water sources?


#### Hypothesis
<!-- /W​hat are your initial hypotheses about the data? -->
<!-- W​rite 2-3 assumptions about the data that you'll want to go back to prove or disprove. You will want to keep them in front of you as you look at the data to keep them or change them. You may see relationships that you want to explore and will develop a "belief" about the data.  -->
<!-- Start documenting what you think you can tell from the data.  -->
<!-- What pops up as interesting to you? Most likely it will be interesting to others as well. -->
<!-- U​se the discussion boards to discuss with others about your client and the data to brainstorm together./ -->

<!-- For Water Related Data:  -->

1. Less than half (50%) of the water from wells in Maji Ndogo is safe to consume.
2. The average queue time is around 200 minutes.
3. Out of all the private taps, Less than half (50%) are functioning and safe-to-consume.
4. There are more rural sources than there are urban sources. 
5. No, the citizens aren't able to safely collect water from public water sources.
6. Women have the hardest time collecting water.

#### Approach
<!-- /Describe in 5-6 sentences w​hat approach you are going to take in order to prove (or disprove) your hypotheses. Think about the following in your answer:  -->
<!-- W​hat features (fields/columns) are you going to look at first? -->
<!-- I​s there a relationship that exists that you want to explore? -->
<!-- W​hat metric/ evaluation measure will you use?/ -->

For Water Related Data: 

|---|---------|--------------|--------|
|No.| Features| Relationships| Metrics|
|---|---------|--------------|--------|
|1| subjective_quality_score, results, type_of_water_source| water_quality, water_source, well_pollution | unsafe_well_percent|  
|2| source_id, time_in_queue| well_pollution, water_source, visits| avg_queue_time_min|
|3| type_of_water_source| Features are in one table| broken_taps_percent|
|4| location_id, location_type| Features are in one table| rural_sources_percent|
|5| Crime_id, victim_gender, time_of_day| Features are in one table| Maji Ndogo Crime-related Data Report: Number of Crimes by hour of day|
|6| crime_type, victim_gender| Features are in one table| Maji Ndogo Crime-related Data Report: Gender Disparity Related to Water Collecters|
|---|---------|--------------|--------|


### EDA (Exploritory Data Analysis)
<!-- /Describe the steps you took to import and clean the data -->
<!-- Perform initial exploration of data and provide some screenshots or display some stats of the data you are looking at. -->
<!-- Create an ERD or proposed ERD to show the relationships of the data you are exploring./  -->

The md_water_services.sql file was uploaded to MySQL as a database. It was cleaned and analysed. The Auditor_report.csv was added as a table to the database. This data was used to better understand the water-related problems faced as well as identify the water sources that weren't functioning, polluted or that just made it harder for citizens to collect water (by ways of crimes and exccessive queues). 

[First Look at the Dataset]("C:\Users\shiir\Documents\Comp_local Data Science Projects and Practice Scripts\Maji Ndogo Portfolio Project\1 - Maji-Ndogo -- SQL\EER_Diagram-md_water_services-first_look.png")

Finding out the  water source types:

```sql
SELECT DISTINCT
    type_of_water_source
FROM
    water_source;
```
[Result]("C:\Users\shiir\Documents\Comp_local Data Science Projects and Practice Scripts\Maji Ndogo Portfolio Project\1 - Maji-Ndogo -- SQL\types_of_water_sources_in_Maji.csv")

Looking for persons who have to queued for abnormal times (more than 500 minutes):

```sql
SELECT 
    *
FROM
    visits
WHERE
    time_in_queue > 500;
```
[Result]("C:\Users\shiir\Documents\Comp_local Data Science Projects and Practice Scripts\Maji Ndogo Portfolio Project\1 - Maji-Ndogo -- SQL\queue_time_exceeds_500_min.csv")

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
[Result]("C:\Users\shiir\Documents\Comp_local Data Science Projects and Practice Scripts\Maji Ndogo Portfolio Project\1 - Maji-Ndogo -- SQL\0vs500_queues.csv")

The 500 minute queue times were from "shared tap" water sources, whereas the 0 minute queue times were from "well" and "tap_in_home" water sources. 

**Data Visualisation & Storytelling:**

Md_summary and Md_queue_related_crime were uploaded to Power BI Desktop. I familiarised myself with the data by looking at the total number of people served by Location type, water source type; and how the total was spread across provinces; average queue times by days of the week, hour of day, gender and number of people; the number of crimes by crime type, victim gender and provinces. The results are in "Maji_Ndogo Familiarizing ourselves with the Data" and "Maji_Ndogo Familiarizing ourselves with the Data 2".

Uploaded "Md_water_services_data" on to Power BI Desktop. Cleaned it by making sure features had their correct data types, and that the relationships were correct. Uploaded the variations and checked that the data was ready to be analysed.

### Data Analysis

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
**Data Visualisation & Storytelling:**

Created data reports on Crime-related data, User reports for national and provincial stakeholders, and a dashboard that the public could access to know about what was done in their area and just how much more was left to do, as well as the associated costs and key influencers.
<!-- FIX -->

### Results/Findings

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

**Data Visualisation & Storytelling:**

- It is almost twice as expensive to improve a source in a rural area, compared to an urban area.
- Sokoto has a very high average cost of improvement, both rurally and in urban areas.
- We are over budget in every province.
- We underestimated the cost of rural improvements in Sokoto

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

