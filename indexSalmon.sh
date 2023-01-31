#!/bin/bash -l
#SBATCH --job-name=indexSalmon

conda activate salmon
echo "starting to index"
salmon index -t gentrome.fa.gz -d decoys.txt -p 12 -i salmon_index --gencode
echo "done"
