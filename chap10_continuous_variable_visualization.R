
# chap10_continuous_variable_visualization

# 연속변수 : 시간, 길이 등과 같은 연속서을 가진 그래프 시각화

# 1. 상자 그래프 시각화
summary(VADeaths)
boxplot(VADeaths, range = 0) # 상자 그래프 시각화
# range = 0 : 최소값과 최대값을 점선으로 연결하는 역할

boxplot(VADeaths, range = 0, notch = T) # 상자 그래프 시각화
abline(h = 37, lty = 3, col = 'red')

# 2. 히스토그램 시각화
data(iris) # iris 데이터 셋 가져오기
names(iris)
iris
summary(iris$Sepal.Length)

hist(iris$Sepal.Length, xlab = "iris$Sepal.Length",
     col = "magenta",
     main = "iris 꽃받침 길이 histogram", xlim = c(4.3, 7.9))

summary(iris$Sepal.Width)

hist(iris$Sepal.Width, xlab = "iris$Sepal.Width",
     col = "mistyrose",
     main = "iris 꽃받침 넓이 histogram", xlim = c(2.0, 4.5))

# 밀도분포곡선
par(mfrow = c(1, 1))
hist(iris$Sepal.Width, xlab = "iris$Sepal.Width",
     col = "mistyrose", freq = F,
     main = "iris 꽃받침 넓이 histogram", xlim = c(2.0, 4.5))

# 곡선 추가
lines(density(iris$Sepal.Width), col = "blue")

# 정규분포곡선 추가
x <- seq(2.0, 4.5, 0.1)
x
length(x)

curve(dnorm(x, mean = mean(iris$Sepal.Width), sd = sd(iris$Sepal.Width)),
      col = "red", add = T)


# 3. 산점도 시각화
price <- runif(10, min = 1, max = 100) # 1~100사이 10개 난수 발생
price
plot(price)

par(mfrow = c(2, 2)) # 2행 2열 차트 그리기
plot(price, type = "l") # 유형 : 실선
plot(price, type = "o") # 유형 : 원형과 실선
plot(price, type = "h") # 직선
plot(price, type = "s") # 꺾은선

# plot() 함수 속성 : pch : 연결점 문자타입-> plotting characher-번호(1~30)
plot(price, type = "o", pch = 5) # 빈 사각형
plot(price, type = "o", pch = 15) # 채워진 마름모
plot(price, type = "o", pch = 20, col = "blue") #color 지정
plot(price, type = "o", pch = 20, col = "orange", cex = 1.5) #character expension(확대)

plot(price, type = "o", pch = 20, col = "green", cex = 2.0, lwd = 3) #lwd : line width


# 4. 변수 간의 비교 시각화
data(iris)
iris
attributes(iris)

# 4개 변수 상호 비교
help(pairs)
pairs(iris[, 1:4])

# Species=="virginica"인 경우만 4개 변수 상호비교
iris[iris$Species == "virginica", 1:4]
pairs(iris[iris$Species == "virginica", 1:4])
pairs(iris[iris$Species == "setosa", 1:4])

# 5. 차트 파일 저장 
setwd("D:/Study/itgo_R_programming/output/") # 폴더 지정
jpeg("iris.jpg", width = 720, height = 480) # 픽셀 지정 가능
plot(iris$Sepal.Length, iris$Petal.Length, col = iris$Species)
title(main = "iris 데이터 테이블 산포도 차트")
dev.off() # 장치 종료 