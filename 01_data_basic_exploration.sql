-- =============================================
-- Layoffs 2020–2023 | Basic Exploration
-- =============================================

-- Preview the cleaned dataset
SELECT * FROM layoffs_staging2 LIMIT 10;

-- What are the highest single-day layoffs ever recorded?
SELECT MAX(total_laid_off) AS max_in_one_day, 
       MAX(percentage_laid_off) AS full_shutdown 
FROM layoffs_staging2;

-- Companies that laid off 100% of staff (percentage_laid_off = 1)
SELECT company, location, industry, total_laid_off, funds_raised_millions, `date`
FROM layoffs_staging2
WHERE percentage_laid_off = 1
ORDER BY funds_raised_millions DESC;

-- Total layoffs by company (all time)
SELECT company, SUM(total_laid_off) AS total_laid_off
FROM layoffs_staging2
GROUP BY company
ORDER BY total_laid_off DESC
LIMIT 20;

-- Date range of the dataset
SELECT MIN(`date`) AS earliest, MAX(`date`) AS latest
FROM layoffs_staging2;

-- Total layoffs by industry
SELECT industry, SUM(total_laid_off) AS total_laid_off
FROM layoffs_staging2
GROUP BY industry
ORDER BY total_laid_off DESC;

-- Total layoffs by country
SELECT country, SUM(total_laid_off) AS total_laid_off
FROM layoffs_staging2
GROUP BY country
ORDER BY total_laid_off DESC;