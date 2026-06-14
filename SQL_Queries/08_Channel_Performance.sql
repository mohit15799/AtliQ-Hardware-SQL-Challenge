with cte1 as (
select c.channel,round(sum(f.sold_quantity*g.gross_price)/1000,2) as gross_sales_mln
from dim_customer c
join fact_sales_monthly f using (customer_code)
join fact_gross_price g using (product_code)
where f.fiscal_year = 2021
group by c.channel
order by gross_sales_mln)

select channel,gross_sales_mln,round(
	gross_sales_mln*100/sum(gross_sales_mln) over()
,2) as pct_contribution
from cte1
order by gross_sales_mln desc;

