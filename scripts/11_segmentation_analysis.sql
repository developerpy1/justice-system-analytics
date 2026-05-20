-- Can courts be segmented into high, medium, and low workload groups?

SELECT
    c.court_name,
    COUNT(*) AS total_cases,
    CASE
        WHEN COUNT(*) >= 1100 THEN 'High Workload'
        WHEN COUNT(*) >= 950 THEN 'Medium Workload'
        ELSE 'Low Workload'
    END AS workload_segment
FROM gold.fact_case_activity f
JOIN gold.dim_courts c
ON f.court_id = c.court_id
GROUP BY c.court_name
ORDER BY total_cases DESC;

-- Can cases be segmented into fast, medium, and slow resolution categories?

SELECT
    case_id,
    duration_days,
    CASE
        WHEN duration_days < 60 THEN 'Fast Resolution'
        WHEN duration_days < 180 THEN 'Medium Resolution'
        ELSE 'Slow Resolution'
    END AS resolution_segment
FROM gold.fact_case_activity
WHERE duration_days IS NOT NULL;

-- Which judges belong to high-performance vs low-performance groups?

SELECT
    j.judge_name,
    COUNT(*) AS total_cases,
    AVG(duration_days) AS avg_resolution_days,
    CASE
        WHEN AVG(duration_days) < 100 THEN 'High Performance'
        WHEN AVG(duration_days) < 140 THEN 'Average Performance'
        ELSE 'Low Performance'
    END AS performance_group
FROM gold.fact_case_activity f
JOIN gold.dim_judges j
ON f.judge_id = j.judge_id
WHERE duration_days IS NOT NULL
GROUP BY j.judge_name
ORDER BY avg_resolution_days ASC;