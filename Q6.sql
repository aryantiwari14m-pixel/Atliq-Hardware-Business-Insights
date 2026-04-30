	with cte1 as (select c.customer_code,c.customer,
    AVG(pre_invoice_discount_pct) as average_pct
	 from fact_pre_invoice_deductions d join dim_customer c
     on d.customer_code=c.customer_code
     where fiscal_year = 2021 and c.market = "India"
     group by 
	 customer_code,customer order by average_pct desc limit 5  )
	 
	 select *
	 from cte1
     order by average_pct desc;
