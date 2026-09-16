#!/bin/bash
#SBATCH --job-name 04_nanoplot_allReads
#SBATCH -p slurmpart
#SBATCH -c 25
#SBATCH --mem=100G
#SBATCH --output 04_nanoplot_allReads.out
#SBATCH --error 04_nanoplot_allReads.err

cd /media/data_01/vapatter/PROJECTS/15-LARS/125_NDLE_hTERT_CRISPR_VA13/T2T

/usr/bin/time -v NanoPlot --threads 25 --N50 --color navy --format pdf --loglength --font_scale 3 \
--dpi 600 --verbose --raw --summary 125_VA13_CRISPR_T2T-CHM13v2.0.dna_r10.4.1_e8.2_400bps_sup@v4.3.0.bam.sorted.bam.summary.tsv --outdir \
summary-plots-log-transformed_125_VA13_CRISPR_T2T-CHM13v2.0.dna_r10.4.1_e8.2_400bps_sup@v4.3.0.bam.sorted.bam
