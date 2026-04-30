with cte1 as (select case 
when month(date) in(9,10,11)  then "Q1"
when month(date)  in(12,1,2)then "Q2"
when month(date)  in(3,4,5) then "Q3"
when month(date) in(6,7,8) then "Q4"
end as Quarter,sold_quantity
 from gdb023.fact_sales_monthly where fiscal_year=2020)
 
 select Quarter,sum(sold_quantity) as Total_sales_qty
  from cte1 group by 
 Quarter;
