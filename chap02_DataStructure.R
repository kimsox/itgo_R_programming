
# 2�� �ڷᱸ�� ����

# �������� �ڷᱸ��
# 1. Vector         1��
# 2. Matrix         2��
# 3. Array          3��(������)
# 4. Data Frame     List�� Vector ȥ����, ���� ���� ���
# 5. List           Key, Value, c(����ü), python(��ųʸ�)

# Chapter02_Datastructure

# 1. Vector �ڷᱸ��
# - ������ �ڷ����� ���� 1���� �迭����
# - ���� �Լ� : c(), seq(), rep()

# ���� ������ ����
v1 <- c(33, -25, 20:25, 12)
v1
length(v1) # 9
v2 <- seq(1, 10, 2) # (����, ����, ����)
v2
v3 <- rep(1:3, 3)   # �ݺ�
v3
? rep
v4 <- rep(1:3, each = 3)
v4

v5 <- c(1:5, "4")
v5 # "1" "2" "3" "4" "5" "4"
sum(v5)

num <- as.numeric(v5) # ���ڷ� ����ȯ
num
sum(num) # 19

# index Ȱ��
age <- c(30, 35, 45)
age
names(age) <- c("ȫ�浿", "�̼���", "������")
age

age[2]
age[3]
age[1:2]
age[c(1, 3)] # �ݵ�� c()�Լ��� ��������

# 2. Matrix : ������ �ڷ����� ���� 2���� �迭
# - �����Լ� : matrix(), rbind(), cbind()
# - ó���Լ� : apply()

# 1) matrix() ����
mt <- matrix(1:5) # c(1:5)
mt # 5x1 ���

mt2 <- matrix(1:9, nrow = 3) # 9�� �����͸� 3��3������ ����. 1������ ����
mt2 <- matrix(1:9, nrow = 3, byrow = T) # ����� ����
mt2

# 2) rbind() / cbind()
x1 <- c(5, 4, 7, 1, 6);
x2 <- c(6, 8, 5, 2, 1);

rb <- rbind(x1, x2) # row bind
rb # 2x5
cb <- cbind(x1, x2) # column bind
cb # 5x2

class(rb); class(cb);

# index �������
rb[1:2, 2:3]
rb[1,]; # 1�� ��ü
cb[, 2]; # 2�� ��ü
rb[1, 3]; # 7 ����

# apply(data, 1/2, Func)
x <- matrix(1:9, nrow = 3)
x

apply(x, 1, max)
apply(x, 2, sd)
apply(x, 2, mean)

# 3. Array : ������ �ڷ����� ���� 3���� �迭
# - �����Լ� : array()

d <- 1:12
arr <- array(d, c(3, 2, 2)) # c(��, ��, ��)
arr

arr[,, 1] # [��, ��, ��]
arr[,, 2]
arr[1,, 2] # 2�鿡�� 1�� ����

# 4. Data Frame : ��� ���� 2���� �ڷᱸ��(DBMS�� table�� ����)
# - �����Լ� : data.frame(), �÷����� ����

# 1) data.frame
no <- c(1001, 1002, 1003)
name <- c("hong", "lee", "kim")
pay <- c(150, 250, 300)

vemp <- data.frame(NO = no, NAME = name, PAY = pay)
vemp
class(vemp) # "data.frame"

# 2) txt ����
setwd("c:\Rdata\chap02")
txtemp <- read.table("emp.txt", header = T, sep = "")
txtemp
class(txtemp)

csvemp <- read.csv("emp.csv", header = T)
csvemp
class(csvemp)