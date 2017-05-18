Avance tres

## Título: Análisis filogenético del género *Treponema* con RADSeq simulado.

### Métodos seguidos

### Uso de programas para simular lecturas

Encontré el programa [ART](https://www.niehs.nih.gov/research/resources/software/biostatistics/art/). Instalé este programa en un nuevo contenedor de Docker con Ubuntu. Al igual que para los otros contenedores, descargué paquetes como curl, wget, bzip2, nano, etcétera,  como los requerimientos mínimos para usar el contenedor. ART permite simular los valores de media, desviación estándar, modelos de error o perfiles de calidad (Huang et al. 2012). Para descargarlo, usé el siguiente comando:

    `wget https://www.niehs.nih.gov/research/resources/assets/docs/artsrcmountrainier20160605linuxtgz.tgz

Para descomprimir el archivo usé el siguiente comando:

    `tar -xvzf artsrcmountrainier20160605linuxtgz.tgz

Para correr este programa tuve algunos problemas, ya que la instalación de las dependencias me marcó un error (E:Unable to find gnu, gls) y otros paquetes. Los primeros comandos que utilicé fueron:

    àpt-get update`
    àpt-get upgrade`
    àpt-get install gnu gls` 

Después de leer en internet y no poder resolver mi problema, le pregunté a un informático. Estuvimos una hora intentando resolver el problema hasta que lo logramos. Entre los comandos que utilizamos para lograr instalar y encontrar las dependencias usamos el comando:

    `Este comando permite hacer un enlace simbólico (parecido a un acceso directo) a la librería gnu
    `ln -s /usr/lib/x86_64-linux-gnu/libgsl.co.19 /usr/lib/x86_64-linux-gnu/libgsl.so.0
    `Este comando permite compilar e instalar la paquetería base que necesita ART para correr
    `../configure --prefix=/test/

     àpt-get install 

Para correr el programa ART, es necesario estar en la carpeta descomprimida y correr:

    `./art_illumina -sam -i ../../../datos/ProyectoFinal_ERA/T.azotonutricium.fasta -l 25 -f 6 -o ../../../datos/ProyectoFinal_ERA/digeridos_SimRAD/calidades/T.azo_single 

Donde "-sam" significa: 
" -l" es el largo de la lectura
"-f" es el full coverage

Este programa genera archivos fastq que pueden ser leídos por el programa FASTQC, [imagen de ejemplo]()

#### Paquetería de R, uso de librerías de bioconductor
Uso de un paquete de simulación SImRAD y alineación con msn.
Con esta paquetería puedo alinear las secuencias digeridas de los genomas y poder comparar la variación. 


Con los fragmentos simulados en formato FASTA, correr el programa ART para simular las condiciones de calidad

### Reensamblaje en ipyrad


##### Paso 1. Demultiplexar o desagrupar las secuencias de acuerdo a los adaptadores.

Le moví al parámetro "## [4] [sorted_fastq_path]: Location of demultiplexed/sorted fastq files a

    `./*.fq 
    
porque ART genera archivos *.fq 

y al parámetro
    
"## [5] [assembly_method]: Assembly method (denovo, reference, denovo+reference, denovo-reference)" a     

    `de novo
Comando

    `ipyrad -p params-iptest.txt -s 1

##### Paso 2. Filtrar las secuencias

Le moví el parámetro ## [17] [filter_min_trim_len]: Min length of reads after adapter trim de 33 (default) a 20 para que las secuencias pasaran.

    `ipyrad -p params-iptest.txt -s 2

##### Paso 3. Agrupamiento de las secuencias de cada muestra por valor de calidad. 

Le moví el parámetro "## [14] [clust_threshold]: Clustering threshold for de novo assembly" de 0.85 (default) a 0.6 para poder agrupar las secuencias, **no se forman grupos y no puedo continuar a los siguientes pasos y no sé porqué.** 

    `ipyrad -p params-iptest.txt -s 3

Análsis filogenéticos

##Pipeline de trabajo

[Pipeline](https://github.com/Amanecer1/Trabajo-Final_Bioinfo2017/blob/master/Pipeline.jpg) para trabajar con simulación y reensamblaje de secuencias para análisis filogenéticos.

[Archivo md](https://github.com/Amanecer1/Trabajo-Final_Bioinfo2017/blob/master/Trabajo_final.md) del trabajo final.
