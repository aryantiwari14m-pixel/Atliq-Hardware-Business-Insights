with cte1 as (
SELECT  count(distinct s.product_code) as product_count_2020,segment 
FROM dim_product p join fact_sales_monthly s on p.product_code
=s.product_code where fiscal_year = 2020
 group by segment 
 order by product_count_2020 desc),

cte2 as (
 select count(distinct s.product_code) as product_count_2021,segment 
from dim_product p join fact_sales_monthly s on p.product_code
=s.product_code where fiscal_year = 2021
 group by segment 
 order by product_count_2021 desc)
 
 select d.segment,
 c.product_count_2020,
 d.product_count_2021,
 round((product_count_2021-product_count_2020),2) as difference 
 from cte1 c join cte2 d on c.segment=d.segment;
