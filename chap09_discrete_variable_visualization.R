
# chap09_ discrete_variable_visualizawtion

# 1. ������Ʈ �ð�ȭ

# (1) ���� ���� ��Ʈ 

# �̻꺯�� �ڷ� ����
chart_data <- c(305, 450, 320, 460, 330, 480, 380, 520)
names(chart_data) <- c("2016 1�б�", "2017 1�б�", "2016 2�б�", "2017 2�б�", "2016 3�б�", "2017 3�б�", "2016 4�б�", "2017 4�б�")
chart_data

# ���� ���� ��Ʈ : �⺻ �Ӽ�
barplot(chart_data, ylim = c(0, 600),
        col = rainbow(8), main = "2016�⵵ vs 2017�⵵ �б⺰ ������Ȳ ��")

# (2) ���� ���� ��Ʈ
barplot(chart_data, xlim = c(0, 600), horiz = TRUE,
        col = rainbow(8), main = "2016�⵵ vs 2017�⵵ �б⺰ ������Ȳ ��")

# red�� blue ���� 4ȸ �ݺ�
barplot(chart_data, xlim = c(0, 600), horiz = TRUE,
        xlab = "�����(����:����)", ylab = "�⵵�� �б���Ȳ",
        space = 2, cex.names = 0.8, col = rep(c(2, 3, 4), 1))
# 1 : ����, 2: ����, 3: �ʷ�, 4: �Ķ�, 5: �ϴû�, 6: ���ֻ�, 7 : �����

VADeaths
str(VADeaths) # structure ��ü ���� �˷���
rnames <- row.names(VADeaths)
par(mfrow = c(1, 2)) # 1�� 2�� �׷��� ���� (�� �������� ���� �ʹٰ�~~~)

# beside = T : ���� ������Ʈ
barplot(VADeaths, beside = T, col = rainbow(5),
        main = "�̱� �����Ͼ��� �������� �������")
# ���� �߰�
legend(19, 71, c("50-54", "55-59", "60-64", "65-69", "70-74"), cex = 0.8, fill = rainbow(5))

# beside = F : ���� ������Ʈ
barplot(VADeaths, beside = F, col = rainbow(5))
title(main = "�̱� �����Ͼ��� �������� �������", font.main = 4)
legend(3.8, 200, c("50-54", "55-59", "60-64", "65-69", "70-74"), cex = 0.8, fill = rainbow(5))


# 2. �� ��Ʈ �ð�ȭ
par(mfrow = c(1, 1))

? dotchart
dotchart(chart_data, color = c("green", "red"), lcolor = "black",
         pch = 1:2, labels = names(chart_data), xlab = "�����",
         main = "�б⺰ �Ǹ���Ȳ �� ��Ʈ �ð�ȭ", cex = 1.2)

# 3. ���� ��Ʈ �ð�ȭ
pie(chart_data, labels = names(chart_data),
    border = 'blue', col = rainbow(8), cex = 1.2)
title("2016~2017�⵵ �б⺰ ������Ȳ")