
select p.product_name, s.year,s.price from Sales as s join
Product as p on s.product_id=p.product_id

--we could have used left join but join(inner by default) is more efficient