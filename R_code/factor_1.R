
set.seed(1)
alpha = sample(c("A","B","C"),25,replace=T)
f = factor(alpha)
z = sample(1:5, 25, replace=T)
g = factor(z)
str(data.frame(f=f,g=g))
