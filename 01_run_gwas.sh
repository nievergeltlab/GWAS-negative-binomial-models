#Run GWAS
   for geno in $(ls genotypes | grep gz )
    do
     echo running $geno
     date
     Rscript 01_plinkR_v2.txt \
             dos_pts_mrsc_mix_am-qc.hg19.ch.fl.chr15_093_103.out.dosage.fam \
             1_MRSC_C_V2_2.5_PCL4.txt \
             pts_mrsc_mix_am-qc-eur_pca.menv.mds_cov \
             $geno \
             "genotypes" \
             "outputs" \
             "pcl4_c_12_future" \
              1
    done

#concatenate reuslts
cat outputs/*.txt | awk '{if (NR==1 || $1 != "SNP") print}' > mrsc_eur_pcl4_c_12_future.results
