create temporary table  unique_products_2020

(SELECT distinct p.product_code FROM dim_product p join 
fact_sales_monthly s on s.product_code=p.product_code 
where fiscal_year=2020)


create temporary table  unique_products_2021

(SELECT distinct p.product_code FROM dim_product p join 
fact_sales_monthly s on s.product_code=p.product_code 
where fiscal_year=2021)