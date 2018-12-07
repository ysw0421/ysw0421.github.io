# Implement the program in examples 1 and 2 in section 7.2 using the while statement.
# 7.2_1
# Get the number of hits in 1 baseball
# Out of 3 names ending
outs = 0
hits = 0
while(outs<=3){
  x =sample(c(0,1),1,prob=c(0.6,0.4))
  print(x)
  if(x == 1) 
    hits = hits +
  else 
    outs= outs+1
}
# 7.2_2
# Betting $ 1 per game
# Get Started with $ 3 $ 40% 1 $ Loss 60% -1 $
positions = 3
count = 1
while(positions>0){
  x =sample(c(0,1),1,prob=c(0.6,0.4))
  print(x)
  positions = if(x == 1)  positions + 1 else  positions - 1
  count = count +1
}
print(count)
print(positions)
