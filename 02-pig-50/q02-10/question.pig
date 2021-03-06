-- Pregunta
-- ===========================================================================
-- 
-- Ordene el archivo `data.tsv`  por letra y valor (3ra columna).
-- Escriba el resultado a la carpeta `output` del directorio actual.
-- 
fs -rm -f -r output;
-- 
--  >>> Escriba el codigo del mapper a partir de este punto <<<
-- 
fs -rm -f -r data.tsv
fs -put data.tsv
data = LOAD 'data.tsv' USING PigStorage('\t')
    AS (
        C1:CHARARRAY,
        C2:CHARARRAY,
        C3:INT
    );
a = ORDER data BY  C1, C3;
DUMP a;
STORE a INTO 'output';
fs -copyToLocal output output;

