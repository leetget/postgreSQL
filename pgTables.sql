CREATE TABLE dep
(
    id   integer NOT NULL,
    city text    NOT NULL,
    name text    NOT NULL,
    CONSTRAINT dep_pk PRIMARY KEY (id)
);

-- продукты

CREATE TABLE prod
(
    id    integer NOT NULL,
    price integer NOT NULL,
    name  text    NOT NULL,
    CONSTRAINT prod_pk PRIMARY KEY (id)
);

-- продажи

CREATE TABLE sales
(
    time    timestamp    NOT NULL,
    dep_id  integer        NOT NULL,
    prod_id integer        NOT NULL,
    cost    numeric(10, 2) NOT NULL,
    CONSTRAINT sales_fk1 FOREIGN KEY (dep_id) REFERENCES dep (id),
    CONSTRAINT sales_fk2 FOREIGN KEY (prod_id) REFERENCES prod (id)
);

commit;

-- для тестирования можно так заполнить

INSERT INTO dep
select i,
       CASE
           WHEN i <= 50 THEN 'town1'
           ELSE 'town2'
           END,
       'dep'
           || i::text
from generate_series(1, 100) as i;

INSERT INTO prod
select i,
       i * 10,
       'prod'
           || i::text
from generate_series(1, 100) as i;


INSERT INTO sales
select timestamp '2021-01-01 00:00' + interval '1 day' * random() - interval '1 day' * i,
       mod(i, 100) + 1,
       mod(i, 100) + 1,
       i
from generate_series(1, 1000) as i;
COMMIT;