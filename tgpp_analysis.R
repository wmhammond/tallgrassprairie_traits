
tgpp<-read.csv("./data/tgpp_ecophys.csv")
head(tgpp)
library(ggplot2)

tgpp$water.content<- (tgpp$fresh.mass-tgpp$dry.mass)/tgpp$fresh.mass

tgpp$SLA <- tgpp$area / tgpp$dry.mass

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
  ylab("")


ggplot(tgpp, aes(x=water.content, y=reorder(unit, -water.content), fill = unit)) + 
  geom_boxplot(color='black', fill = 'lightgrey', outlier.color="NA") + 
  geom_jitter(pch =21, size=2, alpha = 0.5, height=0.1,aes(fill=unit)) +
  theme_bw() +
  theme(legend.position=c(0.9, 0.8),
        legend.background=element_blank()) +
  xlab("Water content (g water/ g fresh sample mass)") +
  ylab("")


ggplot(subset(tgpp, species =="Lespedeza Cuneata"), aes(x=water.content, y=reorder(species, -water.content))) + 
  geom_boxplot(color='black', fill = 'lightgrey') + facet_wrap(~unit, ncol=1) 


ggplot(tgpp, aes(x=SLA, y=reorder(species, -SLA))) + 
  geom_boxplot(color='black', fill = 'lightgrey') 

ggplot(tgpp, aes(x=SLA, y=water.content)) +
  geom_point() + 
  facet_wrap(~species) +
  geom_smooth(method = 'lm')

