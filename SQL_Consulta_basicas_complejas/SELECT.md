* Consulta de actores
> SELECT * FROM `actor`;
* La consulta de actores  pero mostrar  todos  sus  campos
> SELECT `actor_id`, `first_name`, `last_name`, `last_update` FROM `actor`
* La consulta de actores  pero mostrar  todos  sus  campos pero los  campos se vea mas  bonito 
> SELECT `actor_id`, `first_name` as Nombre, `last_name` as Apellido , `last_update` FROM `actor`