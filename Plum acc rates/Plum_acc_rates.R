###################################################
# Accumulation rates for Plum outputs 
#
# Description:
#  This script calculates the accumulation rates by 
# depth and age from the Plum output and send it to 
# the ages files in the case of accumulation rates 
# by depth and to a new file in the case of accumu-
# lation rates by age
#
# Marco A. Aquino-López
###################################################
rm(list = ls()) 	# clean R environment

library(rplum)          # load the Plum library

core = "HP1C"
dir = "~/Plum_runs/"    # Plum_runs directory, change if you running from somewhere else 
dir = paste0(dir,core,'/')

Plum()                  # running Plum, add run = False if you want to use a previous run 

# read the age file from bacon 
files = list.files(dir, '_ages.txt') # reads the age files in the folder 
age_file = read.table(paste0(dir,files[1]),sep="\t",header=TRUE)
# creates empty vectors to save the accumulation rates
age_file$acc.mean = rep(NA,length(age_file$depth))
age_file$acc.min = rep(NA,length(age_file$depth))
age_file$acc.max = rep(NA,length(age_file$depth))

cnt <- 1
for (i in age_file$depth){
	dat <- accrate.depth(i)
	age_file$acc.mean[cnt] = mean(dat)
	age_file$acc.min[cnt]  = quantile(dat, probs = .025) 
	age_file$acc.max[cnt]  = quantile(dat, probs = .975)
	cnt = cnt + 1
}
# save the results into the age_file
write.table(round(age_file,2), paste0(dir,files[1]),sep="\t",col.names=TRUE,row.names = FALSE)

###########
# This is use to generate the accumulation rates by year
###########
ages = seq(age_file$mean[1], tail(age_file$mean,1),1)
acc.mean = rep(NA,length(ages))
acc.min  = rep(NA,length(ages))
acc.max  = rep(NA,length(ages))
progress_bar = txtProgressBar(min=1, max=length(ages), style = 3, char="*")
cnt <- 1
for (i in ages){
	dat <- accrate.age(i)
	acc.mean[cnt] = mean(dat,na.rm=TRUE)
	acc.min[cnt]  = quantile(dat, probs = .025,na.rm=TRUE) 
	acc.max[cnt]  = quantile(dat, probs = .975,na.rm=TRUE)
	cnt = cnt + 1
	setTxtProgressBar(progress_bar, value = i)
}
close(progress_bar)
acc_ages = matrix(c(ages,acc.min,acc.mean,acc.max),ncol=4)
colnames(acc_ages) <- c('Age','min','mean','max')

write.table(round(acc_ages,2), paste0(dir,core,"_acc_age.txt"),sep="\t",col.names=TRUE,row.names=FALSE)





