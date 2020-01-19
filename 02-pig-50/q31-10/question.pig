-- 
-- Pregunta
-- ===========================================================================
-- 
-- Para responder la pregunta use el archivo `data.csv`.
-- 
-- Cuente la cantidad de personas nacidas por año.
-- 
-- Escriba el resultado a la carpeta `output` del directorio actual.
-- 
fs -rm -f -r output;
-- 
fs -rm -f data.csv;
fs -put data.csv;
u = LOAD 'data.csv' USING PigStorage(',') 
    AS (id:int, 
        firstname:CHARARRAY, 
        surname:CHARARRAY, 
        birthday:CHARARRAY, 
        color:CHARARRAY, 
        quantity:INT);
--
-- >>> Escriba su respuesta a partir de este punto <<<
--
formato = FOREACH u GENERATE ToDate(birthday,'yyyy-MM-dd') as date;
selected = FOREACH formato GENERATE GetYear(date) as year;
gruped = GROUP selected BY year;
cant = FOREACH gruped GENERATE group, COUNT(selected);
DUMP cant;
STORE cant INTO 'output' USING PigStorage(',');
fs -copyToLocal output output;
