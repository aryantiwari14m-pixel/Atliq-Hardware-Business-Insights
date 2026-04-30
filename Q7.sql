select monthname(date) as Month
,year(date_add(date,interval 4 month)) as Fiscal_year,
round((sold_quantity*gross_sales),2)
as Gross_sales_amt from gross_sales s join dim_customer d
on s.customer_code=d.customer_code where d.customer = "Atliq Exclusive"