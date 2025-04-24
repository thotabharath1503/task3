SELECT name, state, city FROM customers;

select*from products
where price>499;

SELECT * FROM customers
ORDER BY name;

SELECT 
    orders.order_id,
    customers.name AS customer_name,
    customers.city,
    products.name AS product_name,
    products.category,
    products.price,
    orders.quantity,
    (products.price * orders.quantity) AS total_price,
    orders.order_date
FROM 
    orders
INNER JOIN customers ON orders.customer_id = customers.customer_id
INNER JOIN products ON orders.product_id = products.product_id;


SELECT 
    customers.customer_id,
    customers.name AS customer_name,
    customers.city,
    orders.order_id,
    orders.product_id,
    orders.quantity,
    orders.order_date
FROM 
    customers
LEFT JOIN orders ON customers.customer_id = orders.customer_id;

SELECT 
    orders.order_id,
    customers.customer_id,
    customers.name AS customer_name,
    customers.city,
    orders.product_id,
    orders.quantity,
    orders.order_date
FROM 
    customers
RIGHT JOIN orders ON customers.customer_id = orders.customer_id;

SELECT * FROM products
WHERE price > (
    SELECT AVG(price) FROM products
);


SELECT SUM(stock_quantity) AS total_stock
FROM products;

DROP VIEW IF EXISTS customer_order_summary;

CREATE VIEW customer_order_summary AS
SELECT 
    c.customer_id,
    c.name AS customer_name,
    c.city,
    p.name AS product_name,
    p.category,
    p.price,
    o.quantity,
    (p.price * o.quantity) AS total_value,
    o.order_date
FROM 
    customers c
JOIN 
    orders o ON c.customer_id = o.customer_id
JOIN 
    products p ON o.product_id = p.product_id;

SELECT * FROM customer_order_summary;

CREATE INDEX idx_products_product_id ON products(product_id);
CREATE INDEX idx_products_category ON products(category);

SHOW INDEX FROM orders;






