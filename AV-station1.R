dataset<- read.csv("anandvihar data.csv")
View(dataset)
summary(dataset)
str(dataset)

#parsedate parse all the date format
library(parsedate)

dataset$Date<-parse_date(dataset$Date,approx = TRUE)
#converting POSIXct to date class
dataset$Date<- as.Date(dataset$Date)
class(dataset$Date)
####################################################
dataset$Date<-as.numeric(dataset$Date)
class(dataset$Date)
dataset$Nox<- as.numeric(dataset$Nox)
class(dataset$Nox)
dataset$pm10<- as.numeric(dataset$pm10)
class(dataset$pm10)

#handling the missing data
dataset$bar.pressure.mmHG.<- impute(dataset$bar.pressure.mmHG., mean)
dataset$wind.speed.m.s.<- impute(dataset$wind.speed.m.s., mean)
dataset$ambient.temp.c.<- impute(dataset$ambient.temp.c., mean)
dataset$wind.direction.degree.<= impute(dataset$wind.direction.degree., mean)
dataset$benzene.ug.mg3.<- impute(dataset$benzene.ug.mg3.,mean)
dataset$NO<- impute(dataset$NO,mean)
dataset$NO2<- impute(dataset$NO2, mean)
dataset$tolune<- impute(dataset$tolune, mean)
dataset$Nox<- impute(dataset$Nox,mean)
dataset$O3<- impute(dataset$O3, mean)
dataset$pm2.5<- impute(dataset$pm2.5, mean)
dataset$pm10<- impute(dataset$pm10, mean)
dataset$PXY<- impute(dataset$PXY,mean)
dataset$relativehumidity...<- impute(dataset$relativehumidity..., mean)
dataset$SO2<- impute(dataset$SO2, mean)
dataset$solar.radiation.w.m2.<- impute(dataset$solar.radiation.w.m2., mean)
View(dataset)

View(dataset)

head(dataset)


##feature selection
library(Boruta)
Boruta(Date~. , data= dataset)


library(earth)
earth<- earth(Date~. , data = dataset)
e<-evimp(earth)
e

par('mar')
par(mar=c(1,1,1,1))
plot(e)

fit<- aov(Date~. , data = dataset)
summary(fit)


#time series analysis
data.ts<-ts(dataset, start= c(2016-07-01,1))
str(data.ts)
 data.ts

autoplot(data.ts)



bp<- read.csv("anandvihar data.csv")
bp.ts<- ts(bp,  start= c(07/01/2016,1))
str(bp.ts)
bp.ts

autoplot(bp.ts)
autoplot
