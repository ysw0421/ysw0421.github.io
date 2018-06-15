#sapply()
n = 10000
m = 100
s = rpois(n, m)
A = vector(mode="list",length=n)
for(i in 1:n) A[[i]] = rnorm(s[i],100,15)
time = proc.time()
a.1 = sapply(A, max)
proc.time() - time
windows(height=5, width=6)
hist(a.1, xlim=c(120,180),xlab="x.max",main="Histogram of Maximums")
