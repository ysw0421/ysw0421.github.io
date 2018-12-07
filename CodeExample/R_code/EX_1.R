#6단원 과제
data(airquality)
str(airquality)
AQ.80 = subset(airquality,Temp>80)
barplot(sort(tapply(AQ.80$Wind,factor(AQ.80$Month),median)),horiz=T,las=1,main="median wind")
