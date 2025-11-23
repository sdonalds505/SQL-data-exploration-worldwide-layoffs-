-- =============================================
-- Worst "Bang for Buck": Most Employees Laid Off per $1M Raised
-- =============================================

SELECT
    company,
    MAX(funds_raised_millions) AS funds_raised_millions,
    SUM(total_laid_off) AS total_laid_off,
    ROUND(SUM(total_laid_off) / MAX(funds_raised_millions), 2) AS laid_off_per_million_raised
FROM layoffs_staging2
WHERE funds_raised_millions IS NOT NULL
  AND funds_raised_millions > 0
  AND total_laid_off IS NOT NULL
GROUP BY company
HAVING SUM(total_laid_off) >= 50
ORDER BY laid_off_per_million_raised DESC
LIMIT 15;