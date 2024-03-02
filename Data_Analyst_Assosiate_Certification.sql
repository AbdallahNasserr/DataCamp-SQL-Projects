SELECT 
    product_id, 
    COALESCE(product_type, 'Unknown') AS product_type,
    COALESCE(brand, 'Unknown') AS brand,
    coalesce(round(cast(left(weight,position(' ' in weight)-1) as numeric),2),(SELECT round(cast (percentile_disc(0.5) WITHIN GROUP (ORDER BY weight) as numeric),2) FROM products)) as weight,
    COALESCE(round(cast(price as numeric),2),(SELECT round(cast (percentile_disc(0.5) WITHIN GROUP (ORDER BY price) as numeric),2) FROM products)) AS price,
    COALESCE(average_units_sold, 0) AS average_units_sold,
    COALESCE(year_added, 2022) AS year_added,
    COALESCE(UPPER(stock_location), 'Unknown') AS stock_location
FROM 
    products;
