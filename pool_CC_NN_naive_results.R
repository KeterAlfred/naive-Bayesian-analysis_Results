

setwd("C:\\Users\\Keter\\OneDrive - ITG\\EDCTP\\PhD\\lca\\Vukuzazi\\revised analysis\\vb_sim_analysis\\naive\\Results")


rm(list = ls())


require("R2jags")
require("runjags")
require(coda)







cc1 = readRDS("vb.CC.sim1.naive.res1_25.RData")
cc2 = readRDS("vb.CC.sim1.naive.res26_50.RData")
cc3 = readRDS("vb.CC.sim1.naive.res51_75.RData")
cc4 = readRDS("vb.CC.sim1.naive.res76_100.RData")





print(cc1[1], intervals = c(0.5, 0.025, 0.975))
print(cc2[1], intervals = c(0.5, 0.025, 0.975))
print(cc3[1], intervals = c(0.5, 0.025, 0.975))
print(cc4[1], intervals = c(0.5, 0.025, 0.975))



cc = c(cc1, cc2, cc3, cc4)
cc.l = sapply(cc,coda::as.mcmc)

cc.r=combine.MCMC(
  mcmc.objects = cc.l
)

cc.s = summary(cc.r)
round( cc.s$quantiles[,c(3,1,5)],3)















nn1 = readRDS("vb.NN.sim1.naive.res1_25.RData")
nn2 = readRDS("vb.NN.sim1.naive.res26_50.RData")
nn3 = readRDS("vb.NN.sim1.naive.res51_75.RData")
nn4 = readRDS("vb.NN.sim1.naive.res76_100.RData")





print(nn1[1], intervals = c(0.5, 0.025, 0.975))
print(nn2[1], intervals = c(0.5, 0.025, 0.975))
print(nn3[1], intervals = c(0.5, 0.025, 0.975))
print(nn4[1], intervals = c(0.5, 0.025, 0.975))



nn = c(nn1, nn2, nn3, nn4)
nn.l = sapply(nn,coda::as.mcmc)

nn.r=combine.MCMC(
  mcmc.objects = nn.l
)

nn.s = summary(nn.r)

round( nn.s$quantiles[,c(3,1,5)],3)















# 
# se.names =  row.names(lca.s$quantile)[which(substr(row.names(lca.s$quantile),1,2) %in% c("se"))]
# sp.names =  row.names(lca.s$quantile)[which(substr(row.names(lca.s$quantile),1,2) %in% c("sp"))]
# pi.names =  row.names(lca.s$quantile)[which(substr(row.names(lca.s$quantile),1,2) %in% c("pi"))]
# 
# 
# 
# 
# 
# sen.names = se.names[
#   which(substr(se.names,5, nchar(se.names)-1) %in% ",4")]
# spe.names = sp.names[
#   which(substr(sp.names,5, nchar(sp.names)-1) %in% ",4")]
# 
# 
# ind.pi = which(substr(row.names(lca.s$quantile),1,6) %in% pi.names)
# ind.se = which(substr(row.names(lca.s$quantile),1,7) %in% sen.names)
# ind.sp = which(substr(row.names(lca.s$quantile),1,7) %in% spe.names)
# 
# 
# 
# # Final results
# 
# round(lca.s$quantile[ c(ind.pi, ind.se, ind.sp), c(3,1,5)],3)




