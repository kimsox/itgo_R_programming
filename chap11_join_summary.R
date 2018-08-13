
# chap11_join_summary

# plyr ��Űġ ��ġ
install.packages('plyr')
library(plyr)

# ������ ������������ �� �����
x = data.frame(ID = c(1, 2, 3, 4, 5), height = c(160, 171, 173, 162, 165))
y = data.frame(ID = c(5, 4, 1, 3, 2), weight = c(55, 73, 60, 57, 80))
x
y
# 1. join() : plyr ��Ű�� ���� �Լ�
z <- join(x, y, by = "ID") # ID�÷����� ����
z

x = data.frame(ID = c(1, 2, 3, 4, 6), height = c(160, 171, 173, 162, 180))
y = data.frame(ID = c(5, 4, 1, 3, 2), weight = c(55, 73, 60, 57, 80))

# 1) left ����
z <- join(x, y, by = "ID") # ID�÷����� ����
z

# 2) inner ����
z <- join(x, y, by = 'ID', type = 'inner')
z

# 3) full ����
z <- join(x, y, by = 'ID', type = 'full')
z

# 4) key ������ �����ϱ�
x = data.frame(key1 = c(1, 1, 2, 2, 3), key2 = c('a', 'b', 'c', 'd', 'e'),
               val1 = c(10, 20, 30, 40, 50))
y = data.frame(key1 = c(3, 2, 2, 1, 1), key2 = c('e', 'd', 'c', 'b', 'a'),
               val2 = c(500, 400, 300, 200, 100))

df <- join(x, y, by = c('key1', 'key2'))
df

# 2. tapply : �����Լ� �⺻����
names(iris)
# ����) tapply(vector, ���ܺ���, Func)
tapply(iris$Sepal.Length, iris$Species, mean)
# setosa versicolor virginica
# 5.006 5.936 6.588
table(iris$Species) # ���ڵ� ����
# setosa versicolor virginica
# 50 50 50

# 3. ddply() : plyr ��Ű�� ����
# ����) ddply(dataframe, .(���ܺ���), �������, ������=�Լ�(����))

# ���� ������(Species)�� �ɹ�ħ����(Sepal.Length)�� ��� ���
dp <- ddply(iris, .(Species), summarise,
            avg = mean(Sepal.Length),
            tot = sum(Sepal.Length),
            var = var(Sepal.Length),
            sd = sd(Sepal.Length)
            )
dp

# plyr ��Ű�� ���� data set
data(baseball)
str(baseball) # 'data.frame':	21699 obs. of  22 variables:
#$ id   : chr  "ansonca01" -> ���� id
#$ year : int  1871 1871 1871 -> Ȱ�� �⵵ 
#$ team : chr  "RC1" "WS3" "FW1" "NY2" ... -> Ȱ�� ���� 
#$ lg   : chr  "" "" "" "" ... -> ���׸�
#$ g    : int  25 32 19 33 29 29 29 46 37 25 -> ���Ӽ�  
#$ ab   : int  120 162 89 161 128 146 145 217 174 130 -> ���ü� 
#$ r    : int  29 45 15 35 35 40 36 60 26 40 ... -> ����� 
#$ hr   : int  0 0 0 1 3 1 2 0 0 0 ... -> Ȩ���� 

head(baseball)
tail(baseball)
length(baseball$team)

# ������ subset �ۼ� 
benitar01 <- subset(baseball, id == 'benitar01')
benitar01
length(benitar01$id) # 17�� 

# Ȱ���⵵
min(benitar01$year) # 1994
max(benitar01$year) # 2007

# ��ü ������ �� Ȯ��
length(baseball$id) # 21699
length(unique(baseball$id)) # 1228

min(baseball$year) # 1871
max(baseball$year) # 2007

# id�� �������� �� ������ ���� �⵵(start_year) : min() ���� ���ϱ� 
head(ddply(baseball, .(id), summarise, start_year = min(year)))

# id�� �������� ���۳⵵(start_year), ������ �⵵(end_year)
head(ddply(baseball, .(id), summarise, start_year = min(year),
           end_year = max(year)))

# id ���� ���۳⵵, ����⵵, Ȱ���⵵
head(ddply(baseball, .(id), summarise, start_year = min(year),
           end_year = max(year), cyear = end_year - start_year + 1))

# id, team ���� ���۳⵵, ����⵵, Ȱ���⵵
head(ddply(baseball, .(id, team), summarise, start_year = min(year),
           end_year = max(year), cyear = end_year - start_year + 1))