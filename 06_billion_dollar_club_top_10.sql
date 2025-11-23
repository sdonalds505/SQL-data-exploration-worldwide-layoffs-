-- =============================================
-- The $1B+ Club: Companies That Raised a Billion or More
-- and Then Laid Off the Most People
-- =============================================

SELECT
    company,
    MAX(funds_raised_millions) AS funds_raised_millions,
    SUM(total_laid_off) AS total_laid_off,
    MAX(percentage_laid_off) AS highest_single_layoff_percentage,
    COUNT(*) AS layoff_events
FROM layoffs_staging2
WHERE funds_raised_millions >= 1000
GROUP BY company
ORDER BY total_laid_off DESC
LIMIT 10;