select segment,count(distinct product_code) as No_of_Products from dim_product
group by segment
order by No_of_Products desc;