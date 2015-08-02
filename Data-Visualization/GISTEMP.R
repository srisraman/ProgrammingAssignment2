GIStempdata2  <- read.csv("ExcelFormattedGISTEMPData2CSV.csv")[ ,c(1:4)]
names(GIStempdata2)<- c("Year","Global","NHem","SHem")
str(GIStempdata2)
library(reshape2)
GISlong <- melt(GIStempdata2,id="Year")
summary(GISlong)
head(GISlong)
tail(GISlong)
library(ggplot2)
ggplot(GISlong,
       aes(x=Year,y=value, colour=variable))+
geom_line(size=1)+
ylim(c(-70,100))+
theme(legend.title=element_blank(),legend.text=element_text(size=16),legend.position="top")+
labs(x="Year",y="Deviation",title = "GISTEMP for Globe and Hemispheres")
dev.copy(png,file= "GISTEMP.png",width=600,height=500)
dev.off()



    
