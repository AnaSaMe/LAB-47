#--------------------------LABORATORIO 47--------------------------------
# Hecho con gusto por Carla Carolina Pérez Hernández (UAEH)
#V3

#---------------Alumna: Ana Grisel Sanjuan Merida--------------------------
# LABORATORIO - Gráficos en R con ggplot2 para Ciencia de Datos
# Graficas de barras en R 

#Instalanr paquete con los datos
install.packages("gapminder")
install.packages("ggplot2")

#Cargar libreria ggplot2 y gapminder
library(ggplot2)
library(gapminder)

#Cargar y visualizar datos al entorno
data("gapminder")

#Filtrando por año 2007
#Se crea objeto llamado gapminder2007
#Se aprecia el data en el environment
gapminder2007 <- gapminder[gapminder$year == '2007', ]

#Gráfica de barras
#Se extraen datos de gapminder2007
#La gráfica tendrá diversos elementos estéticos
#Variable X será un factor de conteo de cuántos países incluye cada continente
#El gráfico será de barras
ggplot(data=gapminder2007,
       mappin = aes(x = factor(continent)))+
  geom_bar()

#Grafica de barras (VERTICAL)
#Se extraen datos de gapminder2007
#La gráfica tendrá diversos elementos estéticos
#Variable X será un factor de conteo de cuántos países incluye cada continente
#El gráfico será de barras en vertical
ggplot(data=gapminder2007,
       mappin = aes(x = factor(continent)))+
  geom_bar() +
  coord_flip()

#Creando etiqueta para expectativa de vida a través de variable categórica
#Se extraen datos de gapminder2007 fijando la expectativa de vida
#La etiqueta tendrá condicionante: como input gapminder2007
#y si dentro de la variable hay un conteo menor a cincuenta, la categoría será "poca"
#y si dentro de la variable hay un conteo menor a setenta, la categoría será "media"
#y si dentro de la varibales no se cumple con ninguna de las dos condicionantes, la categoría será "alta"
#Se visualiza en el environment
gapminder2007$lifeExp_label <- ifelse(
  gapminder2007$lifeExp < 50,
  "poca",
  ifelse(gapminder2007$lifeExp < 70,
         "media" ,
         "alta"))

#Guardando grafica en variable

#Primero generamos objeto p
#De los datos de gapminder2007
#Los elementos estéticos son que en la X será un factor de conteo de los continente
#Con un rellenado con base en la etiqueta lifeExp_label 
p <- ggplot(data=gapminder2007,
            mapping = aes(x = factor(continent),
                          fill = lifeExp_label)) 

#Stacked bar chart (apilada)
#Del objeto p agregamos una capa: geom_bar
#Es una gráfica apilada con base en la expectativa de vida
#Con relación al conteo de los países en los continentes que revelan nivel alto, medio y poca de lifeExp
p + geom_bar(position = "stack", stat = "count")
            
#Dodge bar chart (separada)
#Del objeto p agregamos una capa: geom_bar
#Es una gráfica separada con base en la expectativa de vida
#Con relación al conteo de los países en los continentes que revelan nivel alto, medio y poca de lifeExp
p + geom_bar(position = "dodge", stat = "count")

#LLENA 100% + percent barchart
#Del objeto p agregamos una capa: geom_bar
#Es una gráfica fill (del 100%) con base en la expectativa de vida
#Con relación al conteo de los países en los continentes que revelan nivel alto, medio y poca de lifeExp
p + geom_bar(position = "fill", stat = "count")

#------------------FIN LABORATORIO 47------------------------