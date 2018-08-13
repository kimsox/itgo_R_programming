
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

tot <- numeric()
avg <- numeric()

for (i in 1:nrow(student)) { # 학생수 만큼 반복
    tot[i] <- student$kor[i] + student$eng[i] + student$mat[i]
    avg[i] <- round((tot[i] / 3), 2) # 소수 두번째자리 까지 표현!
}
tot
avg

# data.frame에 칼럼 추가
student$avg <- avg
student$tot <- tot
student

# 다중 for
# for(){ for() {} }
# skip~~~~~


# 2) while(조걷식){표현식}
i = 0
while (i < 10) {
    i = i + 1 # 카운터 변수
    print(i) # 1~10까지 출력됨
}

# 3) repeat {탈출조건}
cnt <- 1
repeat {
    print(cnt)
    cnt <- cnt + 2
    if (cnt > 15)
        break
    }
