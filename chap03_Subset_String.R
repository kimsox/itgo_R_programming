
# chap03_Subset_String

# 1. 서브셋 만들기 : subset(DF, 조건식)
x <- 1:5
y <- 6:10
z <- letters[1:5] # letters : 소문자 vector 이다??!

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
df2 <- subset(df, z %in% c("a", "c", "e", "k")) # k는 없음
df2

# 2. 병합(merge)
height <- data.frame(id = c(1:2), h = c(180, 175))
weight <- data.frame(id = c(1:2), w = c(80, 75))
height;
weight;

user <- merge(height, weight, by.x = "id", by.y = "id")
user

# 3. 문자열 처리 함수와 정규표현식
# - stringr 패키지에서 제공하는 함수 이용 문자열 처리
install.packages("stringr")
library(stringr)

# 형식) str_extract('문자열', '정규표현식')
str_extract("absc1234#$%%홍길동", "[0-9]{2}") # "12"
str_extract_all("absc1234#$%%홍길동", "[0-9]{2}") # "12" "34"

# 1) 반복 수 관련 정규표현식 : [] {n}
str <- "hongkildong35leed45유관순125###"
str_extract_all(str, "[a-z]{3}") # list 반환
str_extract_all(str, "[0-9]{2}") # list 반환
str_extract_all(str, "[가-힣]{3}") # "유관순"
str_extract_all(str, "[0-9]{2,}") # list 반환 - 숫자 2개이상 추출

# 2) 단어와 숫자 관련 정규표현식
# 단어 : \\w : word
# 숫자 : \\d : digit

# 주민번호 양식 검사
jumin <- "123456-1234567"
str_extract_all(jumin, "[0-9]{6}-[1,2,3,4][0-9]{6}")
str_extract_all(jumin, "\\d{6}-[1,2,3,4]\\d{6}") # 상동
jumin2 <- "123456-5234567"
str_extract_all(jumin2, "[0-9]{6}-[1,2,3,4][0-9]{6}") # 5라서 추출안댐

# email 양식 검사
email <- "kp1234@naver.com"
str_extract_all(email, "\\w{4,}@\\w{3,}.\\w{2,}")

# 3) 특정문자열을 제외하는 정규표현식
str <- "hongkildong35leed45유관순125###"
str_extract_all(str, "[^0-9]{2}")

# 4) 문자열 길이 구하기
length(str) # 1
str_length(str) # 28

# 5) 문자열 위치(index)
str_locate_all(str, "gk") # 4 5

# 6) 부분 문자열
str_sub(str, 10, 20) # 10번째 문자 ~ 20번째 문자

# 7) 문자열 교체
str_replace_all(str, "유관순", "유관순열사")

# 8) 문자열 분리
str2 <- "홍길동,이순신,유관순"
sp <- str_split(str2, ",")
sp2 <- unlist(sp)
sp2 # vector

# 9) 문자열 결합
paste(sp2, collapse = ",") # 기본함수

# 10) 특정 문자열 기준 양쪽 분리
jumin <- "123456-1234567"
str_split_fixed(jumin, "-", 2) # matrix 형태로 분리됨
# [, 1][, 2]
# [1,] "123456" "1234567"

