-- What are the different types of courts?

SELECT DISTINCT
    court_type
FROM gold.dim_courts;

-- Which provinces have judicial activity?

SELECT DISTINCT
    province
FROM gold.dim_regions;


-- What are the most common case types?

SELECT
    ct.case_type,
    COUNT(*) AS total_cases
FROM gold.fact_case_activity f
JOIN gold.dim_case_types ct
ON f.case_type_id = ct.case_type_id
GROUP BY ct.case_type
ORDER BY total_cases DESC;

-- What is the average experience level of judges?

SELECT
    AVG(years_experience) AS avg_experience,
    MIN(years_experience) AS min_experience,
    MAX(years_experience) AS max_experience
FROM gold.dim_judges;