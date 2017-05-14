/*Carga de datos*/

file = load 'dataset.csv' using PigStorage(',') AS (year:int, ine_code:int, name:chararray, value:double);

/*Ciudades de más de 1 millón de habitantes dado el año*/


citiesWithMoreOfAMillion = filter file by year==2015 and value >= 1000000;

store citiesWithMoreOfAMillion into 'citiesWithMoreOfAMillion';

/*Ciudades de menos de 50 habitantes dado el año*/

citiesWithLessOfAMillion = filter file by year==2015 and value <= 50;

store citiesWithLessOfAMillion into 'citiesWithLessOfAMillion';
