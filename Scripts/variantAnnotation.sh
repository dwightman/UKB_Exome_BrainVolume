####### code used for variant annotation ##################

#$1 represents chromosome number
#${1}_SNPs4VEP.txt is vcf format chr pos rsID ref alt . . . 

#REVEL annotation
vep --cache -i ${1}_SNPs4VEP.txt -o ${1}_SNPanno.vcf --plugin REVEL,/home/.vep/Plugins/new_tabbed_revel_grch38.tsv.gz

#LOFTEE
vep --cache -i ${1}_SNPs4VEP.txt -o LOF${1}_SNPanno.vcf --dir_plugin /home/LOFTEE/GRCh38/loftee-grch38 --plugin LoF,loftee_path:/home/LOFTEE/GRCh38/loftee-grch38,human_ancestor_fa:/home/LOFTEE/GRCh38/human_ancestor.fa.gz,conservation_file:/home/LOFTEE/GRCh38/loftee.sql,gerp_bigwig:/home/LOFTEE/GRCh38/gerp_conservation_scores.homo_sapiens.GRCh38.bw


