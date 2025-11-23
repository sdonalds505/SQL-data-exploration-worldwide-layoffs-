-- =============================================
-- Companies That Had 2+ Layoff Rounds
-- =============================================

WITH multi_layoff_companies AS (
    SELECT
        company,
        COUNT(*) AS layoff_rounds,
        SUM(total_laid_off) AS total_people_laid_off,
        MIN(`date`) AS first_layoff,
        MAX(`date`) AS last_layoff,
        ROUND(AVG(percentage_laid_off), 3) AS avg_percentage_per_round
    FROM layoffs_staging2
    GROUP BY company
    HAVING COUNT(*) >= 2
)
SELECT *
FROM multi_layoff_companies
ORDER BY layoff_rounds DESC, total_people_laid_off DESC
LIMIT 25;