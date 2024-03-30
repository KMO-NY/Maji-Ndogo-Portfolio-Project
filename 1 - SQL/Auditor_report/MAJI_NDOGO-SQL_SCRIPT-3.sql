-- Generating an ERD
-- Add Auditor Report to db
USE md_water_services;
DROP TABLE IF EXISTS `auditor_report`;
CREATE TABLE `auditor_report` (
    `location_id` VARCHAR(32),
    `type_of_water_source` VARCHAR(64),
    `true_water_source_score` INT DEFAULT NULL,
    `statements` VARCHAR(255)
);
-- 
SELECT 
    *
FROM
    auditor_report
LIMIT 3;
-- Integrating the Auditor's reporT
-- Is there a difference in the scores?
SELECT 
    ar.location_id,
    v.record_id,
    ar.true_water_source_score AS auditor_score,
    wq.subjective_quality_score AS surveyor_score
FROM
    auditor_report ar
        JOIN
    visits v ON ar.location_id = v.location_id
        JOIN
    water_quality wq ON v.record_id = wq.record_id;
-- Auditor file had 1620 records, however, rows returned from query are 2698. 
-- Reason: Multiple visits were made to 1 location 
-- Checking for differences in scores
SELECT 
    ar.location_id,
    v.record_id,
    ar.true_water_source_score AS auditor_score,
    wq.subjective_quality_score AS surveyor_score
FROM
    auditor_report ar
        JOIN
    visits v ON ar.location_id = v.location_id
        JOIN
    water_quality wq ON v.record_id = wq.record_id
WHERE
    ar.true_water_source_score = wq.subjective_quality_score
        AND v.visit_count = 1;
-- how many places audited had correct scores?
-- 1518/1620 = 94%
-- Incorrectly scored
SELECT 
    ar.location_id,
    v.record_id,
    ar.true_water_source_score AS auditor_score,
    wq.subjective_quality_score AS surveyor_score
FROM
    auditor_report ar
        JOIN
    visits v ON ar.location_id = v.location_id
        JOIN
    water_quality wq ON v.record_id = wq.record_id
WHERE
    ar.true_water_source_score != wq.subjective_quality_score
        AND v.visit_count = 1;
-- Checking whether the integrity of the type of water source is maintained
SELECT 
    ar.location_id,
    ar.type_of_water_source AS auditor_source,
    ws.type_of_water_source AS survey_source,
    v.record_id,
    ar.true_water_source_score AS auditor_score,
    wq.subjective_quality_score AS surveyor_score
FROM
    auditor_report ar
        JOIN
    visits v ON ar.location_id = v.location_id
        JOIN
    water_quality wq ON v.record_id = wq.record_id
        JOIN
    water_source ws ON v.source_id = ws.source_id
WHERE
    ar.true_water_source_score != wq.subjective_quality_score
        AND v.visit_count = 1;
-- even though the scores are wrong, the integrity of the type_of_water_source data we analysed last time is not affected.
-- 3. Linking records to employees 
-- joining the employee data, we can see which employees made these incorrect records.
SELECT 
    ar.location_id,
    v.record_id,
    ar.true_water_source_score AS auditor_score,
    wq.subjective_quality_score AS surveyor_score,
    v.assigned_employee_id
FROM
    auditor_report ar
        JOIN
    visits v ON ar.location_id = v.location_id
        JOIN
    water_quality wq ON v.record_id = wq.record_id
WHERE
    ar.true_water_source_score != wq.subjective_quality_score
        AND v.visit_count = 1;
-- employee ID is not enough. finding out their names
SELECT 
    ar.location_id,
    v.record_id,
    ar.true_water_source_score AS auditor_score,
    wq.subjective_quality_score AS surveyor_score,
    e.employee_name
FROM
    auditor_report ar
        JOIN
    visits v ON ar.location_id = v.location_id
        JOIN
    water_quality wq ON v.record_id = wq.record_id
        JOIN
    employee e ON v.assigned_employee_id = e.assigned_employee_id
WHERE
    ar.true_water_source_score != wq.subjective_quality_score
        AND v.visit_count = 1; 
-- Incorrect records CTE
WITH Incorrect_records AS (SELECT 
    ar.location_id,
    v.record_id,
    ar.true_water_source_score AS auditor_score,
    wq.subjective_quality_score AS surveyor_score,
    e.employee_name
FROM
    auditor_report ar
        JOIN
    visits v ON ar.location_id = v.location_id
        JOIN
    water_quality wq ON v.record_id = wq.record_id
        JOIN
    employee e ON v.assigned_employee_id = e.assigned_employee_id
WHERE
    ar.true_water_source_score != wq.subjective_quality_score
        AND v.visit_count = 1) SELECT * FROM Incorrect_records;
-- Calculate the number of times someone's name comes up
WITH Incorrect_records AS (SELECT 
    ar.location_id,
    v.record_id,
    ar.true_water_source_score AS auditor_score,
    wq.subjective_quality_score AS surveyor_score,
    e.employee_name
FROM
    auditor_report ar
        JOIN
    visits v ON ar.location_id = v.location_id
        JOIN
    water_quality wq ON v.record_id = wq.record_id
        JOIN
    employee e ON v.assigned_employee_id = e.assigned_employee_id
WHERE
    ar.true_water_source_score != wq.subjective_quality_score
        AND v.visit_count = 1) select distinct employee_name from Incorrect_records;
-- how many mistakes did each employee make?
WITH Incorrect_records AS (SELECT 
    ar.location_id,
    v.record_id,
    ar.true_water_source_score AS auditor_score,
    wq.subjective_quality_score AS surveyor_score,
    e.employee_name
FROM
    auditor_report ar
        JOIN
    visits v ON ar.location_id = v.location_id
        JOIN
    water_quality wq ON v.record_id = wq.record_id
        JOIN
    employee e ON v.assigned_employee_id = e.assigned_employee_id
WHERE
    ar.true_water_source_score != wq.subjective_quality_score
        AND v.visit_count = 1) SELECT DISTINCT employee_name, count(*) as num_of_mistakes FROM Incorrect_records GROUP BY employee_name ORDER BY count(*) DESC;
-- 4. Gathering some evidence 
-- Incorrect_records view
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
-- test 
 SELECT * FROM Incorrect_records;
WITH error_count AS ( -- This CTE calculates the number of mistakes each employee made
SELECT
distinct employee_name,
COUNT(*) AS num_of_mistakes
FROM
Incorrect_records
/*
Incorrect_records is a view that joins the audit report to the database
for records where the auditor and
employees scores are different
*/
GROUP BY
employee_name)
-- Query
SELECT * FROM error_count;
-- (b) Find the average for number of mistakes
WITH error_count AS (SELECT 
DISTINCT employee_name, count(*) as num_of_mistakes 
FROM Incorrect_records 
GROUP BY employee_name) 
SELECT AVG(num_of_mistakes) as avg_error_count_per_empl FROM error_count;
-- (c) find all of the employees who have an above-average number of mistakes 
-- (creating suspect list)
WITH error_count AS (
    SELECT 
        DISTINCT employee_name, 
        COUNT(*) as num_of_mistakes 
    FROM Incorrect_records 
    GROUP BY employee_name
),
avg_error_count_per_empl AS (
    SELECT AVG(num_of_mistakes) as avg_error_count 
    FROM error_count
)
SELECT 
    employee_name, 
    num_of_mistakes
FROM error_count
CROSS JOIN avg_error_count_per_empl
WHERE num_of_mistakes > avg_error_count 
order by num_of_mistakes DESC;
-- convert the suspect_list to a CTE
WITH error_count AS ( -- This CTE calculates the number of mistakes each employee made
SELECT
employee_name,
COUNT(employee_name) AS num_of_mistakes
FROM
Incorrect_records
/*
Incorrect_records is a view that joins the audit report to the database
for records where the auditor and
employees scores are different
*/
GROUP BY
employee_name),
suspect_list AS (-- This CTE SELECTS the employees with above−average mistakes
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
-- Filter the records that refer to "cash".
SELECT 
    employee_name
FROM
    Incorrect_records
WHERE
    statements LIKE '%cash%'
GROUP BY employee_name;
-- Only employees from suspect list have statements that mention cash
-- Update unsafe_well_percent
SELECT COUNT(*) FROM project_progress_view WHERE type_of_water_source = "well"; -- 12467
-- Result is the same. There aren't any wells that were incorrectly recorded as "Clean".
-- SELECT ROUND((12467 / (17383)) * 100) AS unsafe_well_percent = 72%