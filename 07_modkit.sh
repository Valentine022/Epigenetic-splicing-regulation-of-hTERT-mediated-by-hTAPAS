#!/bin/bash
#SBATCH --job-name=07_modkit
#SBATCH -p slurmpart
#SBATCH -c 15
#SBATCH --output=07_modkit.out
#SBATCH --error=07_modkit.err
#SBATCH --time=48:00:00    # Set a maximum runtime
#SBATCH --mem=100G         # Allocate memory, adjust as needed

# Load required modules
module purge
module load dorado/0.8.1
module load samtools/1.20
module load minimap2/2.28

# Define paths
REF="/media/data_01/shared/GENOMES/homo_sapiens/T2T-CHM13v2.0/genome/T2T-CHM13v2.0.fasta"
OUT_DIR="/media/data_01/vapatter/PROJECTS/15-LARS/125_NDLE_hTERT_CRISPR_VA13/T2T/DORADO_DEMUX"

cd $OUT_DIR

for f in *aligned.bam; do samtools sort -o $f.sorted.bam $f; done

for f in *aligned.bam.sorted.bam; do samtools index $f; done

for f in *aligned.bam.sorted.bam; do modkit pileup $f \
$f.bed --cpg --ref $REF; done

OUT_DIR="/media/data_01/vapatter/PROJECTS/15-LARS/125_NDLE_hTERT_CRISPR_VA13/T2T"

cd $OUT_DIR

for f in *.sorted.bam; do samtools index $f; done

for f in *.sorted.bam; do modkit pileup $f \
$f.bed --cpg --ref $REF; done

