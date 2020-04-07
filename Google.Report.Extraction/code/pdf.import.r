library(readtext)
setwd("~") #setwd
files <- list.files(path = "data/", recursive = TRUE,
                          pattern = "\\.pdf$", 
                          full.names = TRUE)

for(i in seq_along(length(files))) {
  text = lapply(files, readtext::readtext)
}

library(data.table)
for(i in seq_along(length(text))) {
  string = rbindlist(text)
}

meta = data.frame(string$doc_id, string$text)
colnames(meta) = c("doc_id", "text")

#Pre-Process Text 
library(tm)
library(stringr)
data.text = tolower(meta$text)
data.text = tm::removeWords(data.text, stopwords("SMART"))
data.text = iconv(data.text, "latin1", "ASCII", sub = " ")
data.text = gsub("^NA| NA ", " ", data.text)
data.text = tm::stripWhitespace(data.text)
str(data.text)

#Extract Location Name from Doc Id ...
library(qdapRegex)
location = c(rm_between(meta$doc_id, '29_', '_Mob', extract=TRUE))
location[1]
str(location)

#Extract Retail Metric from Text ...
library(qdapRegex)
retail = c(rm_between(data.text, 'mobility trends places restaurants, ', '% +', extract=TRUE))
retail[1]
str(retail)

#Extract grocery Metric from Text ...
library(qdapRegex)
grocery = c(rm_between(data.text, 'mobility trends places grocery ', '% +', extract=TRUE))
grocery[1]
str(grocery)

#Extract national.park Metric from Text ...
library(qdapRegex)
national.park = c(rm_between(data.text, 'mobility trends places national parks, ', '% +', extract=TRUE))
national.park[1]
str(national.park)

#Extract transport Metric from Text ...
library(qdapRegex)
transport = c(rm_between(data.text, 'mobility trends places public transport ', '% +', extract=TRUE))
transport[1]
str(transport)

#Extract work Metric from Text ...
library(qdapRegex)
work = c(rm_between(data.text, 'mobility trends places work. ', '% +', extract=TRUE))
work[1]
str(work)

#Extract residence Metric from Text ...
library(qdapRegex)
residence = c(rm_between(data.text, 'mobility trends places residence. ', '% +', extract=TRUE))
residence[1]
str(residence)

#Create Dataframe of Text and Id ...
data = data.frame(meta$doc_id, location, retail, grocery, national.park, transport, work, residence, data.text)
colnames(data) = c("doc.id", "location", "retail", "grocery", "national.park", "transport", "work", "residence", "text")
str(data)
library(xlsx)
write.xlsx(data, "data.xlsx")

#subset US Data ...
data.us = data[stringi::stri_detect_fixed(data$location, "US"), ]
data.us = data.frame(data.us)
str(data.us)
write.xlsx(data.us, "data.us.xlsx")
