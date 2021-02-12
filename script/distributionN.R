library(ggplot2)
library(argparse)
library(tidyverse)
args = commandArgs(trailingOnly=TRUE)
input=as.numeric(args[1])
  
myd = read.table(args[1], header=T)
p = myd %>% gather(count, value, values:N) %>% ggplot(aes(value, samples, fill = count)) + geom_bar(stat = "identity", width=0.50) + facet_wrap(.~ species) 
q = p + labs(x="Values") + theme(legend.title = element_blank()) + theme_bw()+  ylab("Chromosomes") + scale_fill_discrete(name = "Count", labels = c("N", "nucleotides"))

ggsave("./DistributionofN.png", plot= q, device="png", width = 20, height = 15, units = "cm", dpi = 300)
