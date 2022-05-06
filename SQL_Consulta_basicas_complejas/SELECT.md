1. Consulta de actores
> SELECT * FROM `actor`;
2. La consulta de actores  pero mostrar  todos  sus  campos
> SELECT `actor_id`, `first_name`, `last_name`, `last_update` FROM `actor`
3. La consulta de actores  pero mostrar  todos  sus  campos pero los  campos se vea mas  bonito 
> SELECT `actor_id`, `first_name` as Nombre, `last_name` as Apellido , `last_update` FROM `actor`
4. Realizar  una  consulta cualquier  tabla y su contenido no se debe repetir 
> se usa DISTINCT para  ver  los q no se repite
> SELECT DISTINCT(customer.store_id) FROM `customer`
5. Ordenar  los datos ascedente  y descendete 
> SELECT * FROM `customer` ORDER by customer_id asc;
> SELECT * FROM `customer` ORDER by customer_id desc;

Actividades

Consulta store_id, first_name y last_name de la tabla customer de la base de datos sakila.

> SELECT store_id, first_name , last_name FROM `customer` 

Cambia el nombre de las columnas store_id, first_name y last_name a Tienda, Nombre y Apellido respectivamente.

> SELECT store_id as tienda, first_name as nombre , last_name as apellido FROM `customer`

Ordena de manera descendente la columna Apellido
> SELECT store_id as tienda, first_name as nombre , last_name as apellido FROM `customer` ORDER BY `apellido` ASC

Consulta la tabla payment de la base de datos sakila.

> SELECT * FROM `payment`


¿Cuál es la cantidad mas baja y mas alta de la columna amount?
>  SELECT distinct amount FROM `payment` ORDER by amount ASC; // Es 0
> SELECT distinct amount  FROM `payment` ORDER by amount DESC; // 11.99

