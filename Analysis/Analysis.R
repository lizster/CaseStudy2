df <- read.csv('Procrastination2.csv')

#4a
df2 <- df[df$Age > 18,]

#4b
AgeSummary <- summary(df2$Age)

FourB <- matrix(AgeSummary[1],AgeSummary[4],AgeSummary[6],AgeSummary[7])
FourB2 <- table(AgeDesc)
