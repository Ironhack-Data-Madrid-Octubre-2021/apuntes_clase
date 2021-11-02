##########################################################
##########################################################
#
#            The SQL SELECT Statement
#		      			 (& Friends)
#
#                    \ (•◡•) /
#
##########################################################
##########################################################

###########
-- SELECT - FROM: https://www.mysqltutorial.org/mysql-select-statement-query-data.aspx



###########
-- SELECT - FROM: https://www.mysqltutorial.org/mysql-select-statement-query-data.aspx
###########


# seleccionar columnas específicas de la tabla


# seleccionar todas las columnas de la tabla   

# poniendo alias a las columnas


###########
-- WHERE: https://www.mysqltutorial.org/mysql-where/

/* 
Nos permite especificar las condiciones que los datos que queremos seleccionar
deben satisfacer
*/

-- Todos los empleados nombrados Hugo


-- Todas las empleadas




###########    
/*
En SQL hay muchos OPERADORES que se utilizan para enlazar
las palabras clave y los simbolos. Echemos un vistazo a los más 
¡frecuentes!
*/    
###########
-- AND: https://www.mysqltutorial.org/mysql-and/

-- Todas las empleadas llamadas Hugo




###########
-- OR: https://www.mysqltutorial.org/mysql-or/

-- Todas las empleadas que son mujeres o se llaman Hugo


    
###########
-- Precedencia del operador

# ¿Qué va a devolver esta query?



# ¿Y esta?

/*
Regla SQL: El operador AND tiene prioridad sobre el operador OR
			  Si queremos anular este comportamiento, debemos utilizar paréntesis.
*/

-- La siguiente query devuelve todos los Hugo que sean F o M



###########
-- IN / NOT IN: https://www.mysqltutorial.org/sql-in.aspx

# Recuperar todos los datos de las personas llamadas Hugo, Mark, Bojan o Anneke




# Otra opción ("Tipo Python")




# O, para hacer lo contrario



###########
-- LIKE / NOT LIKE: https://www.mysqltutorial.org/mysql-like/
/*
Query basada en un patrón especificado
Sintaxis: expresión LIKE patrón
(Observe que los patrones no distinguen entre mayúsculas y minúsculas)
*/

# El comodín de porcentaje ( % ) coincide con cualquier cadena de cero o más caracteres. 
# (Puede verse como un sustituto de una secuencia de caracteres)

# Seleccionar todos los empleados cuyo nombre empieza por 'An'




# ¿Qué hará esto?



# ¿Y esto?    



-- El comodín del guión bajo ( _ ) coincide con cualquier carácter, pero sólo con uno
# Seleccionamos los nombre que empiezan por mar y un caracter más




# (NOT LIKE funciona justo devolviéndome lo contrario,  todo lo que no sea mar y un caracter)
# TODO LO QUE NO SEA LO QUE DEVUELVE LA QUERY ANTERIOR




# Recuperar todos los datos de los empleados no contratados en el año 1990



/*
NOTA: *, %, _ son llamadaos "Wildcard Characters" o "Comodines"
*/


###########
-- BETWEEN - AND: https://www.mysqltutorial.org/mysql-between

# Con fechas



# Es equivalente a 



# con tipos numéricoos 



# con strings


# Si quiero hasta la D tengo que poner una letra más, solo cuando estamos buscando por letras con %

-- Orden alfabético, los nombres empiezan entre a y d 
    
###########
-- IS NOT NULL / IS NULL: https://www.mysqltutorial.org/mysql-is-null/
-- Como en pandas, jeje ʕ•ᴥ•ʔ






###########
-- Operadores matemáticos de comparación

	# igual = (solo un igual, sintaxis SQL)
	# distinto <> or !=   (como en python)
	# mayor que >
	# mayor o igual que >=
	# menor que <
	# menor o igual que  <=
    


-- Ejercicio: Devuelve todas las columnas de las empleadas contratadas después de '2000-01-01'




###########
-- Operadores aritméticos
-- Podemos operar columnas o podemos meterlos como resultado en una cláusula where

	# suma + 
	# resta - 
	# multiplicación * 
	# división / 
	# módilo % 




###########
-- SELECT DISTINCT: https://www.mysqltutorial.org/mysql-distinct.aspx




# Como el unique de pandas, me da los únicos





###########
-- Introducción a las funciones agregadas: https://www.mysqltutorial.org/mysql-aggregate-functions.aspx

/* 
Una función agregada realiza un cálculo en varias filas y devuelve un único valor.
Sintaxis: function_name(DISTINCT | ALL expression)
Todas las funciones de agregación IGNORAN los valores NULL a menos que se especifique
*/    

# ¿Cuántos empleados hay en nuestra base de datos? 
# pista: emp_no es la clave primaria de la tabla




# ¿Cuántos nombres diferentes tenemos en la tabla?



-- ¿Cuántos empleados han nacido después de 1965-01-01??

SELECT COUNT(*) # NOTA: el uso de * hace que COUNT incluya valores NULL
FROM employees
WHERE birth_date >= "1965-01-01" AND birth_date IS NOT NULL; #En este caso no hay nulos en la columna cumpleaños

# Contar el número de departamentos únicos




    
###########
-- ORDER BY: https://www.mysqltutorial.org/mysql-order-by/

# Ordenar los nombres por orden alfabético
# ASC por defecto




# Usando múltiples campos




# MAX()



# MIN()



# AVG()




###########
-- GROUP BY: https://www.mysqltutorial.org/mysql-group-by.aspx
# ¿Te resulta famialiar esto? ʕ•ᴥ•ʔ
/*
Syntaxis:
SELECT 
    c1, c2,..., cn, aggregate_function(ci)
FROM
    table
WHERE
    where_conditions
GROUP BY c1 , c2,...,cn
ORDER BY c1, c2, ...;
*/

# Contamos el número de veces que aparece cada nombre en la tabla de empleados
;


# EJERCICIO:  Repite la query pero ordenando el resultado por orden alfabético



###########
-- USANDO alias (AS): https://www.mysqltutorial.org/mysql-alias/
/* Se utiliza para cambiar el nombre de una columna de la query para aclarar la salida */

# Cambiemos el nombre de la columna COUNT(first_name) del ejemplo anterior



###### CONCAT



###########
-- HAVING: https://www.mysqltutorial.org/mysql-having.aspx

/*
Utilizado frecuentemente con GROUP BY, especifica una condición de filtro para grupos de filas o agregados.
Funciona como un WHERE pero dentro de una cláusula GROUP BY
Syntax:
SELECT 
    select_list
FROM 
    table_name
WHERE 
    search_condition
GROUP BY 
    group_by_expression
HAVING 
    group_condition;
ORDER BY
	 column_name(s)
	 
Después de HAVING, puedes tener una condición con una función agregada,
mientras que WHERE no puede utilizar funciones agregadas dentro de sus condiciones
*/

# WHERE y HAVING equivalentes:




# Ejemplo donde WHERE no funciona, HAVING sí:


/*Extraer todos los nombres que aparecen más de 250 veces en la tabla de Employees.*/

	# WHERE no funciona:

/*
SELECT first_name, COUNT(first_name) AS names_count
FROM employees
GROUP BY first_name 
WHERE names_count > 250;
*/




-- WHERE vs HAVING 

/*
WHERE nos permite establecer condiciones que se refieren a subconjuntos de filas individuales.
Estas condiciones se aplican *antes* de reorganizar la salida en grupos.
No es hasta este momento que la salida puede ser mejorada o filtrada con una condición especificada
en la cláusula HAVING.
*/

-- AQUÍ UTILIZO LA COLUMNA QUE YA LLEVA EL COUNT > 20 


-- AQUÍ METO EL COUNT DE LA COLUMNA



/*
Del subconjunto de empleados contratados antes de 2015, (se aplica a todas las filas --> WHERE)
Extraer una lista de todos los nombres que se encuentran menos de 50 veces. (función agregada COUNT --> HAVING)
*/




###########
-- LIMIT: https://www.mysqltutorial.org/mysql-limit.aspxauthors
# Mostrar los números de los 10 empleados mejor pagados




##### Orden lógico del procesado en SQL
-- FROM
-- ON
-- JOIN
-- WHERE
-- GROUP BY
-- HAVING
-- SELECT
-- DISTINCT
-- ORDER BY
-- LIMIT




########### EXTRA ###################
-- SQL has built-in functions to deal with NULL values. Good examples are:

# IFNULL(expression_1,expression_2); returns expression_1 if expression_1 is not NULL ; otherwise, it returns expression_2

# COALESCE(value1,value2,...);takes a number of arguments and returns the first non-NULL argument. 
# In case all arguments are NULL, the COALESCE function returns NULL.

# for more info: 
-- > COALESECE() https://www.mysqltutorial.org/mysql-coalesce/
-- > IFNULL() https://www.mysqltutorial.org/mysql-ifnull/