
# chap07_User_function

# �Լ� ���� ����
# ���� <- function([�Ű�����]) {
#               �Լ��� ���๮
#           }

# �Լ� ȣ��
# ����([�Ű�����])

# �Ű������� ���� �Լ� ��
f1 <- function() {
    cat("�Ű������� ���� �Լ�")
}

f1() # �Լ� ȣ��

# �Ű������� �ִ� �Լ� ��
f2 <- function(x) { # ���μ�
    cat("x�� �� =", x, "\n") # \n �ٹٲ�
    print(x) # ������ ���
}

f2(10) # ���μ�

# ���� ���� �ִ� �Լ� ��
f3 <- function(x, y) {
    add <- x + y # ����
    sub <- x - y
    mul <- x * y
    div <- x / y
    # return(add, sub, mul, div) # ���� �߻�
    df <- data.frame(add, sub, mul, div)
    return(df)
}

add <- f3(10, 20)
add

# ��跮�� ���ϴ� �Լ�
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

# ���� �ҷ�����
setwd("��¼����¼��")
test <- read.csv("test.csv", header = TRUE)
head(test) # ��� ������
dim(test) # ����~ 402 5  : ���ڵ尳�� �÷�����

# A �÷� �����跮, �󵵼� ���ϱ�
summary(test) # �����跮
table(test$A) # A ���� ��� �󵵼�
max(test$A) # �ְ� �󵵼�
min(test$A) # �ּ� �󵵼�

# �� Į�� ���� �����跮�� �󵵼� ���ϱ�
data_pro <- function(x) {

    for (idx in 1:length(x)) {
        cat(idx, '��° Į���� �󵵺м� ���')
        print(table(x[idx]))
        cat('\n')
    }
    for (idx in 1:length(x)) {
        f <- table(x[idx])
        cat(idx, '��° Į���� �ִ�/�ּڰ�\n')
        cat("max =", max(f), "min =", min(f), '\n')
    }
}
data_pro(test) #�Լ� ȣ��

# ��Ÿ���� ���� ����- �� : a^2+b^2=c^2
pytha <- function(s, t) {
    a <- s ^ 2 - t ^ 2
    b <- 2 * s * t
    c <- s ^ 2 + t ^ 2
    cat("��Ÿ������ ���� : 3���� ���� : ", a, b, c)
}

pytha(2, 1) # s,t�� ���� ���� -> 3 4 5

# ����ġ(NA) ������ ó��
data <- c(10, 20, 5, 4, 40, 7, NA, 6, 3, NA, 2, NA) # 97
data
mean(data, na.rm = T) # NA

# ����ġ ������ ó�� �Լ�
na <- function(x) {
    # 1�� : NA ���� 
    print(x)
    print(mean(x, na.rm = T))

    # 2�� : NA�� 0���� ��ü  
    data = ifelse(!is.na(x), x, 0) # NA�̸� 0���� ��ü
    print(data)
    print(mean(data))

    # 3�� : NA�� ������� ��ü 
    data2 = ifelse(!is.na(x), x, round(mean(x, na.rm = TRUE), 2)) # ������� ��ü 
    print(data2)
    print(mean(data2))
}
na(data) # �Լ� ȣ��

# Ư������ ���� -> ��������ȯ
string_pro <- function(str) {
    library(stringr)
    # Ư������ ����
    str_replace_all(str, "\\,|\\%|\\$", "")
    # ���� -> ���� ����ȯ
    num <- as.numeric(str2)
    return(num)
}

string <- "$145,784%"
re_num <- string_pro(string)
re_num
