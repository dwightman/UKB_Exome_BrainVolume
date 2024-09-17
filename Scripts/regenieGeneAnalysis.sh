####### code used for regenie gene based analysis ##################

#step 1
#EURtyped is the plink bed,bim,fam file of UKB people with only typed variants
#$1 represents total or regional analysis
#$2 represents the phenotypes being analysed
#$3 represents the covariants included either tablex for total brain volume or tablex,totalbrainvolume for regional

#get snp list
plink2 --bfile EURtyped --keep people.txt --maf 0.01 --mac 100 --geno 0.1 --hwe 1e-15 --mind 0.1 --write-snplist --write-samples --no-id-header --threads 15 --out qc_pass

/home/regenie_v3.4.1.gz_x86_64_Centos7_mkl --step 1 --gz --bed EURtyped --extract qc_pass.snplist --keep qc_pass.id --phenoFile BrainCovars.txt --phenoColList $2 --covarFile BrainCovars.txt --covarColList ${3},tabley,tablez,coilz,age_imaging,nonlinear_warping,linwarp,nonlinwarp,sex,age2,centre_Cheadle,centre_Newcastle,centre_Reading,handedness_R,handedness_A,batch_200k,batch_300k,batch_450k,pop_pc1,pop_pc2,pop_pc3,pop_pc4,pop_pc5,pop_pc6,pop_pc7,pop_pc8,pop_pc9,pop_pc10,pop_pc11,pop_pc12,pop_pc13,pop_pc14,pop_pc15,pop_pc16,pop_pc17,pop_pc18,pop_pc19,pop_pc20 --bsize 1000 --lowmem --lowmem-prefix regenie_tmp_preds --use-relative-path --threads 15 --strict --out ${1}pred


#step 2
#$1 represents chromosome
#$2 represents total or regional 
#$3 represents the predictions from step 1
#$4 represents the regenie mask file format
#$5 represents the covariants included either tablex for total brain volume or tablex,totalbrainvolume for regional
#$6 represents the phenotypes being analysed
#${2}_VariantsR.txt is a list of variants to include (MAF<0.01)


/home/regenie_v3.4.1.gz_x86_64_Centos7_mkl --step 2 --bgen ukb23159_c${1}_b0_v1.bgen --sample ukb23159_c${1}_b0_v1.sample --ref-first --extract ${2}_VariantsR.txt --covarFile ${2}BrainCovars.txt --covarColList ${5},tabley,tablez,coilz,age_imaging,nonlinear_warping,linwarp,nonlinwarp,sex,age2,centre_Cheadle,centre_Newcastle,centre_Reading,handedness_R,handedness_A,batch_200k,batch_300k,batch_450k,pop_pc1,pop_pc2,pop_pc3,pop_pc4,pop_pc5,pop_pc6,pop_pc7,pop_pc8,pop_pc9,pop_pc10,pop_pc11,pop_pc12,pop_pc13,pop_pc14,pop_pc15,pop_pc16,pop_pc17,pop_pc18,pop_pc19,pop_pc20 --phenoFile ${2}BrainCovars.txt --phenoColList ${6} --pred ${2}pred_pred.list --anno-file ${1}_canno.annotations --set-list ${1}_csetlist.setlist --mask-def ${4}.masks --bsize 200 --strict --vc-tests skato,acato-full --vc-MACthr 4 --vc-maxAAF 0.01 --rgc-gene-p --minMAC 1 --joint acat,sbat --gz --out ${2}_${4}_chr${1}



#LOVO
#$1 represents chromosome
#$2 represents total or regional 
#$3 represents the predictions from step 1
#$4 represents the regenie mask file format
#$5 represents the covariants included either tablex for total brain volume or tablex,totalbrainvolume for regional
#$6 represents the phenotypes being analysed
#$7 representts the lovo command with the gene and mask (e.g. --mask-lovo,ENSG00000131495,LOFTEEREVEL,0.0001)
#${2}_VariantsR.txt is a list of variants to include (MAF<0.01)


e=$(echo $7 | sed 's/,/ /1')
g=$(echo $7 | sed 's/,/ /g' | awk '{print $2}')
/home/regenie_v3.4.1.gz_x86_64_Centos7_mkl --step 2 --bgen ukb23159_c${1}_b0_v1.bgen --sample ukb23159_c${1}_b0_v1.sample --ref-first --extract ${2}_VariantsR.txt --covarFile ${2}BrainCovars.txt --covarColList ${5},tabley,tablez,coilz,age_imaging,nonlinear_warping,linwarp,nonlinwarp,sex,age2,centre_Cheadle,centre_Newcastle,centre_Reading,handedness_R,handedness_A,batch_200k,batch_300k,batch_450k,pop_pc1,pop_pc2,pop_pc3,pop_pc4,pop_pc5,pop_pc6,pop_pc7,pop_pc8,pop_pc9,pop_pc10,pop_pc11,pop_pc12,pop_pc13,pop_pc14,pop_pc15,pop_pc16,pop_pc17,pop_pc18,pop_pc19,pop_pc20 --phenoFile ${2}BrainCovars.txt --phenoColList ${6} --pred ${2}GRM_pred.list --anno-file ${1}_canno.annotations --set-list ${1}_csetlist.setlist --mask-def ${4}.masks --bsize 200 --strict --vc-tests skato,acatv --vc-MACthr 4 --vc-maxAAF 0.01 --minMAC 1 --gz  $e --out ${g}_${6}
