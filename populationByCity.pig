/*Carga de datos*/

fichero = load 'datosMunicipios.csv' using PigStorage(',') 
AS (year:int, ine_code:int, name:chararray, value:double);

/*Habitantes de una población dado el año*/
 
filtro_mun = filter fichero by name == 'Madrid' and year == 2015;

store filtro_mun into 'poblacionMunicipio';

