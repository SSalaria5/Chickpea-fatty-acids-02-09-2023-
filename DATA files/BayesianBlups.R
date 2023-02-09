library(rstanarm)
library(bayesplot)
library(shinystan)
options(mc.cores = parallel::detectCores())

setwd('/zfs/dilthavar/ssalari')
df <- read.csv("DTST.data.csv", row.names = 1)
df[,1:6] <- lapply(df[,1:6], function(x) as.factor(x))
head(df)


bayesian_blups <- df[,c(5,6)]
for (trait in c("PalmiticAcid","LinoleicAcid","AlphaLinolenicAcid","OleicAcid")){
  stan.model <- stan_lmer(paste0(trait, 
                                " ~ (1|GenotypeNum) + (1|Block:Exp:Rep) + (1|Rep:Exp) + (1|Exp) + (1|GenotypeNum:Exp)"), 
           data=df, adapt_delta = 0.99, seed=324)
  blups <- ranef(stan.model)$GenotypeNum
  blups$GenotypeNum <- rownames(blups)
  colnames(blups) <- c(trait, "GenotypeNum")
  bayesian_blups <- merge(bayesian_blups, blups, by="GenotypeNum")
}
write.csv(unique(bayesian_blups), "bayesian_blups.csv", row.names = F, quote=F)



