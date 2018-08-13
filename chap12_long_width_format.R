
# chap12_long_width format

# 1. reshape2 패키지 활용
install.packages('reshape2')
library(reshape2)

# 1. dcast()함수 이용 : 긴 형식 -> 넓은 형식 변경
# - '긴 형식'(Long format)을 '넓은 형식'(wide format)으로 모양 변경

data <- read.csv("data.csv")
data
names(data)
# data.csv 데이터 셋 구성 - 22개 관측치, 3개 변수
# Date : 구매날짜
# Customer : 고객ID
# Buy : 구매수량

# 형식) dcast(데이터셋, 앞변수~뒤변수, 함수)
wide <- dcast(data, Customer_ID ~ Date, sum)
wide
