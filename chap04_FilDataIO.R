
# chap04_FileDataIO


# 1. 파일 자료 읽어오기

# 1) 키보드 입력

# 숫자 입력
score <- scan()

# 문자입력
name <- scan(what = "")

# 2) 파일 자료 읽어오기

# read.table vs read.csv
# 공통점 : 행렬구조 파일 읽기
# 차이점
# read.table : 컬럼이 특수문자로 구분
# read.csv : 컬럼이 콤마로 구분

# 1)) read.table() 함수 이용
# (1) 컬럼명이 없는 파일 불러오기
getwd()
setwd("")
student <- read.table(file = "student.txt")
student

# (2) 컬럼명이 있는 파일 불러오기
student1 <- read.table(file = "student1.txt", header = T)
student1

# (3) 구분자가 있는 경우 (세미콜론, 탭)
student2 <- read.table(file = "student2.txt", sep = ";", header = T)
student2

# (4) 특정문자 NA 처리 (- 문자열을 NA로 처리)
student3 <- read.table(file = "student3.txt", sep = " ", header = T, na.strings = "-")
student3

mean(student3$키, na.rm = T)

# 2)) read.csv() 함수 이용
student4 <- read.csv(file = "student4.csv", na.strings = "-")
student4
student4 <- read.csv(file.choose(), na.strings = "-") # file.choose()를 사용하여 탐색기에서 직접 선택 가능

# 3)) read.xlsx() 함수 이용 - 엑셀데이터 읽어오기
Sys.setenv(JAVA_HOME = 'C:\\Program Files\\Java\\jre1.8.0_181')

# rJava를 로드하기 때문에 rJava 패키지 설치 필요
install.packages("rJava")
library(rJava) # 로딩

# xlsx 패키지 설치
install.packages("xlsx") # JAVA 개발 패키지
library(xlsx)

# studentexcel.xlsx 파일 선택
studentex <- read.xlsx(file.choose(), sheetIndex = 1, encoding = "UTF-8")
studentex

# 4)) web에서 파일 읽어오기
titanic <- read.csv("https://vincentarelbundock.github.io/Rdatasets/csv/COUNT/titanic.csv")
titanic
str(titanic)
