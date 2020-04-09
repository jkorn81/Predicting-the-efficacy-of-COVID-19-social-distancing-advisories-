# Predicting-the-efficacy-of-COVID-19-social-distancing-advisories-

This Github repository provides the materials needed to replicate the results reported in, “Predicting the efficacy of COVID-19 social distancing advisories”. It also provides the flexibility to extend them by adding additional variables of interest and by updating the data from Google’s COVID-19 Community Mobility Report – which can be found at https://www.google.com/covid19/mobility/. There are three main folders: Google.Report.Extraction, Merged.Data, and Modeling.
The Google.Report.Extraction folder contains two R scripts used to download and extract the data from the COVID-19 Community Mobility Report:

  1) The R script labeled “pdf.download” downloads the current COVID-19 Community Mobility Report .pdf files from the website and 
     stores them on your machine in a directory labeled “/data”.
  2) The R script labeled “pdf.import” imports the pdf files, converts them into a list of texts, and then uses regular expressions to 
     extract various data points from the texts to create the two generated xlsx files that are also saved in “/data”:  

        - data.xlsx contains all countries and US states. 
        - data.us.xlsx is a subset of data.xlsx only including the US states. 

The Merged.Data folder contains an R script label “merge.data” and a filed labeled “us.stats.xlsx”. The “us.stats.xlsx” contains the demographic data used in our study including the: average crime rate, Gini coefficient (income inequality), percentage of population female, percentage of population infected with COVID-19, percentage of population under 25, percentage of population with college degree, percentage of votes for republican gubernatorial candidates, overdose rate, population, poverty rate, smoking rate, suicide rate, and the teen pregnancy rate. Sources of the various measures include:
              
The R script labeled “merge.data” merges the downloaded COVID-19 Community Mobility Report data in “/data/data.us.xlsx” with the “us.stats.xlsx” and saves it as Final.Data.xlsx. To add additional variables to the data add an additional merge() function to merge FinalData.xlsx with any data sharing a foriegn key. For instance, to merge the FinalData.xlsx with another dataset the following syntax is required: merge(FinalData, "new_data", by = "location"). Note that the by = "" can be any foriegn key that matches between the datasets. For this project 'location' is used as the foriegn key variable. 

The Modeling folder contains a data set labeled “FinalData.xlsx” which is the complete data set used in our study and two R scripts to conduct a Random Forest (RF) to extract the most important predictors and plot the results and run an OLS regression using the three most predictive variables found in the RF.

The R script labeled “Final_Code.r” performs the above operations/analyses on the “FinalData.xlsx”.

