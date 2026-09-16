#!/bin/bash

#SBATCH --job-name 03_samtools_fastq
#SBATCH -p slurmpart
#SBATCH -c 25
#SBATCH --output 03_samtools_fastq.out
#SBATCH --error 03_samtools_fastq.err

### Template script for post basecalling processes on bonsai CPU using dorado to produce both bam file and fastq file along with basic seqencing statistics
### This script can be submitted immediately after the basecalling script using sbatch "--dependency=afterok:job_id_of_basecalling this_script.sh"

module purge
module load dorado/0.8.0
module load samtools/1.20
module load pigz/2.8

OUTPUT_DIR="/media/data_01/vapatter/PROJECTS/15-LARS/125_NDLE_hTERT_CRISPR_VA13/T2T"

cd $OUTPUT_DIR

/usr/bin/time -v samtools fastq -@ 25 125_VA13_CRISPR_T2T-CHM13v2.0.dna_r10.4.1_e8.2_400bps_sup@v4.3.0.bam.sorted.bam.sorted.bam > \
125_VA13_CRISPR_T2T-CHM13v2.0.dna_r10.4.1_e8.2_400bps_sup@v4.3.0.bam.sorted.bam.fastq
pigz 125_VA13_CRISPR_T2T-CHM13v2.0.dna_r10.4.1_e8.2_400bps_sup@v4.3.0.bam.sorted.bam.fastq
