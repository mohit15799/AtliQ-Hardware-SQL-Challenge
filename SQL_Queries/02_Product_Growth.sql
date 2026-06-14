with cte1 as 
(Select (select count(distinct product_code)
 from fact_sales_monthly where fiscal_year = 2020) as unique_products_2020,
 
 (Select count(distinct product_code) 
 from fact_sales_monthly where fiscal_year = 2021) as unique_products_2021)
 
 select *,((unique_products_2021 - unique_products_2020)/unique_products_2021)*100
 as percentage_chg from cte1;
 
 