#set working directory 
setwd("~/GitHub/DataMadeApp")

#read CSV file
legislators <- read.csv(file = "legislators.csv")

#split Rs and Ds into separate sheets
#create new dataframes based on the value in the "party" column (D/R/I)
repubs <- subset(legislators, legislators$party == "R")
dems <- subset(legislators, legislators$party == "D")

#task 1: Democrats younger than 45
#needed: party (D/R/I) and birthdate (yyyy-mm-dd)

#find todays date
today <- Sys.Date()

#calculate age: 45 years * 365 + 11 for leap years = 16436 days
#convert the value in birthdate into R date structure and test against todays date
#Subset any values that are younger than 45 (16436 days)
demsLegs <- subset(dems, (today- as.Date(dems$birthdate)) < 16436)

#task 2: All republicans with twitter and youtube
#needed: party (D/R/I), twitter_id, and youtube_url

#subset to new dataframe based on entries that do not have blanks in twitter_id and youtube_url
repubsLegs <- subset(repubs, repubs$twitter_id != "" & repubs$youtube_url != "")

#Write both dataframes to new spreadsheets
write.csv(repubsLegs, file = "republicanLegisators.csv")
write.csv(demsLegs, file = "democraticLegislators.csv")
