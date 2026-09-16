#!/bin/bash

#SBATCH --job-name 02_dorado_summary
#SBATCH -p slurmpart
#SBATCH -G 1
#SBATCH --mem=300G
#SBATCH --output 02_dorado_summary.out
#SBATCH --error 02_dorado_summary.err

module purge
module load dorado/0.8.0
module load samtools/1.20

cd /media/data_01/vapatter/PROJECTS/15-LARS/149_LE_hTERT_HEK72h/T2T

/usr/bin/time -v dorado summary HEK_72h_hTAPAS_CRISPR_T2T-CHM13v2.0.dna_r10.4.1_e8.2_400bps_sup@v4.3.0.bam >\
HEK_72h_hTAPAS_CRISPR_T2T-CHM13v2.0.dna_r10.4.1_e8.2_400bps_sup@v4.3.0.summary.tsv

