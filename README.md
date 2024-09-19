# Wightman et al. (2024) Rare variant aggregation highlights rare disease genes associated with brain volume variation.
Scripts: shell scripts used to analyse the data included in the manuscript <br />
Summary statistics: All gene level pLOF+Missense summary statistics for all phenotypes <br />
<br />
                    -\*_AllTests.txt.gz contains the results for all analysis methods <br />
                    -\*_GENEP.txt.gz contains the results just for the GENE_P methods <br />
                    <br />
                    -Column headers are: Gene Genename CHROM GENPOS N TEST BETA SE CHISQ LOG10P VariantCategory mask P CAF cMAC Nvariants <br />
                                        -VariantCategory represents whether high confidence pLOF+missense variants were used or all pLOF+missense variants <br />
                                        -mask represents the allele frequency mask: 0.01, 0.001, 0.0001, or singleton <br />
                                        -CAF represents the cumulative allele frequency <br />
                                        -cMAC represents the cumulative minor allele count <br />


