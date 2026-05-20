-- What percentage of total cases belongs to each province?

SELECT
    c.province,
    COUNT(*) AS total_cases,

    ROUND(
        COUNT(*) * 100.0 /
        SUM(COUNT(*)) OVER(),
        2
    ) AS percentage_of_total_cases

FROM gold.fact_case_activity f
JOIN gold.dim_courts c
ON f.court_id = c.court_id
GROUP BY c.province
ORDER BY percentage_of_total_cases DESC;

-- What percentage of cases belongs to each case type?


SELECT
    ct.case_type,
    COUNT(*) AS total_cases,
    ROUND(
        COUNT(*) * 100.0 /
        SUM(COUNT(*)) OVER(),
        2
    ) AS percentage_of_total_cases
FROM gold.fact_case_activity f
JOIN gold.dim_case_types ct
ON f.case_type_id = ct.case_type_id
GROUP BY ct.case_type
ORDER BY percentage_of_total_cases DESC;

-- What share of total cases is still pending?

SELECT
    COUNT(*) AS pending_cases,

    ROUND(
        COUNT(*) * 100.0 /
        (SELECT COUNT(*) FROM gold.fact_case_activity),
        2
    ) AS pending_percentage

FROM gold.fact_case_activity
WHERE case_status = 'Pending';