setwd("~") #setwd
library(XML)
library(RCurl)

url <- "https://www.google.com/covid19/mobility/"
page   <- getURL(url)
parsed <- htmlParse(page)
links  <- xpathSApply(parsed, path="//a", xmlGetAttr, "href")
inds   <- grep("*.pdf", links)
links  <- links[inds]

regex_match <- regexpr("[^/]+$", links, perl=TRUE)
destination <- regmatches(links, regex_match)

for(i in seq_along(links)){
  download.file(links[i], destfile= paste("data/", destination[i], sep=""), mode = "wb")
  Sys.sleep(runif(1, 1, 5))
}