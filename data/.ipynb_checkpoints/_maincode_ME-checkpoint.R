options(stringsAsFactors=FALSE)
me1 <- read.csv("/Users/cervas/Google Drive/Projects/PGP/Maine/CD2-2018/me1.csv")
me2 <- read.csv("/Users/cervas/Google Drive/Projects/PGP/Maine/CD2-2018/me2.csv")
me3 <- read.csv("/Users/cervas/Google Drive/Projects/PGP/Maine/CD2-2018/me3.csv")
me4 <- read.csv("/Users/cervas/Google Drive/Projects/PGP/Maine/CD2-2018/me4.csv")
me5 <- read.csv("/Users/cervas/Google Drive/Projects/PGP/Maine/CD2-2018/me5.csv")
me6 <- read.csv("/Users/cervas/Google Drive/Projects/PGP/Maine/CD2-2018/me6.csv")
me7 <- read.csv("/Users/cervas/Google Drive/Projects/PGP/Maine/CD2-2018/me7.csv")
me8 <- read.csv("/Users/cervas/Google Drive/Projects/PGP/Maine/CD2-2018/me8.csv")

colnames_me <- c("record", "precinct", "ballot_style", "rank1", "rank2", "rank3", "rank4", "rank5")
	colnames(me1) <- colnames(me2) <- colnames(me3) <- colnames(me4) <- colnames(me5) <- colnames(me6) <- colnames(me7) <- colnames(me8) <- colnames_me
me.list <- list(me1,me2,me3,me4,me5,me6,me7,me8)
	me.all <- do.call(rbind,me.list)
write.csv(me.all, "/Users/cervas/Google Drive/Projects/PGP/Maine/CD2-2018/ME_all.csv", row.names=F)



# Round 1
	table(me.all$rank1)
	length(me.all$rank1)

# -----------------------

# Round 2 - Re-allocate Hoar second choices
	me.all$round2 <- me.all$rank1
		reallocate <- me.all$rank1=="Hoar, William R.S."

# Reallocations from Hoar
	table(me.all$rank2[reallocate])

me.all$round2[reallocate] <- me.all$rank2[reallocate]
	# Round two results
		table(me.all$round2)
		length(me.all$round2)

# -----------------------

# Round 3 - Re-allocate Hoar second choices
	me.all$round3 <- me.all$round2
		# Who voted for Bond in first round?
			reallocate_r2 <- me.all$round2=="Bond, Tiffany L."
				table(reallocate_r2)
		

		#This is for our benefit to understand how voters are casting votes in RCV
		# Of those who voted Bond in first round, who voted Hoar (and thus skip to rank three) in second round?
			reallocate_r2_2 <- me.all$rank2[reallocate_r2]=="Hoar, William R.S."
				table(reallocate_r2_2)
				table(me.all$rank3[reallocate_r2_2])

# Reallocations from Bond
	table(me.all$rank2[reallocate_r2])

me.all$round3[reallocate_r2] <- me.all$rank2[reallocate_r2]
table(me.all$round2)
length(me.all$round2)
