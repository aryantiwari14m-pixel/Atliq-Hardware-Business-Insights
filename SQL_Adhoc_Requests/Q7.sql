/*
  Request 7: 
  Get the complete report of the Gross sales amount for the customer "Atliq Exclusive" 
  for each month. This analysis helps to identify the monthly sales trend and 
  any significant performance dips.
  Final output contains these fields: Month, Fiscal_year, Gross_sales_amt
*/

select monthname(s.date) as Month
,s.Fiscal_year,
round(sum(Gross_sales),2)
as Gross_sales_amt from gross_sales s join dim_customer d
on s.customer_code=d.customer_code where d.customer = "Atliq Exclusive"
group by month,s.fiscal_year

