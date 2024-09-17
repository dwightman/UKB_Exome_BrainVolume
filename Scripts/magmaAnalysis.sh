####### code used for magma analysis ##################


#rare variant magma analysis
#$1 represents the phenotype from ExWAS results
#Syn represents the results from the synonymous variant analysis

magma --gene-results ${1}.genes.raw --set-annot MSigDB_20231Hs_MAGMA.txt --out results/${1}_MSigDB
magma --gene-results ${1}Syn.genes.raw --set-annot MSigDB_20231Hs_MAGMA.txt --out results/${1}Syn_MSigDB
#GTEx
magma --gene-results ${1}.genes.raw --gene-covar gtex_v8_ts_avg_log2TPM.txt --model direction=greater condition-hide=Average --out results/${1}_GTExspecific
magma --gene-results ${1}Syn.genes.raw --gene-covar gtex_v8_ts_avg_log2TPM.txt --model direction=greater condition-hide=Average --out results/${1}Syn_GTExspecific


#ENIGMA magma analysis
#$1 represents the phenotype from the ENIGMA analysis.
#${1}.txt is formatted as SNP,P,N
#BrainVolumeENIGMA.genes.annot is the variant to gene mapping created using ensembl gene boundaries
#g1000_eur is the plink bed,bim,fam files from 1000 genomes EUR taken from MAGMA website
#ENSG_OnlyProteinCoding.txt is a list of ensembl IDs for protein coding genes

#gene analysis
magma --bfile g1000_eur --gene-annot BrainVolumeENIGMA.genes.annot --pval ${1}.txt ncol=N_COL --out $1

#MSIGDB
magma --gene-results ${1}.genes.raw --settings gene-include=ENSG_OnlyProteinCoding.txt --set-annot MSigDB_20231Hs_MAGMA.txt --out results/${1}_MSigDB

#GTEx
magma --gene-results ${1}.genes.raw --gene-covar gtex_v8_ts_avg_log2TPM.txt --settings gene-include=ENSG_OnlyProteinCoding.txt --model direction=greater condition-hide=Average --out results/${1}_GTExspecific


#UKB common variant magma analysis
#$1 represents the phenotype from the UKB common variant analysis.
#${1}.txt is formatted as SNP,P,N
#BrainVolumeUKB.genes.annot is the variant to gene mapping created using ensembl gene boundaries
#g1000_eur is the plink bed,bim,fam files from 1000 genomes EUR taken from MAGMA website
#ENSG_OnlyProteinCoding.txt is a list of ensembl IDs for protein coding genes

#gene analysis
magma --bfile g1000_eur --gene-annot BrainVolumeUKB.genes.annot --pval ${1}.txt ncol=N_COL --out $1

#MSIGDB
magma --gene-results ${1}.genes.raw --settings gene-include=ENSG_OnlyProteinCoding.txt --set-annot MSigDB_20231Hs_MAGMA.txt --out results/${1}_MSigDB

#GTEx
magma --gene-results ${1}.genes.raw --gene-covar gtex_v8_ts_avg_log2TPM.txt --settings gene-include=ENSG_OnlyProteinCoding.txt --model direction=greater condition-hide=Average --out results/${1}_GTExspecific


