
# chap09_ discrete_variable_visualizawtion

# 1. 막대차트 시각화

# (1) 세로 막대 차트 

# 이산변수 자료 생성
chart_data <- c(305, 450, 320, 460, 330, 480, 380, 520)
names(chart_data) <- c("2016 1분기", "2017 1분기", "2016 2분기", "2017 2분기", "2016 3분기", "2017 3분기", "2016 4분기", "2017 4분기")
chart_data

# 세로 막대 차트 : 기본 속성
barplot(chart_data, ylim = c(0, 600),
        col = rainbow(8), main = "2016년도 vs 2017년도 분기별 매출현황 비교")

# (2) 가로 막대 차트
barplot(chart_data, xlim = c(0, 600), horiz = TRUE,
        col = rainbow(8), main = "2016년도 vs 2017년도 분기별 매출현황 비교")

# red와 blue 색상 4회 반복
barplot(chart_data, xlim = c(0, 600), horiz = TRUE,
        xlab = "매출액(단위:만워)", ylab = "년도별 분기현황",
        space = 2, cex.names = 0.8, col = rep(c(2, 3, 4), 1))
# 1 : 검정, 2: 빨강, 3: 초록, 4: 파랑, 5: 하늘색, 6: 자주색, 7 : 노랑색

VADeaths
str(VADeaths) # structure 전체 구조 알려줌
rnames <- row.names(VADeaths)
par(mfrow = c(1, 2)) # 1행 2열 그래프 보기 (난 여러개를 보고 싶다고~~~)

# beside = T : 개별 막대차트
barplot(VADeaths, beside = T, col = rainbow(5),
        main = "미국 버지니아주 하위계층 사망비율")
# 범례 추가
legend(19, 71, c("50-54", "55-59", "60-64", "65-69", "70-74"), cex = 0.8, fill = rainbow(5))

# beside = F : 누적 막대차트
barplot(VADeaths, beside = F, col = rainbow(5))
title(main = "미국 버지니아주 하위계층 사망비율", font.main = 4)
legend(3.8, 200, c("50-54", "55-59", "60-64", "65-69", "70-74"), cex = 0.8, fill = rainbow(5))


# 2. 점 차트 시각화
par(mfrow = c(1, 1))

? dotchart
dotchart(chart_data, color = c("green", "red"), lcolor = "black",
         pch = 1:2, labels = names(chart_data), xlab = "매출액",
         main = "분기별 판매현황 점 차트 시각화", cex = 1.2)

# 3. 파이 차트 시각화
pie(chart_data, labels = names(chart_data),
    border = 'blue', col = rainbow(8), cex = 1.2)
title("2016~2017년도 분기별 매출현황")
