/*
  Request 3: 
  Provide a report with all the unique product counts for each segment 
  and sort them in descending order of product counts.
  Final output: segment, product_count
*/


SELECT count(distinct product_code)  as product_count,segment 
FROM dim_product 
 group by segment 
 order by product_count desc