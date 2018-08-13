
# chap11_join_summary

# plyr 패키치 설치
install.packages('plyr')
library(plyr)

# 병합할 데이터프레임 셋 만들기
x = data.frame(ID = c(1, 2, 3, 4, 5), height = c(160, 171, 173, 162, 165))
y = data.frame(ID = c(5, 4, 1, 3, 2), weight = c(55, 73, 60, 57, 80))
x
y
# 1. join() : plyr 패키지 제공 함수
z <- join(x, y, by = "ID") # ID컬럼으로 조인
z

x = data.frame(ID = c(1, 2, 3, 4, 6), height = c(160, 171, 173, 162, 180))
y = data.frame(ID = c(5, 4, 1, 3, 2), weight = c(55, 73, 60, 57, 80))

# 1) left 조인
z <- join(x, y, by = "ID") # ID컬럼으로 조인
z

# 2) inner 조인
z <- join(x, y, by = 'ID', type = 'inner')
z

# 3) full 조인
z <- join(x, y, by = 'ID', type = 'full')
z

# 4) key 값으로 병합하기
x = data.frame(key1 = c(1, 1, 2, 2, 3), key2 = c('a', 'b', 'c', 'd', 'e'),
               val1 = c(10, 20, 30, 40, 50))
y = data.frame(key1 = c(3, 2, 2, 1, 1), key2 = c('e', 'd', 'c', 'b', 'a'),
               val2 = c(500, 400, 300, 200, 100))

df <- join(x, y, by = c('key1', 'key2'))
df

# 2. tapply : 내장함수 기본제공
names(iris)
# 형식) tapply(vector, 집단변수, Func)
tapply(iris$Sepal.Length, iris$Species, mean)
# setosa versicolor virginica
# 5.006 5.936 6.588
table(iris$Species) # 레코드 개수
# setosa versicolor virginica
# 50 50 50

# 3. ddply() : plyr 패키지 제공
# 형식) ddply(dataframe, .(집단변수), 요약집계, 변수명=함수(변수))

# 꽃의 종류별(Species)로 꽃받침길이(Sepal.Length)의 평균 계산
dp <- ddply(iris, .(Species), summarise,
            avg = mean(Sepal.Length),
            tot = sum(Sepal.Length),
            var = var(Sepal.Length),
            sd = sd(Sepal.Length)
            )
dp

# plyr 패키지 제공 data set
data(baseball)
str(baseball) # 'data.frame':	21699 obs. of  22 variables:
#$ id   : chr  "ansonca01" -> 선수 id
#$ year : int  1871 1871 1871 -> 활동 년도 
#$ team : chr  "RC1" "WS3" "FW1" "NY2" ... -> 활동 팀명 
#$ lg   : chr  "" "" "" "" ... -> 리그명
#$ g    : int  25 32 19 33 29 29 29 46 37 25 -> 게임수  
#$ ab   : int  120 162 89 161 128 146 145 217 174 130 -> 베팅수 
#$ r    : int  29 45 15 35 35 40 36 60 26 40 ... -> 도루수 
#$ hr   : int  0 0 0 1 3 1 2 0 0 0 ... -> 홈런수 

head(baseball)
tail(baseball)
length(baseball$team)

# 선수별 subset 작성 
benitar01 <- subset(baseball, id == 'benitar01')
benitar01
length(benitar01$id) # 17개 

# 활동년도
min(benitar01$year) # 1994
max(benitar01$year) # 2007

# 전체 선수의 수 확인
length(baseball$id) # 21699
length(unique(baseball$id)) # 1228

min(baseball$year) # 1871
max(baseball$year) # 2007

# id를 기준으로 각 선수의 시작 년도(start_year) : min() 적용 구하기 
head(ddply(baseball, .(id), summarise, start_year = min(year)))

# id를 기준으로 시작년도(start_year), 마지막 년도(end_year)
head(ddply(baseball, .(id), summarise, start_year = min(year),
           end_year = max(year)))

# id 기준 시작년도, 은퇴년도, 활동년도
head(ddply(baseball, .(id), summarise, start_year = min(year),
           end_year = max(year), cyear = end_year - start_year + 1))

# id, team 기준 시작년도, 은퇴년도, 활동년도
head(ddply(baseball, .(id, team), summarise, start_year = min(year),
           end_year = max(year), cyear = end_year - start_year + 1))
