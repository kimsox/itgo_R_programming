install.packages('RODBC')
install.packages('ggplot2')
install.packages("RColorBrewer") {
    library(RColorBrewer) # �÷� ��Ű��
    display.brewer.all()
}
# palette �Լ� 
palette()
brewer.pal(n = 12, name = "Set3")
palette(brewer.pal(n = 12, name = "Set3"))
myColor <- c(275128, 275262)
myColor <- sprintf("#%06X", myColor)
palette(myColor)


# ����~~~~~~~
library(RODBC) # SQL ���� ��Ű��
odbcCloseAll() # ��� ���� ����
con <- odbcConnect('EX_DATA', 'EXAdmin', 'exData!1')

# ��Ǻ� �ߺ� ���� ���� (PK1 : AREA_HQ_ID , PK2 : OCCUR_DTMC)
strquery <- paste("select tb1.* from OPM_TRAFINFO_LOG as tb1",
    "inner join (select area_hq_id, occur_dtmc, max(date_st) as max_datest",
    "from OPM_TRAFINFO_LOG group by area_hq_id, occur_dtmc ) as Sub",
    "on tb1.date_st = Sub.max_datest and tb1.occur_dtmc = Sub.occur_dtmc and tb1.area_hq_id = Sub.area_hq_id",
    "order by occur_dtmc")

main_df <- sqlQuery(con, strquery)

odbcClose(con) # ���� ����
odbcCloseAll() # ��� ���� ����

names(main_df) # �÷��� ��ü ����
str(main_df) # ��Ʈ���� ���� ����
head(main_df) # ���� �ο�(���ڵ�) ����
length(main_df) # �÷� ����
table(main_df$ROUTE_NO) # �뼱�� �󵵼�
dim(main_df)

# 1. �Ϲ� ���
dataAll <- subset(main_df)

# �������� ���� ���� (����-���ΰ��� ��Ű���� 0���� ����, R ���α׷����� index�� 1���� ����)
incident_name <- c("���", "����", "��ֹ�", "�۾�", "��������/��ü", "ȭ��", "����", "����", "�����", "�Ȱ�", "���蹰������", "����", "�����", "ȫ��", "��ǳ", "�̺�Ʈ/ȫ��", "������", "���", "����", "��ǳ", "��º�", "������", "�ͳγ�������")

# barplot �׸��� (dataAll�� �ش�)
dataAll_inci <- table(dataAll$INC_TP_CD)
dataAll_inci_name <- character()
cnt <- 0
for (i in as.numeric(names(dataAll_inci))) {
    cnt <- cnt + 1
    dataAll_inci_name[cnt] <- incident_name[i + 1]
}

par(mfrow = c(1, 2))
par(mar = c(5, 5, 5, 1))
dataAll_inci_bar <- barplot(dataAll_inci, col = rainbow(10), ylim = c(0, max(dataAll_inci) + 500), names.arg = dataAll_inci_name, las = 2,)
text(dataAll_inci_bar, dataAll_inci + max(dataAll_inci) / 80, paste(dataAll_inci))
title("�������� �����ڵ� �� ���", outer = TRUE)
# pie
dataAll_inci_percent <- as.character(round(prop.table(dataAll_inci), 4) * 100)
dataAll_inci_percent <- paste(dataAll_inci_percent, "%", sep = "")
dataAll_inci_pie <- pie(dataAll_inci, col = rainbow(10), label = dataAll_inci_percent)


# 2. �ð��� clock plot �׸��� (�Լ� ���� ����Ʈ : http://www.r-graph-gallery.com/49-clock-plot)

# Clock plot function
clock.plot <- function(x, col = rainbow(n, alpha = 0.6), ...) {
    par(mar = c(1, 1, 1, 1))
    #par(pin = c(5, 5))
    raw <- x
    if (min(x) < 0) x <- x - min(x)
    if (max(x) > 1) x <- x / max(x)
    n <- length(x)
    if (is.null(names(x))) names(x) <- 0:(n - 1)
    #if (is.null(names(x))) names(x) <- sprintf("%02d��", 0:(n - 1))
    m <- 1.05
    plot(0, type = 'n', xlim = c(-m, m), ylim = c(-m, m), axes = F, xlab = '', ylab = '', ...)
    a <- pi / 2 - 2 * pi / 200 * 0:200
    polygon(cos(a), sin(a))
    v <- .02
    a <- pi / 2 - 2 * pi / n * 0:n
    segments((1 + v) * cos(a), (1 + v) * sin(a), (1 - v) * cos(a), (1 - v) * sin(a))
    segments(cos(a), sin(a), 0, 0, col = 'light grey', lty = 3)
    ca <- -2 * pi / n * (0:50) / 50
    for (i in 1:n) {
        a <- pi / 2 - 2 * pi / n * (i - 1)
        b <- pi / 2 - 2 * pi / n * i
        polygon(c(0, x[i] * cos(a + ca), 0), c(0, x[i] * sin(a + ca), 0), col = col[i])
        v <- .1
        text((1 + v) * cos(a), (1 + v) * sin(a), names(x)[i])
        text((1 + v - 0.2) * cos(a - 2 * pi / 48), (1 + v - 0.2) * sin(a - 2 * pi / 48), raw[i], font = 2)
    }
}

#main_df$OCCUR_DTMC
par(mfrow = c(1, 1))
# ��ü �������� �ð��� ���
occurHour <- sprintf("%02d", ((main_df$OCCUR_DTMC - main_df$OCCUR_DTMC %% 10000) / 10000) %% 100)
clock.plot(table(occurHour))
scan()

# �������� ���� �� �ð��� ���
par(mfrow = c(2, 4))
table(main_df$INC_TP_CD)
for (i in names(table(main_df$INC_TP_CD))) {
    hourCnt <- numeric(24)
    roadWork <- subset(main_df, INC_TP_CD == i)
    occurHour <- ((roadWork$OCCUR_DTMC - roadWork$OCCUR_DTMC %% 10000) / 10000) %% 100
    for (j in occurHour) {
        hourCnt[j + 1] <- hourCnt[j + 1] + 1
    }
    clock.plot(hourCnt)
    scan()
}


# 3. ���� �� ���캸��
# ��ΰ��ӵ��� �� subset���� ��������
# ��ü���� ������
str(main_df)
type <- 2
nRoadNo <- 10
ylimNo <- ifelse(nRoadNo == 10, 450, 250)
if (type == 1) {
    data0500 <- subset(main_df, ROUTE_NO == nRoadNo & INC_TP_CD == 3)
} else if (type == 2) {
    data0500 <- subset(main_df, ROUTE_NO == nRoadNo & INC_TP_CD == c(0:2))
}

data0500$OCCUR_DTMC <- ((data0500$OCCUR_DTMC - data0500$OCCUR_DTMC %% 10000) / 10000) %% 100 +
    (((data0500$OCCUR_DTMC %% 10000) - (data0500$OCCUR_DTMC %% 100)) / 100 * 60 + (data0500$OCCUR_DTMC %% 100)) / 3600

if (type == 1) {
    data0500E <- subset(data0500, UPDOWN_DIV == 'E')
    data0500S <- subset(data0500, UPDOWN_DIV == 'S')
} else if (type == 2) {
    data0500D0 <- subset(data0500, INC_TP_CD == 0)
    data0500D1 <- subset(data0500, INC_TP_CD == 1)
    data0500D2 <- subset(data0500, INC_TP_CD == 2)
}

#str(data0500)
#head(data0500)
par(mfrow = c(1, 1))
par(mar = c(5, 5, 4, 1))
if (type == 1) {
    plot(data0500E$OCCUR_DTMC, data0500E$OCCURE_MILEPOST, col = "Red", xlim = c(0, 24), ylim = c(0, ylimNo), lwd = 2,
         xlab = "Time", ylab = "Milestone")
    points(data0500S$OCCUR_DTMC, data0500S$OCCURE_MILEPOST, col = "Blue", lwd = 2)
} else if (type == 2) {
    plot(data0500D0$OCCUR_DTMC, data0500D0$OCCURE_MILEPOST, col = "Red", xlim = c(0, 24), ylim = c(0, ylimNo), lwd = 2,
     xlab = "Time", ylab = "Milestone")
    points(data0500D1$OCCUR_DTMC, data0500D1$OCCURE_MILEPOST, col = "Blue", lwd = 2)
    points(data0500D2$OCCUR_DTMC, data0500D2$OCCURE_MILEPOST, col = "darkorange", lwd = 2)
}

abline(h = seq(0, ylimNo, 25), col = "Grey", lty = 3)
abline(v = seq(0, 24, 1), col = "Grey", lty = 3)
if (type == 1) {
    legend(4, ylimNo, c("E", "S"), pch = c(1, 1), col = c("Red", "Blue"))
} else if (type == 2) {
    legend(4, ylimNo, c("���", "����", "��ֹ�"), pch = c(1, 1), col = c("Red", "Blue", "darkorange"))
}

title(main = "���߻�Ȳ", outer = F)

setwd("D:/Study/itgo_R_programming/EXData_Practice/")
mile0050 <- read.csv(file = sprintf("%04d.csv", nRoadNo), header = F)

text(1, mile0050$V2, mile0050$V1, col = "Dark Green", cex = 0.8)

# ��� ������׷� �׸���
# ����� ������� (��ΰ��ӵ���) 
accident0010 <- subset(main_df, ROUTE_NO == 10 & INC_TP_CD == 0, select = c(OCCURE_MILEPOST))
accidentHist <- accident0010
# ����� ������� (�������ӵ���) 
accident0500 <- subset(main_df, ROUTE_NO == 500 & INC_TP_CD == 0, select = c(OCCURE_MILEPOST))
accidentHist <- accident0500

head(accidentHist)
mode(accidentHist)
#hist(accidentHist$OCCURE_MILEPOST, breaks = 50, xlim = c(0, 450))
#abline(v = seq(0, 500, 5), col = "Grey", lty = 3)
library(ggplot2)
ggplot(accidentHist, aes(x = accidentHist$OCCURE_MILEPOST)) +
    geom_histogram(binwidth = 1, color = "white", fill = rgb(0.2, 0.7, 0.1, 0.4))
#fh <- cut(accidentHist$OCCURE_MILEPOST, breaks = 100)

subMile <- subset(accidentHist, accidentHist$OCCURE_MILEPOST > 372 & accidentHist$OCCURE_MILEPOST < 377)

mt <- subMile[order(subMile$OCCURE_MILEPOST),]
mt