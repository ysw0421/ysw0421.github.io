---
layout: post
title: R Data structure
meta: R 데이터 구조에 대해서 알아보자
category: R
---
<html>
<a class="custom" style="font-size:30px;">
  R에서 "factor"는 범주형 변수(벡터) or 비연속적 변수(벡터)를 지칭합니다. 인자 벡터는 문자열 벡터로부터 또는 수치형 벡터로부터 생성될 수 있습니다.
  "factor"는 범주형 데이터를 표현하는데 사용됩니다. 범주형 데이터는 유한한 수의 범주 or 고유 그룹이 포함됩니다. 범주형 데이터에는 논리적 순서가 없을 수도 있습니다. 예를 들어, 성별, 재료, 유형, 결제 방법이 이에 해당됩니다. 수치형 벡터로 생성된 "factor"는 level으로 알려진 사전에 정의된 집합값만 담을 수 있다.<br>
  <img src="/asset/r/factor_1.JPG">
  <pre>
  <code>
  var x = 5;
  var y = 6;
  var sum = x + y;
  </code>
  </pre>
<br>
  table() 함수는 빈도표를 만들어 냅니다. addmargins() 함수는 빈도표의 주변 합을 테이블에 추가합니다.<br>
  <img src="/asset/r/factor_2.JPG">  <img src="/asset/r/factor_3.JPG">
<br>
  tapply(x, f, function)는 x를 f의 수준 별로 쪼개서 function을 적용합니다.<br>
sppaly()와 split()은 쪼갬의 대상이 벡터가 아니라 데이터 프레임인 경우에 사용한다.<br>
  <img src="/asset/r/factor_4.JPG">
<br>
  aggregate(x,list(f,g),function)은 x(벡터 or dataframe)를 f와 g의 조합으로 쪼개서 function을 적용합니다. 즉, 종합하고 집계합니다.<br>
cut(x, 0:10)은 벡터 x를 0:10로 쪼개서 factor 변수로 만드는, 소위 구간화(binning)을 합니다.
지킬을 쓰려면 배워야하는게 많다.<br>
</a>
</html>
