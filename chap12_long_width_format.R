
# chap12_long_width format

# 1. reshape2 ��Ű�� Ȱ��
install.packages('reshape2')
library(reshape2)

# 1. dcast()�Լ� �̿� : �� ���� -> ���� ���� ����
# - '�� ����'(Long format)�� '���� ����'(wide format)���� ��� ����

data <- read.csv("data.csv")
data
names(data)
# data.csv ������ �� ���� - 22�� ����ġ, 3�� ����
# Date : ���ų�¥
# Customer : ����ID
# Buy : ���ż���

# ����) dcast(�����ͼ�, �պ���~�ں���, �Լ�)
wide <- dcast(data, Customer_ID ~ Date, sum)
wide