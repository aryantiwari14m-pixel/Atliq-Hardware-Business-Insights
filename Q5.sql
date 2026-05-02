/*
  Request 5: 
  Get the products that have the highest and lowest manufacturing costs. 
  Final output: product_code, product, manufacturing_cost
*/

(select p.product_code,p.product,m.manufacturing_cost 
from dim_product p join fact_manufacturing_cost m on 
p.product_code=m.product_code order by m.manufacturing_cost desc
limit 1)

union 

(select p.product_code,p.product,m.manufacturing_cost 
from dim_product p join fact_manufacturing_cost m on 
p.product_code=m.product_code order by m.manufacturing_cost
limit 1);
