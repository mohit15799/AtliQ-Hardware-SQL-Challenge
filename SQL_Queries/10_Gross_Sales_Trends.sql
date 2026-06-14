select monthname(s.date),year(s.date),sum(s.sold_quantity*g.gross_price) as gross_sales_amount
from fact_sales_monthly s
join dim_product p using (product_code)
join dim_customer c using (customer_code)
join fact_gross_price g using (product_code)
where customer = "Atliq Exclusive"
group by date;
