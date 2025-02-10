select *
row_number() over(
partition by company, industry, total_laid_off, percentage_laid_off, 'date')
from layoffs_staging


select * from layoffs_staging;



select *,
row_number() over(
partition by company, industry, total_laid_off, percentage, 'date') as row_num
from layoffs_staging;

with duplicate_cte as
(
select *,
row_number() over(
partition by company, location, industry, total_laid_off, percentage, 'date',stage, country,
funds_raised_millions) as row_num
from layoffs_staging
)
select * from duplicate_cte where row_num >1;

CREATE TABLE `layoffs_staging2` (
  `company` text,
  `location` text,
  `industry` text,
  `total_laid_off` text,
  `percentage` text,
  `date` date DEFAULT NULL,
  `stage` text,
  `country` text,
  `funds_raised_millions` text,
  `row_num` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

select * from layoffs_staging2
where row_num >1;

Delete from layoffs_staging2
where row_num >1;

insert into layoffs_staging2
select *,
row_number() over(
partition by company, location, industry, total_laid_off, percentage, 'date',stage, country,
funds_raised_millions) as row_num
from layoffs_staging;


Select * from layoffs_staging2
where row_num >1;

select * from layoffs_staging2
where row_num >1;

select company, trim(company)
from layoffs_staging2;

select *
from layoffs_staging2
where industry like 'crypto%';

update layoffs_staging2
set industry = 'crypto'
where industry like 'crypto';

select distinct industry
from layoffs_staging2;

select distinct country, trim(trailing'.'from country)
from layoffs_staging2
order by 1 ;

select date from layoffs_staging2;



select date,
str_to_date(date, '%m/%d/%Y')
from layoffs_staging2;

update layoffs_staging2
set date = str_to_date(date, '%m/%d/%y');

alter table layoffs_staging2
modify column date DATE;

select *
from layoffs_staging2;