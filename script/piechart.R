library(ggplot2)
library(scales)
args = commandArgs(trailingOnly=TRUE)
input=as.numeric(args[1]) 
 

myd = read.delim(args[1],  sep="\t", header = T)
df = data.frame(myd)

c = ggplot(df, aes (x="", y = Count, fill = factor(Type))) + 
geom_col(position = 'stack', width = 1) +
geom_text(aes(label = paste(round(Count / sum(Count) * 100, 1), "%"), x = 1.3), position = position_stack(vjust = 0.6), size = 2.5 , fontface="bold") + theme_classic() + theme(plot.title = element_text(hjust=0.7), axis.line = element_blank(), axis.text = element_blank(), axis.ticks = element_blank()) + labs(fill = "Type", x = NULL, y = NULL, title = "Variants distribution on pangenome of 39 strains after smoothxg") + coord_polar("y")
ggsave("./distributiononpangenomeof39strainsaftersmoothxg.png", plot= c, device="png", width = 20, height = 15, units = "cm", dpi = 300)
