-- =============================================
-- Top 5 Companies with Most Layoffs Each Year
-- Uses DENSE_RANK() + CTEs
-- =============================================

WITH company_year AS (
    SELECT 
        company,
        YEAR(`date`) AS layoff_year,
        SUM(total_laid_off) AS total_laid_off
    FROM layoffs_staging2
    GROUP BY company, layoff_year
),
company_year_rank AS (
    SELECT 
        company,
        layoff_year,
        total_laid_off,
        DENSE_RANK() OVER (PARTITION BY layoff_year ORDER BY total_laid_off DESC) AS ranking
    FROM company_year
    WHERE layoff_year IS NOT NULL
)
SELECT 
    layoff_year,
    ranking,
    company,
    total_laid_off
FROM company_year_rank
WHERE ranking <= 5
ORDER BY layoff_year, ranking;