select p.division,s.product_code,p.product,
sum(sold_quantity) as total_sales_qty
,dense_rank() over(order by sum(s.sold_quantity) desc) as Rank_order 
 from gdb023.fact_sales_monthly s join dim_product p  
 on s.product_code=p.product_code 
 group by p.division,s.product_code,p.product
 order by total_sales_qty desc
 limit 3;
