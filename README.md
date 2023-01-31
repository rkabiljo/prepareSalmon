# prepareSalmon
## download reference files

```
wget http://hgdownload.soe.ucsc.edu/goldenPath/hg38/bigZips/p13/hg38.p13.fa.gz

wget https://ftp.ebi.ac.uk/pub/databases/gencode/Gencode_human/release_38/gencode.v38.transcripts.fa.gz

wget https://ftp.ebi.ac.uk/pub/databases/gencode/Gencode_human/release_38/gencode.v38.chr_patch_hapl_scaff.annotation.gtf.gz

```

## prepare index files for Salmon 
```
bash scripts/generateDecoyTranscriptome.sh -a /scratch/pawsey0360/rkabiljo/Hg38RefForSalmon/gencode.v38.chr_patch_hapl_scaff.annotation.gtf -g /scratch/pawsey0360/rkabiljo/Hg38RefForSalmon/hg38.p13.fa -t /scratch/pawsey0360/rkabiljo/Hg38RefForSalmon/gencode.v38.transcripts.fa -o /scratch/pawsey0360/rkabiljo/salmon_index_HSfullP13 
```
