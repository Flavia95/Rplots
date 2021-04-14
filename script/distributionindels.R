library(tidyverse)
library(argparse)
args = commandArgs(trailingOnly=TRUE)
input=as.numeric(args[1])

myd = read.delim(args[1], sep="\t", header=T)
h <- ggplot(subset(myd, length!=0) , aes(length) )+geom_histogram(binwidth=1)  +xlim(-200, 200) + theme_classic()
ggsave("./distributionofindels.png", plot= h, device="png", width = 20, height = 15, units = "cm", dpi = 300)
