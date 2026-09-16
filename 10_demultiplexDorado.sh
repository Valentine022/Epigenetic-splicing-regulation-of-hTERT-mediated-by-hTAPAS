#!/bin/bash
#SBATCH --job-name 10_demultiplex
#SBATCH -p slurmpart
#SBATCH -G 1
#SBATCH --output 10_demultiplexDorado.out
#SBATCH --error 10_demultiplexDorado.err

### Template script for basecalling on bonsai GPU using dorado to produce both bam file and fastq file along with basic seqencing statistics

module purge
module load dorado/0.8.1
module load samtools/1.16.1
module load guppy
module load pigz

OUTPUT_DIR="/media/data_01/vapatter/PROJECTS/15-LARS/178a_LE_hTERT_cd4t/T2T"
REF="/media/data_01/shared/GENOMES/homo_sapiens/T2T-CHM13v2.0/genome/T2T-CHM13v2.0.fasta"

dorado demux --no-trim --sort-bam --kit-name EXP-NBD114 --output-dir $OUTPUT_DIR/DORADO_DEMUX \
$OUTPUT_DIR/178_T2T-CHM13v2.0.dna_r10.4.1_e8.2_400bps_sup@v4.3.0.bam

dorado demux --no-trim --sort-bam --kit-name EXP-NBD104 --output-dir $OUTPUT_DIR/DORADO_DEMUX \
$OUTPUT_DIR/178_T2T-CHM13v2.0.dna_r10.4.1_e8.2_400bps_sup@v4.3.0.bam


sbatch 11_dorado_align.sh
