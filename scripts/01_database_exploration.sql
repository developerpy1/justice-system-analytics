-- How many cases are stored in the system?


SELECT 
    COUNT(*) AS total_cases
FROM gold.fact_case_activity;

-- What is the date range of the dataset?

SELECT 
    MIN(filing_date) AS first_filing_date,
    MAX(filing_date) AS last_filing_date,
    DATEDIFF(YEAR, MIN(filing_date), MAX(filing_date)) AS years_covered
FROM gold.fact_case_activity;


-- How many courts, judges, provinces, and case types exist?

SELECT COUNT(*) AS total_courts
FROM gold.dim_courts;

SELECT COUNT(*) AS total_judges
FROM gold.dim_judges;

SELECT COUNT(*) AS total_provinces
FROM gold.dim_regions;

SELECT COUNT(*) AS total_case_types
FROM gold.dim_case_types;
