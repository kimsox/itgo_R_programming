

# SQL을 이용하여 데이터 받아 오는 부분 
################################################################################################################
library(RODBC) # SQL 연결 패키지
odbcCloseAll() # 모든 연결 종료
con <- odbcConnect('EX_DATA', 'EXAdmin', 'exData!1')

# 사건별 중복 제거 쿼리 (PK1 : AREA_HQ_ID , PK2 : OCCUR_DTMC)
strquery <- paste("select tb1.* from OPM_TRAFINFO_LOG as tb1",
    "inner join (select area_hq_id, occur_dtmc, max(date_st) as max_datest",
    "from OPM_TRAFINFO_LOG group by area_hq_id, occur_dtmc ) as Sub",
    "on tb1.date_st = Sub.max_datest and tb1.occur_dtmc = Sub.occur_dtmc and tb1.area_hq_id = Sub.area_hq_id",
    "order by occur_dtmc")

main_df <- sqlQuery(con, strquery)

odbcClose(con) # 연결 종료
odbcCloseAll() # 모든 연결 종료
################################################################################################################