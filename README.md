# GWAS-negative-binomial-models

## Convert the dosages data to the right format.
Consider doing this on a cluster.  
Details in 00_convert_dosage_format.txt.  


## Run the GWAS.  
Details in 01_run_gwas.sh, which calls on a helper script called 01_plinkR_v3  

The script is designed to loop over all genotype files in a given directory.  

As input you need to specify:  

a .fam file for the dosages data (if all .fam files match across dosages files, which they should, you don't need this to be a variable, you just need to pick one)  
a phenotype file  
a covariate file  
a genotype file in the modified format  
path to genotype file  
output file name  
phenotype name  
theoretical lowest value for the phenotype*  

*e.g. if the phenotype ranges from 1-5, set this value to 1. The reason for this is because the regression model assumes that 0 is meaningful, so we need to set what 0 should be.  

Right now it outputs just regression results, which at some point have to be combined with frequency/info scores that you would get if you just ran GWAS  

# Major caution: Right now the indexing assumes there are exactly 5 covariates. The outputs will not be correct if you change the number of covariates. The script needs to be adjusted to pick the correct columns if that is the case.  
