-- What is the cumulative number of filed cases over time?

SELECT
    YEAR(filing_date) AS filing_year,
    MONTH(filing_date) AS filing_month,
    COUNT(*) AS monthly_cases,
    SUM(COUNT(*)) OVER(
        ORDER BY YEAR(filing_date),
                 MONTH(filing_date)
    ) AS cumulative_cases
FROM gold.fact_case_activity
GROUP BY YEAR(filing_date),
         MONTH(filing_date)
ORDER BY filing_year,
         filing_month;

-- How does cumulative resolved cases compare against cumulative filed cases?


SELECT
    YEAR(filing_date) AS filing_year,
    MONTH(filing_date) AS filing_month,
    COUNT(*) AS filed_cases,
    SUM(
        CASE
            WHEN case_status = 'Resolved'
            THEN 1
            ELSE 0
        END
    ) AS resolved_cases
FROM gold.fact_case_activity
GROUP BY YEAR(filing_date),
         MONTH(filing_date)
ORDER BY filing_year,
         filing_month;
