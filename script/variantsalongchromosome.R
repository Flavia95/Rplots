library(tidyverse)
library(argparse)
args = commandArgs(trailingOnly=TRUE)
input=as.numeric(args[1])

myd = read.delim(args[1], sep="\t", header=F)
colnames(myd) = c("chrom", "pos", "variants")

p <- myd %>% select(pos, variants) %>%drop_na() %>% ggplot(mapping = aes(x = pos, fill = variants))
    
h <- p + geom_histogram(binwidth=1e6, position = "dodge") + theme_classic() + labs(title = "Distribution of Variants")+ theme(plot.title = element_text(hjust = 0.5))

ggsave("./distributionofvariants.png", plot= h, device="png", width = 20, height = 15, units = "cm", dpi = 300)
