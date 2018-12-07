# [1번 문제]
# 0과 1 사이의 균일 임의 수(UNIFORM RANDOM NUMBER)를 2개 취하여, 0과 2개 점, 그리고 1에서 끊기는 3개의 선분으로 삼각형이 만들어질 확률을
# N(=10,000)회의 몬테칼로 시행을 통하여 추정하라. 단, R 스크립트의 첫 두 줄을 다음과 같이 할 것.
N = 10000
X = matrix(runif(N*2),2,N)
X.s = apply(X, 2, sort)
S = rbind(X.s[1,],X.s[2,]-X.s[1,],1-X.s[2,])
S.s = apply(S,2,sort)
triangle = (S.s[1,] + S.s[2,] >= S.s[3,])
round(sum(triangle)/N,3)

# [2번 문제]
# 숫자 1부터 52가 표기된 52장의 카드를 이항 임의 수(~B(52,0.5))개를 비복원 추출하여 왼편에 놓고 나머지를 오른편에 놓는다. 그리고 왼쪽 카드들을
# 자체적으로 순서정렬하고 오른쪽 카드들도 자체적으로 순서정렬하여 왼쪽 카드들에 이어 놓는다.(작은 번호일 수록 왼쪽에서 몇 번째 위치에 놓는다.)
# 이런 카드 재배열 작업을 N(=1O,000)회 반복하여, 2번 카드가 가장 왼쪽에서 몇 번째 위치에 나타났는지를 보고하고 그 빈도 분포를 막대그림으로 표현한다.
n = 52; N = 10000
wo.freq = rep(0,52)
two.freq = rep(0,52)
for(r in 1:N){
  cards = 1:n
  s = rbinom(1,n,0.5)
  index = sort(sample(1:n,s))
  cards = c(cards[index], cards[-index])
  t = order(cards)[2]
  two.freq[t] = two.freq[t] + 1
}
two.freq
barplot(two.freq, names.arg = 1:52, main="The order of 2", cex.names=0.8, cex.axis = 0.8)

# [3번 문제]
# 메이저리그 야구 2015년 투수들의 연봉과 IPouts (innings pitched*3)의 산점도를 제시하라.
library(Lahman)
data(Pitching)
str(Pitching)
data(Salaries)
str(Salaries)
Pitching.1 = subset(Pitching, yearID==2015)
Salaries.1 = subset(Salaries, yearID==2015)
Merged = merge(Pitching.1, Salaries.1, by = "playerID")
str(Merged)
with(Merged, plot(salary/1000, IPouts, main="Major League Pitchters 2015"))

# [4번 문제]
# 메이저 리그 야구의 1966년 - 2015년 Pitching 기록에서 연도별 최대 IPouts의 추이를 보여주는 꺽은 선 그래프를 제시하라. 단 tpply()함수를 활용해야함.
IPouts.by.year = tapply(Pitching$IPouts, Pitching$yearID, max)
year = rownames(IPouts.by.year)
plot(IPouts.by.year[year>=1966&year<=2015]~year[year>=1966 & year <= 2015], ylim=c(0,1500),xlab="year", ylab="IPouts",type="o", main="Maximum IPouts by Year")

# [5번 문제]
# 메이저리그 야구의 1985-2015년 Salaries 기록에서 연도별 중간 연봉의 추이를 보여주는 꺽은 선 그래프(시도표, time plot)를 제시하라.
# 단, aggregate()함수를 활용해야 함. 연봉을 1,000불 단위로 할 것.
plot(aggregate(Salaries$salary/1000, list(Salaries$year),median),xlab="year",ylim=c(0,2000),ylab="median salary/1000", type="o", main="Major League Median Salaries by Year")

