
# chap06_repetitive_statement

# 1. for(���� in ��) {ǥ����}
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

# 1~100���� Ȧ���� �հ� ¦���� ���� ���� ���ϱ�
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

# vector ����
kor <- c(81, 85, 74)
eng <- c(95, 86, 41)
mat <- c(62, 41, 75)
name <- c("ȫ�浿", "�̼���", "������")

# data.frame ����
student <- data.frame(name, kor, eng, mat)
student