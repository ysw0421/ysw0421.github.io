# Let's make a function one.inning that calculates one innings scoring in baseball.
# Inning function definition
# Out, 1, 2, 3, home run
one.inning = function(prob=c(0.75,0.15,0.05,0.025,0.025)){
  run =0
  out =0
# There are 3 bases from 0 to 3, 7 cases 
  base =c(0,0,0,0,0,0,0)
  repeat{
# Set hits according to prob
    hit = sample(0:4,1,prob=prob)
#if문 hit 칠시 else 못칠시 out
    if(hit>0){
      base[hit+(1:3)]=base[1:3]
      base[hit] = 1
      if(hit>1) base[1:(hit-1)]=0
      run = run+sum(base[4:7])
      base[4:7]=0
    }else{
      out = out+1
      if(out>=3) break
    }
  }
# Return to run, out, base to list.
  return(list(run=run, out=out, bases=base[1:3]))
}

prob.A=c(0.75,0.15,0.05,0.025,0.025)
prob.B=c(0.75,0.15,0.05,0.025,0.025)
score.A=0
score.B=0
# The score of teams A and B is calculated nine times.
for(i in 1:9){
  score.A=score.A+one.inning(prob.A)$run
  score.B=score.B+one.inning(prob.B)$run
}
c(score.A,score.B)
