# README 

Este trabajo se divide en tres partes. Debido a que se basa en genomas completos de bacterias del género *Treponema* los archivos que se generan son muy pesados y sólo pongo un ejemplo. En la tabla siguiente está anotado el número gi de cada genoma para su consulta.

Los genomas completos fueron obtenidos de NCBI, con el [buscador de genomas](https://www.ncbi.nlm.nih.gov/genome/browse/). Los ID's de las especies son:




| Especie | Ref | gi |
| :--- | :--- | :--- |
| 1. *T. azotonutricium*| NC_015577.1 | 333992987 |
| 2. *T. brennaborense*| NC_015500.1 | 332296669 |
| 3. *T. caldarium*| NC_015732.1 | 339498645 |
| 4. *T. denticola*| NC_002967.9 | 42516522 |
| 5. *T. pallidum*| NC_000919.1 | 15638995 |
| 6. *T. paraluiscuniculi*| NC_015714.1 | 338705982 |
| 7. *T. pedis*| NC_022097.1 | 5308919224 |
| 8. *T. primitia*| NC_015578.1 | 333996462 |
| 9. *T. putidum*| NZ_CP009228.1 | 769218029 |
| 10. *T. succinifasciens*| NC_015385.1 | 328946930 |


**Nota: De ser posible, correr los scripts de R en un cluster, porque son procesos muy largos que usan mucha memoria RAM, cuando son usados en las computadoras personales**

##
 Simulación de lecturas en R

Para esta parte se escribió el script llamado "SimRAD_Treponema.R". Dicho script contiene los comandos para la instalación del paquete SimRAD del repositorio [Bioconductor](http://bioconductor.org/). Después, ejecuta un loop para digerir con SimRAD las secuencias de los genomas completos que se encuentran en la carpeta "genomas_completos". Los nuevos archivos corresponden a lecturas de alelos RAD.

## Alineamiento de secuencias

El script "alineamientos.R" instala el paquete "msa" de Bioconductor. Este paquete permite alinear secuencias con algoritmos como MUSCLE o CLUSTAL. Este pequeño script toma los genomas digeridos generados con SimRAD, que se encuentran en la carpeta digeridos_SimRAD, y los alinea. 

## Gráficas en R

El script "graficas.R" hace una pequeña filogenia inventada (aunque con algo de información verídica, al abrir se da la información bibliográfica). La segunda parte de este script describe brevemente la relación entre el tamaño de los genomas y el número de proteínas y el contenido GC. 

-----------

## Simulación de lecturas de secuenciación de nueva generación con descriptores de calidad, uso de ART

El archivo .txt llamado "ART", describe los comandos para instalar en un contenedor linux el programa **ART** y el comando para correrlo. **ART** se corre en la carpeta descomprimida "art_src_MountRainier_Linux/". El comando para correr un programa en linux es 

    ./[el nombre del programa y sus parámetros]

**ART** tiene los siguientes parámetros: [Parámetros de ART](https://github.com/Amanecer1/Trabajo-Final_Bioinfo2017/blob/master/Proyecto_Final/ART_params.md)

## Ensamblaje incompleto con pyrad

El documento [tarea viejita](https://github.com/Amanecer1/Tareas-Curso-BioinflnvRepro/blob/master/Pasos_pyrad.md), contiene los pasos a seguir para un uso básico de pyrad.

El archivo ,txt [Parámetros de pyrad](https://github.com/Amanecer1/Trabajo-Final_Bioinfo2017/blob/master/Proyecto_Final/genomas_completos/digeridos_SimRAD/Calidades/params-iptest.txt) contiene los parámetros que usé para correr los primeros tres pasos de ensamblaje, no pude continuar porque no se hacen grupos en el paso 3. Por esto no pude desarrollar una filogenia con estos datos. 


## Directorios

### Base: Proyecto_Final

#### bin

Contiene los scripts que usé en R: SimRAD_Treponema.R, alineamientos.R, graficas.R.

#### genomas_completos

Contiene las secuencias de los genomas completos en archivos tipo fasta.

##### Subcarpeta digeridos_SimRAD

Contiene los archivos fasta generados en la simulación. Sin embargo, no son legibles por cualquier programa porque está decodificados como objetos DNAStringSet (tipo de objeto especial para manipular en SimRAD, msa, etc).

###### Subcarpeta Calidades

Debería contener los archivos generados por ART y leídos en FASTQC, pero son muy pesados y no puedo subirlos.
Para correr pyrad, indiqué que este fuera el directorio de trabajo, por lo que se genera aquí el archivo params-iptest.txt. Además, pyrad genera en cada paso del proceso una carpeta y otros archivos (iptest_s1_demultiplex_stats, iptest.json,ipyrad.log), además de que genera una carpeta con archivos nuevos en cada paso, de los seis básicos. ipyrad.log es un archivo donde se van anotando los errores o el estatus de cada paso.

### Subcarpeta BLAST

Contiene los resultados del BLAST, al comparar la especie *Treponema azotonutricium* que es endosimbiótica con el genoma de *T. pallidum que es patogénica* [T.azoto_vs_T_pall.jpge](https://github.com/Amanecer1/Trabajo-Final_Bioinfo2017/blob/master/Proyecto_Final/BLAST/T.azoto_vs_T_pall.jpg). También comparé *T. azotonutricium* contra otra *T. primitia que es endosimbiótica* [T.azoto_vs_T_primitia](https://github.com/Amanecer1/Trabajo-Final_Bioinfo2017/blob/master/Proyecto_Final/BLAST/T.azoto_vs_T.primitia.jpg). Es interesante que los genomas de las dos especies endosimbióticas sean más parecidos (las áreas verdes), en comparación con la patogénica. Con una buena filogenia de referencia, esto podría sugerir que hay convergencia por el hábito, si las especies endosimbióticas están en clados diferentes. También es curioso que las especies endosimbióticas tengan genomas similares en tamaño, en comparación con la patogénica que tiene más o menos una quinta parte del tamaño.




# Pipeline del proyecto
https://github.com/Amanecer1/Trabajo-Final_Bioinfo2017/blob/master/Proyecto_Final/Pipeline.jpg

