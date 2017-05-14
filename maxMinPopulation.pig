/*Carga de datos*/

fichero = load 'dataset.csv' using PigStorage(',') 
AS (year:int, ine_code:int, name:chararray, value:double);
 
/*Municipio y año con más poblacion*/

agrupados_municipio = group fichero by (name, year);

mun_poblacionMax = foreach agrupados_municipio generate (fichero.name,fichero.year), MAX(fichero.value) as max;

ordenadoMax = order mun_poblacionMax by max desc;

maximo = limit ordenadoMax 1;

store maximo into 'maximo';


/*Municipio y año con menos poblacion*/

ficheroCapado = filter fichero by name != 'name';

ord = order ficheroCapado by value;

minimo = limit ord 1;

store minimo into 'minimo';
