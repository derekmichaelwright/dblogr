#
install.packages("devtools")
devtools::install_github("jiabowang/GAPIT")
#
myRootFolder <- "C:/gitfolder/dblogr/academic/gwas_tutorial/"
myRootFolder <- "C:/Users/wrigh/OneDrive - University of Saskatchewan/gitfolder/dblogr/academic/gwas_tutorial/"
#
setwd(myRootFolder)
#
# Read in phenotype data
myY <- read.csv("Data/myY.csv")[,-2]
# Read in genotype data (note: header = F)
myG <- read.csv("Data/myG_hmp.csv", header = F)
#
library(GAPIT)
setwd( paste0(myRootFolder, "New_GWAS_Results") )
# Simplest GWAS
myGAPIT <- GAPIT( Y = myY[,c(1:2)], G = myG,
                  PCA.total = 4,
                  model = c("MLM","MLMM","FarmCPU","BLINK"),
                  Random.model = F, Phenotype.View = F )
#
#
myGAPIT <- GAPIT( Y = myY[,-2], G = myG, model = c("MLM", "BLINK") )
#
# check for name errors
setdiff(myY$Name, t(myG[1,])) # should be character(0)
setdiff(t(myG[1,]), myY$Name) # should show just the first 11 columns of myG
