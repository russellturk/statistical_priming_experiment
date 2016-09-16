library(MCMCglmm)

#Small test model, log transformation corrects to Normal distribution, added small constant to avoid -inf errors on log(0)
mcmc.testdata.1<-MCMCglmm(fixed = log(response_time) ~ log(Bigram_Frequency+0.0001) + 
                      Letters_trailing + Freq_trailing + LR_Diversity + Conc_trailing,
                      nitt=10000, random=~P + Trailing, 
                      data= testdata)

summary(mcmc.testdata.1)

#Large scale test
mcmc.testdata.2<-MCMCglmm(fixed = log(response_time) ~ log(Bigram_Frequency+0.0001) + 
                            Letters_trailing + Freq_trailing + LR_Diversity + Conc_trailing,
                          nitt=500000, random=~P + Trailing, 
                          data= testdata)

summary(mcmc.testdata.2)

library(lme4)

#Non MCMC method implemented as check
lmer.testdata.1 <- lmer(log(testdata$response_time)~log(testdata$Bigram_Frequency+0.0001) + 
  testdata$Letters_trailing+testdata$Freq_trailing +testdata$LR_Diversity +testdata$Conc_trailing + 
  (1|testdata$P) +(1|testdata$Trailing))

summary(lmer.testdata.1)
