# Avance dos



## Título: Análisis filogenético del género *Treponema* con RADSeq simulado.

### Justificación

El avance de la tecnología (en particular, la computación) en conjunto con los campos de la bioquímica y la biología molecular han permitido el auge de la genómica. Ésta se define como la ciencia que estudia los genomas, sus propiedades, su evolución, la integración con los procesos celulares, etc. Actualmente se ha generado información acerca de la genética de diversos organismos que está incluida en repositorios especializados y generalmente de libre acceso. Esta apertura del conocimiento permite aprovechar los datos que han sido obtenidos de manera independiente por diferentes grupos de trabajo y analizarlos para generar nuevo conocimiento o para validar el que existe.


### Sistemas de estudio




| Especie | ID |
| :--- | :--- |
| 1. *T. azotonutricium*| NC_015577.1 |
| 2. *T. brennaborense*| NC_015500.1 |
| 3. *T. caldarium*| NC_015732.1 |
| 4. *T. denticola*| NC_002967.9 |
| 5. *T. pallidum*| NC_000919.1 |
| 6. *T. paraluiscuniculi*| NC_015714.1 |
| 7. *T. pedis*| NC_022097.1 |
| 8. *T. primitia*| NC_015578.1 |
| 9. *T. putidum*| NZ_CP009228.1 |
| 10. *T. succinifasciens*| NC_015385.1 |


Estas especies son bacterias que pueden ser patogénicas de humanos, conejos y vacas o pueden ser endosimbiontes facultativos u obligados de los tractos digestivos de termitas. Además, se ha propuesto que las diferentes formas de vida de las bacterias pueden implicar ganancia y pérdida de genes (Ochman y Moran 2001). Por su parte, las especies patogénicas tienen en su genoma, secuencias que codifican para los genes tprC, tprI, tprK, tprG y tprJ, asociados a su patogenicidad (Gray et al 2006). 

### Métodos seguidos

##### Búsqueda y descarga de secuencias de genomas completos

En la dirección de NCBI [buscador](https://www.ncbi.nlm.nih.gov/genome/browse/) busqué genomas completos de al menos cuatro especies del mismo género. Debido a que los datos de genomas de eucariontes no reunían mis condiciones al poner esos filtros de búsqueda, decidí usar los genomas bacterianos. Encontré 10 especies del género Treponema con genomas completos. Los descargué en formato FASTA.

##### Simulación de lecturas generadas por el paquete SimRAD de R

No puedo generar un reporte de este script porque colapsa el programa R, debido a que requiere mucha memoria. Por esto anexo los comandos que seguí para hacer las simulaciones, con el ejemplo de la especie *T. denticola*.

###### Instalación del paquete de SimRAD

    source("https://bioconductor.org/biocLite.R")
    biocLite()#instala los paquetes núcleo
    biocLite(c("zlibbioc","ShortRead","Biostrings")) #para instalar los paquetes asociados a SimRAD
    install.packages(c("SimRAD", repos=c("http://rstudio.org/_packages", "http://cran.rstudio.com"))) #para instalar SimRAD
    
Corrí las funciones para hacer una simulación con la enzima PStI, generando datos semejantes al RADseq original. 

1. Crear un objeto con una secuencia de referencia. Función para jalar una secuencia de referencia en formato fasta

    `referencia<-ref.DNAseq(FASTA.file= "C:\\Users\\Erandi\\Desktop\\Bioinformatica\\ProyectoFinal_ERA\\T.denticola.fasta", subselect.contigs =T, prop.contigs = 0.1)`
    
2. Determinar los sitios de restricción. Comandos para crear los objetos que contengan los sitios de corte de alguna enzima de restricción

 Sitios de corte de la enzima PstI

    `cs_5p1 <- "TGCA"`

    `cs_3p1 <- "ACGT"` 

3. Realizar la digestión. Función para hacer una digestión simulada de la secuencia de referencia con los sitios de corte de la enzima de restricción

    `simseq.dig <- insilico.digest(referencia, cs_5p1, cs_3p1, verbose=TRUE)`

3.1 Observar los fragmentos resultantes. Comando para ver la primeras líneas del resultado de la digestión

    `head(simseq.dig)`

4. Crear un tipo de archivo para contener las secuencias. El comando DNAStringSet permite convertir a un tipo de archivo

    `Treponema<-DNAStringSet(x= simseq.dig)`


5. Exportar a un archivo los nuevos fragmentos. Comando para escribir un archivo FASTA con los fragmentos que se generaron en la digestión

    `writeXStringSet(Treponema, "C:\\Users\\Erandi\\Desktop\\Bioinformatica\\ProyectoFinal_ERA\\T.denticol.dig.fasta", append=FALSE, compress=T, compression_level=NA, format="fasta")`



##### Simulación de lecturas generadas por la plataforma de secuenciación PacBio

###### Instalación del simulador SiLiCO (García-Baker et al. in press)

A partir de una búsqueda de simuladores para generar secuencias en el buscador [Omics Tools](https://omictools.com/), realicé una búesqueda con las palabras "simulation assembly". Seleccioné el programa SiLiCO porque en la simulación permite dar valores de media y desviación estándar de los fragmentos (ver aquí [SiLiCO](https://github.com/ethanagbaker/SiLiCO) ). 
He trabajado en Docker porque no quiero instalar nada que "mate" mi computadora. SiLiCO requiere trabajar con lenguaje python, por lo que descargué el contenedor con python, con este comando:

    docker pull python

Monté el volumen con el directorio donde he guardado las secuencias descargadas

    docker run -v C:\\Users\\Erandi\\Desktop\\Bioinformatica\\ProyectoFinal_ERA:/datos -it python /bin/bash

Actualicé e instalé paquetes de linux para el contenedor de Python

    apt-get update

    apt-get upgrade

    apt-get install wget curl bzip2 nano

Después de tener listo el contenedor, instalé el programa

    wget https://github.com/ethanagbaker/SiLiCO/blob/master/releases/v1.0.1/SiLiCO-1.0.1.tar.gz?raw=true

Seguí las instrucciones del repositorio de SiLiCO que se mencionan en el archivo [README.md](https://github.com/ethanagbaker/SiLiCO/blob/master/README.md):

    tar -xvzf SiLiCO-1.0.0.tar.gz
    cd SiLiCO-1.0.0
    python setup.py build
    python setup.py install

Corrí el programa con las cada secuencia por separado con los valores por default de media, desviación estándar. Modifiqué los valores de coverage y de trials. Actualmente estoy escribiendo un loop sencillo para correr todos los archivos:

    python SiLiCO.py -i ../datos/ProyectoFinal_ERA/T.azonutricium.fasta -o ../datos/ProyectoFinal_ERA/T.azotonutricium_sil -p -m 10000 -s 2050 -c 9 trials=9

El flag `-p` determina el tipo de plataforma, en este caso PacBio. Los otros comandos son `-m` es la longitud media de las lecturas, `-s` es la desviación estándar, `-c` es el coverage (el default es 8), y `trials` es el número de corridas (el default es 1).

Este programa genera archivos tipo bed. 



#### Inconvenientes

El primer intento fue generar las lecturas con SimRAD en R y con SiLiCO, sin embargo éstas sólo pueden exportarse en formato FASTA y ipyrad sólo reconoce archivos con formato fastq. Esto es, las características intrísecas de calidad de las lecturas, en esta simulación no están. Por esto procederé a hacer un análsis comparativo de las regiones de patogenicidad entre las especies patógenas y sus diferencias con las especies facultativas y obligadas endosimbióticas.

##### Método propuesto

1. Buscar los genes tprcC, D, I, K, G (Gray y Mulligan 2006) de patogenicidad.

2. Encontré el programa MetaSim. Este programa simula lecturas y puede ser utilizado para diseñar un metagenoma (Richter et al. 2008).

3. Quisera seguir los pasos recomendados para realizar simulaciones a diferentes niveles, propuestos en Escalona et al. 2016. Para generar archivos de calidad fastq, había estado considerando el programa FASTQSim, estoy terminando la instalación. No estaba segura del uso de este programa, sin embargo en el artículo mencionado ya lo citan.


### Literatura consultada

Escalona; M., Rocha, S., Posada, D. 2016. A comparison of toools for the simulation of genomic next-generation sequencing data. Nature 17: 459-469.

Gray R. R., Mulligan . C.J, et al. 2006. Molecular evolution of the tprC, D, I, K, G, and J genes in the pathogenic genus *Treponema*. Mol. Biol. Evol. 23(11):2220-2233.

Ochman H. and Moran N. A. 2001. Genes lost and genes found: evolution of bacterial pathogenesis and symbiosis. Science 292(5519):1096-1999.

Richter DC, Ott F, Auch AF, Schmid R, Huson DH. 2008. MetaSim—A Sequencing Simulator for Genomics and Metagenomics. PLoS ONE 3(10): e3373. doi:10.1371/journal.pone.0003373 

Roads, A. and Fai Au, K. 2015. PacBio Sequencing and Applications. Genomics, Proteomics and Bioinformatics 13(5): 278-289.



