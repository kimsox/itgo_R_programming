# chap05_conditional_statrment

# 1. ������

# 1) ���������
num1 <- 100 # �ǿ�����1
num2 <- 20 # �ǿ�����2
result <- num1 + num2 # ����
result
result <- num1 - num2 # ����
result
result <- num1 * num2 # ����
result
result <- num1 / num2 # ������
result

result <- num1 %% num2 # ������ ���
result

result <- num1 ^ 2 # ���� ���(num1 ** 2)
result
result <- num1 ** 2
result
result <- num1 ^ num2 # 100�� 20��
result

# 2) ���� ������
# (1) �����
boolean <- num1 == num2 # �� ������ ���� ������ ��
boolean
boolean <- num1 != num2 # �� ������ ���� �ٸ��� ��
boolean

# (2) ũ���
boolean <- num1 > num2 # num1 ���� ū�� ��
boolean
boolean <- num1 >= num2 # num1 ���� ũ�ų� ������ ��
boolean
boolean <- num1 < num2 # num2 ���� ū�� ��
boolean
boolean <- num1 <= num2 # num2 ���� ũ�ų� ������ ��
boolean

# 3) ���� ������
logical <- num1 >= 50 & num2 <= 10 # �� ������� ������ �Ǵ�
logical
logical <- num1 >= 50 | num2 <= 10 # �� ����� �� �ϳ��� ������ �Ǵ�
logical

x <- TRUE
y <- FALSE
xor(x, y)
x <- TRUE
y <- TRUE
xor(x, y)

# 2. if()�Լ�
x <- 10
y <- 5
z <- x * y
z

#if(���ǽ�){ # ���,����,����������
#   ���๮1  <- ��
#}else{
#   ���๮2  <- ���� 
#}

if (x * y > 40) {
    # ��� > ���� > ���� 
    cat("x*y�� ����� 40 �̻��Դϴ�.\n") # \n �ٹٲ�
    cat("x*y =", z, '\n')
    print(z)
} else {
    cat("x*y�� ����� 40 �̸��Դϴ�. x*y =", z, "\n")
}

# ���� ���ϱ�
score <- scan()

if (score >= 90) {
    # ���ǽ�1
    result = "A����" # ���ǽ�1 ��
} else if (score >= 80) {
    # ���ǽ�2
    result = "B����" # ���ǽ�1 ����, ���ǽ�2 �� 
} else if (score >= 70) {
    result = "C����"
} else if (score >= 60) {
    result = "D����"
} else {
    result = "F����"
}
cat("����� ������ ", result) # ����� ������  B����
print(result)


# 3. ifelse(����, ��, ����) - 3�� ������ ���

score <- c(78, 95, 85, 65)
score
ifelse(score >= 80, "���", "���")
# vector -> ifelse() -> vector

# 4. switch ��
# ����) switch(�񱳱���, ���౸��1, ���౸��2, ���౸��3)

switch("pwd", id = "hong", pwd = "1234", age = 105, name = "ȫ�浿")

# 5. which ��
# which()�� ��ȣ���� ���ǿ� �ش��ϴ� ��ġ(�ε���)�� ����Ѵ�.
x <- c(2, 3, 5, 7, 8)
x # 
which(x == 7) # 4

# ���Ϳ��� ���-> index�� ����
name <- c("kim", "lee", "choi", "park")
which(name == "choi") # 3

# �����������ӿ��� ���
no <- c(1:5)
name <- c("ȫ�浿", "�̼���", "������", "������", "������")
score <- c(85, 78, 89, 90, 74)

exam <- data.frame(�й� = no, �̸� = name, ���� = score)
exam
which(exam$�̸� == "������")