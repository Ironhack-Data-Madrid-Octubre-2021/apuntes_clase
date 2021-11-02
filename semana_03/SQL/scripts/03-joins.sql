/* Queremos sacar de la tabla los libros con sus autores, teniendo en cuenta que tenemos la información diversificada
en tres tablas diferentes...entendamos el camino e intentemos hacerlo */








/* Al ver nuestro RD, sabemos que las editoriales y los títulos tienen una relación de uno a muchos. 
Unámoslos y obtengamos un recuento del número de títulos que ha publicado cada editorial. */








/* Como hemos utilizado un INNER JOIN para esta consulta, sólo devuelve los resultados de las editoriales cuyo pub_id está en ambas tablas. 
¿Qué pasaría si quisiéramos que los resultados devolvieran los registros de todas las editoriales, independientemente de si han publicado algún título? 
Esto es exactamente lo que puede hacer un left join. 
Todo lo que tenemos que hacer es sustituir nuestro INNER JOIN por un LEFT JOIN y nos devolverá todos los registros de la tabla 
de editoriales y contará con cero registros para las que no tienen ningún título publicado.*/










/* ¿Y si quisiéramos analizar cuántas unidades se han vendido de cada título? 
Podríamos declarar nuestra tabla de ventas en primer lugar, nuestra tabla de títulos en segundo lugar, 
y utilizar un RIGHT JOIN para garantizar que nuestra consulta
devuelva un registro para cada título (incluso los que no se vendieron). */






