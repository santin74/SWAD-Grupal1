#Aunque tiene la extensi√≥n enga√±osa ".sav", el fichero "plasma.sav" no es un 
# fichero SPSS, sino que en realidad es un fichero R y se carga con load()
#plasma <- read.spss("plasma.sav", to.data.frame=TRUE)
library ( lattice )
library ( Rcmdr )

load("plasma.sav")


load(url('http://biostat.mc.vanderbilt.edu/wiki/pub/Main/DataSets/plasma.sav'))
class(plasma)
names(plasma)
summary(plasma)


attach(plasma)

cor(plasma[,c(4,6,7,8,9,10,11,12,13,14)])
# cruzamos todas las variables, excepto cuantitativas
splom(plasma[,c(4,6,7,8,9,10,11,12,13,14)])

splom(~plasma[,c(4,6,7,8,9,10,11,12,13,14)]|plasma$vituse)

splom(~plasma[,c(4,6,7,8,9,10,11,12,13,14)]|plasma$vituse)

attach(plasma)

#1 parto valores de alcohol en niveles. miro los cuartiles para ver cÛmo segmentarlo.
boxplot(plasma$alcohol,outline=FALSE) # quito un outlier que no me deja ver nada
plasma$alcohol_level <- with(plasma, bin.var(alcohol, bins=3,   method='natural', labels=FALSE))
#
# necesitarÌamos recodificar los valores 1,2,3 a algo descriptivo, e incluso discutir cu·ntos level's serÌan
xyplot( betadiet ~ alcohol|smokstat * alcohol_level )
xyplot( retdiet ~ retplasma |smokstat * alcohol_level )
xyplot( betadiet ~ alcohol|smokstat * sex )
xyplot( retdiet ~ retplasma |smokstat * sex )

#podemos hacer esto mismo ,por grupos de edad. Para mÌ, El problema de nuevo : perder informaciÛn al seleccionar mal los cortes en las edades
#parto tb en niveles las edades <- ojo, pq podemos perder informaciÛn al mirar el gr·fico. ahora vemos segmentos
# y si elegimos mal los niveles, podemos "dejar de ver" algo.


# aparentemente veo una correlaciÛn en el gr·fico. Pero en lugar de basarlo en apreciaciÛn visual, Examino si es real matem·ticamente
cor(plasma[,c("betadiet","betaplasma")], use="complete")
    


