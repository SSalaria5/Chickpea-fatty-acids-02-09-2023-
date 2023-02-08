install.packages("agricolae")
install.packages("multcompView")
install.packages("car")


setwd("/zfs/dilthavar/ssalari")

# The file DTST.data.csv has renamed
DTST_data <- read.csv("DTST.data.csv")
DATA <-DTST_data
# Analysis conducted using data from one fatty acid at a time
PA_DATA <- DATA[,c(1:7,11)]
PA_DATA <- PA_DATA[!is.na(PA_DATA$OleicAcid),] # To remove missing values

#model y = m + ID + Exp + Rep + Block + Exp:Rep + ID:Exp + Exp:Rep:Block + error
library(lme4)
library(emmeans)
library(agricolae)
library(reshape)
library(car)
library(metan)
library(multcompview)
PA_DATA <- DATA[,c(1:7,11)]
str(PA_DATA)
PA_DATA <- PA_DATA[!is.na(PA_DATA$OleicAcid),]
PA_DATA$Block <- as.factor(PA_DATA$Block)
PA_DATA$ID <- as.factor(PA_DATA$ID)
PA_DATA$Rep <- as.factor(PA_DATA$Rep)
PA_DATA$Site <- as.factor(PA_DATA$Site)

m.f<-lm(OleicAcid ~ID + Site + Rep+ Block + Exp:ID + 
          Exp:Rep + Exp:Rep:Block, data = PA_DATA)
anova(m.f)  

#For mean comprisons 
wak <-PBIB.test(PA_DATA$Block, PA_DATA$ID, PA_DATA$Rep, PA_DATA$OleicAcid,16,
                method = "REML", test = "tukey", alpha = 0.05,
                console = TRUE,group = TRUE)
