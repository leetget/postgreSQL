-- 2. показать все отделы, где в марте 2020 года были продажи товаров с ценой (sales.cost) меньше 500.

select dep.name,sales.cost,time
from dep
join sales on sales.dep_id = dep.id
where sales.cost <500 
and date_trunc('month',time) = '2020-03-01'
-- в контексте данной задачи, считаю предпочтительным использовать date_trunc 