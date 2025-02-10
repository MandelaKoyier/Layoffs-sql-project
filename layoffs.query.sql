drop table if exists layoffs;
create table layoffs (company text,
                      location text,
                      industry text,
                      total_laid_off text,
                      percentage text,
                      date date,
                      stage text,
                      country text,
                      funds_raised_millions text);
                      
SHOW GLOBAL VARIABLES LIKE 'local_infile';
load data local infile '\Users\Lenovo\Downloads\Layoffs.csv' into table layoffs;

                      
