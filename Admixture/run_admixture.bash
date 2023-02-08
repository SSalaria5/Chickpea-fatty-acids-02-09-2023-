#!/usr/bin/env bash

# bash run_admixture.bash plink.bed

PLINK_FILE=plink.bed

for K in 1 2 3 4 5 6 7 8
do
    /zfs/dilthavar/software/admixture ${PLINK_FILE} $K -j16 --cv=5 | tee log${K}.out
done

# I used ggplot to generate figure using all_admix1.csv file 
# See  Admix plot, PCA (Using Admix and Origin information)script for plotting
