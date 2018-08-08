
# chap04_FileDataIO


# 1. ���� �ڷ� �о����

# 1) Ű���� �Է�

# ���� �Է�
score <- scan()

# �����Է�
name <- scan(what = "")

# 2) ���� �ڷ� �о����

# read.table vs read.csv
# ������ : ��ı��� ���� �б�
# ������
# read.table : �÷��� Ư�����ڷ� ����
# read.csv : �÷��� �޸��� ����

# 1)) read.table() �Լ� �̿�
# (1) �÷����� ���� ���� �ҷ�����
getwd()
setwd("")
student <- read.table(file = "student.txt")
student

# (2) �÷����� �ִ� ���� �ҷ�����
student1 <- read.table(file = "student1.txt", header = T)
student1

# (3) �����ڰ� �ִ� ��� (�����ݷ�, ��)
student2 <- read.table(file = "student2.txt", sep = ";", header = T)
student2

# (4) Ư������ NA ó�� (- ���ڿ��� NA�� ó��)
student3 <- read.table(file = "student3.txt", sep = " ", header = T, na.strings = "-")
student3

mean(student3$Ű, na.rm = T)

# 2)) read.csv() �Լ� �̿�
student4 <- read.csv(file = "student4.csv", na.strings = "-")
student4
student4 <- read.csv(file.choose(), na.strings = "-") # file.choose()�� ����Ͽ� Ž���⿡�� ���� ���� ����

# 3)) read.xlsx() �Լ� �̿� - ���������� �о����
Sys.setenv(JAVA_HOME = 'C:\\Program Files\\Java\\jre1.8.0_181')

# rJava�� �ε��ϱ� ������ rJava ��Ű�� ��ġ �ʿ�
install.packages("rJava")
library(rJava) # �ε�

# xlsx ��Ű�� ��ġ
install.packages("xlsx") # JAVA ���� ��Ű��
library(xlsx)

# studentexcel.xlsx ���� ����
studentex <- read.xlsx(file.choose(), sheetIndex = 1, encoding = "UTF-8")
studentex

# 4)) web���� ���� �о����
titanic <- read.csv("https://vincentarelbundock.github.io/Rdatasets/csv/COUNT/titanic.csv")
titanic
str(titanic)