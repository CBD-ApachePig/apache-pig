/*Carga de datos*/

file = load 'dataset.csv' using PigStorage(',') AS (year:int, ine_code:int, name:chararray, value:double);

/* La media de varias poblaciones dado su nombre a lo largo de su serie histórica*/

filterByTown = filter file by name == 'Bujalance' or name == 'Cañete de las Torres';

groupByTown = group filterByTown by name;

avg_popolation = foreach groupByTown generate group, AVG(filterByTown.value) as file;

store avg_popolation into 'avg_popolation';








