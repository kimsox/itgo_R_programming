# chap01_Basic

# 1. ��Ű�� ����
# 2. ������ ������ ����
# 3. �⺻�Լ� ����
# 4. �۾�����

# 1. ��Ű�� ����

# ��밡���� ��Ű��
dim(available.packages())
# [1] 12794     17
# session ����
sessionInfo()
# ��Ű�� = �Լ� + �����ͼ�
# ��Ű�� ��ġ���
install.packages("stringr")
.libPaths()
library(stringr)
# ���ڿ� ���� �Լ�
str_extract_all("abase113##%%%afafa", "[a-z]{3}")
# �޸� �ε� ��Ű�� Ȯ�� (���̺귯���� �Ź� �ε��ؾ��Ѵ�!!)
search()
# ��Ű�� ����
remove.packages("stringr")

# 2. ������ ������ ����
# (1) ���� : �޸𸮿� �̸�
# (2) ���� �ۼ� ��Ģ
# - ù�ڴ� ������, �ι�° ����, Ư������(.,_)
# - �����, �Լ��� ���Ұ�
# - ��ҹ� ���� (num != NUM)
# - ���� ���� �� Ÿ�� ���� ����

# [�ǽ�]
ver1 <- 0 # ver1 = 0
ver1 <- 1
ver2 <- 10
ver3 <- 100
ver1;
ver2;
ver3;


# ���.�������
member.id <- "hong"
member.pwd <- "1234"
member.name <- "ȫ�浿"

# �ڷ���(type) : ������, ������, ������, ����ġ��
int <- 1045
float <- 10.452
char <- "������" # '������'
bool <- T # TRUE, F, FALSE
score <- c(78, 89, NA)

# �ڷ��� Ȯ��
mode(int) # "numeric"
mode(float) # "numeric"
mode(char) # "character"
mode(bool) # "logical"
mode(score) # "numeric"

# ��跮
sum(score)
sum(score, na.rm = T) # 167
sum(1:3, 5:6)

# 3. �⺻�Լ� ����

# �Լ� ����
help(sum)
? sum

# �⺻ �����ͼ�
data()
Nile
length(Nile)
plot(Nile)
hist(Nile)

# 4. �۾�����
getwd() # �⺻��� ���� - ���� ����½� ���
setwd("C:/Rdata/chap01") # �⺻��� ���� 
test <- read.csv("test.csv", header = T)