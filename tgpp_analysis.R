
tgpp<-read.csv("./data/tgpp_ecophys.csv")
head(tgpp)
library(ggplot2)

head(tgpp)
# need to calculate water content:
tgpp$water.content<- (tgpp$fresh.mass-tgpp$dry.mass)/tgpp$fresh.mass #units g/g
# need to calculate specific leaf area: 
tgpp$SLA <- tgpp$area / tgpp$dry.mass #units m2 / g


#first, some basic visualization
#histogram:
ggplot(tgpp, aes(x=water.content)) + 
  geom_histogram(color='black', fill='lightgrey') +
  theme_bw()

#boxplot of all data:
ggplot(tgpp, aes(x=water.content, y= unit)) + 
  geom_boxplot(color='black', fill='lightgrey') +
  theme_bw()


# water content plots
ggplot(tgpp, aes(x=water.content, y=reorder(unit, -water.content), fill = unit)) + 
  geom_boxplot(color='black', fill = 'lightgrey', outlier.color="NA") + 
  geom_jitter(pch =21, size=2, alpha = 0.5, height=0.1,aes(fill=unit)) +
  theme_bw() +
  theme(legend.position=c(0.9, 0.8),
        legend.background=element_blank()) +
  xlab("Water content (g water/ g fresh sample mass)") +
  ylab("")

ggplot(tgpp, aes(x=water.content, y=reorder(species, -water.content), fill = unit)) + 
  geom_boxplot(color='black', fill = 'lightgrey', outlier.color="NA") + 
  geom_jitter(pch =21, size=2, alpha = 0.5, height=0.1,aes(fill=unit)) +
  theme_bw() +
  theme(legend.position=c(0.9, 0.8),
        legend.background=element_blank()) +
  xlab("Water content (g water/ g fresh sample mass)") +
  ylab("") +
  geom_hline(yintercept=c(7.5,8.5), color = 'red')

ggplot(subset(tgpp, species=="Lespedeza cuneata"), aes(x=water.content, y=reorder(unit, -water.content), fill = unit)) + 
  geom_boxplot(color='black', outlier.color="NA") + 
  geom_jitter(pch =21, size=2, alpha = 0.5, height=0.1,aes(fill=unit)) +
  theme_bw() +
  theme(legend.position=c(0.9, 0.8),
        legend.background=element_blank()) +
  xlab("Water content (g water/ g fresh sample mass)") +
  ylab("") +
  geom_hline(yintercept=c(7.5,8.5), color = 'red') +
  ggtitle("Lespedeza cuneata")



ggplot(subset(tgpp, species =="Lespedeza cuneata"), aes(x=water.content, y=reorder(species, water.content), fill = unit)) + 
  geom_boxplot() +
  theme_bw() +
  geom_hline(yintercept=c(.5,1.5,2.5,3.5,4.5,5.5,6.5,7.5,8.5,9.5,10.5,11.5,12.5, 13.5, 14.5, 15.5, 16.5),
             color = 'black', linetype = 'dashed')


# SLA Plots
ggplot(tgpp, aes(x=SLA, y=reorder(species, -SLA), fill = unit)) + 
  geom_boxplot(color='black', fill = 'lightgrey', outlier.color="NA") + 
  geom_jitter(pch =21, size=2, alpha = 0.5, height=0.1,aes(fill=unit)) +
  theme_bw() +
  theme(legend.position=c(0.9, 0.8),
        legend.background=element_blank()) +
  xlab("Specific Leaf Area (m^2/g)") +
  ylab("") +
  geom_hline(yintercept=c(7.5,8.5), color = 'red')

ggplot(subset(tgpp, species=="Lespedeza cuneata"), aes(x=SLA, y=reorder(unit, -SLA), fill = unit)) + 
  geom_boxplot(color='black', fill = 'lightgrey', outlier.color="NA") + 
  geom_jitter(pch =21, size=2, alpha = 0.5, height=0.1,aes(fill=unit)) +
  theme_bw() +
  theme(legend.position=c(0.9, 0.8),
        legend.background=element_blank()) +
  xlab("Specific Leaf Area (m^2/g)") +
  ylab("") +
  geom_hline(yintercept=c(7.5,8.5), color = 'red')


