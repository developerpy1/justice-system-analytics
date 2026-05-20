-- How has the number of cases changed over the years?

SELECT
    YEAR(filing_date) AS filing_year,
    COUNT(*) AS total_cases
FROM gold.fact_case_activity
GROUP BY YEAR(filing_date)
ORDER BY filing_year;

-- Which months have the highest case volume?

SELECT
    MONTH(filing_date) AS filing_month,
    COUNT(*) AS total_cases
FROM gold.fact_case_activity
GROUP BY MONTH(filing_date)
ORDER BY total_cases DESC;

-- Are there seasonal patterns in judicial activity?

SELECT
    DATENAME(MONTH, filing_date) AS month_name,
    COUNT(*) AS total_cases
FROM gold.fact_case_activity
GROUP BY DATENAME(MONTH, filing_date),
         MONTH(filing_date)
ORDER BY MONTH(filing_date);
