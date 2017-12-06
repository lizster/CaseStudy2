

df <- read.csv('Procrastination2.csv')

#4a
df2 <- df[df$Age > 18,]

#4b
q4b <- summary(df2$Age)


q4b2 <- table(matrix(q4b[1],q4b[4],q4b[6],q4b[7]))

q4b2


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

<<<<<<< HEAD
#df2 <- head(sort(df$DPmean,decreasing=TRUE), n = 15)
df2 <- aggregate(DPmean ~ Country, mean)

question5A <- ggplot(data = df, aes(Country,DPmean)) + 
                geom_col(aes(fill = Category))
                #coord_flip() +
                #labs(y = 'Median ABV',title = 'Top 15 Nations Average Procrastination Scores') +
                #theme_economist() +
                #theme(plot.title = element_text(hjust = 0.5))

print(question5A)
=======

df3 <- aggregate(DPmean ~ Country + Category,data = df2, mean)

df3 <- head(df3[order(df3$DPmean, decreasing = TRUE),], n = 15)


ggplot(data = df3, aes(y = DPmean,x = reorder(Country,DPmean))) + 
  geom_col(aes(fill = Category)) +
  coord_flip() +
  labs(x = 'Country',y = 'DP Mean',title = 'Top 15 Nations Average Procrastination Scores') +
  theme_economist() +
  theme(plot.title = element_text(hjust = 0.5)) 

>>>>>>> aa0078261eebd67698af871d22de923f61083dbf
#Question 5c

#Question 5d
Q5d <- ggplot(data = df, aes(x = Age,y = log(Income))) + 
      geom_point(aes(color=Gender)) +
      labs(x = 'Age', y = 'Income',title = 'Relationship Between Age and Income') +
      theme_economist() +
      theme(plot.title = element_text(hjust = 0.5)) +
      geom_smooth(method = 'lm')

print(Q5d) 

Q5dlm <- lm(log(Income) ~ Age, data = df)
summary(Q5dlm)

#Question 5e
Q5e <- ggplot(data = df, aes(x = HDI,y = SWLSmean)) + 
        geom_point() +
        labs(x = 'Age', y = 'Income',title = 'Relationship Between Human Development Index and Life Satisfaction') +
        theme_economist() +
        theme(plot.title = element_text(hjust = 0.5)) +
        geom_smooth(method = 'lm')

print(Q5e) 

Q5elm <- lm(SWLSmean ~ HDI, data = df)
summary(Q5elm)

Q5e2 <- ggplot(data = df, aes(y = SWLSmean,x = HDI)) + 
          geom_col() +
          #coord_flip() +
          labs(x = 'HDI',y = 'Mean SWLS',title = 'Relationship Between Human Development Index and Life Satisfaction') +
          theme_economist() +
          theme(plot.title = element_text(hjust = 0.5))

print(Q5e2)
