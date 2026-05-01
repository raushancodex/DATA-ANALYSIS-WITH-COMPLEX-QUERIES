
WITH category_totals AS (
    SELECT 
        category, 
        SUM(quantity * price) AS total_sales
    FROM sales_data
    GROUP BY category
),
product_totals AS (
    SELECT 
        product_name,
        category,
        SUM(quantity * price) AS product_sales
    FROM sales_data
    GROUP BY product_name, category
)
SELECT 
    p.product_name,
    p.category,
    p.product_sales,
    c.total_sales,
    ROUND((p.product_sales / c.total_sales) * 100, 2) AS contribution_percent
FROM product_totals p
JOIN category_totals c ON p.category = c.category
WHERE (p.product_sales / c.total_sales) * 100 > 50;