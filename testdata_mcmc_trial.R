library(MCMCglmm)

mcmc.testdata.1<-MCMCglmm(fixed = log(response_time) ~ log(Bigram_Frequency+0.0001) + 
                      Letters_trailing + Freq_trailing + LR_Diversity + Conc_trailing,
                      nitt=100000, random=~P + Trailing, 
                      data= testdata)

summary(mcmc.testdata.1)

mcmc.testdata.2<-MCMCglmm(fixed = log(response_time) ~ log(Bigram_Frequency+0.0001) + 
                            Letters_trailing + Freq_trailing + LR_Diversity + Conc_trailing,
                          nitt=500000, random=~P + Trailing, 
                          data= testdata)

summary(mcmc.testdata.2)