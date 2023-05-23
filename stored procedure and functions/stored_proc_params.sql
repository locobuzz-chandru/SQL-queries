--For every given product and the quantity,
--1) check if product is available based on the required quantity,
--2) if available then modify the database tables accordingly.

create or replace procedure pr_buy_products(IN p_product_name varchar, IN p_quantity int)
LANGUAGE plpgsql
as $$
DECLARE
	v_product_code int;
	v_price float;
	v_count int;
BEGIN
	SELECT count(1)
	into v_count
	from products
	where product_name = p_product_name
	and quantity_remaining >= p_quantity;
	
	if v_count > 0 then
		SELECT id, price
		into v_product_code, v_price
		from products
		where product_name = p_product_name;

		insert into sales (order_date,product_code_id,quantity_ordered,sale_price)
		VALUES (current_date,v_product_code,p_quantity,(v_price * p_quantity));

		update products
		set quantity_remaining = (quantity_remaining - p_quantity),
		quantity_sold = (quantity_sold + p_quantity)
		WHERE id = v_product_code;

		raise notice 'Product Sold';
	else
		raise notice 'Insuffeicent Quantity';
	end if;
end;
$$