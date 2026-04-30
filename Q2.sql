with cte1 as (select 
(select count(*) from unique_products_2020) as unique_products_2020,
(select count(*) from unique_products_2021) as unique_products_2021)

select 
unique_products_2020,
unique_products_2021,
round(((unique_products_2021-unique_products_2020)
*100/unique_products_2020),2) as Percentage_chg
from Cte1;
