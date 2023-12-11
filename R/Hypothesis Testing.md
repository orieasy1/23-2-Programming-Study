<h1>R을 이용해 가설검정을 진행하는 방법</h1>

* 단일모집단의 모평균에 대한 검정
* 단일모집단의 모비율에 대한 검정
* 두 개의 모집단의 모평균에 대한 검정
* 두 개의 모집단의 모비율에 대한 검정

* 모상관계수에 대한 검정(단일모집단)


<h3>단일모집단의 모평균에 대한검정</h3>

1. 모표준편차를 알고있는 경우
z.test() 함수 사용

```R
# 가상의 데이터 생성
set.seed(123)
data <- rnorm(100, mean = 50, sd = 10)  # 평균 50, 표준편차 10인 가상의 데이터

# 양측 검정 (모평균이 50인지 검정)
result_two_sided <- z.test(data, mu = 50, alternative = "two.sided")

# 좌측 검정
result_less <- z.test(data, mu = 50, alternative = "less")

# 우측 검정
result_greater <- z.test(data, mu = 50, alternative = "greater")

# 결과 출력
print("양측 검정:")
print(result_two_sided)

print("\n좌측 검정:")
print(result_less)

print("\n우측 검정:")
print(result_greater)

```

2. 모표준편차를 모르는 경우
t.test() 함수 이용

```R
# 필요한 라이브러리 로드
library(stats)

# 가상의 데이터 생성
set.seed(123)
data <- rnorm(100, mean = 50, sd = 10)  # 평균 50, 표준편차 10인 가상의 데이터

# 양측 검정 (모평균이 45인지 검정)
result_two_sided <- t.test(data, mu = 45, alternative = "two.sided")

# 좌측 검정
result_less <- t.test(data, mu = 45, alternative = "less")

# 우측 검정
result_greater <- t.test(data, mu = 45, alternative = "greater")

# 결과 출력
print("양측 검정:")
print(result_two_sided)

print("\n좌측 검정:")
print(result_less)

print("\n우측 검정:")
print(result_greater)
```

<h3>단일모집단의 모비율에 대한 검정</h3>

* binom.test() 함수 사용
이항분포를 사용하여 단일모집단에 대한 모비율에 대한 가설검정

```R
binom.test(x = 관측도수, n = 표본수, p = 귀무가설_모비율, alternative = "대립가설_종류")

binom.test(x = 관측도수, n = 표본수, p = 귀무가설_모비율, 
    alternative = "대립가설_종류", conf.level = 신뢰수준) 
``` 
* prop.test() 함수 사용

```R
# 주어진 값
sample_size <- 200  # 표본 크기
success_count <- 120  # 성공한 표본 수 (성공: 예, 실패: 아니오)

# 모비율 가설 검정(p는 귀무가설에 설정한 모비율의 값)
prop_test_result <- prop.test(success_count, sample_size, p = 0.5, alternative = "two.sided")

# 결과 출력
print(prop_test_result)

```