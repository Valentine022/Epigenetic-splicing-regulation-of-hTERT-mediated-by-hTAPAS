#!/bin/bash
#SBATCH --job-name 01_dorado
#SBATCH -p slurmpart
#SBATCH -G 1
#SBATCH --output 01_dorado.out
#SBATCH --error 01_dorado.err

### Template script for basecalling on bonsai GPU using dorado to produce both bam file and fastq file along with basic seqencing statistics

module purge
module load dorado/0.8.1
module load samtools/1.16.1
module load guppy
module load pigz

POD5_DIR="/media/data_01/shared/SEQUENCING_NANOPORE/125_NDLE_hTERT_CRISPR_VA13/pod5"
OUTPUT_DIR="/media/data_01/vapatter/PROJECTS/15-LARS/125_NDLE_hTERT_CRISPR_VA13/T2T"
REF="/media/data_01/shared/GENOMES/homo_sapiens/T2T-CHM13v2.0/genome/T2T-CHM13v2.0.fasta"

dorado basecaller \
    --reference $REF \
    --recursive \
    --device cuda:0 \
    sup,5mC_5hmC \
    $POD5_DIR > $OUTPUT_DIR/125_VA13_CRISPR_T2T-CHM13v2.0.dna_r10.4.1_e8.2_400bps_sup@v4.3.0.bam
