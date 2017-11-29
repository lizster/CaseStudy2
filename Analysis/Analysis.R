df <- read.csv('Data/Procrastination2.csv')

#4a
df2 <- df[df$Age > 18,]

#4b
AgeSummary <- summary(df2$Age)

FourB <- matrix(AgeSummary[1],AgeSummary[4],AgeSummary[6],AgeSummary[7])
FourB2 <- table(AgeDesc)
#needs more work

#4c.
table(df$Gender)

table(df$WorkStatus)
df %>% count(WorkStatus, sort=TRUE)

df %>% count(Occupation, sort=TRUE)

#4d.

df %>% count(Country, sort=TRUE)

#4e
A <- table(df$YouPro,df$OthersPro)
A[-1,-1]
#could use some labels

#Question 5a
library(ggplot2)
library(ggthemes)
library(plyr)

#df2 <- head(sort(df$DPmean,decreasing=TRUE), n = 15)


ggplot(data = df, aes(y = DPmean,x = Country)) + 
  geom_col(aes(fill = Category)) +
  coord_flip() +
  labs(y = 'Median ABV',title = 'Top 15 Nations Average Procrastination Scores') +
  theme_economist() +
  theme(plot.title = element_text(hjust = 0.5))

#Question 5c

#Question 5d


