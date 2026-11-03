#!/bin/bash

# ============================================================
# Regional CpG Methylation Analysis
# ============================================================
# Description:
# Calculates the unweighted mean methylation percentage
#
# Input:  bedMethyl file
# Output: Mean CpG methylation percentage
# ============================================================

awk -v chr="NC_060929.1" \
    -v start=1196006 \
    -v end=1205278 '

# Select records within the specified genomic region
# $1  = Reference chromosome
# $2  = Genomic start position
# $4  = Modification code ("m" = 5-methylcytosine)
# $10 = Valid sequencing coverage
# $11 = Methylation percentage

$1==chr && $2>=start && $2<end && $4=="m" && $10>0 {

    # Sum site-specific methylation percentages
    sum += $11

    # Count qualifying methylation records
    n++
}

END {
    # Calculate the unweighted arithmetic mean
    if (n > 0)
        printf "Mean CpG methylation: %.2f%%\n", sum/n
}

' $f.bed
