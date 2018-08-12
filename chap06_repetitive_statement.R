
# chap06_repetitive_statement

# 1. for(변수 in 값) {표현식}
i <- c(1:10)
i
d <- numeric()
for (n in i) {
    print(n * 10)
    print(n)
    d[n] <- n * 2
}
d

for (n in i) {
    if (n %% 2 == 0)
        next
    else {
        print(n)
    }
}

# 1~100까지 홀수의 합과 짝수의 합을 각각 구하기
i <- c(1:100)
d <- numeric(2)
for (n in i) {
    if (n %% 2 == 0) {
        d[1] <- d[1] + n
    } else {
        d[2] <- d[2] + n
    }
}
d

# vector 생성
kor <- c(81, 85, 74)
eng <- c(95, 86, 41)
mat <- c(62, 41, 75)
name <- c("홍길동", "이순신", "유관순")

# data.frame 생성
student <- data.frame(name, kor, eng, mat)
student