# Raw Data 
This folder contains both the raw data and the relevant graphs associated with our analysis.  

## Procrastination.csv  
`Procrastination.csv` contains the raw, untouched data that we cleaned and ended up using for to answer our key questions that can be found in the README.md in the base repository.  
Below is a brief description of each column:  
* `Age`: the participant's age in years (integer)  
* `Gender`: the gender the particpant identifies as (Male or Female) (factor)  
* `Kids`: binary, whether they have kids or not  
* `Education`: education level at the time of data collection  
* `WorkStatus`: what kind of job are they worrking at the time of data collection?  
* `AnnualIncome`: annual income converted to dollars  
* `Occupation`: occupation at the time of data collection  
* `OccupationYears`: how many years have you been in this job?  
* `OccupationMonths`: how many months have you been in this job?  
* `Community`: size of community  
* `CountryOfResidence`: the country where the person holds citizenship  
* `MaritalStatus`: single, married, divorced, separated, etc...  
* `NumberSons`: number of sons (integer)  
* `NumberDaughters`: number of daughters (integer)  
#### The following columns refer to the following procrastination tests:  
* *Decisional Procrastination Scale (DP)*: A cognitive measure of procrastination. In relation to students, this type of procrastination is one of the hardest problems students have to deal with when they have to make decisions on their academic tasks (Mann, 2016).  
  * Mann L. (2016). Procrastination revisited: a commentary. Aust. Psychol. 51 47–51. 10.1111/ap.12208  
* *Adult Inventory of Procrastination* (AIP) Scale: Includes items related to promptness, meeting deadlines, and timeliness (Svartdal, 2017). This scale was originally created by McCown et al. in 1989.  
  * Svartdal, Frode, and Piers Steel. "Irrational Delay Revisited: Examining Five Procrastination Scales in a Global Sample." Frontiers in Psychology, 2017. Academic OneFile, link.galegroup.com/apps/doc/A513126429/AONE?u=txshracd2548&sid=AONE&xid=7483e39a. Accessed 1 Dec. 2017.  
* *General Procrastination Scale (GP)*: a behavorial perspective of procrastination that addresses implemental or behavioral delay (Svartdal, 2017). This scale was oringinaly created by Lay in 1986.  
  * Svartdal, Frode, and Piers Steel. "Irrational Delay Revisited: Examining Five Procrastination Scales in a Global Sample." Frontiers in Psychology, 2017. Academic OneFile, link.galegroup.com/apps/doc/A513126429/AONE?u=txshracd2548&sid=AONE&xid=7483e39a. Accessed 1 Dec. 2017.  
* *Satisfaction with Life Scale (SWLS)*  Scale: "To measure life satisfaction, Diener, Emmons, Larsen, and Griffin (1985) developed the Satisfaction with Life Scale (SWLS)" (Wang, Daoyang, et al., 2017).  
  * Testing the factorial invariance of the satisfaction with life scale across Chinese adolescents." Social Behavior and Personality: An International Journal, vol. 45, no. 3, 2017, p. 505+. Academic OneFile, link.galegroup.com/apps/doc/A497198164/AONE?u=txshracd2548&sid=AONE&xid=f6f4ac58. Accessed 1 Dec. 2017.  
* `DP1`: "I waste a lot of time on trivial matters before getting to the final decisions"  
* `DP2`: "Even after I make a decision I delay acting upon it"  
* `DP3`: "I don’t make decisions unless I really have to"  
* `DP4`: "I delay making decisions until it’s too late"  
* `DP5`: "I put off making decisions until it’s too late"  
* `AIP1`: "I pay my bills on time"  
* `AIP2`: "I am prompt and on time for most appointments"  
* `AIP3`: "I lay out my clothes the night before I have an important appointment, so I won’t be late"  
* `AIP4`: "I find myself running later than I would like to be"  
* `AIP5`: "I don’t get things done on time"  
* `AIP6`: "If someone were teaching a course on how to get things done on time, I would attend"  
* `AIP7`: "My friends and family think I wait until the last minute"  
* `AIP8`: "I get important things done with time to spare"  
* `AIP9`: "I am not very good at meeting deadlines"  
* `AIP10`: "I find myself running out of time"  
* `AIP11`: "I schedule doctor’s appointments when I am supposed to without delay"  
* `AIP12`: "I am more punctual than most people I know"  
* `AIP13`: "I do routine maintenance (e.g., changing the car oil) on things I own as often as I should"  
* `AIP14`: "When I have to be somewhere at a certain time my friends expect me to run a bit late"  
* `AIP15`: "Putting things off till the last minute has cost me money in the past"  
* `GP1`: "I often find myself performing tasks that I had intended to do days before"  
* `GP2`: "I often miss concerts, sporting events, or the like because I don’t get around to buying tickets on time"  
* `GP3`: "When planning a party, I make the necessary arrangements well in advance"  
* `GP4`: "When it is time to get up in the morning, I most often get right out of bed"  
* `GP5`: "A letter may sit for days after I write it before mailing it possible"  
* `GP6`: "I generally return phone calls promptly"  
* `GP7`: "Even jobs that require little else except sitting down and doing them, I find that they seldom get done for days"  
* `GP8`: "I usually make decisions as soon as possible"  
* `GP9`: "I generally delay before starting on work I have to do"  
* `GP10`: "When traveling, I usually have to rush in preparing to arrive at the airport or station at the appropriate time"  
* `GP11`: "When preparing to go out, I am seldom caught having to do something at the last minute"  
* `GP12`: "In preparation for some deadlines, I often waste time by doing other things"  
* `GP13`: "If a bill for a small amount comes, I pay it right away"  
* `GP14`: "I usually return a “RSVP” request very shortly after receiving it"  
* `GP15`: "I often have a task finished sooner than necessary"  
* `GP16`: "I always seem to end up shopping for birthday gifts at the last minute"  
* `GP17`: "I usually buy even an essential item at the last minute"  
* `GP18`: "I usually accomplish all the things I plan to do in a day"  
* `GP19`: "I am continually saying “I’ll do it tomorrow"  
* `GP20`: "I usually take care of all the tasks I have to do before I settle down and relax for the evening"  
* `SWLS1`: "In most ways my life is close to my ideal"  
* `SWLS2`: "The conditions of my life are excellent"  
* `SWLS3`: "I am satisfied with my life"  
* `SWLS4`: "So far I have gotten the important things I want in life"  
* `SWLS5`: "If I could live my life over, I would change almost nothing"  
* `P1`: "Do you consider yourself a procrastinator?"
* `P2`: "Do others consider you a procrastinator?"
* `DPMean`: contains the means of all of the answers from the Decisional Procrastination Scale  
* `AIPMean`: contains the means of all of the answers from the Adult Inventory of Procrastination  
* `GPMean`: contains the means of all of the answers from the General Procrastination Scale  
* `SWLSMean`: contains the means of all of the answers from the Satisfaction with Life Scale  

## HumanDevelopmentIndex.csv  
This data set contains information regarding the Human Development Index. 
For more information on this index and the data collection, here is the original link https://en.wikipedia.org/wiki/List_of_countries_by_Human_Development_Index#Complete_list_of_countries.  
Column Descriptions:  
* `Country`: contains a list of all of the countries used in the data set 
* `HDI`: a combined statistic of a country's lifespan, education level, and GDP per capita. A higher HDI score indicates scoring high on each of these levels. It is scored on a level of 0-1. 
* `Category`: consists of Low, Medium, High, and Very High, which correspond to HDI score per country
## Procrastination2.csv  
This data set contains the cleaned and merged version of the above two data sets. Reference their column names for further information. 


