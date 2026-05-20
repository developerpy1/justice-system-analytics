-- How has monthly case activity evolved over time?

SELECT
    YEAR(filing_date) AS filing_year,
    MONTH(filing_date) AS filing_month,
    COUNT(*) AS total_cases
FROM gold.fact_case_activity
GROUP BY YEAR(filing_date),
         MONTH(filing_date)
ORDER BY filing_year,
         filing_month;

-- Is the judicial system experiencing workload growth?

SELECT
    YEAR(filing_date) AS filing_year,
    COUNT(*) AS total_cases
FROM gold.fact_case_activity
GROUP BY YEAR(filing_date)
ORDER BY filing_year;
