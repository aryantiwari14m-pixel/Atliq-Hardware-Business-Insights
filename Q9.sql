/*
  Request 9: 
  Which channel helped to bring more gross sales in the fiscal year 2021 
  and the percentage of contribution? 
  Final output contains these fields: channel, gross_sales_mln, percentage
*/


with cte1 as (select c.channel,round(sum(gross_sales)/1000000,2) 
as Gross_mln from gdb023.gross_sales s join dim_customer c 
on s.customer_code=c.customer_code
where fiscal_year =2021
group by c.channel
order by Gross_mln desc )

select *,round(Gross_mln*100/sum(Gross_mln) over(),2)  
as Percentage from cte1;
