with cte1 as 
(Select segment,
 count(distinct case when fiscal_year = 2020 then product_code end) as unique_products_2020,
 count(distinct case when fiscal_year = 2021 then product_code end) as unique_products_2021
 from fact_sales_monthly s join dim_product p using (product_code)
 group by segment)
 select *,(unique_products_2021 - unique_products_2020) as difference from cte1;
 
 