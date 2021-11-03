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
SELECT * FROM departments;


###########
-- SELECT - FROM: https://www.mysqltutorial.org/mysql-select-statement-query-data.aspx
###########
SELECT * FROM employees;


# seleccionar columnas específicas de la tabla
SELECT birth_date, first_name, gender 
FROM employees;

# seleccionar todas las columnas de la tabla   
SELECT * FROM employees;

# poniendo alias a las columnas
SELECT birth_date as CUMPLE, first_name as NOMBRE, gender 
FROM employees;

SELECT birth_date CUMPLE, first_name NOMBRE, gender 
FROM employees; #PONED AS PORQUE SI NO NO SE ENTIENDE NADA

###########
-- WHERE: https://www.mysqltutorial.org/mysql-where/

/* 
Nos permite especificar las condiciones que los datos que queremos seleccionar
deben satisfacer
*/

SELECT * 
FROM employees
WHERE first_name = "Parto";

-- Todos los empleados nombrados Hugo

SELECT * 
FROM employees
WHERE first_name = "Hugo";


-- Todas las empleadas

SELECT * 
FROM employees
WHERE gender = "F";


###########    
/*
En SQL hay muchos OPERADORES que se utilizan para enlazar
las palabras clave y los simbolos. Echemos un vistazo a los más 
¡frecuentes!
*/    
###########
-- AND: https://www.mysqltutorial.org/mysql-and/

-- Todas las empleadas llamadas Hugo

SELECT * 
FROM employees
WHERE gender = "F" and first_name = "Hugo";


###########
-- OR: https://www.mysqltutorial.org/mysql-or/

-- Todas las empleadas que son mujeres o se llaman Hugo

SELECT * 
FROM employees
WHERE gender = "F" OR first_name = "Hugo";

###########
-- Precedencia del operador

# ¿Qué va a devolver esta query?

SELECT *
FROM employees
WHERE (first_name = "Hugo" AND gender = "F") OR gender = "M";

# ¿Y esta?

/*
Regla SQL: El operador AND tiene prioridad sobre el operador OR
			  Si queremos anular este comportamiento, debemos utilizar paréntesis.
*/

-- La siguiente query devuelve todos los Hugo que sean F o M

SELECT *
FROM employees
WHERE first_name = "Hugo" AND (gender = "F" OR gender ="M");

###########
-- IN / NOT IN: https://www.mysqltutorial.org/sql-in.aspx

# Recuperar todos los datos de las personas llamadas Hugo, Mark, Bojan o Anneke
SELECT *
FROM employees
WHERE first_name = "Hugo"
OR first_name = "Mark"
OR first_name = "Bojan"
OR first_name = "Anneke";



# Otra opción ("Tipo Python")
SELECT * 
FROM employees 
WHERE first_name IN ('Hugo', 'Mark', 'Bojan','Anneke');

# O, para hacer lo contrario
SELECT * 
FROM employees 
WHERE first_name NOT IN ('Hugo', 'Mark', 'Bojan','Anneke');


###########
-- LIKE / NOT LIKE: https://www.mysqltutorial.org/mysql-like/
/*
Query basada en un patrón especificado
Sintaxis: expresión LIKE patrón
(Observe que los patrones no distinguen entre mayúsculas y minúsculas)
*/

SELECT * 
FROM employees
WHERE first_name LIKE ("An%");



# El comodín de porcentaje ( % ) coincide con cualquier cadena de cero o más caracteres. 
# (Puede verse como un sustituto de una secuencia de caracteres)

# Seleccionar todos los empleados cuyo nombre empieza por 'An'
SELECT * 
FROM employees
WHERE first_name LIKE ("an%");



# ¿Qué hará esto?

SELECT * 
FROM employees
WHERE first_name LIKE ("%an");

# ¿Y esto?    
SELECT * 
FROM employees
WHERE first_name LIKE ("%an%");



-- El comodín del guión bajo ( _ ) coincide con cualquier carácter, pero sólo con uno
# Seleccionamos los nombre que empiezan por mar y un caracter más

SELECT * 
FROM employees
WHERE first_name LIKE ("mar_");


# (NOT LIKE funciona justo devolviéndome lo contrario,  todo lo que no sea mar y un caracter)
# TODO LO QUE NO SEA LO QUE DEVUELVE LA QUERY ANTERIOR

SELECT * 
FROM employees
WHERE first_name NOT LIKE ("mar_");

# Recuperar todos los datos de los empleados no contratados en el año 1990

SELECT *
FROM employees
WHERE hire_date NOT LIKE ("1990%");

/*
NOTA: *, %, _ son llamadaos "Wildcard Characters" o "Comodines"
*/


###########
-- BETWEEN - AND: https://www.mysqltutorial.org/mysql-between

# Con fechas
SELECT *
FROM employees
WHERE hire_date >= "1990-01-01" AND hire_date <= "2000-01-01";


# Es equivalente a 

SELECT *
FROM employees
WHERE hire_date BETWEEN "1990-01-01" AND  "2000-01-01";

# con tipos numéricoos 
SELECT *
FROM salaries
WHERE salary BETWEEN 60000 AND 70000;


SELECT *
FROM salaries
WHERE salary >= 60000 AND salary <= 70000;

# con strings

SELECT *
FROM employees
WHERE first_name BETWEEN "A" AND "D"
ORDER BY first_name DESC;


# Puedo utilizar wildcard 

SELECT *
FROM employees
WHERE first_name BETWEEN "BE%" AND "C%";


-- Orden alfabético, los nombres empiezan entre a y d 
    
###########
-- IS NOT NULL / IS NULL: https://www.mysqltutorial.org/mysql-is-null/
-- Como en pandas, jeje ʕ•ᴥ•ʔ

SELECT *
FROM employees
WHERE first_name IS NULL;

SELECT *
FROM employees
WHERE first_name IS NOT NULL;


###########
-- Operadores matemáticos de comparación

	# igual = (solo un igual, sintaxis SQL)
	# distinto <> or !=   (como en python)
	# mayor que >
	# mayor o igual que >=
	# menor que <
	# menor o igual que  <=
    


-- Ejercicio: Devuelve todas las columnas de las empleadas contratadas después de '2000-01-01'
SELECT *
FROM employees
WHERE gender = "F" AND hire_date > '2000-01-01';

-- los datos numéricos no van entre comillas

SELECT *
FROM salaries
WHERE salary >= 60000 AND salary <= 70000;

###########
-- Operadores aritméticos
-- Podemos operar columnas o podemos meterlos como resultado en una cláusula where

	# suma + 
	# resta - 
	# multiplicación * 
	# división / 
	# módilo % 

SELECT SUM(salary) from salaries;

SELECT salary, (salary * 4/ 100) from salaries;


SELECT * from salaries
WHERE salary / 2 = 36402;


SELECT emp_no, salary, (salary*16 / 100) as IRPF
FROM salaries
WHERE from_date > "1998-12-20";

SELECT SUM(salary) as TOTAL
FROM salaries
WHERE from_date LIKE ("1998%");

###########
-- SELECT DISTINCT: https://www.mysqltutorial.org/mysql-distinct.aspx

SELECT DISTINCT gender
FROM employees;



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

SELECT COUNT(emp_no)
FROM employees;


# ¿Cuántos nombres diferentes tenemos en la tabla?

SELECT COUNT(DISTINCT first_name)
FROM employees;

-- ¿Cuántos empleados han nacido después de 1965-01-01??

SELECT COUNT(*) # NOTA: el uso de * hace que COUNT incluya valores NULL
FROM employees
WHERE birth_date >= "1965-01-01"; #En este caso no hay nulos en la columna cumpleaños


# Contar el número de departamentos únicos
SELECT COUNT(DISTINCT dept_name)
FROM departments;

SELECT COUNT(DISTINCT dept_name)
FROM departments
GROUP BY dept_name; # SI NO LE INDICO LA COLUMNA ME SALE EL COUNT CON GROUPBY PERO NO SÉ DE QUÉ

    
###########
-- ORDER BY: https://www.mysqltutorial.org/mysql-order-by/

# Ordenar los nombres por orden alfabético
# ASC por defecto

SELECT *
FROM employees
ORDER BY first_name DESC;


SELECT *
FROM employees
ORDER BY first_name;

# Usando múltiples campos

SELECT *
FROM employees
ORDER BY first_name, last_name;


# MAX()

SELECT MAX(salary)
FROM salaries;

# MIN()

SELECT MIN(salary)
FROM salaries;

# AVG()

SELECT AVG(salary)
FROM salaries;




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
SELECT first_name, COUNT(first_name)
FROM employees
GROUP BY first_name;


# EJERCICIO:  Repite la query pero ordenando el resultado por orden alfabético

SELECT first_name, COUNT(first_name) as count
FROM employees
GROUP BY first_name
ORDER BY first_name;

###########
-- USANDO alias (AS): https://www.mysqltutorial.org/mysql-alias/
/* Se utiliza para cambiar el nombre de una columna de la query para aclarar la salida */

# Cambiemos el nombre de la columna COUNT(first_name) del ejemplo anterior
SELECT first_name AS nombre, COUNT(first_name) AS count
FROM employees
GROUP BY first_name
ORDER BY first_name;


###### CONCAT
SELECT CONCAT(first_name, " ",  last_name) as FULL_NAME
FROM employees; 





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

SELECT *
FROM employees
WHERE hire_date >= "2000-01-01";

SELECT *
FROM employees
HAVING hire_date >= "2000-01-01";



# Ejemplo donde WHERE no funciona, HAVING sí:


/*Extraer todos los nombres que aparecen más de 250 veces en la tabla de Employees.*/

	# WHERE no funciona:

/*
SELECT first_name, COUNT(first_name) AS names_count
FROM employees
GROUP BY first_name 
WHERE names_count > 250;
*/

SELECT first_name, COUNT(first_name) AS names_count
FROM employees
GROUP BY first_name
HAVING names_count > 250;



-- WHERE vs HAVING 

/*
WHERE nos permite establecer condiciones que se refieren a subconjuntos de filas individuales.
Estas condiciones se aplican *antes* de reorganizar la salida en grupos.
No es hasta este momento que la salida puede ser mejorada o filtrada con una condición especificada
en la cláusula HAVING.
*/

/*
Dame nombre y cuántas veces aparece nombre en los datos si has sido contratada en 1986 y ese nombre 
aparece más de 20 veces.
*/

-- AQUÍ UTILIZO LA COLUMNA QUE YA LLEVA EL COUNT > 20 

SELECT first_name, COUNT(first_name) as count
FROM employees
WHERE hire_date LIKE ("1986%") #CONDICIÓN INIDIVUAL DE REGISTRO, CONTRATADAS EN 1986
GROUP BY first_name
HAVING count > 20 # CONDICIÓN SOBRE LA AGRUPACIÓN
ORDER BY count DESC;



/*
Del subconjunto de empleados contratados antes de 2015, (se aplica a todas las filas --> WHERE)
Extraer una lista de todos los nombres que se encuentran más de 50 veces. (función agregada COUNT --> HAVING)
*/

SELECT first_name, COUNT(first_name) as count
FROM employees
WHERE hire_date < "2015-01-01"
GROUP BY first_name
HAVING count > 50;

###########
-- LIMIT: https://www.mysqltutorial.org/mysql-limit.aspxauthors
# Mostrar los números de los 10 empleados mejor pagados

SELECT emp_no, salary
FROM salaries
ORDER BY salary DESC
LIMIT 10;

SELECT salaries.emp_no, first_name, last_name, salary
FROM employees
JOIN salaries
ON employees.emp_no = salaries.emp_no 
ORDER BY salary DESC
LIMIT 10;



##### Orden lógico del procesado en SQL
-- SELECT
-- FROM
-- ON
-- JOIN
-- WHERE
-- GROUP BY
-- HAVING
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