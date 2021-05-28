
# DESeq is a differential expression analyses of RNA-seq data
# The DESeq algorithm applies the negative binomial distribution and a Likelihood Ratio Test (LRT), 
# it normalizes data by trimmed mean of M-values and circumvents a small sample size 
# by incorporating information from all genes in a set of samples.
# Example dataset:
# dir <- system.file("extdata", package="pasilla",mustWork=TRUE)


# My files from HTSeq count - 3 untreated (BHI medium) and 3 treated (Human serum) samples.
# 3126 transcript units



#Packages needed:
#if (!requireNamespace("BiocManager", quietly = TRUE)) install.packages("BiocManager")
#BiocManager::install("DESeq2")
#library("DESeq2")
#Install apeglm - approximate posterior estimation for GLM coefficients
#BiocManager::install("apeglm")
#For example dataset:
#BiocManager::install("pasilla")

#How to use:
# http://bioconductor.org/packages/devel/bioc/vignettes/DESeq2/inst/doc/DESeq2.html#htseq-count-input
#Anna: "Some tip for deseq: you could make sample files and condition variables from a vector format 
#using the c('somefile', 'somefile' ...) instead of grep for example and c('condition_1', 'condition_2' ...) instead of sub"

#Directory of HTSeq count files:
directory <- "/Users/heidiottesen/OneDrive - Uppsala universitet/Office/Plugg/1 MSc Bioinformatics UU/1MB462 Genome Analysis/Project/2_HTSeq/singles"
#dirAnna <- "/Users/heidiottesen/OneDrive - Uppsala universitet/Office/Plugg/1 MSc Bioinformatics UU/1MB462 Genome Analysis/Project/2_HTSeq/singles/old_names"

#(Make sure the condition, treated/untreated, is specified in the file-name)

#Specifying which files and what conditions to use:
#sampleFiles <- grep("treated",list.files(directory),value=TRUE)
#sampleCondition <- sub("(.*treated).*","\\1",sampleFiles)

#Anna's way:
sFilesAnna <- c('treated1.txt', 'treated2.txt', 'treated3.txt', 'untreated1.txt', 'untreated2.txt', 'untreated3.txt')
sCondAnna <- c('treated', 'treated', 'treated', 'untreated', 'untreated', 'untreated')

#Create Table with appropriate names and headers
sampleTable <- data.frame(sampleName = sFilesAnna,fileName = sFilesAnna,condition = sCondAnna)
#sampleTable <- data.frame(sampleName = sampleFiles,fileName = sampleFiles,condition = sampleCondition)


#Encode conditions as factors - factor 1 and factor 2 = 2 levels
sampleTable$condition <- factor(sampleTable$condition)


#Create Dataset with all CDS from HTS count files:
library("DESeq2")
ddsHTSeq <- DESeqDataSetFromHTSeqCount(sampleTable = sampleTable,directory = directory,design= ~ condition)
ddsHTSeq

#Run DESeq:
dds <- DESeq(ddsHTSeq)

#Show results as log2 fold change and Wald test p value:
res <- results(dds)
res

#different representation table - log fold shrinkage
res <- results(dds, name="condition_untreated_vs_treated")
res <- results(dds, contrast=c("condition","treated","untreated"))

res 

resultsNames(dds)
resLFC <- lfcShrink(dds, coef="condition_untreated_vs_treated", type="apeglm")
resLFC


plotMA(res, ylim=c(-10,10))
plotMA(resLFC, ylim=c(-10,10))

summary(res)

#out of 3031 with nonzero total read count
#adjusted p-value < 0.1
#LFC > 0 (up)       : 1216, 40%
#LFC < 0 (down)     : 1212, 40%
#outliers [1]       : 0, 0%
#low counts [2]     : 0, 0%
#(mean count < 0)

library("DESeq2")
library("dplyr")
# Remove false discovery, Keep only truly significant
res1 = as.data.frame(res)
res1 = mutate(res1, sig=ifelse(res1$padj<0.1, "FDR<0.1","not sig")) 

res1[which(abs(res1$log2FoldChange)<1.0),"sig"] = "not sig"

library(ggplot2)
ggplot(res1, aes(log2FoldChange, -log(padj))) + geom_point(aes(col=sig)) + scale_color_manual(values=c("red", "black"))


res = res[order(abs(res$log2FoldChange), decreasing = TRUE),]
res
#Top 10 Genes:
#   [1] "FKFLPFNF_01449" "FKFLPFNF_01450" "FKFLPFNF_01448" "FKFLPFNF_01451" "FKFLPFNF_01452"
#   [6] "FKFLPFNF_01453" "FKFLPFNF_01455" "FKFLPFNF_01456" "FKFLPFNF_01454" "FKFLPFNF_01510"
topgene = rownames(res)[1:10]
topgene
plotCounts(dds, gene = topgene, intgroup = c("53", "treatment"))
