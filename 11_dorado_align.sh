#!/bin/bash
#SBATCH --job-name 11_dorado
#SBATCH -p slurmpart
#SBATCH -G 1
#SBATCH --output 11_dorado.out
#SBATCH --error 11_dorado.err

### Template script for basecalling on bonsai GPU using dorado to produce both bam file and fastq file along with basic seqencing statistics

module purge
module load dorado/0.8.1
module load samtools/1.16.1
module load guppy
module load pigz

REF="/media/data_01/shared/GENOMES/homo_sapiens/T2T-CHM13v2.0/genome/T2T-CHM13v2.0.fasta"
OUTPUT_DIR="/media/data_01/vapatter/PROJECTS/15-LARS/178a_LE_hTERT_cd4t/T2T/DORADO_DEMUX"
cd $OUTPUT_DIR

for f in *bam; do dorado aligner $REF $f > $OUTPUT_DIR/$f.aligned.bam; done

conda activate /media/data_01/vapatter/CONDA/NANOPLOT

sbatch 07_modkit.sh
