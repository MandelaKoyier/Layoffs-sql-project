-- exploratory data analysis
select *
from layoffs_staging2;

select max(total_laid_off), max(percentage)
from layoffs_staging2;

select *
from layoffs_staging2
where percentage = 1
order by funds_raised_millions;

select company, sum(total_laid_off)
from layoffs_staging2
group by company
order by 2 desc;

select min(date), max(date)
from layoffs_staging2;

select stage , sum(total_laid_off)
from layoffs_staging2
group by stage
order by 1 desc;

select substring(date, 6,2) as month, sum(total_laid_off)
from layoffs_staging2
where substring(date, 6,2) is not null
group by month
order by 1 asc;

with rolling_total as 
(
select substring(date, 1,7) as month, sum(total_laid_off) as sum_total_off
from layoffs_staging2
where substring(date, 1,7) is not null
group by month
order by 1 asc
)
select month,sum_total_off
,sum(sum_total_off) over(order by month) as ROLLING_TOTAL
from rolling_total;

select company, sum(total_laid_off)
from layoffs_staging2
group by company
order by 2 desc;

select company, year(date),sum(total_laid_off)
from layoffs_staging2
group by company, year(date)
order by 3 desc;


with company_year(company,years,total_laid_off) as 
(
select company, year(date),sum(total_laid_off)
from layoffs_staging2
group by company, year(date)
), company_year_rank as
(
select *, dense_rank() over(partition by years order by total_laid_off desc) as ranking
from company_year
where years is not null
)
select *
from company_year_rank
where ranking <= 5