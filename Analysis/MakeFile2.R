library(data.table)

HDI <- read.csv('HumanDevelopmentIndex.csv')
pro <- read.csv('Procrastination.csv')

df <- merge(x = pro,y = HDI,by.x = 'Country.of.residence', by.y = "Country")

#Questions 2a
one <- data.frame(nrow(pro),ncol(pro))
colnames(one) <- c("Number of Rows", "Number of Columns")

#Question 2b
colnames(df)[1] <- 'Country'
colnames(df)[2] <- 'Age'
colnames(df)[3] <- 'Gender'
colnames(df)[4] <- 'KidStatus'
colnames(df)[5] <- 'Education'
colnames(df)[6] <- 'WorkStatus'
colnames(df)[7] <- 'Income'
colnames(df)[8] <- 'Occupation'
colnames(df)[9] <- 'TenureYears'
colnames(df)[10] <- 'TenureMonths'
colnames(df)[11] <- 'CommunitySize'
colnames(df)[12] <- 'MatritalStatus'
colnames(df)[13] <- 'Sons'
colnames(df)[14] <- 'Daughters'
#colnames(df)[15] <- '' 

#Question 2c
df$Country <- as.character(df$Country)
df$Age <- as.integer(df$Age)

levels(df$Education)[levels(df$Education)=="deg"] <- "Bachelors"
levels(df$Education)[levels(df$Education)=="dip"] <- "Diploma"
levels(df$Education)[levels(df$Education)=="ma"] <- "Masters"
levels(df$Education)[levels(df$Education)=="phd"] <- "Doctorate"
levels(df$Education)[levels(df$Education)=="high"] <- "Diploma"
levels(df$Education)[levels(df$Education)=="deg"] <- "Bachelors"
levels(df$Education)[levels(df$Education)=="lthigh"] <- "Some High School"
levels(df$Education)[levels(df$Education)=="ltuni"] <- "Some University"
levels(df$Education)[levels(df$Education)=="grade"] <- "Grade School"

levels(df$WorkStatus)[levels(df$WorkStatus)=="0"] <- "unemployed"

levels(df$Occupation)[levels(df$Occupation)=="0"] <- ""
levels(df$Occupation)[levels(df$Occupation)=="please specify"] <- ""
levels(df$Occupation)[levels(df$Occupation)=="na"] <- ""
levels(df$Occupation)[levels(df$Occupation)==" veterinarian"] <- "Veterinarian"
levels(df$Occupation)[levels(df$Occupation)==" Teaching Assistant/Graduate student"] <- "Teacher"
levels(df$Occupation)[levels(df$Occupation)=="abc"] <- ""
levels(df$Occupation)[levels(df$Occupation)=="'Utterly shiftless arts student'... at p"] <- ""
#Needs more work


df$TenureYears <- as.integer(df$TenureYears)
df$TenureYears[df$TenureYears == 999] <- NA

levels(df$CommunitySize)[levels(df$CommunitySize)=="0"] <- ""
levels(df$CommunitySize)[levels(df$CommunitySize)=="8"] <- ""
levels(df$CommunitySize)[levels(df$CommunitySize)=="Large Town"] <- "Large-City"
levels(df$CommunitySize)[levels(df$CommunitySize)=="Small City"] <- "Small-City"
levels(df$CommunitySize)[levels(df$CommunitySize)=="Small Town"] <- "Small-City"
levels(df$CommunitySize)[levels(df$CommunitySize)=="Medium-Sized"] <- "Medium-City"

levels(df$MatritalStatus)[levels(df$MatritalStatus)=="0"] <- ""

df$Sons <- as.integer(df$Sons)

df$DPmean <- rowMeans(df[15:19],na.rm = TRUE)
df$AIPmean <- rowMeans(df[20:34],na.rm = TRUE)
df$GPmean <- rowMeans(df[35:54],na.rm = TRUE)
df$SWLSmean <- rowMeans(df[55:59],na.rm = TRUE)

write.csv(df,"Procrastination2.csv",row.names = FALSE)
