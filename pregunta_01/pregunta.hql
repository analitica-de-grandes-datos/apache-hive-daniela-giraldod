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

CREATE TABLE datos (letra STRING,dates DATE,number INT)

ROW FORMAT DELIMITED FIELDS TERMINATED BY '\t' STORED AS TEXTFILE;

LOAD DATA LOCAL INPATH 'data.tsv' OVERWRITE INTO TABLE datos;

SELECT letra, COUNT(letra) AS cantidad
FROM datos
GROUP BY letra;

INSERT OVERWRITE DIRECTORY 'output'
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
SELECT letra, COUNT(letra) AS cantidad
FROM datos
GROUP BY letra;
