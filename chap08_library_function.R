

# chap08_library_function

## 주요 R 내장 함수
seq(-2, 2, by = .2) # 0.2씩 증가
seq(length = 10, from = -5, by = .2) # -5부터 10개 생성 
rnorm(20, mean = 0, sd = 1) # 정규분포를 따르는 20개 데이터 생성
runif(20, min = 0, max = 100) # 0~100사이의 20개 난수 생성
sample(0:100, 20) # 0~100사이의 20개 sample 생성 (정수 결과)
vec <- 1:10
min(vec)
max(vec)
range(vec)
mean(vec) # 평균
median(vec) # 중위수
sum(vec)
prod(vec) # 데이터의 곱

factorial(5) # 팩토리얼
abs(-5.3) # 절대값
sd(rnorm(10)) # 표준편차
table(vec) # 빈도수
sqrt(16) # 4 
4 ^ 2 # 16
# 나머지 구하기
5 %% 3 # 2
6 %% 2 # 0

# 자연 로그
log(10)

e <- exp(1) 
e
e ^ log(1)

# 로그 vs 지수 : 역함수 관계
# 로그함수는 x에 대한 지수값을 반환하고,
# 지수함수는 x에 대한 로그값을 반환한다.

log(10)
exp(log(10))

# 지수함수는 x값 증가에 따라서 출력 t는 급격 상승
# 로그함수는 x값 증가에 따라서 출력 y는 완만하게 상승
x <- c(0.12, 1, 12, 999, 9999)
exp(x)
log(x)

# 일반 로그
log10(10)

getwd()
setwd("대상디렉토리 확정하자")
excel <- read.csv("excel.csv", header = TRUE)
head(excel, 10)

# colMeans() 함수 : 각 열의 평균 뎨간
colMeans(excel[1:5]) # - excel[,c(1:5)] -> 5개
colSums(excel[1:5])

rowMeans(excel[1:5])
summary(excel)

###############################
# 반올림 관련 함수
###############################
x <- c(1.5, 2.5, -1.3, 2.5)
x
mean(x)
round(mean(x))
ceiling(mean(x))
floor(mean(x))

###############################
## 난수 생성과 확률분포
###############################

# 1. 정규분포를 따르는 난수 생성
# 형식) rnorm(n, mean = 0, sd = 1)
? rnorm
n <- 1000
r <- rnorm(n, mean = 0, sd = 1)
r
hist(r) # 대칭성

# 2. 균등분포를 따르는 난수 생성)
# 형식) runif(n, min, max)
r2 <- runif(n, min = 0, max = 1)
r2
hist(r2)


set.seed(123) # seed()함수를 실행하면 같은 값으로 난수 생성 
n <- 10
r3 <- rbinom(n, 1, 0.5) # 1개 size에서 1/2(0.5)확률로 난수 정수 생성 
r3

r3 <- rbinom(n, 1, 0.25) # 1개 size에서 1/4(0.25)확률로 난수 정수 생성 
r3

r3 <- rbinom(n, 3, 0.5) # 3개 size에서 1/2(0.5)0.5확률로 난수 정수 생성  
r3


# 3. 이항분포를 따르는 난수 생성 
# 형식) rbinom(n, sample size, prop)
# sample size를 대상으로 나올 수 있는 확률값 지정 

set.seed(123) # seed()함수를 실행하면 같은 값으로 난수 생성 
n <- 10
r3 <- rbinom(n, 1, 0.5) # 1개 size에서 1/2(0.5)확률로 난수 정수 생성 
r3

r3 <- rbinom(n, 1, 0.25) # 1개 size에서 1/4(0.25)확률로 난수 정수 생성 
r3

r3 <- rbinom(n, 3, 0.5) # 3개 size에서 1/2(0.5)0.5확률로 난수 정수 생성  
r3

# 종자값(seed)을 지정하여 동일한 난수발생 
rnorm(5, mean = 0, sd = 1)

set.seed(123)
rnorm(5, mean = 0, sd = 1)

set.seed(345)
rnorm(5, mean = 0, sd = 1)