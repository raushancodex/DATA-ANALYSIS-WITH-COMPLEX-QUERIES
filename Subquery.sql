
SELECT * FROM sales_data
WHERE price > (SELECT AVG(price) FROM sales_data);