# SET 4 4번문제
install.packages("Lahman")
library("Lahman")
data("Pitching")
str(Pitching)

# 시간 항상 현재시간
classified =list()
for(i in 1:length(Pitching$yearID)){
    r=Pitching$playerID[i]
    classified[[r]]=c(classified[[r]],Pitching$yearID[i])
}
# 선수의 활동년 수를 산출한 히스토 그램
hist(sapply(classified,length))
# 활동년 수가 가장 큰 선수
classified[which(sapply(classified,length)==max(sapply(classified,length)))]
# 활동년 가장 큰 선수의 ERA추세
ERA = Pitching$ERA[Pitching$playerID==names(classified[which(sapply(classified,length)==max(sapply(classified,length)))])]
plot(ERA,type="o")
