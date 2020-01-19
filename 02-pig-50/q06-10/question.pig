-- 
-- Pregunta
-- ===========================================================================
-- 
-- Para el archivo `data.tsv` Calcule la cantidad de registros por clave de la 
-- columna 3. En otras palabras, cuántos registros hay que tengan la clave 
-- `aaa`?
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
a = FOREACH data3 GENERATE FLATTEN(C3);
g = GROUP a BY $0;
r = FOREACH g GENERATE $0,COUNT(a);
DUMP r;
STORE r INTO 'output' USING PigStorage(',');
fs -copyToLocal output output;
