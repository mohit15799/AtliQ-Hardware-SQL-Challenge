with cte1 as (
select division,product,sum(sold_quantity) as total_sold_quantity
from fact_sales_monthly s join dim_product p using (product_code)
where fiscal_year = 2021
group by division,product),
cte2 as (select *,rank() over(partition by division order by total_sold_quantity desc) as rnk
from cte1),
cte3 as (select * from cte2 where rnk <=3)
select * from cte3 
