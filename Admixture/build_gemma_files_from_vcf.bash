VCF="ChickPea.renamed.chroms_renamed.no_25866.recode.vcf"
PLINK_OUTPUT="plink" # The output name for Plink data
PHENOTYPES="bayesian_blups.tsv" # tab-separate file with header = IID\tFID\tPhenotype1\tPhenotype2\t...PhenotypeN
NUM_PHENOTYPES="4" # example for seven phenotypes

TMPDIR="."

# echo "/zfs/dilthavar/software/vcftools --gzvcf ${VCF} --plink --out ${PLINK_OUTPUT}"
# /zfs/dilthavar/software/vcftools --gzvcf ${VCF} --plink --out ${PLINK_OUTPUT}

/zfs/dilthavar/software/Plink/plink --noweb --allow-extra-chr --vcf ${VCF} --no-pheno --allow-no-sex --make-bed --out ${PLINK_OUTPUT} 

# gk=1 (centered relatedness matrix) gk=2 (standardized relatedness matrix)
# ~/gemma-0.98.1 -bfile ${PLINK_OUTPUT} -gk 2 -o ${PLINK_OUTPUT} -hwe 0 -miss 1 -maf 0


