
SELECT 
    product_name,
    category,
    SUM(quantity * price) AS total_sales,
    RANK() OVER (PARTITION BY category ORDER BY SUM(quantity * price) DESC) AS category_rank
FROM sales_data
GROUP BY product_name, category;
