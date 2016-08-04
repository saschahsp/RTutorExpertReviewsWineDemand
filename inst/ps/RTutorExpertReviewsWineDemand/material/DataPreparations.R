#expand data
library(foreign)
library(tidyr)
datadta <- read.dta("C:/Users/Sascha/Desktop/bacheloer thesis/Do Expert Reviews Affect the Demand for Wine/data.dta")
saveRDS(datadta, file="datadta.Rds")
#
datasort <- datadta[order(datadta$artikelnr),]
saveRDS(datasort, file="datasort.Rds")
#
dataexp <- datasort %>% 
  expand(artikelnr,period) %>%
  dplyr::left_join(datasort)
#
library(dplyr)
##datalag
e2 <- dataexp
codeabove <- "code <- 'e2 <- e2 %>%
  group_by(artikelnr) %>%
mutate(rev_all_lag_1 = lag(rev_all, n = 1))'
a = 'rev_all_lag_1'
c = 'n = 1'
for(i in 0:24){
  b = paste('rev_all_lag_',i+1,sep = '')
  d = paste('n =',i+1,sep = '')
  code <- gsub(a,b,code)
  code <- gsub(c,d,code)
  eval(parse(text = code)) 
  a = b
  c = d
}"
eval(parse(text = codeabove))
codeabove <-gsub('rev_all','rev_all_hi',codeabove)
eval(parse(text = codeabove))
codeabove <-gsub('rev_all_hi','rev_all_lo',codeabove)
eval(parse(text = codeabove))
codeabove <-gsub('rev_all_lo','ma_split',codeabove)
eval(parse(text = codeabove))
##datalead
codeabovelead <- "code <- 'e2 <- e2 %>%
group_by(artikelnr) %>%
mutate(rev_all_lead_1 = lead(rev_all, n = 1))'
a = 'rev_all_lead_1'
c = 'n = 1'
for(i in 0:3){
b = paste('rev_all_lead_',i+1,sep = '')
d = paste('n =',i+1,sep = '')
code <- gsub(a,b,code)
code <- gsub(c,d,code)
eval(parse(text = code)) 
a = b
c = d
}"
eval(parse(text = codeabovelead))
codeabovelead <-gsub('rev_all','rev_all_hi',codeabovelead)
eval(parse(text = codeabovelead))
codeabovelead <-gsub('rev_all_hi','rev_all_lo',codeabovelead)
eval(parse(text = codeabovelead))
codeabovelead <-gsub('rev_all_lo','ma_split',codeabovelead)
eval(parse(text = codeabovelead))
#
e2 <- ungroup(e2)
datafilterreg <- subset(e2, !(is.na(rev_all_lead_1)) & !(is.na(rev_all_lead_2)) & !(is.na(rev_all_lead_3)) & !(is.na(rev_all_lead_4)) & !(is.na(dist)) & dist > 4)
datafilterreg <- datafilterreg %>%
  arrange(artikelnr,period)
saveRDS(datafilterreg, file="datafilterreg.Rds")
#
datafilter <- subset(e2, !(is.na(llitre)) & !(is.na(rev_all))& !(is.na(rev_all_lag_1))& !(is.na(rev_all_lag_2)) & !(is.na(rev_all_lag_3))& !(is.na(rev_all_lag_4))& !(is.na(rev_all_lag_5))& !(is.na(rev_all_lag_6))& !(is.na(rev_all_lag_7)) & !(is.na(rev_all_lag_8))& !(is.na(rev_all_lag_9)) & !(is.na(rev_all_lag_10))& !(is.na(rev_all_lag_11))& !(is.na(rev_all_lag_12)) & !(is.na(rev_all_lag_13))& !(is.na(rev_all_lag_14))& !(is.na(rev_all_lag_15)) & !(is.na(rev_all_lag_16))& !(is.na(rev_all_lag_17)) & !(is.na(rev_all_lag_18))& !(is.na(rev_all_lag_19))& !(is.na(rev_all_lag_20))& !(is.na(rev_all_lag_21)) & !(is.na(rev_all_lag_22)) & !(is.na(rev_all_lag_23))& !(is.na(rev_all_lag_24))& !(is.na(rev_all_lag_25 ))& !(is.na(rev_all_lead_1))& !(is.na(rev_all_lead_2)) & !(is.na(rev_all_lead_3))& !(is.na(rev_all_lead_4))& !(is.na(rev_all_hi))& !(is.na(rev_all_hi_lag_1))& !(is.na(rev_all_hi_lag_2))& !(is.na(rev_all_hi_lag_3)) & !(is.na(rev_all_hi_lag_4)) & !(is.na(rev_all_hi_lag_5))& !(is.na(rev_all_hi_lag_6)) & !(is.na(rev_all_hi_lag_7)) & !(is.na(rev_all_hi_lag_8))& !(is.na(rev_all_hi_lag_9))& !(is.na(rev_all_hi_lag_10)) & !(is.na(rev_all_hi_lag_11)) & !(is.na(rev_all_hi_lag_12)) & !(is.na(rev_all_hi_lag_13))& !(is.na(rev_all_hi_lag_14)) & !(is.na(rev_all_hi_lag_15)) & !(is.na(rev_all_hi_lag_16)) & !(is.na(rev_all_hi_lag_17))& !(is.na(rev_all_hi_lag_18))& !(is.na(rev_all_hi_lag_19))& !(is.na(rev_all_hi_lag_20)) & !(is.na(rev_all_hi_lag_21))& !(is.na(rev_all_hi_lag_22))& !(is.na(rev_all_hi_lag_23))& !(is.na(rev_all_hi_lag_24))& !(is.na(rev_all_hi_lag_25))& !(is.na(rev_all_hi_lead_1))& !(is.na(rev_all_hi_lead_2))& !(is.na(rev_all_hi_lead_3))& !(is.na(rev_all_hi_lead_4))& !(is.na(rev_all_lo))& !(is.na(rev_all_lo_lag_1))& !(is.na(rev_all_lo_lag_2))& !(is.na(rev_all_lo_lag_3))& !(is.na(rev_all_lo_lag_4))& !(is.na(rev_all_lo_lag_5))& !(is.na(rev_all_lo_lag_6))& !(is.na(rev_all_lo_lag_7))& !(is.na(rev_all_lo_lag_8))& !(is.na(rev_all_lo_lag_9))& !(is.na(rev_all_lo_lag_10))& !(is.na(rev_all_lo_lag_11))& !(is.na(rev_all_lo_lag_12))& !(is.na(rev_all_lo_lag_13))& !(is.na(rev_all_lo_lag_14))& !(is.na(rev_all_lo_lag_15))& !(is.na(rev_all_lo_lag_16))& !(is.na(rev_all_lo_lag_17))& !(is.na(rev_all_lo_lag_18))& !(is.na(rev_all_lo_lag_19))& !(is.na(rev_all_lo_lag_20))& !(is.na(rev_all_lo_lag_21))& !(is.na(rev_all_lo_lag_22))& !(is.na(rev_all_lo_lag_23))& !(is.na(rev_all_lo_lag_24))& !(is.na(rev_all_lo_lag_25))& !(is.na(rev_all_lo_lead_1))& !(is.na(rev_all_lo_lead_2))& !(is.na(rev_all_lo_lead_3))& !(is.na(rev_all_lo_lead_4))& !(is.na(ma_split))& !(is.na(ma_split_lag_1))& !(is.na(ma_split_lag_2))& !(is.na(ma_split_lag_3))& !(is.na(ma_split_lag_4))& !(is.na(ma_split_lag_5))& !(is.na(ma_split_lag_6))& !(is.na(ma_split_lag_7))& !(is.na(ma_split_lag_8))& !(is.na(ma_split_lag_9))& !(is.na(ma_split_lag_10))& !(is.na(ma_split_lag_11))& !(is.na(ma_split_lag_12))&!(is.na(ma_split_lag_13))& !(is.na(ma_split_lag_14))& !(is.na(ma_split_lag_15))& !(is.na(ma_split_lag_16))& !(is.na(ma_split_lag_17))& !(is.na(ma_split_lag_18))& !(is.na(ma_split_lag_19))& !(is.na(ma_split_lag_20))& !(is.na(ma_split_lag_21))& !(is.na(ma_split_lag_22))& !(is.na(ma_split_lag_23))& !(is.na(ma_split_lag_24))&!(is.na(ma_split_lag_25))& !(is.na(ma_split_lead_1))& !(is.na(ma_split_lead_2))& !(is.na(ma_split_lead_3))& !(is.na(ma_split_lead_4)) & !(is.na(rev_all_lead_1)) & !(is.na(rev_all_lead_2)) & !(is.na(rev_all_lead_3)) & !(is.na(rev_all_lead_4)) & !(is.na(dist)) & dist > 4)
datafilter <- datafilter %>%
  arrange(artikelnr,period)
saveRDS(datafilter, file="datafilter.Rds")
#
#code as string for the review plots.
codeplot <- "plot(dffig3$week[1:30],dffig3$estimate[1:30], main = 'Reviews', xlab = 'week', ylab = 'log liter',ylim=c(-0.02,0.08), xlim=c(-5,25), pch = 21, bg = 'blue', panel.first = c(abline(a = 0, b = 1, lty = 1, col = 'grey'), abline(a = 0, b = 0, lty = 1,  col = 'grey')))
grid(nx = NULL, ny = NULL)
# Plotting a line between the upper and lower value of the 95% confidence interval.
segments(dffig3$week[1:30], dffig3$l[1:30], dffig3$week[1:30], dffig3$u[1:30])
# Plotting points in the shape of '_' for the upper and lower value of the 95% confidence interval. 
points(dffig3$week[1:30],dffig3$l[1:30], pch = '_')
points(dffig3$week[1:30],dffig3$u[1:30], pch = '_')"
saveRDS(codeplot, file="codeplot.Rds")

##data set for the aom regressions
e3 <- dataexp
codeaom <- "code <- 'e3 <- e3 %>%
group_by(artikelnr) %>%
mutate(rev_all_lag_1 = lag(rev_all, n = 1))'
a = 'rev_all_lag_1'
c = 'n = 1'
for(i in 0:24){
b = paste('rev_all_lag_',i+1,sep = '')
d = paste('n =',i+1,sep = '')
code <- gsub(a,b,code)
code <- gsub(c,d,code)
eval(parse(text = code)) 
a = b
c = d
}"
eval(parse(text = codeaom))
codeaom <-gsub('rev_all','rev_ex_hi',codeaom)
eval(parse(text = codeaom))
codeaom <-gsub('rev_ex_hi','rev_ex_lo',codeaom)
eval(parse(text = codeaom))
codeaom <-gsub('rev_ex_lo','ma_split',codeaom)
eval(parse(text = codeaom))
codeaom <-gsub('ma_split','rev_nyaom',codeaom)
eval(parse(text = codeaom))
codeaom <-gsub('rev_nyaom','rev_nyaom_hi',codeaom)
eval(parse(text = codeaom))
codeaom <-gsub('rev_nyaom_hi','rev_nyaom_lo',codeaom)
eval(parse(text = codeaom))
##datalead
codeaomlead <- "code <- 'e3 <- e3 %>%
group_by(artikelnr) %>%
mutate(rev_all_lead_1 = lead(rev_all, n = 1))'
a = 'rev_all_lead_1'
c = 'n = 1'
for(i in 0:3){
b = paste('rev_all_lead_',i+1,sep = '')
d = paste('n =',i+1,sep = '')
code <- gsub(a,b,code)
code <- gsub(c,d,code)
eval(parse(text = code)) 
a = b
c = d
}"
eval(parse(text = codeaomlead))
codeaomlead <-gsub('rev_all','rev_ex_hi',codeaomlead)
eval(parse(text = codeaomlead))
codeaomlead <-gsub('rev_ex_hi','rev_ex_lo',codeaomlead)
eval(parse(text = codeaomlead))
codeaomlead <-gsub('rev_ex_lo','ma_split',codeaomlead)
eval(parse(text = codeaomlead))
codeaomlead <-gsub('ma_split','rev_nyaom',codeaomlead)
eval(parse(text = codeaomlead))
codeaomlead <-gsub('rev_nyaom','rev_nyaom_hi',codeaomlead)
eval(parse(text = codeaomlead))
codeaomlead <-gsub('rev_nyaom_hi','rev_nyaom_lo',codeaomlead)
eval(parse(text = codeaomlead))
##
colnames(e3)
###
e3 <- ungroup(e3)
dataaom <- subset(e3, !(is.na(rev_all_lead_1)) & !(is.na(rev_all_lead_2)) & !(is.na(rev_all_lead_3)) & !(is.na(rev_all_lead_4)) & !(is.na(dist)) & dist > 4)
dataaom <- dataaom %>%
  arrange(artikelnr,period)
saveRDS(dataaom, file="dataaom.Rds")

#tidynonaom
library(broom)
library(lfe)
nonaomreg <- felm(llitre ~ rev_nyaom + rev_nyaom_lag_1 + rev_nyaom_lag_2 + rev_nyaom_lag_3 + rev_nyaom_lag_4 + rev_nyaom_lag_5 + rev_nyaom_lag_6 + rev_nyaom_lag_7 + rev_nyaom_lag_8 + rev_nyaom_lag_9 + rev_nyaom_lag_10 + rev_nyaom_lag_11 + rev_nyaom_lag_12 + rev_nyaom_lag_13 + rev_nyaom_lag_14 + rev_nyaom_lag_15 + rev_nyaom_lag_16 + rev_nyaom_lag_17 + rev_nyaom_lag_18 + rev_nyaom_lag_19 + rev_nyaom_lag_20 + rev_nyaom_lag_21 + rev_nyaom_lag_22 + rev_nyaom_lag_23 + rev_nyaom_lag_24 + rev_nyaom_lag_25  + rev_nyaom_lead_1 + rev_nyaom_lead_2 + rev_nyaom_lead_3 + rev_nyaom_lead_4 + rev_nyaom_hi + rev_nyaom_hi_lag_1 + rev_nyaom_hi_lag_2 + rev_nyaom_hi_lag_3 + rev_nyaom_hi_lag_4 + rev_nyaom_hi_lag_5 + rev_nyaom_hi_lag_6 + rev_nyaom_hi_lag_7 + rev_nyaom_hi_lag_8 + rev_nyaom_hi_lag_9 + rev_nyaom_hi_lag_10 + rev_nyaom_hi_lag_11 + rev_nyaom_hi_lag_12 + rev_nyaom_hi_lag_13 + rev_nyaom_hi_lag_14 + rev_nyaom_hi_lag_15 + rev_nyaom_hi_lag_16 + rev_nyaom_hi_lag_17 + rev_nyaom_hi_lag_18 + rev_nyaom_hi_lag_19 + rev_nyaom_hi_lag_20 + rev_nyaom_hi_lag_21 + rev_nyaom_hi_lag_22 + rev_nyaom_hi_lag_23 + rev_nyaom_hi_lag_24 + rev_nyaom_hi_lag_25 + rev_nyaom_hi_lead_1 + rev_nyaom_hi_lead_2 + rev_nyaom_hi_lead_3 + rev_nyaom_hi_lead_4 + rev_nyaom_lo + rev_nyaom_lo_lag_1 + rev_nyaom_lo_lag_2 + rev_nyaom_lo_lag_3 + rev_nyaom_lo_lag_4 + rev_nyaom_lo_lag_5 + rev_nyaom_lo_lag_6 + rev_nyaom_lo_lag_7 + rev_nyaom_lo_lag_8 + rev_nyaom_lo_lag_9 + rev_nyaom_lo_lag_10 + rev_nyaom_lo_lag_11 + rev_nyaom_lo_lag_12 + rev_nyaom_lo_lag_13 + rev_nyaom_lo_lag_14 + rev_nyaom_lo_lag_15 + rev_nyaom_lo_lag_16 + rev_nyaom_lo_lag_17 + rev_nyaom_lo_lag_18 + rev_nyaom_lo_lag_19 + rev_nyaom_lo_lag_20 + rev_nyaom_lo_lag_21 + rev_nyaom_lo_lag_22 + rev_nyaom_lo_lag_23 + rev_nyaom_lo_lag_24 + rev_nyaom_lo_lag_25 + rev_nyaom_lo_lead_1 + rev_nyaom_lo_lead_2 + rev_nyaom_lo_lead_3 + rev_nyaom_lo_lead_4 + ma_split + ma_split_lag_1 + ma_split_lag_2 + ma_split_lag_3 + ma_split_lag_4 + ma_split_lag_5 + ma_split_lag_6 + ma_split_lag_7 + ma_split_lag_8 + ma_split_lag_9 + ma_split_lag_10 + ma_split_lag_11 + ma_split_lag_12 + ma_split_lag_13 + ma_split_lag_14 + ma_split_lag_15 + ma_split_lag_16 + ma_split_lag_17 + ma_split_lag_18 + ma_split_lag_19 + ma_split_lag_20 + ma_split_lag_21 + ma_split_lag_22 + ma_split_lag_23 + ma_split_lag_24 +ma_split_lag_25 + ma_split_lead_1 + ma_split_lead_2 + ma_split_lead_3 + ma_split_lead_4 | time_segm_price + artikpr | 0 | artikelid, data = dataaom)
tidynonaom <- tidy(nonaomreg)
saveRDS(tidynonaom, file = "tidynonaom.RDS")
#tidyfig3
fig3reg <- felm(llitre ~ rev_all + rev_all_lag_1 + rev_all_lag_2 + rev_all_lag_3 + rev_all_lag_4 + rev_all_lag_5 + rev_all_lag_6 + rev_all_lag_7 + rev_all_lag_8 + rev_all_lag_9 + rev_all_lag_10 + rev_all_lag_11 + rev_all_lag_12 + rev_all_lag_13 + rev_all_lag_14 + rev_all_lag_15 + rev_all_lag_16 + rev_all_lag_17 + rev_all_lag_18 + rev_all_lag_19 + rev_all_lag_20 + rev_all_lag_21 + rev_all_lag_22 + rev_all_lag_23 + rev_all_lag_24 + rev_all_lag_25+ rev_all_lead_1 + rev_all_lead_2 + rev_all_lead_3 + rev_all_lead_4 + rev_all_hi + rev_all_hi_lag_1 + rev_all_hi_lag_2 + rev_all_hi_lag_3 + rev_all_hi_lag_4 + rev_all_hi_lag_5 + rev_all_hi_lag_6 + rev_all_hi_lag_7 + rev_all_hi_lag_8 + rev_all_hi_lag_9 + rev_all_hi_lag_10 + rev_all_hi_lag_11 + rev_all_hi_lag_12 + rev_all_hi_lag_13 + rev_all_hi_lag_14 + rev_all_hi_lag_15 + rev_all_hi_lag_16 + rev_all_hi_lag_17 + rev_all_hi_lag_18 + rev_all_hi_lag_19 + rev_all_hi_lag_20 + rev_all_hi_lag_21 + rev_all_hi_lag_22 + rev_all_hi_lag_23 + rev_all_hi_lag_24 + rev_all_hi_lag_25 + rev_all_hi_lead_1 + rev_all_hi_lead_2 + rev_all_hi_lead_3 + rev_all_hi_lead_4 + rev_all_lo + rev_all_lo_lag_1 + rev_all_lo_lag_2 + rev_all_lo_lag_3 + rev_all_lo_lag_4 + rev_all_lo_lag_5 + rev_all_lo_lag_6 + rev_all_lo_lag_7 + rev_all_lo_lag_8 + rev_all_lo_lag_9 + rev_all_lo_lag_10 + rev_all_lo_lag_11 + rev_all_lo_lag_12 + rev_all_lo_lag_13 + rev_all_lo_lag_14 + rev_all_lo_lag_15 + rev_all_lo_lag_16 + rev_all_lo_lag_17 + rev_all_lo_lag_18 + rev_all_lo_lag_19 + rev_all_lo_lag_20 + rev_all_lo_lag_21 + rev_all_lo_lag_22 + rev_all_lo_lag_23 + rev_all_lo_lag_24 + rev_all_lo_lag_25 + rev_all_lo_lead_1 + rev_all_lo_lead_2 + rev_all_lo_lead_3 + rev_all_lo_lead_4 + ma_split + ma_split_lag_1 + ma_split_lag_2 + ma_split_lag_3 + ma_split_lag_4 + ma_split_lag_5 + ma_split_lag_6 + ma_split_lag_7 + ma_split_lag_8 + ma_split_lag_9 + ma_split_lag_10 + ma_split_lag_11 + ma_split_lag_12 + ma_split_lag_13 + ma_split_lag_14 + ma_split_lag_15 + ma_split_lag_16 + ma_split_lag_17 + ma_split_lag_18 + ma_split_lag_19 + ma_split_lag_20 + ma_split_lag_21 + ma_split_lag_22 + ma_split_lag_23 + ma_split_lag_24 + ma_split_lag_25 + ma_split_lead_1 + ma_split_lead_2 + ma_split_lead_3 + ma_split_lead_4 | time_segm_price + artikpr | 0 | artikelid, data = datafilterreg)
dffig3 <- tidy(fig3reg)
saveRDS(dffig3, file="tidyfig3.Rds")
##tidyaom
aomreg <- felm(llitre ~ rev_ex_hi + rev_ex_hi_lag_1 + rev_ex_hi_lag_2 + rev_ex_hi_lag_3 + rev_ex_hi_lag_4 + rev_ex_hi_lag_5 + rev_ex_hi_lag_6 + rev_ex_hi_lag_7 + rev_ex_hi_lag_8 + rev_ex_hi_lag_9 + rev_ex_hi_lag_10 + rev_ex_hi_lag_11 + rev_ex_hi_lag_12 + rev_ex_hi_lag_13 + rev_ex_hi_lag_14 + rev_ex_hi_lag_15 + rev_ex_hi_lag_16 + rev_ex_hi_lag_17 + rev_ex_hi_lag_18 + rev_ex_hi_lag_19 + rev_ex_hi_lag_20 + rev_ex_hi_lag_21 + rev_ex_hi_lag_22 + rev_ex_hi_lag_23 + rev_ex_hi_lag_24 + rev_ex_hi_lag_25 + rev_ex_hi_lead_1 + rev_ex_hi_lead_2 + rev_ex_hi_lead_3 + rev_ex_hi_lead_4 + rev_ex_lo + rev_ex_lo_lag_1 + rev_ex_lo_lag_2 + rev_ex_lo_lag_3 + rev_ex_lo_lag_4 + rev_ex_lo_lag_5 + rev_ex_lo_lag_6 + rev_ex_lo_lag_7 + rev_ex_lo_lag_8 + rev_ex_lo_lag_9 + rev_ex_lo_lag_10 + rev_ex_lo_lag_11 + rev_ex_lo_lag_12 + rev_ex_lo_lag_13 + rev_ex_lo_lag_14 + rev_ex_lo_lag_15 + rev_ex_lo_lag_16 + rev_ex_lo_lag_17 + rev_ex_lo_lag_18 + rev_ex_lo_lag_19 + rev_ex_lo_lag_20 + rev_ex_lo_lag_21 + rev_ex_lo_lag_22 + rev_ex_lo_lag_23 + rev_ex_lo_lag_24 + rev_ex_lo_lag_25 + rev_ex_lo_lead_1 + rev_ex_lo_lead_2 + rev_ex_lo_lead_3 + rev_ex_lo_lead_4 + ma_split + ma_split_lag_1 + ma_split_lag_2 + ma_split_lag_3 + ma_split_lag_4 + ma_split_lag_5 + ma_split_lag_6 + ma_split_lag_7 + ma_split_lag_8 + ma_split_lag_9 + ma_split_lag_10 + ma_split_lag_11 + ma_split_lag_12 + ma_split_lag_13 + ma_split_lag_14 + ma_split_lag_15 + ma_split_lag_16 + ma_split_lag_17 + ma_split_lag_18 + ma_split_lag_19 + ma_split_lag_20 + ma_split_lag_21 + ma_split_lag_22 + ma_split_lag_23 + ma_split_lag_24 + ma_split_lag_25 + ma_split_lead_1 + ma_split_lead_2 + ma_split_lead_3 + ma_split_lead_4 | time_segm_price + artikpr | 0 | artikelid, data = dataaom)
tidyaom <- tidy(aomreg)
saveRDS(tidyaom, file="tidyaom.RDS")
#
datacc <- datasort %>%
  mutate(country = 
           ifelse(country == 'Australien', 'Australia',
                  ifelse(country == 'Bulgarien', 'Bulgaria', 
                         ifelse(country == 'Cypern','Cyprus',
                                ifelse(country == 'Frankrike','France',
                                       ifelse(country == 'Grekland','Greece',
                                              ifelse(country == 'Italien','Italy',
                                                     ifelse(country == 'Libanon','Lebanon',
                                                            ifelse(country == 'Nya Zeeland','New Zealand',
                                                                   ifelse(country == 'Österrike','Austria',
                                                                          ifelse(country == 'Övriga ursprung','Greenland',
                                                                                 ifelse(country == 'Rumänien','Romania',
                                                                                        ifelse(country == 'Spanien','Spain',
                                                                                               ifelse(country == 'Sverige','Sweden',
                                                                                                      ifelse(country == 'Sydafrika','South Africa',
                                                                                                             ifelse(country == 'Tyskland','Germany',
                                                                                                                    ifelse(country == 'Ungern','Hungary',
                                                                                                                           ifelse(country == 'USA','USA',country)
                                                                                                                    ))))))))))))))))) 
saveRDS(datacc, file = "datacc.Rds")
#
e4 <- e2
codeabove <- "code <- 'e4 <- e4 %>%
group_by(artikelnr) %>%
mutate(rev_eve_lag_1 = lag(rev_eve, n = 1))'
a = 'rev_eve_lag_1'
c = 'n = 1'
for(i in 0:9){
b = paste('rev_eve_lag_',i+1,sep = '')
d = paste('n =',i+1,sep = '')
code <- gsub(a,b,code)
code <- gsub(c,d,code)
eval(parse(text = code)) 
a = b
c = d
}"
eval(parse(text = codeabove))
codeabove <-gsub('rev_eve','rev_eve_hi',codeabove)
eval(parse(text = codeabove))
codeabove <-gsub('rev_eve_hi','rev_eve_lo',codeabove)
eval(parse(text = codeabove))
e4 <- ungroup(e4)
#umlaut
e4sort <- e4[order(e4$artikelnr),]
e4mc <- e4 %>%
  mutate(m_country = ifelse(country == "Österrike","Oesterrike",
                            ifelse(country == "Övriga ursprung","Oevriga ursprung",
                                   ifelse(country == "Rumänien","Rumaenien",country))))
#
tab3 <- e4mc
#medhigh
tab3 <- tab3 %>%
  mutate(medhigh = ifelse(price_segm == 'h', 1, ifelse(price_segm == 'm', 1, 0)))
#neworld
tab3 <- tab3 %>%
  mutate(newworld = ifelse(m_country %in% c("Argentina", "Australien", "Chile", "Nya Zeeland", "Portugal", "Sydafrika", "USA"),1, ifelse(m_country %in% c("Sverige", "Grekland", "Libanon", "Oesterrike", "Uruguay", "Isreal", "Oevriga ursprung", "Bulgarien", "Rumaenien","Cypern"),NA,0)))
#ma_brands
#legal_m
tab3 <- tab3 %>% 
  mutate(ma_brands = ifelse(is.na(ma_split),0,ifelse(ma_split <= 0,0,1)),
         legal_m = ifelse(date > "2003-05-15",1,0))
#new
#vin_brands
tab3 <- tab3 %>%
  mutate(new = ifelse(old == 0,1,0),
         vint_brands = ifelse(vintage != "n",1,0))
#high_var 
highvar <- tab3 %>%
  group_by(m_country,region,year) %>%
  summarize("standard_deviation" = sd(na.omit(v10_all))) %>%
  mutate(highvar_q = ifelse(is.na(standard_deviation) | standard_deviation < 3.040,0,1))
mergehighvar <- merge(tab3, highvar, by = c("m_country","region","year"))
tab3dummies <- mergehighvar[order(mergehighvar$artikelnr),]
tab3dummies <- subset(tab3dummies, !(is.na(rev_all_lead_1)) & !(is.na(rev_all_lead_2)) & !(is.na(rev_all_lead_3)) & !(is.na(rev_all_lead_4)) & !(is.na(dist)) & dist > 4)
tab3 <- tab3dummies %>%
  arrange(artikelnr,period)
#
codenew <- paste0(
  "new <- tab3dummies
  
  new$Review <- 0
  new$GoodReview <- 0
  new$BadReview <- 0","
  
  codecate <- 'new <- new %>%
  mutate(Review = ifelse(rev_all_lag_1 == 1 & new == 1,1,Review),
  GoodReview = ifelse(rev_all_hi_lag_1 == 1 & new == 1,1,GoodReview),
  BadReview = ifelse(rev_all_lo_lag_1 == 1 & new == 1,1,BadReview))'",
  "\n",
  "for(i in 2:11){
  eval(parse(text = codeloop))
  }
  # Checking the non-lagged variable, which is basically lag_0. 
  new <- new %>%
  mutate(Review = ifelse(rev_all == 1 & new == 1,1,Review),
  GoodReview = ifelse(rev_all_hi == 1 & new == 1,1,GoodReview),
  BadReview = ifelse(rev_all_lo == 1 & new == 1,1,BadReview))
  newsort <- new[order(new$artikelnr),]
  
  newreg <- felm(llitre ~ Review + GoodReview + BadReview + new + rev_all + rev_all_lag_1 + rev_all_lag_2 + 
  rev_all_lag_3 + rev_all_lag_4 + rev_all_lag_5 + rev_all_lag_6 + rev_all_lag_7 + rev_all_lag_8 + rev_all_lag_9 + 
  rev_all_lag_10 + rev_all_lag_11 + rev_all_lag_12 + rev_all_lag_13 + rev_all_lag_14 + rev_all_lag_15 + 
  rev_all_lag_16 + rev_all_lag_17 + rev_all_lag_18 + rev_all_lag_19 + rev_all_lag_20 + rev_all_lag_21 + 
  rev_all_lag_22 + rev_all_lag_23 + rev_all_lag_24 + rev_all_lag_25  + rev_all_lead_1 + rev_all_lead_2 + 
  rev_all_lead_3 + rev_all_lead_4 + rev_all_hi + rev_all_hi_lag_1 + rev_all_hi_lag_2 + rev_all_hi_lag_3 + rev_all_hi_lag_4 + 
  rev_all_hi_lag_5 + rev_all_hi_lag_6 + rev_all_hi_lag_7 + rev_all_hi_lag_8 + rev_all_hi_lag_9 + rev_all_hi_lag_10 + 
  rev_all_hi_lag_11 + rev_all_hi_lag_12 + rev_all_hi_lag_13 + rev_all_hi_lag_14 + rev_all_hi_lag_15 + 
  rev_all_hi_lag_16 + rev_all_hi_lag_17 + rev_all_hi_lag_18 + rev_all_hi_lag_19 + rev_all_hi_lag_20 + 
  rev_all_hi_lag_21 + rev_all_hi_lag_22 + rev_all_hi_lag_23 + rev_all_hi_lag_24 + rev_all_hi_lag_25 + 
  rev_all_hi_lead_1 + rev_all_hi_lead_2 + rev_all_hi_lead_3 + rev_all_hi_lead_4 + rev_all_lo + rev_all_lo_lag_1 + rev_all_lo_lag_2
  + rev_all_lo_lag_3 + rev_all_lo_lag_4 + rev_all_lo_lag_5 + rev_all_lo_lag_6 + rev_all_lo_lag_7 + rev_all_lo_lag_8 + 
  rev_all_lo_lag_9 + rev_all_lo_lag_10 + rev_all_lo_lag_11 + rev_all_lo_lag_12 + rev_all_lo_lag_13 + rev_all_lo_lag_14
  + rev_all_lo_lag_15 + rev_all_lo_lag_16 + rev_all_lo_lag_17 + rev_all_lo_lag_18 + rev_all_lo_lag_19 + rev_all_lo_lag_20 
  + rev_all_lo_lag_21 + rev_all_lo_lag_22 + rev_all_lo_lag_23 + rev_all_lo_lag_24 + rev_all_lo_lag_25 + rev_all_lo_lead_1 + 
  rev_all_lo_lead_2 + rev_all_lo_lead_3 + rev_all_lo_lead_4 + ma_split + 
  ma_split_lag_1 + ma_split_lag_2 + ma_split_lag_3 + ma_split_lag_4 + ma_split_lag_5 + ma_split_lag_6 + 
  ma_split_lag_7 + ma_split_lag_8 + ma_split_lag_9 + ma_split_lag_10 + ma_split_lag_11 + ma_split_lag_12 +
  ma_split_lag_13 + ma_split_lag_14 + ma_split_lag_15 + ma_split_lag_16 + ma_split_lag_17 + ma_split_lag_18 + 
  ma_split_lag_19 + ma_split_lag_20 + ma_split_lag_21 + ma_split_lag_22 + ma_split_lag_23 + ma_split_lag_24 +
  ma_split_lag_25 + ma_split_lead_1 + ma_split_lead_2 + ma_split_lead_3 + ma_split_lead_4 | time_segm_price + 
  artikpr | 0 | artikelid, data = newsort)
  newsummary <- summary(newreg)")
#
tidynew <- tidy(newreg)
exclude <- tidynew[4:124,1]
saveRDS(exclude, file = "exclude.RDS")