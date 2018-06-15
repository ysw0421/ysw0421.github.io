#lapply()
n = 10000
m = 100
s = rpois(n, m)
A = vector(mode="list",length=n)
for(i in 1:n) A[[i]] = rnorm(s[i],100,15)
time = proc.time()
a.1 = lapply(A, max)
proc.time() - time
head(unlist(a.1),5)
