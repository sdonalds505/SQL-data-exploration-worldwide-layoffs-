-- =============================================
-- Monthly Layoffs Trend + Rolling Total
-- =============================================

-- Monthly layoffs
SELECT 
    SUBSTRING(`date`, 1, 7) AS `month`,
    SUM(total_laid_off) AS total_laid_off
FROM layoffs_staging2
WHERE SUBSTRING(`date`, 1, 7) IS NOT NULL
GROUP BY `month`
ORDER BY `month`;

-- Rolling (cumulative) total layoffs over time
WITH monthly_layoffs AS (
    SELECT 
        SUBSTRING(`date`, 1, 7) AS `month`,
        SUM(total_laid_off) AS total_off
    FROM layoffs_staging2
    WHERE `date` IS NOT NULL
    GROUP BY `month`
)
SELECT 
    `month`,
    total_off,
    SUM(total_off) OVER (ORDER BY `month`) AS rolling_total_layoffs
FROM monthly_layoffs
ORDER BY `month`;