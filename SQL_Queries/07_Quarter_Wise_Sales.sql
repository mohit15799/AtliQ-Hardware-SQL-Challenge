select if(month(date) in (9,10,11), "Quarter 1",
 if(month(date) in (12,1,2),"Quarter 2",
 if(month(date) in (3,4,5),"Quarter 3",
"Quarter 4"))) as quarter,sum(sold_quantity) as total_sold_quantity
from fact_sales_monthly where fiscal_year = 2021
group by quarter
order by total_sold_quantity desc;

