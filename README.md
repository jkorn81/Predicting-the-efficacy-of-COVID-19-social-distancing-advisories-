# Predicting-the-efficacy-of-COVID-19-social-distancing-advisories-

Extracting useful data from Google's Community Mobiltiy Reports at https://www.google.com/covid19/mobility/ can be completed by downloading the github repository. The Github contains three main folders labeled Google.Report.Extraction, Merged.Data, Modeling. 

Google.Report.Extraction folder contains folders labeled code, data, and two generated xlsx files containing the extracted data from Google's reports. Within the code folder is two R scripts to conduct to tasks. The first is completed by the R script labeled pdf.download, which downloads the current Google Community Mobility Reports pdf files from the website and stores them in your local machine in a directory labeled /data. The second task is completed by the R script labeled pdf.import which imports the pdf files, converts them into a list of texts, and then uses regular expressions to extract various data points from the texts to create the two geenrated xlsx files labeled data.xlsx and data.us.xlsx. 

        - data.xlsx contains all countries and US states. 
        - data.us.xlsx is a subset of data.xlsx only including the US states. 

Merged.Data folder contains code and xlsx or csv files to merge into a final dataset for modeling. 

Mdoeling contains a folder labeled code containing R scripts to perform OLS and Random Forest on the final dataset. 
