awk -v chr="NC_060929.1" -v start=1196006 -v end=1205278 '
BEGIN { FS=OFS="\t" }

$1 == chr && $2 < end && $3 > start && $4 == "m" {
    meth += $12
    unmeth += $13
    sites++
}

END {
    total = meth + unmeth

    print "Region:", chr ":" start "-" end
    print "m sites:", sites
    print "Methylated calls:", meth
    print "Unmethylated calls:", unmeth
    print "Total calls:", total

    if (total > 0)
        printf "Percent methylation: %.2f%%\n", 100 * meth / total
    else
        print "Percent methylation: NA"
}' 125_VA13_CRISPR_T2T-CHM13v2.0.dna_r10.4.1_e8.2_400bps_sup@v4.3.0.bed
