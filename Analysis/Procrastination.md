Case Study 2
================
Lizzy Sterling and Casey Martinez
12/06/2017

``` r
knitr::opts_knit$set(root.dir = '/Users/lizzysterling/Desktop/CaseStudy2/Analysis/Data')
```

We are taking a look at the raw data frame.

``` r
#1A
#Work on fixing the directory so that this does not need to be included
Procrastination <- read.csv("Procrastination.csv", header=TRUE)
dim(Procrastination)
```

    ## [1] 4264   61

In order to make the data set human-readable, we need to change the column names so that they make more sense.

``` r
#1B
#colnames(Procrastination)
names(Procrastination)[1:14] <- c("Age", "Gender", "Kids", "Education", "WorkStatus", "AnnualIncome", "Occupation", "OccupationYears", "OccupationMonths", "CommunitySize", "CountryOfResidence", "MaritalStatus", "NumberSons", "NumberDaughers")
#How do you want to label columns 15:61?
```

Now that we know all of the column names, we need to check and make sure all of the values in the columns are accurate.

First, we need to make the values of `OccupationYears` to integers so that we can determine which years do not makes sense.

``` r
#1C
Procrastination$OccupationYears <- round(Procrastination$OccupationYears)
data.frame(unique(Procrastination$OccupationYears))
```

    ##    unique.Procrastination.OccupationYears.
    ## 1                                        9
    ## 2                                        0
    ## 3                                       14
    ## 4                                        1
    ## 5                                        8
    ## 6                                       NA
    ## 7                                        2
    ## 8                                        6
    ## 9                                        5
    ## 10                                       3
    ## 11                                       7
    ## 12                                      10
    ## 13                                      30
    ## 14                                      17
    ## 15                                       4
    ## 16                                      12
    ## 17                                      23
    ## 18                                      13
    ## 19                                      28
    ## 20                                     999

Now that we know the unique values of `OccupationYears`, we know that the 999 value is most likely a mistake. We are going to count the number of observations have this error in order to determine what to do next.

``` r
count(Procrastination[grep("999", Procrastination$OccupationYears),])
```

    ## # A tibble: 1 x 1
    ##       n
    ##   <int>
    ## 1    42

There are 42 entries that include 999 as their number of years in current occupation, so we are not going to delete those values. Instead, we are going to change all of the 999 entries to NAs.

``` r
Procrastination[grep("999", Procrastination$OccupationYears), "OccupationYears"] <- ""
```

In the `NumberSons` column, we need to check and see which values seem off.

``` r
data.frame(unique(Procrastination$NumberSons))
```

    ##   unique.Procrastination.NumberSons.
    ## 1                                  0
    ## 2                               Male
    ## 3                             Female
    ## 4                                  4
    ## 5                                  3
    ## 6                                 10
    ## 7                                  8
    ## 8                                  5
    ## 9

``` r
class(Procrastination$NumberSons)
```

    ## [1] "factor"

We know that in this column, `Male`= 1 Son and `Female` = 2 Sons. Therefore, we need to change each Male and Female entry to their corresponding numbers.

``` r
#Figure out which regular expressions get the grep to only include what is in the quotations - right now both male and female are returning the same rows. Maybe because they are in factor format?
#Procrastination[grep("^Male", Procrastination$NumberSons),]
#Procrastination[grep("Female", Procrastination$NumberSons),]
```

In our `CountryOfResidence` column, we need to check and see which values seem off.

``` r
data.frame(unique(Procrastination$CountryOfResidence))
```

    ##    unique.Procrastination.CountryOfResidence.
    ## 1                                 El Salvador
    ## 2                                     Bolivia
    ## 3                                      Cyprus
    ## 4                              Czech Republic
    ## 5                                     Morocco
    ## 6                                     Ukraine
    ## 7                                       Qatar
    ## 8                                     Antigua
    ## 9                                     Vietnam
    ## 10                                  Lithuania
    ## 11                               Saudi Arabia
    ## 12                                   Bulgaria
    ## 13                                  Macedonia
    ## 14                                  Sri Lanka
    ## 15                                    Ecuador
    ## 16                                Afghanistan
    ## 17                                     Panama
    ## 18                                       Guam
    ## 19                                   Pakistan
    ## 20                                    Estonia
    ## 21                                      Kenya
    ## 22                                     Guyana
    ## 23                                Puerto Rico
    ## 24                                    Bermuda
    ## 25                                    Croatia
    ## 26                                     Taiwan
    ## 27                                    Hungary
    ## 28                                    Austria
    ## 29                                     Brunei
    ## 30                                 Kazakhstan
    ## 31                                      Malta
    ## 32                                 Luxembourg
    ## 33                                    Lebanon
    ## 34                                  Singapore
    ## 35                                  Venezuela
    ## 36                                    Uruguay
    ## 37                                  Argentina
    ## 38                                      Egypt
    ## 39                                  Nicaragua
    ## 40                                    Myanmar
    ## 41                                       Peru
    ## 42                                    Albania
    ## 43                         Dominican Republic
    ## 44                                    Andorra
    ## 45                                   Slovenia
    ## 46                                     Russia
    ## 47                                   Barbados
    ## 48                                Philippines
    ## 49                                   Malaysia
    ## 50                                     Greece
    ## 51                                    Denmark
    ## 52                                      Spain
    ## 53                                      Chile
    ## 54                                    Finland
    ## 55                                      Macao
    ## 56                                New Zealand
    ## 57                                 Yugoslavia
    ## 58                                    Romania
    ## 59                                    Iceland
    ## 60                                   Portugal
    ## 61                                   Thailand
    ## 62                                   Columbia
    ## 63                                      China
    ## 64                                      Ghana
    ## 65                                    Jamaica
    ## 66                                     Norway
    ## 67                                    Algeria
    ## 68                                Netherlands
    ## 69                                    Belgium
    ## 70                                      Japan
    ## 71                                     Isreal
    ## 72                                     Turkey
    ## 73                                     Sweden
    ## 74                                      Italy
    ## 75                                  Hong Kong
    ## 76                                    Ireland
    ## 77                                     France
    ## 78                                     Brazil
    ## 79                                       Iran
    ## 80                                     Mexico
    ## 81                                    Germany
    ## 82                             United Kingdom
    ## 83                                Switzerland
    ## 84                                    Bahamas
    ## 85                               South Africa
    ## 86                                     Poland
    ## 87                                  Australia
    ## 88                                South Korea
    ## 89                                   Botswana
    ## 90                                     Canada
    ## 91                                      India
    ## 92                              United States
    ## 93                                          0
    ## 94

Because 0 is not a country of residence, we need to change it to a NA.

``` r
Procrastination[grep("0", Procrastination$CountryOfResidence), "CountryOfResidence"] <- ""
```

Looking at `Occupation`, we need to check and see which values are not Occupations.

``` r
data.frame(unique(Procrastination$Occupation))
```

    ##            unique.Procrastination.Occupation.
    ## 1                                            
    ## 2                                           0
    ## 3                           financial analyst
    ## 4                            language trainer
    ## 5                                      Editor
    ## 6                                         ouh
    ## 7                                     retired
    ## 8                              Software Sales
    ## 9                               Civil servant
    ## 10                             please specify
    ## 11                                    Economy
    ## 12                              sales manager
    ## 13                                    manager
    ## 14                          BUSINESS CONSULTA
    ## 15                                Copy Writer
    ## 16            Gender/Public Health Consultant
    ## 17                      chairman of the board
    ## 18                           Media Consultant
    ## 19                      Social Policy Analyst
    ## 20                                    Finance
    ## 21                                 Translator
    ## 22                         Technical director
    ## 23                             audio engineer
    ## 24                         Research Associate
    ## 25                                 Controller
    ## 26                              businesswoman
    ## 27                          Financial Advisor
    ## 28                                         IT
    ## 29                                 Programmer
    ## 30                     airport ground handler
    ## 31                        Computer Programmer
    ## 32                                    teacher
    ## 33                           Computer Science
    ## 34                                 Unemployed
    ## 35       EFL Teacher/ Professional Researcher
    ## 36                          Doctor; Physician
    ## 37                         Software Developer
    ## 38                                   Attorney
    ## 39                                  secretary
    ## 40                     journalist (freelance)
    ## 41                               nursing home
    ## 42                                  Developer
    ## 43             Director of a language program
    ## 44                           Graphic Designer
    ## 45                             system manager
    ## 46                               ICT Director
    ## 47                Chiefe Development Engineer
    ## 48                                 consultant
    ## 49        Assoc. Governmental Program Analyst
    ## 50                                   houswife
    ## 51                              Administrator
    ## 52                   IT systems administrator
    ## 53                        Computer Consultant
    ## 54  student fysiotherapy /home care / massage
    ## 55                              Astrohysicist
    ## 56            Student and part time secretary
    ## 57                                 Journalist
    ## 58                                   lecturer
    ## 59        Teaching Assistant/Graduate student
    ## 60                             Business Owner
    ## 61                               entrepreneur
    ## 62                         free professionist
    ## 63                                 Agronomist
    ## 64                          college professor
    ## 65                                    dentist
    ## 66                                   director
    ## 67                       Financial Controller
    ## 68                                   attorney
    ## 69     President Nongovernmental organization
    ## 70                              Dance teacher
    ## 71                     coordinatore operativo
    ## 72                                interpreter
    ## 73                   self-employed translator
    ## 74                         Research Scientist
    ## 75                       Disability Allowance
    ## 76                               Sales Expert
    ## 77                                    Postdoc
    ## 78                                  Physicist
    ## 79                                      Sales
    ## 80                                   engineer
    ## 81                                   Musician
    ## 82                             System Analyst
    ## 83                                    trainee
    ## 84                               Web Designer
    ## 85                                Dish Washer
    ## 86                      ESL Teacher/Biologist
    ## 87                            Sales executive
    ## 88                      Freelance ESL Teacher
    ## 89                      Information Developer
    ## 90                                   IT admin
    ## 91                           Network Engineer
    ## 92        student childhood and youth studies
    ## 93                            Quality Manager
    ## 94                               Town Planner
    ## 95                        assistant professor
    ## 96                                   business
    ## 97                              civil servant
    ## 98                      Technical support rep
    ## 99                Programmer/Software Analyst
    ## 100                           Project Manager
    ## 101                          company director
    ## 102                          Customer Service
    ## 103            cataloguer /  freelance artist
    ## 104                   deputy practice manager
    ## 105                                 Architect
    ## 106                                   Analyst
    ## 107                                IT Support
    ## 108                              Receptionist
    ## 109            treatment support co-ordinator
    ## 110                                  producer
    ## 111                                  Academic
    ## 112                   Postdoctoral Researcher
    ## 113                           student/barmaid
    ## 114                                   airline
    ## 115                       Creative Consultant
    ## 116                   Business / Test Analyst
    ## 117                    IT security consultant
    ## 118                         Executive officer
    ## 119                             IT consultant
    ## 120                       IT Support Engineer
    ## 121                           Doctor Research
    ## 122                    information assisstant
    ## 123                       Television Producer
    ## 124                             Press Officer
    ## 125                                    writer
    ## 126                            Procrastinator
    ## 127                Professional Soccer Player
    ## 128                                     fdsdf
    ## 129                                Accountant
    ## 130               Pharmaceutical Merchandiser
    ## 131               Education (at a university)
    ## 132                             IT Consultant
    ## 133                          energy therapist
    ## 134                               psychologis
    ## 135                             HR generalist
    ## 136                            Physiotherapst
    ## 137                          Technical Writer
    ## 138                            Market Analyst
    ## 139               Office Manager / Accountant
    ## 140                  Administration Assistant
    ## 141                                IT Manager
    ## 142               Internet & media consultant
    ## 143         Information Technology Consultant
    ## 144                              Housekeeping
    ## 145                        Web Communications
    ## 146                      Medical Practitioner
    ## 147                              veterinarian
    ## 148      Management Consultant & Entrepreneur
    ## 149                         Technical officer
    ## 150                      Service co-ordinator
    ## 151   Clutter clearer,  video editor, caterer
    ## 152                               entertainer
    ## 153                                 Scientist
    ## 154                                     clerk
    ## 155                             Self Employed
    ## 156                                 President
    ## 157                                 pathology
    ## 158   Divisional Manager of a large cosmetics
    ## 159                                 Marketing
    ## 160                                    Driver
    ## 161                       Director Operations
    ## 162                                     Nurse
    ## 163                                 Sales Rep
    ## 164                        Fitness Instructor
    ## 165                             Residence Don
    ## 166                    Regional Sales Manager
    ## 167                    Country Style Employee
    ## 168                           Systems Analyst
    ## 169                               Facilitator
    ## 170                self-employed Photographer
    ## 171                        Research Assistant
    ## 172                                  Military
    ## 173                            policy analyst
    ## 174                                 Geologist
    ## 175            Instructional Assistant Online
    ## 176                                    Server
    ## 177                                 innkeeper
    ## 178                 Freelance Project Manager
    ## 179         Deputy Chieif Information Officer
    ## 180                     selfemplyed renovator
    ## 181                                Accounting
    ## 182                Systems Programmer/Analyst
    ## 183  Manager - Analytical and Environmental S
    ## 184                             Grease Monkey
    ## 185              Director of Software Company
    ## 186                 Speaker Author Consultant
    ## 187                                   Janitor
    ## 188                            vice-president
    ## 189         Senior Human Resources Consultant
    ## 190               Communications & Publishing
    ## 191                  Artist/ designer/builder
    ## 192                Director,social Dvelopment
    ## 193                    Senior Systems Analyst
    ## 194                         Software engineer
    ## 195                      Training Coordinator
    ## 196                              Statistician
    ## 197               Student / working part-time
    ## 198  Computer Instructor (Continuing Educatio
    ## 199                                 Counselor
    ## 200                                        na
    ## 201       Program Manager and Acting Director
    ## 202                                 Biologist
    ## 203        pro poker player /   website owner
    ## 204  VP Scientific Affairs / pharmaceutical c
    ## 205                           Deputy Director
    ## 206                        operations manager
    ## 207                                C E O/ M D
    ## 208                    Head - Operations & QA
    ## 209                              Software Pro
    ## 210                            tax consultant
    ## 211                          Research Scholar
    ## 212                                   student
    ## 213          Collection management specialist
    ## 214                           project manager
    ## 215                                  Lift Ops
    ## 216            Self-employed Family Therapist
    ## 217                 special education teacher
    ## 218                        Camera Coordinator
    ## 219                                  Designer
    ## 220                         Produce Associate
    ## 221  supervisor shelderd workshop for handcap
    ## 222                                 Braillist
    ## 223                         election services
    ## 224                               Corrections
    ## 225                      Probation Supervisor
    ## 226                               Bank Teller
    ## 227                         Computer Operator
    ## 228                              Case Manager
    ## 229                                       LPN
    ## 230                         Massage Therapist
    ## 231                            vice president
    ## 232                    Traffic Reporter-Radio
    ## 233           Residential Services Supervisor
    ## 234                 Language Service Provider
    ## 235                                 Executive
    ## 236                    Lab Services Assistant
    ## 237                                       ceo
    ## 238                Film Industry/Miscelanious
    ## 239                             acupuncturist
    ## 240   Technology Curriculum Developer Science
    ## 241                                home maker
    ## 242                                 Freelance
    ## 243                           Insurance Agent
    ## 244                               real estate
    ## 245                                        RN
    ## 246                                 associate
    ## 247             Restaurant operations manager
    ## 248                Labor Relations Specialist
    ## 249                TV News Executive Producer
    ## 250                                 Librarian
    ## 251      First VP & Associate General Counsel
    ## 252     Coordinator of International Programs
    ## 253                            Chief of Staff
    ## 254                              yoga teacher
    ## 255                        Volunteer Director
    ## 256               Pastor ; Life coach  clergy
    ## 257                          Research Analyst
    ## 258                     electronic technician
    ## 259                        Associate Producer
    ## 260                                       VMD
    ## 261                                       abc
    ## 262           media relations/science writing
    ## 263                                     buyer
    ## 264                                     Owner
    ## 265                          University Staff
    ## 266                        landscape designer
    ## 267                 Network Services Engineer
    ## 268                   Special Projects Editor
    ## 269                     free lance bookkeeper
    ## 270  Urban Planner/Economic Development Plann
    ## 271                        Executive Director
    ## 272                      marketing copywriter
    ## 273                                 Economist
    ## 274                                    Studey
    ## 275                                bookseller
    ## 276                                 Assistant
    ## 277                    Professional Organizer
    ## 278            Outdoor Recreation Coordinator
    ## 279                      Attorney – Associate
    ## 280                             Co-Proprietor
    ## 281                            Antique Dealer
    ## 282                   Market Research Analyst
    ## 283                           law enforcement
    ## 284                           insurance agent
    ## 285                Parent Educator/Supervisor
    ## 286          Legal Assistant / Office Manager
    ## 287                             museum docent
    ## 288                                Publishing
    ## 289                         maintenance tech.
    ## 290                           Research intern
    ## 291                      employed by a church
    ## 292                        RN - Medical Sales
    ## 293             Client Relationship Assistant
    ## 294                            Communications
    ## 295                           copy supervisor
    ## 296                   Data Warehouse Engineer
    ## 297           Dental & Disability Coordinator
    ## 298                             writer/editor
    ## 299                         Nanny and student
    ## 300                       Program Coordinator
    ## 301                             Social Worker
    ## 302                      training Coordinator
    ## 303                                       EOD
    ## 304                                bookkeeper
    ## 305                                     Tutor
    ## 306                                      host
    ## 307                    Human Resource Manager
    ## 308  owner - private practice physical therap
    ## 309                                  advocate
    ## 310                       Aviation Specialist
    ## 311                                      CRNA
    ## 312                  education administration
    ## 313        Customer Service at Domino's Pizza
    ## 314                          Writer / eductor
    ## 315                      Accounting Assistant
    ## 316                          Program Director
    ## 317                          Tech Analyst/GIS
    ## 318                            jewelry artist
    ## 319                         real estate agent
    ## 320                               IT director
    ## 321                        Investment Counsel
    ## 322                   Food Service Supervisor
    ## 323           Environmental Senior Specialist
    ## 324                      research coordinator
    ## 325                                  Diplomat
    ## 326                          Stay-at-home dad
    ## 327                   Theater General Manager
    ## 328    Graduate student/University instructor
    ## 329                         Field Coordinator
    ## 330                     laboratory technician
    ## 331                 Box Office Representative
    ## 332                     Facilities Management
    ## 333  Freelance musician / part time EMT / pri
    ## 334                                 Dietitian
    ## 335                                   realtor
    ## 336                    Information Management
    ## 337                   Office Services Manager
    ## 338              Juvenile Corrections Officer
    ## 339                                   stocker
    ## 340                       Account Service Rep
    ## 341                                    intern
    ## 342                              set designer
    ## 343                             Groundskeeper
    ## 344                  library paraprofessional
    ## 345                        Ecology technician
    ## 346                                    Artist
    ## 347  Consultant and entrepreneur (small busin
    ## 348                  Food Department Director
    ## 349               Graduate Research Assistant
    ## 350                           psychotherapist
    ## 351                    In-house Legal Counsel
    ## 352          Writer and management consultant
    ## 353      Senior Consultant Programmer/Analyst
    ## 354                                       EMT
    ## 355                       Legislation Analyst
    ## 356                          public relations
    ## 357                           sales insurance
    ## 358                    Writer/editor/musician
    ## 359                                  designer
    ## 360                           Legal Assistant
    ## 361                         Proposal Director
    ## 362                        real estate broker
    ## 363           Vice President / program office
    ## 364                        regulatory affairs
    ## 365                        Associate Director
    ## 366                              wig designer
    ## 367                            Campus Planner
    ## 368                    Administrative Officer
    ## 369                    phd student researcher
    ## 370                         Teacher assistant
    ## 371                    Senior Records Analyst
    ## 372                  musician/student/teacher
    ## 373    Teacher and Full Time Doctoral Student
    ## 374                               health care
    ## 375                      Multimedia Developer
    ## 376                       Executive Assistant
    ## 377                     Insurance Coordinator
    ## 378                             Speaker/Actor
    ## 379                   Retail / artist /writer
    ## 380                      Artist/administrator
    ## 381                   Social Media consultant
    ## 382                                Pharmacist
    ## 383                        Program Specialist
    ## 384                    Science writing intern
    ## 385                                    school
    ## 386                       research specialist
    ## 387                                manager IT
    ## 388                                     Nanny
    ## 389                            Epidemiologist
    ## 390                                 HVAC Tech
    ## 391                        Accounting Manager
    ## 392               Self-employed writer/editor
    ## 393                     Healthcare Consultant
    ## 394                                researcher
    ## 395                              chiropractor
    ## 396                           college faculty
    ## 397                    Information technology
    ## 398   P-T College Faculty & P-T Self-Employed
    ## 399                     Respiratory Therapist
    ## 400                                 Insurance
    ## 401                            Office Manager
    ## 402                              admin assist
    ## 403                      Warehouse Supervisor
    ## 404       Director of non-profit organization
    ## 405                 Sr. Drug Safety Associate
    ## 406                     Electrical Technician
    ## 407                       Senior Staff Writer
    ## 408                        Writing Consultant
    ## 409                federal excise tax auditor
    ## 410                           retired/adjunct
    ## 411                       television director
    ## 412                                quad racer
    ## 413                        university faculty
    ## 414                              IT Assistant
    ## 415                            anthropologist
    ## 416                     Environmental Analyst
    ## 417                       Post Grad Physician
    ## 418                           writer/musician
    ## 419                Staff Writer at a magazine
    ## 420                    Research / GIS analyst
    ## 421  environmental education non profit direc
    ## 422                          technical writer
    ## 423                                IT analyst
    ## 424       Full-Time Mother / Part-Time Editor
    ## 425                          Casting Director
    ## 426                      Financial Consultant
    ## 427                     Real estate developer
    ## 428                              Tech Support
    ## 429          pr and communications firm owner
    ## 430                        Library technician
    ## 431                         Surgical Resident
    ## 432                      Grants Administrator
    ## 433                      Senior Grant Officer
    ## 434     Student part-time and sales full-time
    ## 435          Psychiatrist in Private Practice
    ## 436                              Office Admin
    ## 437                          School Counselor
    ## 438                               new realtor
    ## 439          Medical / Public Health Educator
    ## 440     self-employed freelance writer/author
    ## 441                             self employed
    ## 442                          student/imvestor
    ## 443                        Social Work Intern
    ## 444  Administrative Asistant for Jewelry Stor
    ## 445                                 Computers
    ## 446                    Bar & Restaurant Owner
    ## 447                                         s
    ## 448           Licensed Professional Counselor
    ## 449  supervising program development speciali
    ## 450                                   Surgeon
    ## 451                      Programmer/Developer
    ## 452                   Master Control Operator
    ## 453          Test Item Writer (Self-employed)
    ## 454                                 Secretary
    ## 455                          Hotel Desk Clerk
    ## 456                                   Actress
    ## 457                          Accounts Payable
    ## 458                  medical transcriptionist
    ## 459  Self-Employed / personal trainer / stren
    ## 460         Director / information technology
    ## 461                                    Retail
    ## 462                          rocket scientist
    ## 463                             manufacturing
    ## 464                                 Paralegal
    ## 465                      Capstone Golf Course
    ## 466                    laborer (construction)
    ## 467                          temporary office
    ## 468               Student and Private Curator
    ## 469                        Graduate Assistant
    ## 470                        Programmer Analyst
    ## 471                                Town Clerk
    ## 472                        Consulting Manager
    ## 473                  Investigative Specialist
    ## 474            writer / lecturer / consultant
    ## 475                                        md
    ## 476                               Asst. Prof.
    ## 477                               EHS Manager
    ## 478                           Program Manager
    ## 479  Ornithology Graduate Student and Teachin
    ## 480               Research/Teaching Assistant
    ## 481                                    Dealer
    ## 482              Mentor/Special Events intern
    ## 483                             IT Technician
    ## 484                     Real Estate Appraiser
    ## 485  Attorney - self employed for 2 years – f
    ## 486                                Tour Guide
    ## 487   Graduate student--research and teaching
    ## 488                         Technical Trainer
    ## 489         catholic priest/ full timestudent
    ## 490                              Geophysicist
    ## 491                    ISTraining Coordinator
    ## 492                   set lighting technician
    ## 493                    senior project manager
    ## 494                                 enologist
    ## 495          Registered Respiratory Therapist
    ## 496                    Framer/Sales Associate
    ## 497  Fitness Assistant / wellness mentor / ca
    ## 498                             visual artist
    ## 499                         newspaper carrier
    ## 500                 Consumer Case Coordinator
    ## 501                       business consultant
    ## 502                                   Medical
    ## 503                 Manager,Interacitve Media
    ## 504                              Art Director
    ## 505                              Telemarketer
    ## 506                                   Partner
    ## 507            Associate / investment banking
    ## 508                                    trader
    ## 509                     Technical Coordinator
    ## 510  financial officer / small career-trainin
    ## 511                 artist/designer/homemaker
    ## 512  Special Education Administrative Assista
    ## 513                 assistant general counsel
    ## 514                  Private Equity Principal
    ## 515                         Creative Director
    ## 516                                 Law clerk
    ## 517                             president/CEO
    ## 518                               IT Director
    ## 519  Program director at a non-profit organiz
    ## 520                              Tax Examiner
    ## 521                               IT Engineer
    ## 522                         senior consultant
    ## 523               Physical Science Technician
    ## 524                            letter carrier
    ## 525    teacher's assistant/afterschool leader
    ## 526                               film editor
    ## 527              insurance broker's assistant
    ## 528                          Software trainer
    ## 529                            self employeed
    ## 530         Shipping/receiving/warehouse mgnt
    ## 531                     Senior Policy Advisor
    ## 532                       medical sonographer
    ## 533               Certified Nurse's Assistant
    ## 534                  Asst. Pre-school Teacher
    ## 535           Director of Contract Management
    ## 536                                   analyst
    ## 537                    financial risk manager
    ## 538                                    office
    ## 539            Self employed Public Relations
    ## 540                    Attorney-self employed
    ## 541                          Technology (CTO)
    ## 542                     associate at law firm
    ## 543  Please specify title Manager for Regulat
    ## 544                           Account Manager
    ## 545               Dept. Director (Non-profit)
    ## 546                       Mechanical Engineer
    ## 547                                Film maker
    ## 548                                Supervisor
    ## 549                Foreign Affairs Specialist
    ## 550                         bookkeeper/ actor
    ## 551                      Investment Assistant
    ## 552  restaurant mgr / student / and looking f
    ## 553                                Life Guard
    ## 554                            detail checker
    ## 555                           Student/Teacher
    ## 556                       Graduate Researcher
    ## 557   PCA for a quadrapilegic and a PCA for a
    ## 558                                       PCA
    ## 559                     College Administrator
    ## 560                             IT Specialist
    ## 561                        Academic Assistant
    ## 562  'Utterly shiftless arts student'... at p
    ## 563                     Human Resource Manger
    ## 564            volunteer mental health worker
    ## 565                   Media Relations Manager
    ## 566                          Research manager
    ## 567                        Medical Laboratory
    ## 568                         Financial Analyst
    ## 569                            Budget analyst
    ## 570                        resident physician
    ## 571                         Program Assistant
    ## 572                           Program officer
    ## 573  Deputy Chief of Public Information for t
    ## 574                             Public Health
    ## 575             Page Designer for a newspaper
    ## 576                            flight surgeon
    ## 577          Accounts Payable / Fleet Manager
    ## 578                   Theater artist/ Teacher
    ## 579                        Clinical Dietitian
    ## 580                 Entrepreneur & Consultant
    ## 581                          Process Engineer
    ## 582               Clinical Research Assistant
    ## 583                     Non-profit Consultant
    ## 584                            student/waiter
    ## 585  Early Childhood Education Student/ Nanny
    ## 586    Writer & Director of Content Solutions
    ## 587                        Recreational Staff
    ## 588  Organic Grocery Store Cashier/shift lead
    ## 589                                    banker
    ## 590                               Senate Page
    ## 591                        Online Media Buyer
    ## 592    Free lance editor and tutor--in theory
    ## 593                        instructor / coach
    ## 594                          land use planner
    ## 595                  Contsuruction Management
    ## 596                                 Bartender
    ## 597  full time student and part time bartende
    ## 598                     Sales/ daycare worker
    ## 599                                 education
    ## 600                            CAD Technician
    ## 601                                Internship
    ## 602                          Paraprofessional
    ## 603                    Vetrans Representative
    ## 604                    Researcher - Physician
    ## 605                    Environmental Engineer
    ## 606         Writer / web designer/ web-master
    ## 607                                   hostess
    ## 608                          business manager
    ## 609                                     Mover
    ## 610                         Library Assistant
    ## 611                Product Field Test Manager
    ## 612                   TV BROADCAST TECHNICIAN
    ## 613                 fulltime office assistant
    ## 614   Night Dispatch Supervisor  (it's just a
    ## 615                      Corporate instructor
    ## 616                           Editor Attorney
    ## 617                                      asst
    ## 618                       Reasearch assistant
    ## 619                         investment banker
    ## 620                     physician (internist)
    ## 621               Assistant District Attorney
    ## 622                     clinical psychologist
    ## 623      Service Registrar/English Instructor
    ## 624                     Management consultant
    ## 625                Webmaster / Print Designer
    ## 626                           account planner
    ## 627                         acounting analyst
    ## 628                           Legal Secretary
    ## 629                pjublic relations director
    ## 630                       research technician
    ## 631  Associate director/ marketing communicat
    ## 632          Director of business development
    ## 633                                      mktg
    ## 634            furniture maker, home restorer
    ## 635                   Chief Financial Officer
    ## 636                         Activities Leader
    ## 637                     Quotations specialist
    ## 638                  Early child hood teacher
    ## 639                            pharmacy tech.
    ## 640             Speech and language Assistant
    ## 641                       Assistant Professor
    ## 642   adjunct faculty / University + communit
    ## 643                            student/retail
    ## 644                Career Placement Associate
    ## 645                           steamship agent
    ## 646                      Education Specialist
    ## 647                  Clinical Trial Assistant
    ## 648                  Computer Systems Analyst
    ## 649                          IT Administrator
    ## 650  Executive Vice President / Senior Lender
    ## 651              Director of Academic Affairs
    ## 652                 Lab Director/Archeologist
    ## 653                                      Temp
    ## 654     Production Operations Support Analyst
    ## 655                          Educator/Student
    ## 656      Student and Administrative Assistant
    ## 657                              CAD operator
    ## 658              Plant Engineering Supervisor
    ## 659               Insurance Claims Supervisor
    ## 660                                 chauffeur
    ## 661                     Corporation President
    ## 662   academic/career coach & admin assistant
    ## 663                                specialist
    ## 664                               Proofreader
    ## 665                  Business Systems Analyst
    ## 666                         Corporate Trainer
    ## 667                              Farm Manager
    ## 668                                adult care
    ## 669                          Software analyst
    ## 670                   teacher / Administrator
    ## 671                              Gove service
    ## 672                                 warehouse
    ## 673                                     vidoe
    ## 674                    Grocery Store Salesman
    ## 675  Doctoral Candidate!!!  no wonder i'm doi
    ## 676                            photo profucer

First, we notice that `please specify` and `0` are not occupations, we can get rid of them.

``` r
Procrastination[grep("0", Procrastination$Occupation), "Occupation"] <- ""
Procrastination[grep("please specify", Procrastination$Occupation), "Occupation"] <- ""
```

Next, we need to group certain occupations together so that we can get accurate counts.

``` r
#Error: invalid factor level, NA generated
Procrastination[(grep("teacher", Procrastination$Occupation)), "Occupation"] <- "Teacher"
```

    ## Warning in `[<-.factor`(`*tmp*`, iseq, value = c("Teacher", "Teacher",
    ## "Teacher", : invalid factor level, NA generated

``` r
Procrastination[(grep("Computer", Procrastination$Occupation)), "Occupation"] <- "Computers"
```

Looking at the `Kids` column, we only want to have a Yes or No response.

``` r
data.frame(unique(Procrastination$Kids))
```

    ##   unique.Procrastination.Kids.
    ## 1                     Yes Kids
    ## 2                      No Kids
    ## 3

``` r
#Look into regular expressions to get rid of this
```

Now that all of the columns are clean, we need to make sure they are of the correct data types.

``` r
sapply(Procrastination, class)
```

    ##                                                                                                                      Age 
    ##                                                                                                                "numeric" 
    ##                                                                                                                   Gender 
    ##                                                                                                                 "factor" 
    ##                                                                                                                     Kids 
    ##                                                                                                                 "factor" 
    ##                                                                                                                Education 
    ##                                                                                                                 "factor" 
    ##                                                                                                               WorkStatus 
    ##                                                                                                                 "factor" 
    ##                                                                                                             AnnualIncome 
    ##                                                                                                                "integer" 
    ##                                                                                                               Occupation 
    ##                                                                                                                 "factor" 
    ##                                                                                                          OccupationYears 
    ##                                                                                                              "character" 
    ##                                                                                                         OccupationMonths 
    ##                                                                                                                "integer" 
    ##                                                                                                            CommunitySize 
    ##                                                                                                                 "factor" 
    ##                                                                                                       CountryOfResidence 
    ##                                                                                                                 "factor" 
    ##                                                                                                            MaritalStatus 
    ##                                                                                                                 "factor" 
    ##                                                                                                               NumberSons 
    ##                                                                                                                 "factor" 
    ##                                                                                                           NumberDaughers 
    ##                                                                                                                "integer" 
    ##                                   X.DP.1..I.waste.a.lot.of.time.on.trivial.matters.before.getting.to.the.final.decisions 
    ##                                                                                                                "integer" 
    ##                                                              X.DP.2..Even.after.I.make.a.decision.I.delay.acting.upon.it 
    ##                                                                                                                "integer" 
    ##                                                                   X.DP.3..I.don.t.make.decisions.unless.I.really.have.to 
    ##                                                                                                                "integer" 
    ##                                                                     X.DP.4..I.delay.making.decisions.until.it.s.too.late 
    ##                                                                                                                "integer" 
    ##                                                                   X.DP.5..I.put.off.making.decisions.until.it.s.too.late 
    ##                                                                                                                "integer" 
    ##                                                                                          X.AIP.1..I.pay.my.bills.on.time 
    ##                                                                                                                "integer" 
    ##                                                                   X.AIP.2.I.am.prompt.and.on.time.for.most.appointments. 
    ##                                                                                                                "integer" 
    ##                        X.AIP.3.I.lay.out.my.clothes.the.night.before.I.have.an.important.appointment..so.I.won.t.be.late 
    ##                                                                                                                "integer" 
    ##                                                             X.AIP.4..I.find.myself.running.later.than.I.would.like.to.be 
    ##                                                                                                                "integer" 
    ##                                                                                 X.AIP.5..I.don.t.get.things.done.on.time 
    ##                                                                                                                "integer" 
    ##                             X.AIP.6..If.someone.were.teaching.a.course.on.how.to.get.things.done.on.time..I.would.attend 
    ##                                                                                                                "integer" 
    ##                                                       X.AIP.7..My.friends.and.family.think.I.wait.until.the.last.minute. 
    ##                                                                                                                "integer" 
    ##                                                                  X.AIP.8..I.get.important.things.done.with.time.to.spare 
    ##                                                                                                                "integer" 
    ##                                                                         X.AIP.9..I.am.not.very.good.at.meeting.deadlines 
    ##                                                                                                                "integer" 
    ##                                                                             X.AIP.10..I.find.myself.running.out.of.time. 
    ##                                                                                                                "integer" 
    ##                                           X.AIP.11..I.schedule.doctor.s.appointments.when.I.am.supposed.to.without.delay 
    ##                                                                                                                "integer" 
    ##                                                                     X.AIP.12..I.am.more.punctual.than.most.people.I.know 
    ##                                                                                                                "integer" 
    ##                     X.AIP.13..I.do.routine.maintenance..e.g...changing.the.car.oil..on.things.I.own.as.often.as.I.should 
    ##                                                                                                                "integer" 
    ##                            X.AIP.14.When.I.have.to.be.somewhere.at.a.certain.time.my.friends.expect.me.to.run.a.bit.late 
    ##                                                                                                                "integer" 
    ##                                           X.AIP.15.Putting.things.off.till.the.last.minute.has.cost.me.money.in.the.past 
    ##                                                                                                                "integer" 
    ##                                        X.GP.1.I.often.find.myself.performing.tasks.that.I.had.intended.to.do.days.before 
    ##                                                                                                                "integer" 
    ##          X.GP2..I.often.miss.concerts..sporting.events..or.the.like.because.I.don.t.get.around.to.buying.tickets.on.time 
    ##                                                                                                                "integer" 
    ##                                         X.GP.3..When.planning.a.party..I.make.the.necessary.arrangements.well.in.advance 
    ##                                                                                                                "integer" 
    ##                                      X.GP.4..When.it.is.time.to.get.up.in.the.morning..I.most.often.get.right.out.of.bed 
    ##                                                                                                                "integer" 
    ##                                            X.GP.5..A.letter.may.sit.for.days.after.I.write.it.before.mailing.it.possible 
    ##                                                                                                                "integer" 
    ##                                                                          X.GP.6..I.generally.return.phone.calls.promptly 
    ##                                                                                                                "integer" 
    ## X.GP.7..Even.jobs.that.require.little.else.except.sitting.down.and.doing.them..I.find.that.they.seldom.get.done.for.days 
    ##                                                                                                                "integer" 
    ##                                                                     X.GP.8..I.usually.make.decisions.as.soon.as.possible 
    ##                                                                                                                "integer" 
    ##                                                           X.GP.9..I.generally.delay.before.starting.on.work.I.have.to.do 
    ##                                                                                                                "integer" 
    ## X.GP.10..When.traveling..I.usually.have.to.rush.in.preparing.to.arrive.at.the.airport.or.station.at.the.appropriate.time 
    ##                                                                                                                "integer" 
    ##                          X.GP.11..When.preparing.to.go.out..I.am.seldom.caught.having.to.do.something.at.the.last.minute 
    ##                                                                                                                "integer" 
    ##                                     X.GP.12..In.preparation.for.some.deadlines..I.often.waste.time.by.doing.other.things 
    ##                                                                                                                "integer" 
    ##                                                         X.GP.13..If.a.bill.for.a.small.amount.comes..I.pay.it.right.away 
    ##                                                                                                                "integer" 
    ##                                               X.GP.14..I.usually.return.a..RSVP..request.very.shortly.after.receiving.it 
    ##                                                                                                                "integer" 
    ##                                                              X.GP.15..I.often.have.a.task.finished.sooner.than.necessary 
    ##                                                                                                                "integer" 
    ##                                          X.GP.16..I.always.seem.to.end.up.shopping.for.birthday.gifts.at.the.last.minute 
    ##                                                                                                                "integer" 
    ##                                                         X.GP.17..I.usually.buy.even.an.essential.item.at.the.last.minute 
    ##                                                                                                                "integer" 
    ##                                                       X.GP.18..I.usually.accomplish.all.the.things.I.plan.to.do.in.a.day 
    ##                                                                                                                "integer" 
    ##                                                                   X.GP.19..I.am.continually.saying..I.ll.do.it.tomorrow. 
    ##                                                                                                                "integer" 
    ##                X.GP.20..I.usually.take.care.of.all.the.tasks.I.have.to.do.before.I.settle.down.and.relax.for.the.evening 
    ##                                                                                                                "integer" 
    ##                                                                      X.SWLS.1..In.most.ways.my.life.is.close.to.my.ideal 
    ##                                                                                                                "integer" 
    ##                                                                         X.SWLS.2.The.conditions.of.my.life.are.excellent 
    ##                                                                                                                "integer" 
    ##                                                                                   X.SWLS.3..I.am.satisfied.with.my.life. 
    ##                                                                                                                "integer" 
    ##                                                       X.SWLS.4..So.far.I.have.gotten.the.important.things.I.want.in.life 
    ##                                                                                                                "integer" 
    ##                                                    X.SWLS.5..If.I.could.live.my.life.over..I.would.change.almost.nothing 
    ##                                                                                                                "integer" 
    ##                                                                               Do.you.consider.yourself.a.procrastinator. 
    ##                                                                                                                 "factor" 
    ##                                                                                 Do.others.consider.you.a.procrastinator. 
    ##                                                                                                                 "factor"

There are certain columns that are not, so we are going to change them and then check again.
