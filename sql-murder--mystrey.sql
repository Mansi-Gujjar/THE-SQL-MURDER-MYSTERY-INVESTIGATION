-- =====================================================
-- SQL Murder Mystery – Complete Investigation Report
-- =====================================================
-- Objective:
-- Identify the murderer using database investigation techniques.
-- Then uncover the mastermind behind the crime.
-- =====================================================


-- =====================================================
-- STEP 1: Retrieve the murder crime scene report
-- =====================================================
-- We begin by locating the official crime report for the
-- murder that occurred on January 15, 2018 in SQL City.

SELECT *
FROM crime_scene_report
WHERE date = '20180115'
  AND type = 'murder'
  AND city = 'SQL City';

-- Key Findings:
-- • Two witnesses were identified:
--   1) A person living at the last house on "Northwestern Dr"
--   2) Annabel who lives on "Franklin Ave"
-- These individuals may have critical eyewitness information.


-- =====================================================
-- STEP 2: Identify Witness #1 (Last house on Northwestern Dr)
-- =====================================================
-- To find the resident of the last house, we:
-- 1) Filter by street name
-- 2) Sort by address number in descending order
-- 3) Select the highest number (last house)

SELECT *
FROM person
WHERE address_street_name = 'Northwestern Dr'
ORDER BY address_number DESC
LIMIT 1;

-- Result:
-- Morty Schapiro (id = 14887)


-- =====================================================
-- STEP 3: Identify Witness #2 (Annabel on Franklin Ave)
-- =====================================================
-- The report states her name is Annabel and she lives on
-- Franklin Ave. We use a LIKE filter to match her name.

SELECT *
FROM person
WHERE name LIKE '%Annabel%'
  AND address_street_name = 'Franklin Ave';

-- Result:
-- Annabel Miller (id = 16371)


-- =====================================================
-- STEP 4: Retrieve Interview Transcripts
-- =====================================================
-- We now analyze their interviews for investigative clues.

SELECT *
FROM interview
WHERE person_id IN (14887, 16371);

-- Critical Clues Discovered:
-- • The suspect had a "Get Fit Now Gym" bag.
-- • Membership number started with "48Z".
-- • Only gold members have those bags.
-- • The suspect fled in a vehicle with plate containing "H42W".
-- • The suspect was seen at the gym on January 9th.


-- =====================================================
-- STEP 5: Identify Gold Gym Members with ID starting '48Z'
-- =====================================================
-- We narrow suspects to:
-- 1) Gold members
-- 2) Membership IDs beginning with "48Z"

SELECT *
FROM get_fit_now_member
WHERE membership_status = 'gold'
  AND id LIKE '48Z%';

-- Suspect List:
-- • 48Z7A → Joe Germuska (person_id = 28819)
-- • 48Z55 → Jeremy Bowers (person_id = 67318)


-- =====================================================
-- STEP 6: Search for Matching License Plates
-- =====================================================
-- From witness testimony:
-- Plate number contains the substring "H42W".
-- We search the drivers_license table accordingly.

SELECT *
FROM drivers_license
WHERE plate_number LIKE '%H42W%';

-- Three vehicles match this pattern.
-- We must now cross-reference these with our gym suspects.


-- =====================================================
-- STEP 7: Cross-Reference Suspects with Vehicle Data
-- =====================================================
-- We join person and drivers_license tables
-- to check whether either suspect owns a matching plate.

SELECT p.name,
       p.id,
       d.plate_number
FROM person p
JOIN drivers_license d
     ON d.id = p.license_id
WHERE p.id IN (67318, 28819)
  AND d.plate_number LIKE '%H42W%';

-- Result:
-- Jeremy Bowers (id = 67318)
-- Plate matches the witness description.

-- =====================================================
-- CONCLUSION (Primary Case)
-- =====================================================
-- Jeremy Bowers is confirmed as the murderer.


-- =====================================================
-- BONUS INVESTIGATION: Identify the Mastermind
-- =====================================================


-- =====================================================
-- STEP 8: Analyze Jeremy Bowers' Interview
-- =====================================================
-- Jeremy confesses he was hired by a wealthy woman.
-- Provided Characteristics:
-- • Female
-- • Red hair
-- • Height between 65" and 67"
-- • Drives a Tesla Model S
-- • Attended SQL Symphony Concert 3 times in Dec 2017


SELECT *
FROM interview
WHERE person_id = 67318;


-- =====================================================
-- STEP 9: Identify Individual Matching All Criteria
-- =====================================================
-- We join multiple tables:
-- • person
-- • drivers_license
-- • income
-- • facebook_event_checkin
-- Then filter according to all described attributes.

SELECT p.id,
       p.name,
       d.hair_color,
       d.height,
       d.gender,
       i.annual_income,
       d.car_make,
       d.car_model,
       f.event_name
FROM person p
LEFT JOIN drivers_license d
       ON d.id = p.license_id
LEFT JOIN income i
       ON i.ssn = p.ssn
LEFT JOIN facebook_event_checkin f
       ON f.person_id = p.id
WHERE d.hair_color = 'red'
  AND d.height BETWEEN 65 AND 67
  AND d.gender = 'female'
  AND d.car_model = 'Model S'
  AND f.event_name = 'SQL Symphony Concert';

-- Final Result:
-- Miranda Priestly (id = 99716)


-- =====================================================
-- FINAL CONCLUSION
-- =====================================================
-- Murderer: Jeremy Bowers
-- Mastermind: Miranda Priestly
--
-- This case was solved using:
-- • Filtering (WHERE)
-- • Pattern matching (LIKE)
-- • Sorting & limiting
-- • Multi-table JOIN operations
-- • Logical deduction from witness statements
--
-- Case Closed.
-- =====================================================