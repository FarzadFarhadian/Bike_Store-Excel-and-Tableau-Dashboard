select * from [sales].[orders]

select * from [sales].[customers]

select * from [sales].[order_items]

SELECT * FROM [production].[products]

select * from [production].[categories]

select * from [sales].[stores]

select * from [sales].[staffs]

select * from [production].[brands]

select
      ord.order_id,
	  CONCAT(cus.first_name,' ',cus.last_name) as 'customers',
	  cus.city,
	  cus.state,
	  ord.order_date,
	  sum(ite.quantity)as 'total_unite',
	  sum(ite.quantity * ite.list_price) as 'revenue',
	  pro.product_name,
	  cat.category_name,
	  sto.store_name,
	  CONCAT(sta.first_name,' ',sta.last_name) as 'sales_rap',
	  bra.brand_name
	  
from sales.orders ord
join [sales].[customers] cus
on ord.customer_id=cus.customer_id
join [sales].[order_items] ite
on ord.order_id = ite.order_id
join [production].[products] pro
on pro.product_id = ite.product_id
join [production].[categories] cat
on pro.category_id = cat.category_id
join [sales].[stores] sto
on ord.store_id = sto.store_id
join [sales].[staffs] sta
on ord.staff_id = sta.staff_id
join [production].[brands] bra
on bra.brand_id = pro.brand_id
GROUP BY ord.order_id,
	  CONCAT(cus.first_name,' ',cus.last_name),
	  cus.city,
	  cus.state,
	  ord.order_date,
	  pro.product_name,
	  cat.category_name,
	  sto.store_name,
	  CONCAT(sta.first_name,' ',sta.last_name),
	  bra.brand_name