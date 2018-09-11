
install.packages('reshape2')

library(reshape2)




# SQL을 이용하여 데이터 받아 오는 부분 
################################################################################################################
library(RODBC) # SQL 연결 패키지
odbcCloseAll() # 모든 연결 종료
con <- odbcConnect('EX_DATA', 'EXAdmin', 'exData!1')

# 사건별 중복 제거 쿼리 (PK1 : AREA_HQ_ID , PK2 : OCCUR_DTMC)
strquery <- paste("SELECT LEFT(ST_YMDHM, 8) as ST_YMD,[VDS_ID],[LANE_NO],[VOL],[SPD],[OCC]",
	"FROM [EX_DATA].[dbo].[TPS_VDSLANE15MIN] WHERE (ST_YMDHM like '201808__22__' OR ST_YMDHM like '201808__23__') AND LANE_NO = 2 ",
	"AND VDS_ID IN ('0010VDE30500','0010VDE30600','0010VDE30650','0010VDE30700','0010VDE30800',",
	"'0010VDE30900','0010VDE31000','0010VDS30500','0010VDS30600','0010VDS30650','0010VDS30700','0010VDS30800','0010VDS30900','0010VDS31000') AND SPD<>-1 AND SPD > 30 ORDER BY ST_YMDHM")

strquery <- paste("select [VDS_ID],[LANE_NO],[VOL],[SPD],[OCC] ",
    "FROM [EX_DATA].[dbo].[TPS_VDSLANE15MIN] WHERE (ST_YMDHM like '201808%') AND LANE_NO = 2 ",
    "AND VDS_ID LIKE ('0010%') ",
    "AND SPD<>-1 AND SPD > 20 ORDER BY ST_YMDHM")

strquery <- paste("SELECT LEFT(occur_dtmc, 8) as ST_YMD",
    "FROM [EX_DATA].[dbo].[OPM_TRAFINFO_LOG] GROUP BY OCCUR_DTMC WHERE INC_TP_CD =")


main_df <- sqlQuery(con, strquery)

odbcClose(con) # 연결 종료
odbcCloseAll() # 모든 연결 종료
################################################################################################################

raindata <- read.table(file = "Rain.txt", header = T, sep = "\t")

head(raindata)
tapply(raindata$SPD, raindata$ST_YMD, mean)
tapply(main_df$SPD, main_df$ST_YMD, mean)

library(plyr)
y <- ddply(main_df, .(ST_YMD), summarise, avg = mean(SPD), std.dev = sd(SPD), max = max(SPD), min = min(SPD))
y

