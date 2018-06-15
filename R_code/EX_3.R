#야구에서 1이닝 득점을 산출하는 함수 one.inning을 만들어보기로 합니다.
#이닝함수 정의
#아웃,1,2,3,홈런
one.inning = function(prob=c(0.75,0.15,0.05,0.025,0.025)){
  run =0
  out =0
#3개의 base가 있고 0루에서 3루까지 총 7개
  base =c(0,0,0,0,0,0,0)
  repeat{
#prob에 따라 hit를 설정
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
#리스트로 run,out, base몇까지 갔는지 반환한다.
  return(list(run=run, out=out, bases=base[1:3]))
}

prob.A=c(0.75,0.15,0.05,0.025,0.025)
prob.B=c(0.75,0.15,0.05,0.025,0.025)
score.A=0
score.B=0
# 9회동안 A,B팀의 점수 계산을 한다.
for(i in 1:9){
  score.A=score.A+one.inning(prob.A)$run
  score.B=score.B+one.inning(prob.B)$run
}
c(score.A,score.B)