#Dependencies

library(lubridate)
library(tidyr)

#------------------------------
#      Intake and clean data
#------------------------------


file_path<-"../data/Casos_positivos_de_COVID-19_en_Colombia.csv"
encoding<-"UTF-8"

initial <- read.csv(file_path,sep=";",header=TRUE, nrows=200, encoding = encoding)
classes<- sapply(initial,class)
classes

is_date<-grepl("fecha",names(classes),ignore.case=TRUE)
classes[is_date]<- "Date"

cases <- read.table(file_path,sep=";",header=TRUE, colClasses = classes, encoding = encoding,na.strings=c("","NA"))
data.frame(name=names(cases),type=sapply(cases,class))

dim(cases)

# fuente   contagiados   recuperados   activos
# yo         235.261        112.282    122.979
# minsalud   257.101        131.161    116.652
# JHU        248.976 



#------------------------------
#      Processsing
#------------------------------
#na.omit(

# type of recuperation

recovery<-table(cases$Tipo.recuperación)
print(recovery)
sum(recovery)


# data of interest
interest<-na.omit(cases[c("Fecha.diagnostico","Fecha.recuperado")])

recovery_time<-interest$Fecha.recuperado - interest$Fecha.diagnostico 

tapply(recovery_time, month(interest$Fecha.diagnostico), mean)

x<-as.numeric(recovery_time)


plot(density(as.numeric(recovery_time)))
print("Covid")

ans<-table(x>50)
