### Erandi Ramírez Aguirre

### Trabajo final

## Carpetas

### Carpeta de trabajo: "ProyectoFinal_ERA"

Contiene las secuencias de los genomas completos

### Subcarpeta BLAST

Contiene los resultados del BLAST para la sección 3.1 (abajo)

### Subcarpeta de simulaciones: "digeridos_SimRAD"

Contiene las secuencias digeridas son SimRAD en R. La enzima de restricción fue PstI.

### Subdirectorio de archivos asociados a indicadores de calidad simulados con ART: "Calidades"

Contiene los archivos obtenidos de ART

[Imagen de ejemplo](https://github.com/Amanecer1/Trabajo-Final_Bioinfo2017/blob/master/T.azoto_single_fastqc.html)

Esta carpeta es la que se usará para reensamblar (casi) "de novo" los genomas en pyrad.

Al correr pyrad se generan automáticamente las carpetas de cada paso del proceso.

# PIPELINE DEL TRABAJO

https://github.com/Amanecer1/Trabajo-Final_Bioinfo2017/blob/master/Pipeline.jpg

### Paso 1

Bajar los genomas completos: [NCBI genome browser](https://www.ncbi.nlm.nih.gov/genome/browse/)

### Paso 2. Generación de lecturas de secuenciación de nueva generación

#### 2.1.1 Simulación con ART

Después de instalar ART [Avance 3](https://github.com/Amanecer1/Trabajo-Final_Bioinfo2017/blob/master/Avances_3_Erandi_Ram%C3%ADrez_Aguirre.md) , correr ART con cada genoma. Es importante explorar los diferentes parámetros del programa, dependiendo de la pregunta y el organismo que se estudie.

`./art_illumina -sam -i ../../../datos/ProyectoFinal_ERA/T.azotonutricium.fasta -l 25 -f 6 -o ../../../datos/ProyectoFinal_ERA/digeridos_SimRAD/calidades/T.azo_single`

#### 2.1.2 Ensamblaje con pyrad

Uso básico de pyrad, [tarea viejita](https://github.com/Amanecer1/Tareas-Curso-BioinflnvRepro/blob/master/Pasos_pyrad.md)

#### 2.1.3 Realizar la filogenia


#### 2.2.1 Simulación de alelos RAD y análisis en R, con bioconductor

Desde la instalación y el ejemplo, ver en https://github.com/Amanecer1/Trabajo-Final_Bioinfo2017/blob/master/Avances_2_Erandi_Ramirez_Aguirre.md

#### 2.2.2 Alineación

Ver https://github.com/Amanecer1/Trabajo-Final_Bioinfo2017/blob/master/Avances_3_Erandi_Ram%C3%ADrez_Aguirre.md

#### 2.2.3 Comparación de SNP´s

#### 3.1 Patogenicidad

Con la información de Gray et al (2006), hacer un BLAST de las regiones tprC, D, I, K, G, y J contra los genomas de las especies de Treponema que se han estado trabajando. Y realizar las comparaciones de los cambios entre especies, patogénicas y endosimbióticas.










