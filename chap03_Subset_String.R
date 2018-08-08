
# chap03_Subset_String

# 1. ¼­ºê¼Â ¸¸µé±â : subset(DF, Á¶°Ç½Ä)
x <- 1:5
y <- 6:10
z <- letters[1:5] # letters : ¼Ò¹®ÀÚ vector ÀÌ´Ù??!

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
df2 <- subset(df, z %in% c("a", "c", "e", "k")) # k´Â ¾øÀ½
df2

# 2. º´ÇÕ(merge)
height <- data.frame(id = c(1:2), h = c(180, 175))
weight <- data.frame(id = c(1:2), w = c(80, 75))
height;
weight;

user <- merge(height, weight, by.x = "id", by.y = "id")
user

# 3. ¹®ÀÚ¿­ Ã³¸® ÇÔ¼ö¿Í Á¤±ÔÇ¥Çö½Ä
# - stringr ÆÐÅ°Áö¿¡¼­ Á¦°øÇÏ´Â ÇÔ¼ö ÀÌ¿ë ¹®ÀÚ¿­ Ã³¸®
install.packages("stringr")
library(stringr)

# Çü½Ä) str_extract('¹®ÀÚ¿­', 'Á¤±ÔÇ¥Çö½Ä')
str_extract("absc1234#$%%È«±æµ¿", "[0-9]{2}") # "12"
str_extract_all("absc1234#$%%È«±æµ¿", "[0-9]{2}") # "12" "34"

# 1) ¹Ýº¹ ¼ö °ü·Ã Á¤±ÔÇ¥Çö½Ä : [] {n}
str <- "hongkildong35leed45À¯°ü¼ø125###"
str_extract_all(str, "[a-z]{3}") # list ¹ÝÈ¯
str_extract_all(str, "[0-9]{2}") # list ¹ÝÈ¯
str_extract_all(str, "[°¡-ÆR]{3}") # "À¯°ü¼ø"
str_extract_all(str, "[0-9]{2,}") # list ¹ÝÈ¯ - ¼ýÀÚ 2°³ÀÌ»ó ÃßÃâ

# 2) ´Ü¾î¿Í ¼ýÀÚ °ü·Ã Á¤±ÔÇ¥Çö½Ä
# ´Ü¾î : \\w : word
# ¼ýÀÚ : \\d : digit

# ÁÖ¹Î¹øÈ£ ¾ç½Ä °Ë»ç
jumin <- "123456-1234567"
str_extract_all(jumin, "[0-9]{6}-[1,2,3,4][0-9]{6}")
str_extract_all(jumin, "\\d{6}-[1,2,3,4]\\d{6}") # »óµ¿
jumin2 <- "123456-5234567"
str_extract_all(jumin2, "[0-9]{6}-[1,2,3,4][0-9]{6}") # 5¶ó¼­ ÃßÃâ¾È´ï

# email ¾ç½Ä °Ë»ç
email <- "kp1234@naver.com"
str_extract_all(email, "\\w{4,}@\\w{3,}.\\w{2,}")

# 3) Æ¯Á¤¹®ÀÚ¿­À» Á¦¿ÜÇÏ´Â Á¤±ÔÇ¥Çö½Ä
str <- "hongkildong35leed45À¯°ü¼ø125###"
str_extract_all(str, "[^0-9]{2}")

# 4) ¹®ÀÚ¿­ ±æÀÌ ±¸ÇÏ±â
length(str) # 1
str_length(str) # 28

# 5) ¹®ÀÚ¿­ À§Ä¡(index)
str_locate_all(str, "gk") # 4 5

# 6) ºÎºÐ ¹®ÀÚ¿­
str_sub(str, 10, 20) # 10¹øÂ° ¹®ÀÚ ~ 20¹øÂ° ¹®ÀÚ

# 7) ¹®ÀÚ¿­ ±³Ã¼
str_replace_all(str, "À¯°ü¼ø", "À¯°ü¼ø¿­»ç")

# 8) ¹®ÀÚ¿­ ºÐ¸®
str2 <- "È«±æµ¿,ÀÌ¼ø½Å,À¯°ü¼ø"
sp <- str_split(str2, ",")
sp2 <- unlist(sp)
sp2 # vector

# 9) ¹®ÀÚ¿­ °áÇÕ
paste(sp2, collapse = ",") # ±âº»ÇÔ¼ö

# 10) Æ¯Á¤ ¹®ÀÚ¿­ ±âÁØ ¾çÂÊ ºÐ¸®
jumin <- "123456-1234567"
str_split_fixed(jumin, "-", 2) # matrix ÇüÅÂ·Î ºÐ¸®µÊ
# [, 1][, 2]
# [1,] "123456" "1234567"

