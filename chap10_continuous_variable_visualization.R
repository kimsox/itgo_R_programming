
# chap10_continuous_variable_visualization

# ���Ӻ��� : �ð�, ���� ��� ���� ���Ӽ��� ���� �׷��� �ð�ȭ

# 1. ���� �׷��� �ð�ȭ
summary(VADeaths)
boxplot(VADeaths, range = 0) # ���� �׷��� �ð�ȭ
# range = 0 : �ּҰ��� �ִ밪�� �������� �����ϴ� ����

boxplot(VADeaths, range = 0, notch = T) # ���� �׷��� �ð�ȭ
abline(h = 37, lty = 3, col = 'red')

# 2. ������׷� �ð�ȭ
data(iris) # iris ������ �� ��������
names(iris)
iris
summary(iris$Sepal.Length)

hist(iris$Sepal.Length, xlab = "iris$Sepal.Length",
     col = "magenta",
     main = "iris �ɹ�ħ ���� histogram", xlim = c(4.3, 7.9))

summary(iris$Sepal.Width)

hist(iris$Sepal.Width, xlab = "iris$Sepal.Width",
     col = "mistyrose",
     main = "iris �ɹ�ħ ���� histogram", xlim = c(2.0, 4.5))

# �е������
par(mfrow = c(1, 1))
hist(iris$Sepal.Width, xlab = "iris$Sepal.Width",
     col = "mistyrose", freq = F,
     main = "iris �ɹ�ħ ���� histogram", xlim = c(2.0, 4.5))

# � �߰�
lines(density(iris$Sepal.Width), col = "blue")

# ���Ժ���� �߰�
x <- seq(2.0, 4.5, 0.1)
x
length(x)

curve(dnorm(x, mean = mean(iris$Sepal.Width), sd = sd(iris$Sepal.Width)),
      col = "red", add = T)


# 3. ������ �ð�ȭ
price <- runif(10, min = 1, max = 100) # 1~100���� 10�� ���� �߻�
price
plot(price)

par(mfrow = c(2, 2)) # 2�� 2�� ��Ʈ �׸���
plot(price, type = "l") # ���� : �Ǽ�
plot(price, type = "o") # ���� : ������ �Ǽ�
plot(price, type = "h") # ����
plot(price, type = "s") # ������

# plot() �Լ� �Ӽ� : pch : ������ ����Ÿ��-> plotting characher-��ȣ(1~30)
plot(price, type = "o", pch = 5) # �� �簢��
plot(price, type = "o", pch = 15) # ä���� ������
plot(price, type = "o", pch = 20, col = "blue") #color ����
plot(price, type = "o", pch = 20, col = "orange", cex = 1.5) #character expension(Ȯ��)

plot(price, type = "o", pch = 20, col = "green", cex = 2.0, lwd = 3) #lwd : line width


# 4. ���� ���� �� �ð�ȭ
data(iris)
iris
attributes(iris)

# 4�� ���� ��ȣ ��
help(pairs)
pairs(iris[, 1:4])

# Species=="virginica"�� ��츸 4�� ���� ��ȣ��
iris[iris$Species == "virginica", 1:4]
pairs(iris[iris$Species == "virginica", 1:4])
pairs(iris[iris$Species == "setosa", 1:4])

# 5. ��Ʈ ���� ���� 
setwd("D:/Study/itgo_R_programming/output/") # ���� ����
jpeg("iris.jpg", width = 720, height = 480) # �ȼ� ���� ����
plot(iris$Sepal.Length, iris$Petal.Length, col = iris$Species)
title(main = "iris ������ ���̺� ������ ��Ʈ")
dev.off() # ��ġ ���� 