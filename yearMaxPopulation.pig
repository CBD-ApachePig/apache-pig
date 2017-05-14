/*Carga de datos*/

fichero = load 'datosMunicipios.csv' using PigStorage(',') 
AS (year:int, ine_code:int, name:chararray, value:double);

/* Anio en el que tuvo más habitantes dada una ciudad*/
 
filtro_ciudad = filter fichero by name == 'Madrid';

casting = foreach filtro_ciudad generate year, ine_code, name, value;

ordDesc = order casting by value desc;

maximo = limit ordDesc 1;

store maximo into 'anoMaxPopulation';

