create or replace procedure pr_buy_products()
LANGUAGE plpgsql
as $$
DECLARE
	v_product_code VARCHAR(20);
	v_price float;
BEGIN
	SELECT product_code, price
	into v_product_code, v_price
	from products
	where product_name = 'iPhone';
	
	insert into sales (order_date,product_code,quantity_ordered,sale_price)
	VALUES (current_date,v_product_code,1,(v_price * 1));
	
	update products
	set quantity_remaining = (quantity_remaining - 1),
	quantity_sold = (quantity_sold + 1)
	WHERE product_code = v_product_code;
	
	raise notice 'Product Sold';
end;
$$