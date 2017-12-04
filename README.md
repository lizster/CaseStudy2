## Project Overview  
*Insert statistic about procrastination and education*  
 Because of this effect of procrastination on education, Dr. Daniel Engels, the head of the MSDS program at Southern Methodist University, reached out to us to try and determine which kind of people are procrastinating and where are they coming from?  
 To start, we conducted a multi-nation survey to determing the procrastination level of 4264 individuals by giving them 3 procrastination questionnaires the Decisional Procrastination Scale, the AIP, and the General Procrastination Scale.  Along with these measures of procrastination, we asked all participants to rate both how much they view themselves as a procrastinator and how much they feel others think they procrastinate. We also collected general information about the participants, such as their age, size of family, education level, and other demographic information.  
 After we collected all of this information, we realized that we received a very diverse group of participants in terms of where they are from. We decided that we wanted to see if there was a relationship between country of residence and procrastination level. One way of doing this is looking at the Human Development Index (HDI) for the countries included in the survey. To get this data, we scraped the HDI information from Wikipedia (https://en.wikipedia.org/wiki/List_of_countries_by_Human_Development_Index#Complete_list_of_countries). Along with the indexes, we also added the category of HDI (Low, Medium, High, or Very High) for each country into our original data set.  
Now, with our new, complete data set, we discussed with Dr. Engels what information he was looking to get out of analysis, so we generated the following questions to start with:  
* What are the top 15 nations in average procrastination scores? (In terms of DP, AIP, and GP)  
* How many nations, if any, show up in both of these categories?  
* Is there a relationship between Age and Income?  If so, what are some potential reasons for this?  
* Is there a relationship between Life Satisfaction and HDI?  

After analysis, we found that there is not a relationship between Age and Income or Life Satisfaction and HDI, so we decided to try and find significance between . . .
Because the above two are not significant and not relevant to our question, we need to find a new question to ask
  * Try and find any correlations with Age or Education with DP, etc... in order to conclusion
  
* You could end up marketing more in certain countries with lower procrastinatin rates, etc...
With this information, he is hoping to change the marketing of the program towards individuals who are less likely to procrastinate... This 

-Start by explaining the general problem and then talk about the web scraping and where we got the Procrastination data from   
-We want to make it reproducible (this is what GitHub is for)  
-Talk about how others view your sense of Procrastination

-Talk about how procrastination is effecting grades of MSDS students  
-How does age take into account  
-The client is just the program, but the data set is global to help generate an idea of worldwide Procrastination

## Repository Breakdown  
Within the root directory, you can find both the Rmarkdown file and the Markdown file which include the full analysis of our data.  

References:  
* `CaseStudy2.pdf`: a specific outline of how we proceeded through the project  
* `Checklist.txt`: a general outline of how we split up the tasks  

Analysis:  
* `.RHistory`:  
* `Analysis.R`: contains the coe used for analysis  
* `Codebook_Procrastination`: contains the variable information for our main analysis 
* `MakeFile1.R`: the code we used to scrape more information from the web  
* `MakeFile2.R`: the code we used to merge and clean our data in order to make it tidy and ready for analysis  
* `Data`: a folder with the data sets used

Data:  
* `.DS_Store`:  
* `.Rhistory`:  
* `HumanDevelopmentIndex.csv`:  contains information regarding the Human Development Index (HDI)
* `Procrastination.csv`: the raw data  
* `Procrastination2.csv`: the tidied data (including HDI information)  


