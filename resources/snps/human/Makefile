
all: hg19/all.sorted.bed.md5 hg38/all.sorted.bed.md5

clean: 
	rm hg19/bed_chr_*.bed.gz 
	rm hg38/bed_chr_*.bed.gz

## hg19 file sets. 
hg19/all.sorted.bed.md5: hg19/bed_chr_1.bed.sorted.gz
	md5sum hg19/bed_chr_*.sorted.gz > hg19/all.sorted.bed.md5

hg19/bed_chr_1.bed.sorted.gz: hg19/bed_chr_1.bed.gz
	for file in hg19/*.bed.gz; do \
		zcat $$file |sort -k4,4 |gzip > $${file/gz/sorted.gz} & \
		done \
		wait

hg19/bed_chr_1.bed.gz: 
	cd hg19 && \
	wget ftp://ftp.ncbi.nlm.nih.gov/snp/organisms/human_9606_b150_GRCh37p13/BED/bed_chr_*.bed.gz

## hg38 file sets.
hg38/all.sorted.bed.md5: hg38/bed_chr_1.bed.sorted.gz
	md5sum hg38/bed_chr_*.sorted.gz > hg38/all.sorted.bed.md5

hg38/bed_chr_1.bed.sorted.gz: hg38/bed_chr_1.bed.gz
	for file in hg38/*.bed.gz; do \
		zcat $$file |sort -k4,4 |gzip > $${file/gz/sorted.gz} & \
		done \
		wait

hg38/bed_chr_1.bed.gz:
	cd hg38 && \
	wget ftp://ftp.ncbi.nlm.nih.gov/snp/organisms/human_9606_b151_GRCh38p7/BED/bed_chr_*.bed.gz


