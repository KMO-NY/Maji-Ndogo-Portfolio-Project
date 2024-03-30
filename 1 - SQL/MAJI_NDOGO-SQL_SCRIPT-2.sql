--  1. Cleaning our data
-- Add email addresses to db using employee names, create new column to test out change
SELECT 
    CONCAT(LOWER(REPLACE(employee_name, ' ', '.')),
            '@ndogowater.gov') AS new_email
FROM
    employee
LIMIT 3;
-- Update employee table with emails
UPDATE employee 
SET 
    email = CONCAT(LOWER(REPLACE(employee_name, ' ', '.')),
            '@ndogowater.gov'); 
-- Count length of phone number string - should return 12 
SELECT 
    LENGTH(phone_number)
FROM
    employee
LIMIT 5; 
-- Trim phone number length to get correct 12 count
SELECT 
    TRIM(phone_number) AS new_phone_number
FROM
    employee
LIMIT 5;
-- Update new trimmed phone number 
UPDATE employee 
SET 
    phone_number = TRIM(phone_number); 
-- Count length again to confirm that the length count is the correct 12 
SELECT 
    LENGTH(phone_number)
FROM
    employee
LIMIT 5; 
-- 2.Honouring the workers
-- Count number of employees in each town
SELECT 
    COUNT(assigned_employee_id) AS employee_count, town_name
FROM
    employee
GROUP BY town_name; 
-- Count the number of visits made by each employee 
SELECT 
    COUNT(visit_count) AS total_visits, assigned_employee_id
FROM
    visits
GROUP BY assigned_employee_id
ORDER BY COUNT(visit_count) DESC
LIMIT 3; 
-- Find out the contact details of employees that made the most visits
SELECT 
    employee_name, email, phone_number
FROM
    employee
WHERE
    assigned_employee_id IN (1 , 30, 34); 
-- 3. Analysing locations
-- Count the number of records (locations) per town
SELECT 
    COUNT(location_id) AS records_per_town, town_name
FROM
    location
GROUP BY town_name
ORDER BY records_per_town DESC;
-- Count the number of records (locations) per province
SELECT 
    COUNT(location_id) AS records_per_province, province_name
FROM
    location
GROUP BY province_name
ORDER BY records_per_province DESC; 
-- Create a result set showing: province_name, town_name, records_per_town
SELECT 
    province_name,
    town_name,
    COUNT(location_id) AS records_per_town
FROM
    location
GROUP BY province_name , town_name
ORDER BY province_name ASC , records_per_town DESC;
-- Count number of sources per location type
SELECT 
    COUNT(location_id) AS num_sources, location_type
FROM
    location
GROUP BY location_type;
-- Count number of sources per location type
SELECT 
    COUNT(location_id) AS num_sources, location_type
FROM
    location
GROUP BY location_type;
-- What's the % of rural sources?
SELECT ROUND((23740 / (15910 + 23740)) * 100) AS rural_sources_percent;
-- 4. Diving into the sources
SELECT 
    *
FROM
    water_source
LIMIT 3;
-- How many people did we survey in total?
SELECT 
    SUM(number_of_people_served) AS total_people_surveyed
FROM
    water_source;
-- How many wells, taps and rivers are there?
SELECT 
    type_of_water_source, COUNT(source_id) AS num_sources 
FROM
    water_source
GROUP BY type_of_water_source
ORDER BY num_sources DESC;
-- How many people share particular types of water sources on average?
SELECT 
    type_of_water_source,
    ROUND(AVG(number_of_people_served), 0) AS avg_num_of_people_sharing
FROM
    water_source
GROUP BY type_of_water_source
ORDER BY avg_num_of_people_sharing DESC;
-- How many people are getting water from each type of source?
SELECT 
    type_of_water_source,
    SUM(number_of_people_served) AS total_num_of_people_sharing
FROM
    water_source
GROUP BY type_of_water_source
ORDER BY SUM(number_of_people_served) DESC;
-- % people are getting water from each type of source?
SELECT 
    type_of_water_source,
    ROUND(SUM(number_of_people_served) / 27628140 * 100) AS total_num_of_people_sharing
FROM
    water_source
GROUP BY type_of_water_source
ORDER BY SUM(number_of_people_served) DESC;
-- How many of the taps are functioning?
SELECT ROUND((5856 / (7265 + 5856)) * 100) AS broken_taps_percent;
-- 5. Start of a solution
-- Rank types of water sources by the number of people they serve
SELECT 
    type_of_water_source, 
    SUM(number_of_people_served) AS total_people_served,
    RANK() OVER (ORDER BY SUM(number_of_people_served) DESC) AS rank_by_people_served
FROM 
    water_source
GROUP BY 
    type_of_water_source;
-- Rank types of water sources by the number of people they serve (excluding functioning inhome taps)
SELECT 
    type_of_water_source, 
    SUM(number_of_people_served) AS total_people_served,
    RANK() OVER (ORDER BY SUM(number_of_people_served) DESC) AS rank_by_people_served
FROM 
    water_source
WHERE  type_of_water_source != 'tap_in_home'
GROUP BY 
    type_of_water_source;
-- Rank types of water sources by the number of people they serve (excluding functioning inhome taps) 
-- & prioritise the sources that need to be fixed within each source type
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
-- 6. Analysing queues
-- How long did the survey take?
SELECT 
    MIN(time_of_record) AS start_time,
    MAX(time_of_record) AS end_time,
    DATEDIFF(MAX(time_of_record), MIN(time_of_record)) AS length_of_survey_days
FROM
    visits;
-- What is the average total queue time for water?
SELECT 
    ROUND(AVG(NULLIF(time_in_queue, 0))) AS avg_queue_time_min
FROM
    visits;
-- What is the average queue time on different days?
SELECT 
    DAYNAME(time_of_record) AS day_of_week,
    ROUND(AVG(NULLIF(time_in_queue, 0))) AS avg_queue_time_min
FROM
    visits
GROUP BY DAYNAME(time_of_record);
-- What is the average queue time on different days & at different times?
SELECT 
    DAYNAME(time_of_record) AS day_of_week,
    TIME_FORMAT(TIME(time_of_record), '%H:00') AS hour_of_day,
    ROUND(AVG(NULLIF(time_in_queue, 0))) AS avg_queue_time_min
FROM
    visits
GROUP BY DAYNAME(time_of_record) , TIME_FORMAT(TIME(time_of_record), '%H:00');
-- What is the average queue time at different times of the day?
SELECT 
    TIME_FORMAT(TIME(time_of_record), '%H:00') AS hour_of_day,
    ROUND(AVG(NULLIF(time_in_queue, 0))) AS avg_queue_time_min
FROM
    visits
GROUP BY TIME_FORMAT(TIME(time_of_record), '%H:00')
ORDER BY hour_of_day ASC;
-- How can we communicate this information efficiently?
SELECT 
    TIME_FORMAT(TIME(time_of_record), '%H:00') AS hour_of_day,
    DAYNAME(time_of_record),
    CASE
        WHEN DAYNAME(time_of_record) = 'Sunday' THEN time_in_queue
        ELSE NULL
    END AS Sunday
FROM
    visits
WHERE
    time_in_queue != 0;
-- full week
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