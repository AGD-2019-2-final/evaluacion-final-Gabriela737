-- Pregunta
-- ===========================================================================
-- 
-- Obtenga los cinco (5) valores más pequeños de la 3ra columna.
-- Escriba el resultado a la carpeta `output` del directorio actual.
-- 
fs -rm -f -r output;
--
-- >>> Escriba su respuesta a partir de este punto <<<
--
fs -rm -f -r data.tsv
fs -put data.tsv
data = LOAD 'data.tsv' USING PigStorage('\t')
    AS (
        C1:CHARARRAY,
        C2:CHARARRAY,
        C3:INT
    );
a = ORDER data BY C3;
b = limit a 5;
c = FOREACH b GENERATE C3;
DUMP c;
STORE c INTO 'output';
fs -copyToLocal output output;
