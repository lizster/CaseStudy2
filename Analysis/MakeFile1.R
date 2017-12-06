##############################################
##CASE STUDY 2
##############################################

#if (!require(XML)) install.packages('XML')
library(dplyr)
library(XML)
library(rvest)
#library(RCurl)

link = "https://en.wikipedia.org/wiki/List_of_countries_by_Human_Development_Index#Complete_list_of_countries"
doc <- read_html(link) 
node <- html_nodes(doc,"table")
tables <- html_table(node, fill = TRUE)

df1 <- as.data.frame(tables[4]) #Very High Human Development1
df2 <- as.data.frame(tables[5]) #Very High Human Development2
df3 <- as.data.frame(tables[7]) #High Human Development1
df4 <- as.data.frame(tables[8]) #High Human Development2
df5 <- as.data.frame(tables[10]) #Medium Human Development1
df6 <- as.data.frame(tables[11]) #Medium Human Development2
df7 <- as.data.frame(tables[13]) #Low Human Development1
df8 <- as.data.frame(tables[14]) #Low Human Development2

#Clean Up data frames and add category
df1 <- df1[-1,3:4]
colnames(df1) <- c('Country','HDI')
df1$Category <- "Very High"

df2 <- df2[-1,3:4]
colnames(df2) <- c('Country','HDI')
df2$Category <- "Very High"

df3 <- df3[-1,3:4]
colnames(df3) <- c('Country','HDI')
df3$Category <- "High"

df4 <- df4[-1,3:4]
colnames(df4) <- c('Country','HDI')
df4$Category <- "High"

df5 <- df5[-1,3:4]
colnames(df5) <- c('Country','HDI')
df5$Category <- "Medium"

df6 <- df6[-1,3:4]
colnames(df6) <- c('Country','HDI')
df6$Category <- "Medium"

df7 <- df7[-1,3:4]
colnames(df7) <- c('Country','HDI')
df7$Category <- "Low"

df8 <- df8[-1,3:4]
colnames(df8) <- c('Country','HDI')
df8$Category <- "Low"

#Combine data frames
df <- rbind(df1,df2,df3,df4,df5,df6,df7,df8)

write.csv(df, "HumanDevelopmentIndex.csv",row.names = FALSE)
