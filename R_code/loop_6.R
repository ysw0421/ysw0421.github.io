#apply(), max()를 사용
n = 100000
m = 100
A = matrix(rnorm(n*m,100, 15), n, m)
time= proc.time()
a.1 = apply(A,1,max)
proc.time() - time

#apply(), max를 사용하지 않고 직접 코딩
time=proc.time()
a.1=matrix(0,n)
for(i in 1:n){
a.1[i] = A[i,1]
for(j in 2:m) if(A[i,j]> a.1[i]) a.1[i] = A[i,j]
}
proc.time() -time

#최대값 부분을 사용자 함수로 정의하여 사용
max.1 = function(x){
	if(length(x)==1)return(x)
	else{
	for(j in 2:length(x)) if(x[1]<x[j]) x[1] = x[j]
	}
}

time = proc.time()
a.1 = rep(0,n)
for (i in 1:n)a.1[i] = max.1(A[i,])
proc.time() - time
