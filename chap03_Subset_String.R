
# chap03_Subset_String

# 1. ����� ����� : subset(DF, ���ǽ�)
x <- 1:5
y <- 6:10
z <- letters[1:5] # letters : �ҹ��� vector �̴�??!

df <- data.frame(x, y, z)
df

x1 <- subset(df, x >= 3)
x1
class(x1) # data.frame
y1 <- subset(df, y <= 8)
y1
xy <- subset(df, x >= 2 | y <= 6) # or
xy
xy2 <- subset(df, x >= 2 & y <= 6) # and
xy2
df2 <- subset(df, z %in% c("a", "c", "e", "k")) # k�� ����
df2

# 2. ����(merge)
height <- data.frame(id = c(1:2), h = c(180, 175))
weight <- data.frame(id = c(1:2), w = c(80, 75))
height;
weight;

user <- merge(height, weight, by.x = "id", by.y = "id")
user

# 3. ���ڿ� ó�� �Լ��� ����ǥ����
# - stringr ��Ű������ �����ϴ� �Լ� �̿� ���ڿ� ó��
install.packages("stringr")
library(stringr)

# ����) str_extract('���ڿ�', '����ǥ����')
str_extract("absc1234#$%%ȫ�浿", "[0-9]{2}") # "12"
str_extract_all("absc1234#$%%ȫ�浿", "[0-9]{2}") # "12" "34"

# 1) �ݺ� �� ���� ����ǥ���� : [] {n}
str <- "hongkildong35leed45������125###"
str_extract_all(str, "[a-z]{3}") # list ��ȯ
str_extract_all(str, "[0-9]{2}") # list ��ȯ
str_extract_all(str, "[��-�R]{3}") # "������"
str_extract_all(str, "[0-9]{2,}") # list ��ȯ - ���� 2���̻� ����

# 2) �ܾ�� ���� ���� ����ǥ����
# �ܾ� : \\w : word
# ���� : \\d : digit

# �ֹι�ȣ ��� �˻�
jumin <- "123456-1234567"
str_extract_all(jumin, "[0-9]{6}-[1,2,3,4][0-9]{6}")
str_extract_all(jumin, "\\d{6}-[1,2,3,4]\\d{6}") # ��
jumin2 <- "123456-5234567"
str_extract_all(jumin2, "[0-9]{6}-[1,2,3,4][0-9]{6}") # 5�� ����ȴ�

# email ��� �˻�
email <- "kp1234@naver.com"
str_extract_all(email, "\\w{4,}@\\w{3,}.\\w{2,}")

# 3) Ư�����ڿ��� �����ϴ� ����ǥ����
str <- "hongkildong35leed45������125###"
str_extract_all(str, "[^0-9]{2}")

# 4) ���ڿ� ���� ���ϱ�
length(str) # 1
str_length(str) # 28

# 5) ���ڿ� ��ġ(index)
str_locate_all(str, "gk") # 4 5

# 6) �κ� ���ڿ�
str_sub(str, 10, 20) # 10��° ���� ~ 20��° ����

# 7) ���ڿ� ��ü
str_replace_all(str, "������", "����������")

# 8) ���ڿ� �и�
str2 <- "ȫ�浿,�̼���,������"
sp <- str_split(str2, ",")
sp2 <- unlist(sp)
sp2 # vector

# 9) ���ڿ� ����
paste(sp2, collapse = ",") # �⺻�Լ�

# 10) Ư�� ���ڿ� ���� ���� �и�
jumin <- "123456-1234567"
str_split_fixed(jumin, "-", 2) # matrix ���·� �и���
# [, 1][, 2]
# [1,] "123456" "1234567"
