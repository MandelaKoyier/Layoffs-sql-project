
select date,
str_to_date(date, '%m/%d/%Y')
from layoffs_staging2;

update layoffs_staging2
set date = str_to_date(date, '%m/%d/%y');

alter table layoffs_staging2
modify column date DATE;
update layoffs_staging2
set industry = null
where industry ='';


select *
from layoffs_staging2
where industry is null
or  industry = '';

select *
from layoffs_staging2
where company like 'bally%';

select *
from layoffs_staging2 t1
join layoffs_staging2 t2
  on t1.company = t2.company
  and t1.location = t2.location
where (t1.industry is null or t1.industry = '')
and  t2.industry is not null;


update layoffs_staging2 t1
 join layoffs_staging2 t2
   on t1.company=t2.company
   set t1.industry = t2.industry
where t1.industry is null 
and  t2.industry is not null;

select * 
from layoffs_staging2;

select *
from layoffs_staging2
where total_laid_off is null
and percentage is null;

delete
from layoffs_staging2
where total_laid_off is null
and percentage is null;

select *
from layoffs_staging2;

alter table layoffs_staging2
drop column row_num;