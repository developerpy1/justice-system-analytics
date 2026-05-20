-- What is the average case resolution duration?

SELECT
    AVG(duration_days) AS avg_resolution_days
FROM gold.fact_case_activity
WHERE duration_days IS NOT NULL;

-- What is the average number of hearings per case?

SELECT
    AVG(hearings_count) AS avg_hearings
FROM gold.fact_case_activity;

-- What percentage of cases are resolved, pending, or archived?

SELECT
    case_status,
    COUNT(*) AS total_cases,
    ROUND(
        COUNT(*) * 100.0 /
        SUM(COUNT(*)) OVER(),
        2
    ) AS percentage_of_cases
FROM gold.fact_case_activity
GROUP BY case_status;