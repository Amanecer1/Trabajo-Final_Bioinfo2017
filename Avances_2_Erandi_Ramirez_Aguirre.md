# Avance dos



## Título: Análisis filogenético del género *Treponema* con RADSeq simulado.

### Justificación

El avance de la tecnología (en particular, la computación) en conjunto con los campos de la bioquímica y la biología molecular han permitido el auge de la genómica. Ésta se define como la ciencia que estudia los genomas, sus propiedades, su evolución, la integración con los procesos celulares, etc. Actualmente se ha generado información acerca de la genética de diversos organismos que está incluida en repositorios especializados y generalmente de libre acceso. Esta apertura del conocimiento permite aprovechar los datos que han sido obtenidos de manera independiente por diferentes grupos de trabajo y analizarlos para generar nuevo conocimiento.


### Sistemas de estudio

Las especies son:




| Especie | ID |
-----------------------------------------------------------
| 1. *T. azotonutricium* || NC_015577.1 |
| 2. *T. brennaborense* || NC_015500.1 |
| 3. *T. caldarium* || NC_015732.1 |
| 4. *T. denticola* || NC_002967.9 |
| 5. *T. pallidum* || NC_000919.1 |
| 6. *T. paraluiscuniculi* || NC_015714.1 |
| 7. *T. pedis* || NC_022097.1 |
| 8. *T. primitia* || NC_015578.1 |
| 9. *T. putidum* || NZ_CP009228.1 |
| 10. *T. succinifasciens* || NC_015385.1 |


Estas especies son bacterias que pueden ser patogénicas de humanos, conejos y vacas o pueden ser endosimbiontes facultativos u obligados de los tractos digestivos de termitas. Además, se ha propuesto que las diferentes formas de vida de las bacterias pueden implicar ganancia y pérdida de genes (Ochman y Moran 2001). Por su parte, las especies patogénicas tienen en su genoma un fragmento que codifica para los genes tprC, tprI, tprK, tprG y tprJ (Gray et al 2006). 

### Métodos seguidos

##### Búsqueda y descarga de secuencias de genomas completos

En la dirección de NCBI ([https://www.ncbi.nlm.nih.gov/genome/browse/](https://www.ncbi.nlm.nih.gov/genome/browse/)) busqué genomas completos de al menos cuatro especies del mismo género. Debido a que los datos de genomas de eucariontes no reunían mis condiciones al poner esos filtros de búsqueda, decidí usar los genomas bacterianos. Encontré 10 especies del género Treponema con genomas completos. Los descargué en formato FASTA.

Con línea de comando sería:

Para bajarlos en el directorio actual:

    wget https://eutils.ncbi.nlm.nih.gov/entrez/eutils/efetch.fcgi?db=genome&rettype=fasta&id=NC_015577.1 NC_015500.1 NC_015732.1 NC_002967.9 NC_000919.1 NC_015714.1 NC_022097.1 NC_015578.1 NZ_CP009228.1 NC_015385.1

o también, para bajar secuencias y guardarlas en una carpeta:

    secuencias=curl -s "https://eutils.ncbi.nlm.nih.gov/entrez/eutils/efetch.fcgi?db=genome&rettype=fasta&id=NC_015577.1 NC_015500.1 NC_015732.1 NC_002967.9 NC_000919.1 NC_015714.1 NC_022097.1 NC_015578.1 NZ_CP009228.1 NC_015385.1"
    curl $secuencias$i > $i/Treponema
    for i in ; do
    mkdir $i; do

##### Simulación de lecturas generadas por la plataforma de secuenciación PacBio

Instalación del simulador SiLiCO (García-Baker et al. in press)

A partir de una búsqueda de simuladores para generar secuencias en el buscador [https://omictools.com/](https://omictools.com/ "Omics Tools"), realicé una búesqueda con las palabras "simulation assembly". Seleccioné el programa SiLiCO porque en la simulación permite dar valores de media y desviación estándar de los fragmentos ([https://github.com/ethanagbaker/SiLiCO](https://github.com/ethanagbaker/SiLiCO)). 
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

Seguí las instrucciones del repositorio de SiLiCO que se mencionan en el archivo READMe.md ([https://github.com/ethanagbaker/SiLiCO/blob/master/README.md](https://github.com/ethanagbaker/SiLiCO/blob/master/README.md)):

    tar -xvzf SiLiCO-1.0.0.tar.gz
    cd SiLiCO-1.0.0
    python setup.py build
    python setup.py install

Corrí el programa con las cada secuencia por separado con los valores por default de media, desviación estándar. Modifiqué los valores de coverage y de trials. Actualmente estoy escribiendo un loop sencillo para correr todos los archivos:

    python SiLiCO.py -i ../datos/ProyectoFinal_ERA/T.azonutricium.fasta -o ../datos/ProyectoFinal_ERA/T.azotonutricium_sil -p -m 10000 -s 2050 -c 9 trials=9

El flag `-p` determina el tipo de plataforma, en este caso PacBio. Los otros comandos son `-m` es la longitud media de las lecturas, `-s` es la desviación estándar, `-c`es el coverage (el default es 8), y `trials` es el número de corridas (el default es 1).

Este programa genera archivos tipo bed.

Literatura consultada

Gray R. R., Mulligan . C.J, et al. 2006. Molecular evolution of the tprC, D, I, K, G, and J genes in the pathogenic genus *Treponema*. Mol. Biol. Evol. 23(11):2220-2233.
Ochman H. and Moran N. A. 2001. Genes lost and genes found: evolution of bacterial pathogenesis and symbiosis. Science 292(5519):1096-1999.
Roads, A. and Fai Au, K. 2015. PacBio Sequencing and Applications. Genomics, Proteomics and Bioinformatics 13(5): 278-289.



