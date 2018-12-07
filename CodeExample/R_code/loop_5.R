#tapply()
n = 10000
m = 100
N = n*m
x = rnorm(N,100,15)
grp = sample(1:n, N, replace=T)
time = proc.time()
x.1 = tapply(x, grp, max)
proc.time() - time
