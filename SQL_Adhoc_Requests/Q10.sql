/*
  Request 10: 
  Get the Top 3 products in each division that have a high 
  total_sold_quantity in the fiscal_year 2021. 
  Final output contains these fields: division, product_code, product, 
  total_sold_quantity, rank_order
*/

with cte1 as (select p.division,s.product_code,p.product,
sum(sold_quantity) as total_sales_qty
,dense_rank() over(partition by division 
order by sum(s.sold_quantity) desc) as Rank_order 
 from gdb023.fact_sales_monthly s join dim_product p  
 on s.product_code=p.product_code 
 where s.fiscal_year = 2021 
 group by p.division,s.product_code,p.product
 order by total_sales_qty desc)
 
 select * from cte1 where Rank_order <=3
 
