# chap01_Basic

# 1. 패키지 사용법
# 2. 변수와 데이터 유형
# 3. 기본함수 사용법
# 4. 작업공간

# 1. 패키지 사용법

# 사용가능한 패키지
dim(available.packages())
# [1] 12794     17
# session 보기
sessionInfo()
# 패키지 = 함수 + 데이터셋
# 패키지 설치방법
install.packages("stringr")
.libPaths()
library(stringr)
# 문자열 추출 함수
str_extract_all("abase113##%%%afafa", "[a-z]{3}")
# 메모리 로딩 패키지 확인 (라이브러리는 매번 로딩해야한다!!)
search()
# 패키지 제거
remove.packages("stringr")

# 2. 변수와 데이터 유형
# (1) 변수 : 메모리에 이름
# (2) 변수 작성 규칙
# - 첫자는 영문자, 두번째 숫자, 특수문자(.,_)
# - 예약어, 함수명 사용불가
# - 대소문 구분 (num != NUM)
# - 변수 선언 시 타입 선언 없음

# [실습]
ver1 <- 0 # ver1 = 0
ver1 <- 1
ver2 <- 10
ver3 <- 100
ver1;
ver2;
ver3;


# 멤버.구성요소
member.id <- "hong"
member.pwd <- "1234"
member.name <- "홍길동"

# 자료형(type) : 숫자형, 문자형, 논리형, 결측치형
int <- 1045
float <- 10.452
char <- "문자형" # '문자형'
bool <- T # TRUE, F, FALSE
score <- c(78, 89, NA)

# 자료형 확인
mode(int) # "numeric"
mode(float) # "numeric"
mode(char) # "character"
mode(bool) # "logical"
mode(score) # "numeric"

# 통계량
sum(score)
sum(score, na.rm = T) # 167
sum(1:3, 5:6)

# 3. 기본함수 사용법

# 함수 도움말
help(sum)
? sum

# 기본 데이터셋
data()
Nile
length(Nile)
plot(Nile)
hist(Nile)

# 4. 작업공간
getwd() # 기본경로 보기 - 파일 입출력시 사용
setwd("C:/Rdata/chap01") # 기본경로 수정 
test <- read.csv("test.csv", header = T)

.libPaths()
