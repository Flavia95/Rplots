#Before run the script (len of reads from fasta):
#awk '/^>/{if (l!="") print l; print; l=0; next}{l+=length($0)}END{print l}' BXD001_len1M.fa |paste - - |cut -f 2 > BXD001_readlen.txt

library(tidyr)
library(dplyr)
library(ggplot2)
args = commandArgs(trailingOnly=TRUE)
input=as.numeric(args[1])

myd = read.csv(args[1], header=F)
h = ggplot(myd,aes(V1)) + geom_density() + xlim(1000000,3000000)+ #set xlim as you want
  theme(panel.background = element_rect(fill = '#FFFFFF')) +
  ggtitle("BXD002_len>1M") + xlab('len') + theme(plot.title = element_text(hjust = 0.5))

ggsave("./BXD002_len>1M.png", plot= h, device="png", width = 20, height = 15, units = "cm", dpi = 300)
