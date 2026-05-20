-- What are the key operational insights of the justice system?

SELECT
    case_status,
    COUNT(*) AS total_cases,
    AVG(duration_days) AS avg_resolution_days
FROM gold.fact_case_activity
GROUP BY case_status;

-- Which areas require operational improvement?

SELECT TOP 10
    c.court_name,
    AVG(duration_days) AS avg_resolution_days,
    COUNT(*) AS total_cases
FROM gold.fact_case_activity f
JOIN gold.dim_courts c
ON f.court_id = c.court_id
WHERE duration_days IS NOT NULL
GROUP BY c.court_name
ORDER BY avg_resolution_days DESC;

-- What trends should decision-makers monitor in the future?

SELECT
    YEAR(filing_date) AS filing_year,
    MONTH(filing_date) AS filing_month,

    COUNT(*) AS total_cases,

    AVG(duration_days) AS avg_resolution_days
FROM gold.fact_case_activity
GROUP BY YEAR(filing_date),
         MONTH(filing_date)
ORDER BY filing_year,
         filing_month;