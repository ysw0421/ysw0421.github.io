#apply()
n =100000
m =100
A = matrix(rnorm(n*m,100,15),n,m)
tim = proc.time()
a.1 = apply(A,1,max)
proc.time() - time
windows(height=5, width=6)
hist(a.1, xlim=c(120,180),xlab="x.max",main="Histogram of Maximums")
