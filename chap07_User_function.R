
# chap07_User_function

# 함수 정의 형식
# 변수 <- function([매개변수]) {
#               함수의 실행문
#           }

# 함수 호출
# 변수([매개변수])

# 매개변수가 없는 함수 예
f1 <- function() {
    cat("매개변수가 없는 함수")
}

f1() # 함수 호출

# 매개변수가 있는 함수 예
f2 <- function(x) { # 가인수
    cat("x의 값 =", x, "\n") # \n 줄바꿈
    print(x) # 변수만 사용
}

f2(10) # 실인수

# 리턴 값이 있는 함수 예
f3 <- function(x, y) {
    add <- x + y # 덧셈
    sub <- x - y
    mul <- x * y
    div <- x / y
    # return(add, sub, mul, div) # 오류 발생
    df <- data.frame(add, sub, mul, div)
    return(df)
}

add <- f3(10, 20)
add

# 통계량을 구하는 함수
stat <- function(func, data) {
    switch(func,
           SUM = sum(data),
           AVG = mean(data),
           VAR = var(data),
           SD = sd(data)
           )
}
data <- 1:10
stat("SUM", data)
stat("SD", data)

# 파일 불러오기
setwd("어쩌구저쩌구")
test <- read.csv("test.csv", header = TRUE)
head(test) # 상단 데이터
dim(test) # 차원~ 402 5  : 레코드개수 컬럼개수

# A 컬럼 요약통계량, 빈도수 구하기
summary(test) # 요약통계량
table(test$A) # A 변수 대상 빈도수
max(test$A) # 최고 빈도수
min(test$A) # 최소 빈도수

# 각 칼럼 단위 요약통계량과 빈도수 구하기
data_pro <- function(x) {

    for (idx in 1:length(x)) {
        cat(idx, '번째 칼럼의 빈도분석 결과')
        print(table(x[idx]))
        cat('\n')
    }
    for (idx in 1:length(x)) {
        f <- table(x[idx])
        cat(idx, '번째 칼럼의 최댓값/최솟값\n')
        cat("max =", max(f), "min =", min(f), '\n')
    }
}
data_pro(test) #함수 호출

# 피타고라스 정의 증명- 식 : a^2+b^2=c^2
pytha <- function(s, t) {
    a <- s ^ 2 - t ^ 2
    b <- 2 * s * t
    c <- s ^ 2 + t ^ 2
    cat("피타고라스의 정리 : 3개의 변수 : ", a, b, c)
}

pytha(2, 1) # s,t는 양의 정수 -> 3 4 5

# 결측치(NA) 데이터 처리
data <- c(10, 20, 5, 4, 40, 7, NA, 6, 3, NA, 2, NA) # 97
data
mean(data, na.rm = T) # NA

# 결측치 데이터 처리 함수
na <- function(x) {
    # 1차 : NA 제거 
    print(x)
    print(mean(x, na.rm = T))

    # 2차 : NA를 0으로 대체  
    data = ifelse(!is.na(x), x, 0) # NA이면 0으로 대체
    print(data)
    print(mean(data))

    # 3차 : NA를 평균으로 대체 
    data2 = ifelse(!is.na(x), x, round(mean(x, na.rm = TRUE), 2)) # 평균으로 대체 
    print(data2)
    print(mean(data2))
}
na(data) # 함수 호출

# 특수문자 제거 -> 숫자형변환
string_pro <- function(str) {
    library(stringr)
    # 특수문자 제거
    str_replace_all(str, "\\,|\\%|\\$", "")
    # 무자 -> 숫자 형변환
    num <- as.numeric(str2)
    return(num)
}

string <- "$145,784%"
re_num <- string_pro(string)
re_num

