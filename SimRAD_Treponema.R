### Primero abrir R y RStudio con permisos de administrador para que cargue las dependencias
## Quitar los signos # para activar los comandos
## para instalar la librería de bioconductor
#source("https://bioconductor.org/biocLite.R")
#biocLite()#instala los paquetes núcleo
#biocLite(c("zlibbioc","ShortRead","Biostrings")) #para instalar los paquetes asociados a SimRAD
#install.packages(c("SimRAD", repos=c("http://rstudio.org/_packages", "http://cran.rstudio.com"))) #es otra manera de instalar SimRAD, si la anterior causa problemas.

#Comando para borrar los objetos cargados al amnbiente de R
rm (list= ls ())

# Para cargar el paquete SimRAD y los paquetes asociados
library(SimRAD)

#Determinar los sitios de restricción. Comandos para crear los objetos que contengan los sitios de corte de alguna enzima de restricci?n
#enzima PstI: sitios de corte
cs_5p1 <- "TGCA"
cs_3p1 <- "ACGT"

path="../genomas_completos/"
file.names<-dir(path, pattern= ".fasta")
referencia <- 0
Treponema<-0
for (i in file.names){
  setwd("../genomas_completos/")
  referencia<-ref.DNAseq(FASTA.file=i, subselect.contigs =T, prop.contigs = 0.1) #carga las referencias en un objeto DNAseq
  referencia<-insilico.digest(referencia, cs_5p1, cs_3p1, verbose=TRUE) #digestión
  Treponema<-DNAStringSet(x = referencia) #converisón del objeto a un tipo DNAStringSet
  setwd("./digeridos_SimRAD/") #va al directorio 
  writeXStringSet(Treponema,i, append=FALSE, compress=T, compression_level=NA, format="fasta") #guarda en ese directorio las simulaciones
  setwd("../../bin") #regresa al directorio bin
}

