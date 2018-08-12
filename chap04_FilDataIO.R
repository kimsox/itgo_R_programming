
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
remove.packages(rJava)
# xlsx 패키지 설치
install.packages("xlsx") # JAVA 개발 패키지
library(xlsx)

# studentexcel.xlsx 파일 선택
studentex <- read.xlsx(file.choose(), sheetIndex = 1, encoding = "UTF-8")
studentex

# 4)) web에서 파일 읽어오기 (예제 : 웹에 있는 csv를 바로 읽어옴)
titanic <- read.csv("https://vincentarelbundock.github.io/Rdatasets/csv/COUNT/titanic.csv")
titanic
str(titanic) # 파일에 대한 구성을 살펴본다
# 'data.frame':	1316 obs. of  5 variables:  1316개 레코드, 컬럼은 5개
# 범주의 개수 Factor w/ 3 levels : 3동이라는 얘기랜다.
table(titanic$survived)
# no yes
# 817 499


# 2. 파일 저장하기

# 1) 화면(콘솔) 출력

# cat() 함수
x <- 10
y <- 20
z <- x * y
cat("x*y의 결과는 ", z, "\n입니다.") # \n 줄바꿈
cat("x*y =", z)

# print() 함수
print(z) # 변수 또는 수식만 가능
print(z * 10)
print('x*y =', z) # Error : 변수나 수식만 가능하댄다

# 2) 파일에 데이터 저장

# 1)) write.table() 함수 이용 파일 저장
getwd()
setwd("F:/Programming_Study/itgo_R_programming/LectureNote/제4강/output/")

# (1) 기본옵션으로 저장 - 행 이름과 따옴표 붙음
# write.table(변수명, "경로/파일명")
write.table(studentex, "stdt.txt")
# (2) 행 이름 제거하여 저장
write.table(studentex, "stdt2.txt", row.names = FALSE)
# (3) 따옴표 제거하여 저장
write.table(studentex, "stdt3.txt", row.names = FALSE, quote = FALSE)

# 2)) write.csv() 함수 이용 파일 저장
# data.frame 형식의 데이터를 csv 형식으로 저장
st.df <- studentex
write.csv(st.df, "stdt.csv", row.names = F, quote = F)

# 3)) write.xlsx() 함수 이용 파일 저장 - 엑셀 파일로 저장
library(xlsx) # excel data 입출력 함수 제공

# studentexcel.xlsx 파일 선책
st.df <- read.xlsx(file.choose(), sheetIndex = 1, encoding = "UTF-8")
str(st.df)
write.xlsx(st.df, "student.xlsx") # excel 형식으로 저장
