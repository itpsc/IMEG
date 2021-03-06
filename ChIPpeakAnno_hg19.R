library(org.Hs.eg.db)
library(biomaRt)
library(ChIPpeakAnno)
library(ensembldb)
Args <- commandArgs()
regions <- read.delim(Args[4], header=FALSE, stringsAsFactors=TRUE)
starts = regions$"V2"
ends = regions$"V3"
chrs = regions$"V1"
myPeak = RangedData(IRanges(start=starts, end=ends), space=chrs)
data(TSS.human.GRCh37)
print("running annotation")
annotatedPeak = annotatePeakInBatch(myPeak, AnnotationData=TSS.human.GRCh37,PeakLocForDistance="middle", FeatureLocForDistance="TSS")
print(head(as.data.frame(annotatedPeak)))
print("writing tables and images")
input=as.character(Args[4])
name=unlist(strsplit(input, "\\."))
write.table(as.data.frame(annotatedPeak), file=(paste(name[1],"_annotatedPeakList.xls")), sep="\t", dec=",", row.names=FALSE)
anno=as.data.frame(addGeneIDs(annotatedPeak, "org.Hs.eg.db", "symbol"))
write.table(anno,file= (paste(name[1],"_associatedPeaks_ALL.xls")), sep="\t", dec=",",row.names=FALSE)
print("Done.")
