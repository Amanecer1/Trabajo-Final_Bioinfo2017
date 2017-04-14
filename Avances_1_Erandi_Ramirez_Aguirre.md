### Avances 1

##### 1.- Tipo de análisis:

Desarrollo de una filogenia con datos RAD simulados y ensamblados con pyrad.

##### 2.- Datos que se utilizarán:

Genomas completos de al menos 5 especies del género Treponema, de éstos, la mayoría fueron generados por grupos de trabajo diferentes.

##### Pasos a seguir:

1. Búsqueda y descarga de genomas completos en NCBI, con el buscador de genomas, en [https://www.ncbi.nlm.nih.gov/genome/browse/] ("Buscador de genomas de NCBI")

2. En R y con el paquete SimRAD, realizaré una simulación de loci RAD con una enzima de restricción: PstI (corte 5' TGCA 3'). Se aplicará  el método de RADseq "original".
 También probaré en el programa SiLICO [https://omictools.com/silico-tool] la simulación del ensamblaje. Este programa simula secuencias    generadas en PacBio. La ventaja de este programa es que utiliza las secuencias en formato fasta, lo que me permitiría usar los datos bajados desde GenBank directamente. La pataforma PacBio de secuenciación provee lecturas largas, también tiene un mayor "coverage" y "rendimiento". 

3. Los fragmentos generados desde SimRad, serán exportados a un archivo tipo fasta, y se buscará su compresión.

4. Realizaré el ensamblaje de las secuencias obtenidas en pyrad. 

5. Ensamblaje de los fragmentos en pyrad. Este programa se correrá desde un contenedor Docker.

6. Desarrollo de una filogenia en RaxML. 
