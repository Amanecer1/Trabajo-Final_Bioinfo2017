rm (list= ls ())

#para isntalar el paquete msa
source("https://bioconductor.org/biocLite.R")
biocLite("msa", type="source")

library(msa)

#Comandos para leer los archivos alinear. Los guarda en un objeto tipo DNAStringSet

data1<-readDNAStringSet(filepath="../genomas_completos/digeridos_SimRAD/T.azotonutricium.fasta", format = "fasta")
data2<-readDNAStringSet(filepath="../genomas_completos/digeridos_SimRAD/T.brennaborense.fasta", format = "fasta")
data3<-readDNAStringSet(filepath="../genomas_completos/digeridos_SimRAD/T.caldarium.fasta", format = "fasta")
data4<-readDNAStringSet(filepath="../genomas_completos/digeridos_SimRAD/T.denticola.fasta", format = "fasta")
data5<-readDNAStringSet(filepath="../genomas_completos/digeridos_SimRAD/T.pallidum.fasta", format = "fasta")
data6<-readDNAStringSet(filepath="../genomas_completos/digeridos_SimRAD/T.paraluiscuniculi.fasta", format = "fasta")
data7<-readDNAStringSet(filepath="../genomas_completos/digeridos_SimRAD/T.pedis.fasta", format = "fasta")
data8<-readDNAStringSet(filepath="../genomas_completos/digeridos_SimRAD/T.primitia.fasta", format = "fasta")
data9<-readDNAStringSet(filepath="../genomas_completos/digeridos_SimRAD/T.putidum.fasta", format = "fasta")
data10<-readDNAStringSet(filepath="../genomas_completos/digeridos_SimRAD/T.succinifasciens.fasta", format = "fasta")

#Concatenar en un vector para poder correr el algoritmo

datos<- c(data1, data2, data3, data4, data5, data6, data7, data8, data9, data10)

#Sólo para checar que sea el tipo correcto de objeto
class(datos)

# Función básica para alinear los argumentos del objeto datos
alin<- msa(datos)


