SELECT
	ord.order_id,
	concat(cus.first_name,' ',cus.last_name) as 'Customers Name',
	cus.city,
	cus.state,
	ord.order_date,
	sum(ite.quantity) as 'total units',
	sum(ite.quantity * ite.list_price) AS 'revenue',
	prod.product_name,
	cat.category_name,
	sto.store_name,
	CONCAT(sta.first_name,' ',sta.last_name) AS 'Sales_Rep'
	
FROM sales.orders as ord
JOIN sales.customers as cus 
ON ord.customer_id = cus.customer_id
JOIN sales.order_items as ite
ON ord.order_id = ite.order_id
JOIN production.products as prod
ON ite.product_id = prod.product_id
JOIN production.categories as cat
ON prod.category_id = cat.category_id
JOIN sales.stores as sto
ON ord.store_id = sto.store_id
JOIN sales.staffs as sta
ON ord.staff_id = sta.staff_id

GROUP BY
	ord.order_id,
	concat(cus.first_name,' ',cus.last_name), 
	cus.city,
	cus.state,
	ord.order_date,
	prod.product_name,
	cat.category_name,
	sto.store_name,
	CONCAT(sta.first_name,' ',sta.last_name)
