rm (list= ls ())

#------------------------------------------------Arbolito filogen�tico inventado

library(ape)

#Basada en Lilburn et al. 1999. Phylogenetic diversity of termite gut spirochaetes. Environmental Microbiology 1(4)331-345. Realic� un arbolito con algunas especies de Treponema que tengo. Agregu� T. azotonutricium porque le� que era endosimbi�tica.

#tree<-read.tree(text= "(((T_succinifasciens),(T_primitia,T_azotonutricium+)),(T_pallidum,T_denticola));") #�sta es otra manera de crear el �rbol
set.seed(1)
tree<-rtree(n=5)
tree
plot(tree)
nombres<- c("T. denticola","T. pallidum","T. succinifasciens","T. primitia", "T. azotonutricium" )
tree$tip.label<-nombres
plot(tree)
plot(tree, adj=0, label.offset=0.75, lwd=2, edge.width = 2, align.tip.label = T)
colores<- c("red","red", "green", "blue", "blue")
tiplabels(pch=21, col="black", adj=1, bg=colores, cex=2)

#-------------------------------- Detalles de genomas
rm (list= ls ())


datos<- read.table("../detalles.csv", header=T, sep=",")
View(datos)
names(datos)

par(mfrow = c(2,1), mar = c(2.3, 6, 2, 2.1), mgp = c(4, 1, 0))
palette("rainbow"(10))

plot(datos$GC.~ datos$Genome_size.Mb., main = "Relaci�n tama�o del genoma con contenido GC%", xlab= "Tama�o del genoma (Mb)", ylab= "Porcentaje de GC", cex = 1.1, bty= "n", col.main ="grey", font.axis = 3, pch =18, col= datos$Species)

legend("bottomright", levels(datos$Species),title="Species",col= datos$Species ,bty="n",pch=19, cex= 0.5)

plot(datos$Proteins ~ datos$Genome_size.Mb., main = "Relaci�n tama�o del genoma con n�mero de prote�nas", xlab= "Tama�o del genoma (Mb)", ylab= "N�mero de prote�nas estimadas", cex = 1.1, bty= "n", col.main ="grey", font.axis = 3, pch =20, col =datos$Species)



