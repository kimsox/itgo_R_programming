
# 2강 자료구조 개요

# 여러가지 자료구조
# 1. Vector         1차
# 2. Matrix         2차
# 3. Array          3차(다차원)
# 4. Data Frame     List와 Vector 혼합형, 가장 많이 사용
# 5. List           Key, Value, c(구조체), python(딕셔너리)

# Chapter02_Datastructure

# 1. Vector 자료구조
# - 동일한 자료형을 갖는 1차원 배열구조
# - 생성 함수 : c(), seq(), rep()

# 벡터 변수에 저장
v1 <- c(33, -25, 20:25, 12)
v1
length(v1) # 9
v2 <- seq(1, 10, 2) # (시작, 종료, 증감)
v2
v3 <- rep(1:3, 3)   # 반복
v3
? rep
v4 <- rep(1:3, each = 3)
v4

v5 <- c(1:5, "4")
v5 # "1" "2" "3" "4" "5" "4"
sum(v5)

num <- as.numeric(v5) # 숫자로 형변환
num
sum(num) # 19

# index 활용
age <- c(30, 35, 45)
age
names(age) <- c("홍길동", "이순신", "강감찬")
age

age[2]
age[3]
age[1:2]
age[c(1, 3)] # 반드시 c()함수로 묶어주자

# 2. Matrix : 동리한 자료형을 갖는 2차원 배열
# - 생성함수 : matrix(), rbind(), cbind()
# - 처리함수 : apply()

# 1) matrix() 생성
mt <- matrix(1:5) # c(1:5)
mt # 5x1 행렬

mt2 <- matrix(1:9, nrow = 3) # 9개 데이터를 3열3행으로 구성. 1열부터 적용
mt2 <- matrix(1:9, nrow = 3, byrow = T) # 행부터 적용
mt2

# 2) rbind() / cbind()
x1 <- c(5, 4, 7, 1, 6);
x2 <- c(6, 8, 5, 2, 1);

rb <- rbind(x1, x2) # row bind
rb # 2x5
cb <- cbind(x1, x2) # column bind
cb # 5x2

class(rb); class(cb);

# index 참조방식
rb[1:2, 2:3]
rb[1,]; # 1행 전체
cb[, 2]; # 2열 전체
rb[1, 3]; # 7 참조

# apply(data, 1/2, Func)
x <- matrix(1:9, nrow = 3)
x

apply(x, 1, max)
apply(x, 2, sd)
apply(x, 2, mean)

# 3. Array : 동일한 자료형을 갖는 3차원 배열
# - 생성함수 : array()

d <- 1:12
arr <- array(d, c(3, 2, 2)) # c(행, 열, 면)
arr

arr[,, 1] # [행, 면, 열]
arr[,, 2]
arr[1,, 2] # 2면에서 1행 참조

# 4. Data Frame : 행과 열의 2차원 자료구조(DBMS의 table과 유사)
# - 생성함수 : data.frame(), 컬럼단위 파일

# 1) data.frame
no <- c(1001, 1002, 1003)
name <- c("hong", "lee", "kim")
pay <- c(150, 250, 300)

vemp <- data.frame(NO = no, NAME = name, PAY = pay)
vemp
class(vemp) # "data.frame"

# 2) txt 파일
setwd("c:\Rdata\chap02")
txtemp <- read.table("emp.txt", header = T, sep = "")
txtemp
class(txtemp)

csvemp <- read.csv("emp.csv", header = T)
csvemp
class(csvemp)