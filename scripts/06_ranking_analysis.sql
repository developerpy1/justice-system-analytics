-- Who are the top 10 judges with the highest workload?

SELECT TOP 10
    j.judge_name,
    COUNT(*) AS total_cases
FROM gold.fact_case_activity f
JOIN gold.dim_judges j
ON f.judge_id = j.judge_id
GROUP BY j.judge_name
ORDER BY total_cases DESC;


-- Which courts resolve cases the fastest?

SELECT TOP 10
    c.court_name,
    AVG(duration_days) AS avg_resolution_days
FROM gold.fact_case_activity f
JOIN gold.dim_courts c
ON f.court_id = c.court_id
WHERE duration_days IS NOT NULL
GROUP BY c.court_name
ORDER BY avg_resolution_days ASC;

-- Which courts have the slowest average resolution time?

SELECT TOP 10
    c.court_name,
    AVG(duration_days) AS avg_resolution_days
FROM gold.fact_case_activity f
JOIN gold.dim_courts c
ON f.court_id = c.court_id
WHERE duration_days IS NOT NULL
GROUP BY c.court_name
ORDER BY avg_resolution_days DESC;