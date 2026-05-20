-- Which courts handle the largest number of cases?

SELECT
    c.court_name,
    COUNT(*) AS total_cases
FROM gold.fact_case_activity f
JOIN gold.dim_courts c
ON f.court_id = c.court_id
GROUP BY c.court_name
ORDER BY total_cases DESC;

-- Which provinces generate the highest judicial workload?

SELECT
    c.province,
    COUNT(*) AS total_cases
FROM gold.fact_case_activity f
JOIN gold.dim_courts c
ON f.court_id = c.court_id
GROUP BY c.province
ORDER BY total_cases DESC;

-- Which case types are the most frequent?

SELECT
    ct.case_type,
    COUNT(*) AS total_cases
FROM gold.fact_case_activity f
JOIN gold.dim_case_types ct
ON f.case_type_id = ct.case_type_id
GROUP BY ct.case_type
ORDER BY total_cases DESC;