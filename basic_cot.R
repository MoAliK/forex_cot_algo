install.packages('Quandl')
library('Quandl')
cot <- Quandl("CFTC/JY_FO_ALL", api_key="yzYhJsKyhP9zEHM2PAsA") #extracts cot report for JPY/USD, all cot reports have USD as denominator
cot_jpy_long <- ((cot[,15]/(cot[,15]+cot[,16]))) #calculates %long of all reportable trades at the weekly timepoint
plot(density(cot_jpy_long)) #identify bimodal means
density(cot_jpy_long) #identify quartiles
sigdev_jpylong_1 <- which((cot_jpy_long) < (0.4788)) #lower than first bimode peak
sigdev_jpylong_2 <- which((cot_jpy_long) > (0.5591)) # higher than second bimode peak
notable_deviations <- cot[sigdev_jpylong1,1] #dates of notable deviations for jpylong low long contracts
notable_deviations <- cot[sigdev_jpylong2,1] #dates of notable deviations for jpylong high long contracts

cot_jpy_short <- ((cot[,16]/(cot[,15]+cot[,16]))) #calculates %short of all reportable trades at the weekly timepoint
plot(density(cot_jpy_short)) #identify bimodal means
density(cot_jpy_short) #identify quartiles
sigdev_jpyshort_1 <- which((cot_jpy_short) < (0.4409)) #lower than first quartile 
sigdev_jpyshort_2 <- which((cot_jpy_short) > (0.51)) # higher than 3rd quartile 
notable_deviations <- cot[sigdev_jpyshort1,1] #dates of notable deviations for jpyshort low short contracts
notable_deviations <- cot[sigdev_jpyshort2,1] #dates of notable deviations for jpyshort high short contracts
