use hr_data;
show tables;
select *
from `hr data`
limit 10;
-- get all distinct values of fields
select distinct(`business travel`)
from `hr data`;

select distinct(`cf_age band`)
from `hr data`;

select distinct(`department`)
from `hr data`;

select distinct(`education field`)
from `hr data`;

select distinct(`gender`)
from `hr data`;

select distinct(`job role`)
from `hr data`;

select distinct(`education`)
from `hr data`;