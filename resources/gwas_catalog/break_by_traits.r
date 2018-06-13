a=read.delim("gwas_catalog.tsv",stringsAsFactors=F)
b=a[,c("SNPS","DISEASE.TRAIT")]
b=b[grep("rs",b$SNPS),]
library(stringr)
b$count = str_count(b$SNPS,"rs")
b = b[which(b$count==1),]
b$SNPS = sub(".*(rs[[:digit:]]*).*","\\1",b$SNPS)
b=b[order(b$DISEASE.TRAIT,b$SNPS),]
b=b[!duplicated(b[,c(1,2)]),]
## select the traits with at least N GWAS SNPs. 
names = names(which(table(b$DISEASE.TRAIT)>=10))

for( name in names) {
  tmp = b[which(b$DISEASE.TRAIT == name),]
  name = gsub(" ","_",name)
  name = gsub("/",",",name)

  write.table(tmp[,"SNPS"],paste0("break_by_traits/",name),row.names=F,col.names=F,quote=F)
  }

