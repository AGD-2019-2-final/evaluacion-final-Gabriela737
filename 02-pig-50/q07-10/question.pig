-- Pregunta
-- ===========================================================================
-- 
-- Para el archivo `data.tsv` genere una tabla que contenga la primera columna,
-- la cantidad de elementos en la columna 2 y la cantidad de elementos en la 
-- columna 3 separados por coma. La tabla debe estar ordenada por las 
-- columnas 1, 2 y 3.
-- 
-- Escriba el resultado a la carpeta `output` del directorio actual.
-- 
fs -rm -f -r output;
--
-- >>> Escriba su respuesta a partir de este punto <<<
--
fs -rm -f -r data.tsv
fs -put data.tsv
data3 = LOAD 'data.tsv' USING PigStorage('\t')
    AS (
        C1:CHARARRAY,
        C2:BAG{t: TUPLE(p:CHARARRAY)},
        C3:MAP[]
    );    
a = FOREACH data3 GENERATE C1,SIZE(C2) AS C2, SIZE(C3) AS C3;
b = ORDER a BY C1,C2,C3;
DUMP b;
STORE b INTO 'output' USING PigStorage(',');
fs -copyToLocal output output;
