# chap05_conditional_statrment

# 1. 연산자

# 1) 산술연산자
num1 <- 100 # 피연산자1
num2 <- 20 # 피연산자2
result <- num1 + num2 # 덧셈
result
result <- num1 - num2 # 뺄셈
result
result <- num1 * num2 # 곱셈
result
result <- num1 / num2 # 나눗셈
result

result <- num1 %% num2 # 나머지 계산
result

result <- num1 ^ 2 # 제곱 계산(num1 ** 2)
result
result <- num1 ** 2
result
result <- num1 ^ num2 # 100의 20승
result

# 2) 관계 연산자
# (1) 동등비교
boolean <- num1 == num2 # 두 변수의 값이 같은지 비교
boolean
boolean <- num1 != num2 # 두 변수의 값이 다른지 비교
boolean

# (2) 크기비교
boolean <- num1 > num2 # num1 값이 큰지 비교
boolean
boolean <- num1 >= num2 # num1 값이 크거나 같은지 비교
boolean
boolean <- num1 < num2 # num2 값이 큰지 비교
boolean
boolean <- num1 <= num2 # num2 값이 크거나 같은지 비교
boolean

# 3) 논리 연산자
logical <- num1 >= 50 & num2 <= 10 # 두 관계식이 같은지 판단
logical
logical <- num1 >= 50 | num2 <= 10 # 두 관계식 중 하나라도 같은지 판단
logical

x <- TRUE
y <- FALSE
xor(x, y)
x <- TRUE
y <- TRUE
xor(x, y)

# 2. if()함수
x <- 10
y <- 5
z <- x * y
z

#if(조건식){ # 산술,관계,논리연산자
#   실행문1  <- 참
#}else{
#   실행문2  <- 거짓 
#}

if (x * y > 40) {
    # 산술 > 관계 > 논리 
    cat("x*y의 결과는 40 이상입니다.\n") # \n 줄바꿈
    cat("x*y =", z, '\n')
    print(z)
} else {
    cat("x*y의 결과는 40 미만입니다. x*y =", z, "\n")
}

# 학점 구하기
score <- scan()

if (score >= 90) {
    # 조건식1
    result = "A학점" # 조건식1 참
} else if (score >= 80) {
    # 조건식2
    result = "B학점" # 조건식1 거짓, 조건식2 참 
} else if (score >= 70) {
    result = "C학점"
} else if (score >= 60) {
    result = "D학점"
} else {
    result = "F학점"
}
cat("당신의 학점은 ", result) # 당신의 학점은  B학점
print(result)


# 3. ifelse(조건, 참, 거짓) - 3항 연산자 기능

score <- c(78, 95, 85, 65)
score
ifelse(score >= 80, "우수", "노력")
# vector -> ifelse() -> vector

# 4. switch 문
# 형식) switch(비교구문, 실행구문1, 실행구문2, 실행구문3)

switch("pwd", id = "hong", pwd = "1234", age = 105, name = "홍길동")

# 5. which 문
# which()의 괄호내의 조건에 해당하는 위치(인덱스)를 출력한다.
x <- c(2, 3, 5, 7, 8)
x # 
which(x == 7) # 4

# 벡터에서 사용-> index값 리턴
name <- c("kim", "lee", "choi", "park")
which(name == "choi") # 3

# 데이터프레임에서 사용
no <- c(1:5)
name <- c("홍길동", "이순신", "강감찬", "유관순", "김유신")
score <- c(85, 78, 89, 90, 74)

exam <- data.frame(학번 = no, 이름 = name, 성적 = score)
exam
which(exam$이름 == "유관순")
