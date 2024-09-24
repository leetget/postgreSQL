-- 1. получить все продажи произведенные в городе 'town1' за 2019 год
select dep.city,prod.name,sales.time
from dep 
join prod on prod.id = dep.id -- присоединяем таблицу prod для получения названия проданного продукта
join sales on sales.dep_id = dep.id -- присоединяем таблицу sales для получения таймера продажи продукта
where extract(year from time)= 2019 and city = 'town1' 
-- можно сделать через date_trunc, но думаю, 
--что такой запрос будет являтся менее читабельным и не всегда оптимальным