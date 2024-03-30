USE md_water_services;
-- Joining pieces together: finding the data we need across tables
CREATE VIEW combined_analysis_table AS
    SELECT 
        water_source.type_of_water_source AS source_type,
        location.town_name,
        location.province_name,
        location.location_type,
        water_source.number_of_people_served AS people_served,
        visits.time_in_queue,
        well_pollution.results
    FROM
        visits
            LEFT JOIN
        well_pollution ON well_pollution.source_id = visits.source_id
            INNER JOIN
        location ON location.location_id = visits.location_id
            INNER JOIN
        water_source ON water_source.source_id = visits.source_id
    WHERE
        visits.visit_count = 1;
SELECT count(*) FROM combined_analysis_table;
-- Pivot table breaking down our data into provinces and source types.
WITH province_totals AS (-- This CTE calculates the population of each province
SELECT
province_name,
SUM(people_served) AS total_ppl_serv
FROM
combined_analysis_table
GROUP BY
province_name
)
SELECT
ct.province_name,
-- These case statements create columns for each type of source.
-- The results are aggregated and percentages are calculated
ROUND((SUM(CASE WHEN source_type = 'river'
THEN people_served ELSE 0 END) * 100.0 / pt.total_ppl_serv), 0) AS river,
ROUND((SUM(CASE WHEN source_type = 'shared_tap'
THEN people_served ELSE 0 END) * 100.0 / pt.total_ppl_serv), 0) AS shared_tap,
ROUND((SUM(CASE WHEN source_type = 'tap_in_home'
THEN people_served ELSE 0 END) * 100.0 / pt.total_ppl_serv), 0) AS tap_in_home,
ROUND((SUM(CASE WHEN source_type = 'tap_in_home_broken'
THEN people_served ELSE 0 END) * 100.0 / pt.total_ppl_serv), 0) AS tap_in_home_broken,
ROUND((SUM(CASE WHEN source_type = 'well'
THEN people_served ELSE 0 END) * 100.0 / pt.total_ppl_serv), 0) AS well
FROM
combined_analysis_table ct
JOIN
province_totals pt ON ct.province_name = pt.province_name
GROUP BY
ct.province_name
ORDER BY
ct.province_name; 
-- Pivot table breaking down our data into provinces, town and source types.
WITH town_totals AS ( -- This CTE calculates the population of each town
-- Since there are two Harare towns, we have to group by province_name and town_name
SELECT province_name, town_name, SUM(people_served) AS total_ppl_serv
FROM combined_analysis_table
GROUP BY province_name,town_name
)
SELECT
ct.province_name,
ct.town_name,
ROUND((SUM(CASE WHEN source_type = 'river'
THEN people_served ELSE 0 END) * 100.0 / tt.total_ppl_serv), 0) AS river,
ROUND((SUM(CASE WHEN source_type = 'shared_tap'
THEN people_served ELSE 0 END) * 100.0 / tt.total_ppl_serv), 0) AS shared_tap,
ROUND((SUM(CASE WHEN source_type = 'tap_in_home'
THEN people_served ELSE 0 END) * 100.0 / tt.total_ppl_serv), 0) AS tap_in_home,
ROUND((SUM(CASE WHEN source_type = 'tap_in_home_broken'
THEN people_served ELSE 0 END) * 100.0 / tt.total_ppl_serv), 0) AS tap_in_home_broken,
ROUND((SUM(CASE WHEN source_type = 'well'
THEN people_served ELSE 0 END) * 100.0 / tt.total_ppl_serv), 0) AS well
FROM
combined_analysis_table ct
JOIN -- Since the town names are not unique, we have to join on a composite key
town_totals tt ON ct.province_name = tt.province_name AND ct.town_name = tt.town_name
GROUP BY  -- We group by province first, then by town.
ct.province_name,
ct.town_name
ORDER BY
ct.province_name, ct.town_name;
-- Store it as a temporary table
CREATE TEMPORARY TABLE town_aggregated_water_access
WITH town_totals AS (-- This CTE calculates the population of each town
-- Since there are two Harare towns, we have to group by province_name and town_name
SELECT province_name, town_name, SUM(people_served) AS total_ppl_serv
FROM combined_analysis_table
GROUP BY province_name,town_name
)
SELECT
ct.province_name,
ct.town_name,
ROUND((SUM(CASE WHEN source_type = 'river'
THEN people_served ELSE 0 END) * 100.0 / tt.total_ppl_serv), 0) AS river,
ROUND((SUM(CASE WHEN source_type = 'shared_tap'
THEN people_served ELSE 0 END) * 100.0 / tt.total_ppl_serv), 0) AS shared_tap,
ROUND((SUM(CASE WHEN source_type = 'tap_in_home'
THEN people_served ELSE 0 END) * 100.0 / tt.total_ppl_serv), 0) AS tap_in_home,
ROUND((SUM(CASE WHEN source_type = 'tap_in_home_broken'
THEN people_served ELSE 0 END) * 100.0 / tt.total_ppl_serv), 0) AS tap_in_home_broken,
ROUND((SUM(CASE WHEN source_type = 'well'
THEN people_served ELSE 0 END) * 100.0 / tt.total_ppl_serv), 0) AS well
FROM
combined_analysis_table ct
JOIN -- Since the town names are not unique, we have to join on a composite key
town_totals tt ON ct.province_name = tt.province_name AND ct.town_name = tt.town_name
GROUP BY  -- We group by province first, then by town.
ct.province_name,
ct.town_name
ORDER BY
ct.province_name, ct.town_name;
-- Which town has the highest ratio of people who have taps, but have no running water?
SELECT 
    province_name,
    town_name,
    ROUND(tap_in_home_broken / (tap_in_home_broken + tap_in_home) * 100,
            0) AS Pct_broken_taps
FROM
    town_aggregated_water_access
ORDER BY Pct_broken_taps DESC;
-- Create a table where our teams have the information they need to fix, upgrade and repair water sources
CREATE TABLE Project_progress (
Project_id SERIAL PRIMARY KEY,
/* Project_id −− Unique key for sources in case we visit the same
source more than once in the future.
*/
source_id VARCHAR(20) NOT NULL REFERENCES water_source(source_id) ON DELETE CASCADE ON UPDATE CASCADE,
/* source_id −− Each of the sources we want to improve should exist,
and should refer to the source table. This ensures data integrity.
*/
Address VARCHAR(50), -- Street address
Town VARCHAR(30),
Province VARCHAR(30),
Source_type VARCHAR(50),
Improvement VARCHAR(50), -- What the engineers should do at that place
Source_status VARCHAR(50) DEFAULT 'Backlog' CHECK (Source_status IN ('Backlog', 'In progress', 'Complete')),
/* Source_status −− We want to limit the type of information engineers can give us, so we
limit Source_status.
− By DEFAULT all projects are in the "Backlog" which is like a TODO list.
− CHECK() ensures only those three options will be accepted. This helps to maintain clean data.
*/
Date_of_completion DATE, -- Engineers will add this the day the source has been upgraded.
Comments TEXT -- Engineers can leave comments. We use a TEXT type that has no limit on char length
);
-- Project_progress_query
SELECT
location.address,
location.town_name,
location.province_name,
water_source.source_id,
water_source.type_of_water_source,
well_pollution.results,
CASE                         -- Interventions, depending on whether wells are chemically contaminated, or biologically contaminated.
WHEN well_pollution.results = 'Contaminated: Biological' THEN 'Install UV and RO filter'
WHEN well_pollution.results = 'Contaminated: Chemical' THEN 'Install RO filter'
WHEN water_source.type_of_water_source = 'river' THEN 'Drill well'  -- Upgrade rivers by drilling new wells nearby
WHEN water_source.type_of_water_source = 'shared_tap' AND visits.time_in_queue >= 30 THEN CONCAT("Install ", FLOOR(visits.time_in_queue/30), " taps nearby")   -- Install one tap near each shared tap for every 30 min of queue time
WHEN water_source.type_of_water_source = 'tap_in_home_broken' THEN 'Diagnose local infrastructure'
ELSE null
END AS Improvement
FROM
water_source
LEFT JOIN
well_pollution ON water_source.source_id = well_pollution.source_id
INNER JOIN
visits ON water_source.source_id = visits.source_id
INNER JOIN
location ON location.location_id = visits.location_id 
WHERE
visits.visit_count = 1 -- This must always be true
AND ( -- AND one of the following (OR) options must be true as well.
well_pollution.results != 'Clean'
OR water_source.type_of_water_source IN ('tap_in_home_broken','river')
OR (water_source.type_of_water_source = 'shared_tap' AND visits.time_in_queue >= 30)
);
-- Check for null values
with test_progress as (SELECT
location.address,
location.town_name,
location.province_name,
water_source.source_id,
water_source.type_of_water_source,
well_pollution.results,
CASE                         -- Interventions, depending on whether wells are chemically contaminated, or biologically contaminated.
WHEN well_pollution.results = 'Contaminated: Biological' THEN 'Install UV and RO filter'
WHEN well_pollution.results = 'Contaminated: Chemical' THEN 'Install RO filter'
WHEN water_source.type_of_water_source = 'river' THEN 'Drill well'  -- Upgrade rivers by drilling new wells nearby
WHEN water_source.type_of_water_source = 'shared_tap' AND visits.time_in_queue >= 30 THEN CONCAT("Install ", FLOOR(visits.time_in_queue/30), " taps nearby")   -- Install one tap near each shared tap for every 30 min of queue time
WHEN water_source.type_of_water_source = 'tap_in_home_broken' THEN 'Diagnose local infrastructure'
ELSE null
END AS Improvement
FROM
water_source
LEFT JOIN
well_pollution ON water_source.source_id = well_pollution.source_id
INNER JOIN
visits ON water_source.source_id = visits.source_id
INNER JOIN
location ON location.location_id = visits.location_id 
WHERE
visits.visit_count = 1 -- This must always be true
AND ( -- AND one of the following (OR) options must be true as well.
well_pollution.results != 'Clean'
OR water_source.type_of_water_source IN ('tap_in_home_broken','river')
OR (water_source.type_of_water_source = 'shared_tap' AND visits.time_in_queue >= 30)
)) select * from test_progress where improvement is null;
-- NO NULL VALUES
-- Insert data from Project_progress_query into project_progress table
-- First, create a view called Project_progress_view
CREATE VIEW Project_progress_view AS (SELECT
water_source.source_id,
location.address,
location.town_name,
location.province_name,
water_source.type_of_water_source,
well_pollution.results,
CASE                         -- Interventions, depending on whether wells are chemically contaminated, or biologically contaminated.
WHEN well_pollution.results = 'Contaminated: Biological' THEN 'Install UV and RO filter'
WHEN well_pollution.results = 'Contaminated: Chemical' THEN 'Install RO filter'
WHEN water_source.type_of_water_source = 'river' THEN 'Drill well'  -- Upgrade rivers by drilling new wells nearby
WHEN water_source.type_of_water_source = 'shared_tap' AND visits.time_in_queue >= 30 THEN CONCAT("Install ", FLOOR(visits.time_in_queue/30), " taps nearby")   -- Install one tap near each shared tap for every 30 min of queue time
WHEN water_source.type_of_water_source = 'tap_in_home_broken' THEN 'Diagnose local infrastructure'
ELSE null
END AS Improvement
FROM
water_source
LEFT JOIN
well_pollution ON water_source.source_id = well_pollution.source_id
INNER JOIN
visits ON water_source.source_id = visits.source_id
INNER JOIN
location ON location.location_id = visits.location_id 
WHERE
visits.visit_count = 1 -- This must always be true
AND ( -- AND one of the following (OR) options must be true as well.
well_pollution.results != 'Clean'
OR water_source.type_of_water_source IN ('tap_in_home_broken','river')
OR (water_source.type_of_water_source = 'shared_tap' AND visits.time_in_queue >= 30)
)); 
INSERT INTO 
	md_water_services.project_progress
    (source_id, Address, Town, Province, Source_type, Improvement)
SELECT 
	source_id,
	address,
	town_name,
	province_name,
	type_of_water_source,
    Improvement
FROM project_progress_view;
SELECT * FROM project_progress LIMIT 3