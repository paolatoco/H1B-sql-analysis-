DELETE FROM socs WHERE soc_id > 1;

SELECT * FROM `case_application`;

SELECT COUNT(case_id) FROM case_application;

USE t13_h1b;

select employer_state, state_id
from states
where employer_state 
;

# question 1: Which are the top employers in a certain state in a certain industry?
SELECT e.employer_name, n.naics, s.employer_state, SUM(total_worker_position) AS total_workers
FROM case_application AS cs
INNER JOIN employers AS e ON cs.employer_id = e.employer_id
INNER JOIN states AS s ON cs.state_id = s.state_id
INNER JOIN naics_id AS n ON cs.naics_id = n.naics_id
WHERE n.naics = "Professional Scientific and Technical Services"
AND s.employer_state = "NY"
GROUP BY e.employer_name
ORDER BY total_workers DESC
LIMIT 3
;

# question 2: Which functions seem to pay the most?
SELECT so.soc_title AS functions, AVG(FORMAT(cs.prevaling_wage, '#,##0')) AS avg_salary
FROM case_application AS cs 
INNER JOIN socs AS so ON cs.soc_id = so.soc_id
GROUP BY functions
ORDER BY avg_salary DESC
LIMIT 3
;

# Question 3: Are there certain types of jobs concentrated in certain geographical areas?
SELECT so.soc_title AS job_title, s.state,
		CASE( 
			WHEN s.state = "ME"
        END) AS geographical_area
FROM case_application AS cs
INNER JOIN socs AS so ON cs.soc_id = cs.soc_id
INNER JOIN states AS s ON cs.state_id = s.state_id
WHERE s.state IN ("ME", "NH", "MA", "CT", "RI", "VT", "NY", "NJ", "PA") = 
;

#SQL codes

SELECT e.employer_name, n.naics, s.employer_state, SUM(total_worker_position) AS total_workers
FROM case_application AS cs
INNER JOIN employers AS e ON cs.employer_id = e.employer_id
INNER JOIN states AS s ON cs.state_id = s.state_id
INNER JOIN naics_id AS n ON cs.naics_id = n.naics_id
WHERE n.naics = "Professional Scientific and Technical Services"
AND s.employer_state = "NY"
GROUP BY e.employer_name
ORDER BY total_workers DESC
LIMIT 3
;

SELECT so.soc_title AS functions, AVG(FORMAT(cs.prevaling_wage, '#,##0')) AS avg_salary
FROM case_application AS cs 
INNER JOIN socs AS so ON cs.soc_id = so.soc_id
GROUP BY functions
ORDER BY avg_salary DESC
LIMIT 3
;

SELECT so.soc_title AS job_title,
		(CASE
WHEN s.employer_state = "CT" THEN "Northeast"
            WHEN s.employer_state = "MA" THEN "Northeast"
            WHEN s.employer_state = "ME" THEN "Northeast"
            WHEN s.employer_state = "NH" THEN "Northeast"
            WHEN s.employer_state = "NJ" THEN "Northeast"
            WHEN s.employer_state = "NY" THEN "Northeast"
            WHEN s.employer_state = "PA" THEN "Northeast"
            WHEN s.employer_state = "RI" THEN "Northeast"
            WHEN s.employer_state = "VT" THEN "Northeast"
            WHEN s.employer_state = "IA" THEN "MidWest"
            WHEN s.employer_state = "IL" THEN "MidWest"
            WHEN s.employer_state = "IN" THEN "MidWest"
            WHEN s.employer_state = "KS" THEN "MidWest"
            WHEN s.employer_state = "MI" THEN "MidWest"
            WHEN s.employer_state = "MN" THEN "MidWest"
            WHEN s.employer_state = "MO" THEN "MidWest"
            WHEN s.employer_state = "ND" THEN "MidWest"
            WHEN s.employer_state = "NE" THEN "MidWest"
            WHEN s.employer_state = "OH" THEN "MidWest"
            WHEN s.employer_state = "SD" THEN "MidWest"
            WHEN s.employer_state = "WI" THEN "MidWest"
            WHEN s.employer_state = "AL" THEN "South"
            WHEN s.employer_state = "AR" THEN "South"
            WHEN s.employer_state = "DC" THEN "South"
            WHEN s.employer_state = "DE" THEN "South"
            WHEN s.employer_state = "FL" THEN "South"
            WHEN s.employer_state = "GA" THEN "South"
            WHEN s.employer_state = "KY" THEN "South"
            WHEN s.employer_state = "LA" THEN "South"
            WHEN s.employer_state = "MD" THEN "South"
            WHEN s.employer_state = "MS" THEN "South"
            WHEN s.employer_state = "NC" THEN "South"
            WHEN s.employer_state = "OK" THEN "South"
            WHEN s.employer_state = "SC" THEN "South"
            WHEN s.employer_state = "TN" THEN "South"
            WHEN s.employer_state = "TX" THEN "South"
            WHEN s.employer_state = "VA" THEN "South"
            WHEN s.employer_state = "WV" THEN "South"
            WHEN s.employer_state = "AK" THEN "West"
            WHEN s.employer_state = "AZ" THEN "West"
            WHEN s.employer_state = "CA" THEN "West"
            WHEN s.employer_state = "CO" THEN "West"
            WHEN s.employer_state = "HI" THEN "West"
            WHEN s.employer_state = "ID" THEN "West"
            WHEN s.employer_state = "MT" THEN "West"
            WHEN s.employer_state = "NM" THEN "West"
            WHEN s.employer_state = "NV" THEN "West"
            WHEN s.employer_state = "OR" THEN "West"
            WHEN s.employer_state = "UT" THEN "West"
            WHEN s.employer_state = "WA" THEN "West"
            WHEN s.employer_state = "WY" THEN "West"
            WHEN s.employer_state = "FM" THEN "Other"
            WHEN s.employer_state = "GU" THEN "Other"
            WHEN s.employer_state = "MP" THEN "Other"
            WHEN s.employer_state = "PR" THEN "Other"
            WHEN s.employer_state = "VI" THEN "Other"
            ELSE "No Region"
        END) AS USA_geographical_area
FROM case_application AS ca
INNER JOIN socs AS so ON ca.soc_id = so.soc_id
INNER JOIN states AS s ON ca.state_id = s.state_id
WHERE s.employer_state IN ('CT', 'MA', 'ME', 'NH', 'NJ', 'NY', 'PA', 'RI', 'VT')
;
SELECT avg(FORMAT(ca.prevaling_wage, 'C', 'us-US')) AS avg_salary, st.case_status
FROM case_application AS ca 
INNER JOIN status AS st ON ca.status_id = st.status_id
WHERE st.case_status = "Certified"
;

SELECT s.employer_state, count(ca.total_worker_position) 
FROM case_application AS ca 
INNER JOIN states AS s ON ca.state_id = s.state_id
GROUP BY employer_state
;

