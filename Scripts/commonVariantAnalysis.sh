####### code used for regenie common variant analysis ##################

#step 2
#$1 represents chromosome
#$2 represents total or regional 
#$3 represents the phenotypes being analysed
#$4 represents the covariants included either tablex for total brain volume or tablex,totalbrainvolume for regional


/home/regenie_v3.4.1.gz_x86_64_Centos7_mkl --step 2 --bed chr${1}_EUR --keep people.txt --exclude defaultVariantExclusions.txt --phenoFile ${2}BrainCovars.txt --phenoColList ${3} --covarFile ${2}BrainCovars.txt --covarColList ${4},tabley,tablez,coilz,age_imaging,nonlinear_warping,linwarp,nonlinwarp,sex,age2,centre_Cheadle,centre_Newcastle,centre_Reading,handedness_R,handedness_A,array01,pop_pc1,pop_pc2,pop_pc3,pop_pc4,pop_pc5,pop_pc6,pop_pc7,pop_pc8,pop_pc9,pop_pc10,pop_pc11,pop_pc12,pop_pc13,pop_pc14,pop_pc15,pop_pc16,pop_pc17,pop_pc18,pop_pc19,pop_pc20 --pred ${2}GRM_pred.list --bsize 400 --gz --threads 15 --out ${1}_${2}