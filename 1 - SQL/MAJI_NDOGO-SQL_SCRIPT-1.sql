USE md_water_services;
-- 1. GET TO KNOW OUR DATA: --
SHOW TABLES; 
-- Familarising myself with information
SELECT 
    *
FROM
    location
LIMIT 3;
 ---
SELECT 
    *
FROM
    visits
LIMIT 3;
 ---
 SELECT 
    *
FROM
    water_source
LIMIT 3;
-- 2. DIVE INTO THE WATER SOURCES
-- Find the unique water source types
SELECT DISTINCT
    type_of_water_source
FROM
    water_source;  
-- 3. UNPACK THE VISITS TO THE WATER SOURCES
-- Looking for persons who have to queued for abnormal times 
-- (more than 500 minutes)
SELECT 
    *
FROM
    visits
WHERE
    time_in_queue > 500;
-- Looking at how long other persons queue for water
SELECT 
    *
FROM
    visits;  
-- Found out that others queue for 0 minutes
 -- Find out the water source type that result in 500 min and 0 min respectively
 -- 500 min = 'KiRu26095224','SoRu38869224' and 0 min = 'HaZa21742224','AmDa12214224'
SELECT 
    *
FROM
    water_source
WHERE
    source_id IN ('KiRu26095224' , 'SoRu38869224',
        'HaZa21742224',
        'AmDa12214224');
-- 4. ASSESS THE QUALITY OF THE WATER SOURCES
-- Assess water source quality: Find records where the subject_quality_score is 10 
-- only looking for home taps -- and where the source was visited a second time
SELECT 
    *
FROM
    water_quality
WHERE
    subjective_quality_score = 10
        AND visit_count = 2;
-- 5. INVESTIGATE POLLUTION ISSUES
-- Retrieve well pollution data
SELECT 
    *
FROM
    well_pollution
LIMIT 3; 
-- Find erronusly inputed data (recorded result as "Clean" even though the biological > 0.01)
SELECT 
    *
FROM
    well_pollution
WHERE
    results = 'clean' AND biological > 0.01;
-- Find erronusly inputed data (recorded description as "Clean%" even though the biological > 0.01)
SELECT 
    *
FROM
    well_pollution
WHERE
    description LIKE 'clean%'
        AND biological > 0.01;
-- Create a well_pollution copy table to test update
CREATE TABLE md_water_services.well_pollution_copy AS (SELECT * FROM
    md_water_services.well_pollution);
UPDATE well_pollution_copy 
SET 
    description = 'Bacteria:E. coli'
WHERE
    description = 'Clean Bacteria: E. coli';
UPDATE well_pollution_copy 
SET 
    description = 'Bacteria: Giardia Lamblia'
WHERE
    description = 'Clean Bacteria: Giardia Lamblia';
UPDATE well_pollution_copy 
SET 
    results = 'Contaminated: Biological'
WHERE
    biological > 0.01 AND results = 'Clean';
-- check if our errors are fixed using a SELECT query on the well_pollution_copy table:
SELECT
 *
FROM
 well_pollution_copy
WHERE
 results = 'clean'
 AND 
  biological > 0.01;
--
SELECT
 *
FROM
 well_pollution_copy
WHERE
 description LIKE 'clean%'
 AND biological > 0.01;
-- CONFIRMED!
-- 1a: Updating all records that mistakenly have 
-- Clean Bacteria: E. coli to Bacteria: E. coli
UPDATE well_pollution 
SET 
    description = 'Bacteria: E. coli'
WHERE
    description = 'Clean Bacteria: E. coli';
-- 1b: Updating all records that mistakenly have 
-- Clean Bacteria: Giardia Lamblia to Bacteria: Giardia Lamblia
UPDATE well_pollution 
SET 
    description = 'Bacteria: Giardia Lamblia'
WHERE
    description = 'Clean Bacteria: Giardia Lamblia';
-- 2: Update the results column from Clean to Contaminated: Biological 
-- where the biological column has a value greater than 0.01.
UPDATE well_pollution 
SET 
    results = 'Contaminated: Biological'
WHERE
    biological > 0.01 AND results = 'Clean';
-- Calculate the % of unsafe wells
SELECT COUNT(*) FROM well_pollution; -- 17383
SELECT COUNT(*) FROM well_pollution WHERE results != 'Clean'; -- 12467
SELECT ROUND((12467 / (17383)) * 100) AS unsafe_well_percent;
-- drop test table
DROP TABLE
md_water_services.well_pollution_copy;