# [1번 문제]
# 다음 벡터 x내 100개 elements 중에서 홀수는 모두 몇 개인가?
# 단, length() 함수를 사용하지 말 것.
set.seed(1)
x = sample(0:9, 100, replace=T)
count = 0
for (i in x) if(i%%2==1) count = count+1
print(count)

# [2번 문제]
# 다음 벡터 x 내 단조증가 subsequences 길이 중 최대값은?
# 단조 증가 수열
set.seed(2)
x = rnorm(100)
diff = sign(x[2:100]-x[1:99])
# Run Length Encoding
len = rle(diff)
max(len$lengths[len$values==1])

# [3번 문제]
# 조합 수 nCk가 담긴 리스트 L을 제시하라.
Combination = function(n){
  L = list()
  L[[1]] = c(1,1)
  for(i in 2:10) L[[i]] = c(0, L[[i-1]]) + c(L[[i-1]],0)  
  return(L)
}
Combination(10)

# [4번 문제]
# 다음과 같이 각 열에 최소값 0, 최대값 1의 범위 표준화 변환을 하는 R스크립트를 제시하라.
# 단, 제시된 스크립트에서는 apply() 함수가 쓰여서는 안된다.
set.seed(4)
x = matrix(rnorm(50,50,50),10,5)
min.x = apply(x, 2, min)ㅇ
max.x = apply(x, 2, max)
round(scale(x, center=min.x, scale=max.x-min.x),2)
#--------------------------------------------------
center = matrix(rep(min.x,nrow(x)),nrow(x),ncol(x),byrow=T)
scale = matrix(rep(max.x-min.x, nrow(x)),nrow(x),ncol(x),byrow = T)
Z = (x - center)/scale

# [5번 문제]
# 다음과 같이 카이제곱검정의 출력을 내는 R 스크립트를 제시하라. 카이제곱통계량. 자유도 p-갑이 산출되어야함.
set.seed(5)
blood = sample(c("O","A","B","AB"),100,replace=T)
country = sample(c("Japan","Korea"),100,replace=T)
T = table(blood, country)
chisq.test(T)
#--------------------------------------------------
df = (nrow(T)-1)*(ncol(T)-1)
row = apply(T,1,sum)
col = apply(T,2,sum)
E = row%*%t(col)/sum(T)
chisq = sum((T-E)^2/E)
p.value = 1 -pchisq(chisq, df)
round(chisq, 4); df
round(p.value, 4)