-- 
-- Pregunta
-- ===========================================================================
-- 
-- Para el archivo `data.tsv` compute la cantidad de registros por letra. 
-- Escriba el resultado a la carpeta `output` del directorio actual.
--
fs -rm -f -r output;
--
-- >>> Escriba su respuesta a partir de este punto <<<
--
fs -rm -f -r data.tsv
fs -put data.tsv
data = LOAD 'data.tsv' USING PigStorage()
    AS (
        letter:CHARARRAY,
        date:CHARARRAY,
        number:INT
    );
y = GROUP data BY $0;
z = FOREACH y GENERATE $0, COUNT(data);
DUMP z;
STORE z INTO 'output';
fs -copyToLocal output output;
