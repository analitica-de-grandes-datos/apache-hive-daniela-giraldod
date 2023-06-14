/* 
Pregunta
===========================================================================

Para resolver esta pregunta use el archivo `data.tsv`.

Compute la cantidad de registros por cada letra de la columna 1.
Escriba el resultado ordenado por letra. 

Apache Hive se ejecutará en modo local (sin HDFS).

Escriba el resultado a la carpeta `output` de directorio de trabajo.

        >>> Escriba su respuesta a partir de este punto <<<
*/

DROP TABLE IF EXISTS datos;
DROP TABLE IF EXISTS counter;


CREATE TABLE datos (letra STRING,dates DATE,number INT)

ROW FORMAT DELIMITED FIELDS TERMINATED BY '\t'

LOAD DATA LOCAL INPATH "data.tsv" OVERWRITE INTO TABLE datos;
INSERT OVERWRITE DIRECTORY 'output'
ROW FORMAT DELIMITED FIELDS TERMINATED BY ','

SELECT SUBSTR(letra, 1, 1) AS letra, COUNT(*) AS cantidad
FROM datos
GROUP BY SUBSTR(letra, 1, 1)
ORDER BY letra;
