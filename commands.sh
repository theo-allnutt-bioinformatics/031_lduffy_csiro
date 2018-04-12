#!/bin/bash

#Quality trim and adaptor clip
trimmo.py 'cat/*.gz' 8 ~/db/adaptors.fa p y

#map to ribosomal rRNA to filter 
bbmap_general.py 'clip/*.fastq' ribosomal.fasta ./ 2 bbmap_ribo

#reads rarefied to 4M total and mapped to reference
bbmap_general.py 'rare/*.fastq' ATCC700819.fna ./ 3 bbmap_full
maps2tbl.py 'bbmap_full_mapped/*.map' counts.txt

#Differeintial expression analysis commands below run in R
'''
library("locfit")
library("edgeR")
x <- read.delim("rinput.txt",row.names="gene")
group <- factor(c(1,1,1,1,2,2,2,2))
y <- DGEList(counts=x,group=group)
y <- calcNormFactors(y)
design <- model.matrix(~group)
y <- estimateDisp(y,design)
fit <- glmQLFit(y,design)
qlf <- glmQLFTest(fit,coef=2)
tt<-topTags(qlf,n='all',sort.by="logFC")
write.table(as.data.frame(tt),file="counts.edger",sep="\t")
'''
#run Superfocus to obtain gene function
#convert reads to interleaved fasta
convert-reads.sh
interleave-reads.sh
superfocus.py -q rare_fasta/ -dir superfocus -t 8 -a diamond

#Differeintial funcitonal analysis commands below run in R
'''
ibrary("locfit")
library("edgeR")
x <- read.delim("level1.txt",row.names="Level1")
group <- factor(c(1,1,1,1,2,2,2,2))
y <- DGEList(counts=x,group=group)
y <- calcNormFactors(y)
design <- model.matrix(~group)
y <- estimateDisp(y,design)
fit <- glmQLFit(y,design)
qlf <- glmQLFTest(fit,coef=2)
tt<-topTags(qlf,n='all',sort.by="logFC")
write.table(as.data.frame(tt),file="level1.edger",sep="\t")

x <- read.delim("level2.txt",row.names="Level2")
group <- factor(c(1,1,1,1,2,2,2,2))
y <- DGEList(counts=x,group=group)
y <- calcNormFactors(y)
design <- model.matrix(~group)
y <- estimateDisp(y,design)
fit <- glmQLFit(y,design)
qlf <- glmQLFTest(fit,coef=2)
tt<-topTags(qlf,n='all',sort.by="logFC")
write.table(as.data.frame(tt),file="level2.edger",sep="\t")

x <- read.delim("level3.txt",row.names="Level3")
group <- factor(c(1,1,1,1,2,2,2,2))
y <- DGEList(counts=x,group=group)
y <- calcNormFactors(y)
design <- model.matrix(~group)
y <- estimateDisp(y,design)
fit <- glmQLFit(y,design)
qlf <- glmQLFTest(fit,coef=2)
tt<-topTags(qlf,n='all',sort.by="logFC")
write.table(as.data.frame(tt),file="level3.edger",sep="\t")

x <- read.delim("function.txt",row.names="function")
group <- factor(c(1,1,1,1,2,2,2,2))
y <- DGEList(counts=x,group=group)
y <- calcNormFactors(y)
design <- model.matrix(~group)
y <- estimateDisp(y,design)
fit <- glmQLFit(y,design)
qlf <- glmQLFTest(fit,coef=2)
tt<-topTags(qlf,n='all',sort.by="logFC")
write.table(as.data.frame(tt),file="function.edger",sep="\t")
'''









