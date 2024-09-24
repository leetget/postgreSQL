-- 3. увеличить значение цены (prod.price)  в таблице в два раза у всех товаров, которые продавались в 2018 году в отделе 'dep10'

update prod
set price = price * 2
where id IN(
	select sales.prod_id
	from sales
	join dep on sales.dep_id = dep.id
	where dep.name = 'dep10' and extract(year from sales.time)= 2018
);
-- думал насчет добавления блока DO, но посчитал, что будет неуместно его использовать, 
-- так как нет сложной логики(проверки условий перед обновлением, изолированности выполнения и тд)
