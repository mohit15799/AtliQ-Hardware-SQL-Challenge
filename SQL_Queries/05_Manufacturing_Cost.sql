SELECT p.product_code,
       p.product,
       f.manufacturing_cost
FROM fact_manufacturing_cost f
JOIN dim_product p USING (product_code)
WHERE f.manufacturing_cost IN (

    (SELECT MAX(manufacturing_cost) FROM fact_manufacturing_cost),
    (SELECT MIN(manufacturing_cost) FROM fact_manufacturing_cost)
);