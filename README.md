## install salmon - on create
```
conda config --add channels conda-forge
conda config --add channels bioconda
conda create -n salmon salmon
```
# prepareSalmon
## download reference files

```
wget http://hgdownload.soe.ucsc.edu/goldenPath/hg38/bigZips/p13/hg38.p13.fa.gz

wget https://ftp.ebi.ac.uk/pub/databases/gencode/Gencode_human/release_38/gencode.v38.transcripts.fa.gz

wget https://ftp.ebi.ac.uk/pub/databases/gencode/Gencode_human/release_38/gencode.v38.chr_patch_hapl_scaff.annotation.gtf.gz

```

## prepare index files for Salmon - probably not needed in this new version.  See below what to do instead
```
bash scripts/generateDecoyTranscriptome.sh -a /scratch/pawsey0360/rkabiljo/Hg38RefForSalmon/gencode.v38.chr_patch_hapl_scaff.annotation.gtf -g /scratch/pawsey0360/rkabiljo/Hg38RefForSalmon/hg38.p13.fa -t /scratch/pawsey0360/rkabiljo/Hg38RefForSalmon/gencode.v38.transcripts.fa -o /scratch/pawsey0360/rkabiljo/salmon_index_HSfullP13 

```

### not through the generateDecoyTranscriptome.sh
This is what I found here: https://combine-lab.github.io/alevin-tutorial/2019/selective-alignment/

```
grep "^>" <(gunzip -c hg38.p13.fa.gz) | cut -d " " -f 1 > decoys.txt
sed -i.bak -e 's/>//g' decoys.txt
cat gencode.v38.transcripts.fa.gz hg38.p13.fa.gz > gentrome.fa.gz
salmon index -t gentrome.fa.gz -d decoys.txt -p 12 -i salmon_index --gencode
```

Or to submit it as a script
```
sbatch -p nd_bioinformatics_cpu --mem=60G indexSalmon.sh
```





