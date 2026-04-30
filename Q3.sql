SELECT count(distinct s.product_code) as product_count,segment 
FROM dim_product p join fact_sales_monthly s on p.product_code
=s.product_code 
 group by segment 
 order by product_count desc