-- 
-- Pregunta
-- ===========================================================================
-- 
-- Para el archivo `data.tsv` compute Calcule la cantidad de registros en que 
-- aparece cada letra minúscula en la columna 2.
-- 
-- Escriba el resultado a la carpeta `output` del directorio actual.
-- 
fs -rm -f -r output;
--
-- >>> Escriba su respuesta a partir de este punto <<<
--
fs -rm -f -r output;
fs -rm -f -r data.tsv
fs -put data.tsv
data3 = LOAD 'data.tsv' USING PigStorage('\t')
    AS (
        C1:CHARARRAY,
        C2:BAG{t: TUPLE(p:CHARARRAY)},
        C3:MAP[]
    );
a = FOREACH data3 GENERATE FLATTEN(C2.p);
g = GROUP a BY $0;
r = FOREACH g GENERATE group AS c2, COUNT(a) AS count;
DUMP r;
STORE r INTO 'output';
fs -copyToLocal output output;
