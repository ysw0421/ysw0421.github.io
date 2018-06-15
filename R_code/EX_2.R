#7.2절의 예 1과 2의 프로그램을 while문을 사용하여 구현하라.
#7.2_1
#야구 1이닝에서 히트 수 구하기
#아웃이 3개명 이닝 종료
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
#7.2_2
# 매 게임당 1$씩 배팅하다가 털리면 정지되는 도박
# 3달러가지고 시작 획득 40% 1$ 손실 60% -1$
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