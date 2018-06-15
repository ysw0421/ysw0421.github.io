#6단원 과제
data(airquality)
str(airquality)
#airquilty 값이 80이상
AQ.80 = subset(airquality,Temp>80)
#중앙값 크기순 sort
#tapply 데이터셋의 특정요소를 기준으로
#함수를 수행(median)
barplot(sort(tapply(AQ.80$Wind,factor(AQ.80$Month),median)),horiz=T,las=1,main="median wind")