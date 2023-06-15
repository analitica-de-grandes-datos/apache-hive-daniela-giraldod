/* 
Pregunta
===========================================================================

Para resolver esta pregunta use el archivo `data.tsv`.

Construya una consulta que ordene la tabla por letra y valor (3ra columna).

Apache Hive se ejecutará en modo local (sin HDFS).

Escriba el resultado a la carpeta `output` de directorio de trabajo.

        >>> Escriba su respuesta a partir de este punto <<<
*/


CREATE TABLE datos (letra STRING,dates DATE,number INT)

ROW FORMAT DELIMITED FIELDS TERMINATED BY '\t' STORED AS TEXTFILE;

LOAD DATA LOCAL INPATH 'data.tsv' OVERWRITE INTO TABLE datos;

SELECT *
FROM datos
ORDER BY letra ASC, number ASC;


INSERT OVERWRITE DIRECTORY 'output'
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
SELECT *
FROM datos
ORDER BY letra ASC, number ASC;
