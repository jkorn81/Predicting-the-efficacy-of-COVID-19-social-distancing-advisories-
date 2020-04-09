library(readxl)
library(xlsx)
library(tidyverse)
us.stats <- read_excel("Merged.Data/us.stats.xlsx")
us.stats = us.stats[,-1]
location.stats = str_remove(us.stats$location,"^US_")
us.stats = cbind(location.stats, us.stats[,-1])
colnames(us.stats)[1] = c("location")


data.us <- read_excel("Google.Report.Extraction/data.us.xlsx",
                      col_types = c("text", "text", "text","numeric", 
                                    "numeric", "numeric", "numeric",
                                    "numeric", "numeric", "text"))
data.us = data.us[,-1]
location.us = str_remove(data.us$location,"^US_")
data.us = cbind(location.us, data.us[,-2])
colnames(data.us)[1] = c("location")

str(us.stats)
str(data.us)

FinalData = merge(us.stats, data.us, by = "location")
str(FinalData)
write.xlsx(FinalData, "Modeling/NewData.xlsx")