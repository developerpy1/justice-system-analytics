-- Which courts perform above average in resolution speed?

SELECT
    c.court_name,
    AVG(duration_days) AS avg_resolution_days
FROM gold.fact_case_activity f
JOIN gold.dim_courts c
ON f.court_id = c.court_id
WHERE duration_days IS NOT NULL
GROUP BY c.court_name
ORDER BY avg_resolution_days ASC;

-- Which judges manage the highest workload efficiently?

SELECT TOP 10
    j.judge_name,
    COUNT(*) AS total_cases,
    AVG(duration_days) AS avg_resolution_days
FROM gold.fact_case_activity f
JOIN gold.dim_judges j
ON f.judge_id = j.judge_id
WHERE duration_days IS NOT NULL
GROUP BY j.judge_name
ORDER BY total_cases DESC,
         avg_resolution_days ASC;

-- Which provinces show the best judicial performance?

SELECT
    c.province,
    AVG(duration_days) AS avg_resolution_days
FROM gold.fact_case_activity f
JOIN gold.dim_courts c
ON f.court_id = c.court_id
WHERE duration_days IS NOT NULL
GROUP BY c.province
ORDER BY avg_resolution_days ASC;