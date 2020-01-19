-- 
-- Pregunta
-- ===========================================================================
-- 
-- Para responder la pregunta use el archivo `data.csv`.
-- 
-- Escriba el código equivalente a la siguiente consulta SQL.
-- 
--    SELECT
--        firstname,
--        color
--    FROM 
--        u
--    WHERE color = 'blue' OR firstname LIKE 'K%';
-- 
-- Escriba el resultado a la carpeta `output` del directorio actual.
-- 
fs -rm -f -r output;
--
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
fs -rm -f data.csv;
fs -put data.csv;
u = LOAD 'data.csv' USING PigStorage(',')
    AS (id:int,
        firstname:CHARARRAY,
        surname:CHARARRAY,
        birthday:CHARARRAY,
        color:CHARARRAY,
        quantity:INT);
filtro = FILTER u BY firstname matches '.*K.*' OR color == 'blue';
selected = FOREACH filtro GENERATE firstname, color;
DUMP selected;
STORE selected INTO 'output' USING PigStorage(',');
fs -copyToLocal output output;
