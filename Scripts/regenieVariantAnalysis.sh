####### code used for regenie variant analysis ##################

#step 2
#$1 represents chromosome
#$2 represents total or regional 
#$5 represents the covariants included either tablex for total brain volume or tablex,totalbrainvolume for regional
#$6 represents the phenotypes being analysed

/home/regenie_v3.4.1.gz_x86_64_Centos7_mkl --step 2 --bgen ukb23159_c${1}_b0_v1.bgen --sample ukb23159_c${1}_b0_v1.sample --ref-first --extract variants4regression.txt --covarFile ${2}BrainCovars.txt --covarColList ${5},tabley,tablez,coilz,age_imaging,nonlinear_warping,linwarp,nonlinwarp,sex,age2,centre_Cheadle,centre_Newcastle,centre_Reading,handedness_R,handedness_A,batch_200k,batch_300k,batch_450k,pop_pc1,pop_pc2,pop_pc3,pop_pc4,pop_pc5,pop_pc6,pop_pc7,pop_pc8,pop_pc9,pop_pc10,pop_pc11,pop_pc12,pop_pc13,pop_pc14,pop_pc15,pop_pc16,pop_pc17,pop_pc18,pop_pc19,pop_pc20 --phenoFile ${2}BrainCovars.txt --phenoColList ${6} --pred ${2}GRM_pred.list --bsize 200 --strict --minMAC 1 --gz --out ${2}_Variants_${1}
