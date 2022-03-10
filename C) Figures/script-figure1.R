### This is the R script used to create Figure 1: the graphical representation of temporal trends in Antarctic fur seal abundance and baleen whale harvesting.

library(readxl); library(ggplot2); library(magick); library(cowplot)

est <- read_excel("C:\\Users\\rchen2\\Dropbox\\Fur seal demographics\\SealingWhalingRecords.xlsx", range = "A1:F114") 

coef <- 100
plot <- ggplot(est, aes(x = Year)) + 
  scale_color_manual(values=c("#7570b3", "#d95f02"))+
  geom_point(aes(y = N), col = "#7570b3", shape = 19) +
  theme_classic() +
  stat_smooth(aes(y = N),
              geom = 'area', method = NULL, span = 0.6,
              alpha = 1/2, fill = "#7570b3")+
  geom_col(aes(y = Hunted*coef),
           alpha = 1/2, fill = "#d95f02", width = 1)+
  scale_y_continuous(name = "Estimated Seal Population Size", 
                     breaks = c(0, 1000000, 2000000, 3000000, 4000000, 5000000),
                     labels = c("0", "1M", "2M", "3M", "4M", "5M"),
                     sec.axis = sec_axis(~./coef, 
                                         name = "Estimated Hunted Whales",
                                         breaks = c(0, 10000, 20000, 30000, 40000, 50000),
                                         labels = c("0", "10K", "20K", "30K", "40K", "50K")),)+
  scale_x_continuous(name = "Year",
                     breaks = c(1775, 1800, 1825, 1850, 1875, 1900, 1925,1950, 1975, 2000)) +
  labs(title = "A) Seal population size and whaling numbers over time") +
  theme(axis.title.y.left = element_text(margin = margin(0, 60, 0, 60), size = 16),
        axis.title.y.right = element_text(margin = margin(0, 60, 0, 60), size = 16),
        axis.title.x = element_text(size = 16),
        axis.text.y.left = element_text(size = 12),
        axis.text.y.right = element_text(size = 12),
        axis.text.x = element_text(size = 12),
        title = element_text(size = 16),
        text = element_text(family = "serif")) +
  theme_cowplot() +
  geom_curve(aes(x =1825, y = 3200000, xend = 1825, yend = 1800000), colour = "#BAB7D9",
             arrow = arrow(length = unit(0.03, "npc")), size = 1.3, curvature = -0.2)+
  geom_curve(aes(x =1885, y = 4000000, xend = 1910, yend = 1800000), colour = "#ECAF80",
             arrow = arrow(length = unit(0.03, "npc")), size = 1.3, curvature = 0.2)



