# SQL-data-exploration-worldwide-layoffs
SQL portfolio project analyzing 2020–2023 global layoffs. 6 clean, commented MySQL scripts with CTEs, window functions (DENSE_RANK), rolling totals, and custom metrics like “laid off per $1M raised” + the $1B+ unicorn leaderboard. 

A clean, professional, and fully commented SQL portfolio project analyzing the global layoff wave from March 2020 to early March 2023.

This repository contains **6 production-ready, progressively complex SQL scripts** that go you from basic exploration to advanced analytical insights.

## Dataset
- Table name: `layoffs_staging2` (already cleaned)
- Key columns used:
  - `company`, `location`, `industry`, `country`
  - `total_laid_off`, `percentage_laid_off`
  - `date` (YYYY-MM-DD)
  - `funds_raised_millions`

