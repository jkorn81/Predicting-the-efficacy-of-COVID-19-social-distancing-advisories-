# Predicting-the-efficacy-of-COVID-19-social-distancing-advisories-

This Github repository provides materials needed to replicate the results reported in, “Predicting the efficacy of COVID-19 social distancing advisories”. It also provides the flexibility to extend them by adding additional variables of interest and by updating the data from Google’s COVID-19 Community Mobility Report – which can be found at https://www.google.com/covid19/mobility/. There are three main folders: Google.Report.Extraction, Merged.Data, and Modeling.

Note: To replicate original results skip to section (4). Clone the Github and run "model.study.r". The R script will execute the 
      study's operations/analysis on the study's dataset "FinalData.xlsx". To extend on the work with new data start at section (1) 
      and proceed.

(1) The Google.Report.Extraction folder contains two R scripts used to download and extract the data from the COVID-19 Community 
    Mobility Report. The original .pdf files are not stored on the Github Repository and require the two following R scripts to 
    be run to download the .pdf files.  

   a) The R script labeled “pdf.download” downloads the current COVID-19 Community Mobility Report .pdf files from the website and 
      stores them on your machine in a directory labeled “/data”. A folder labeled "/data" must be created within the working 
      directory. Run the script to store the updated .pdf reports into the folder "/data". 
      
   b) Next run, the R script labeled “pdf.import” to import the pdf files into your local enviroment. Once imported the pdf files
      converts them into a list of texts, and then uses regular expressions to extract various data points from the texts to create two 
      generated .xlsx files that are also saved in “/data”:  

        - data.xlsx contains all countries and US states. 
        - data.us.xlsx is a subset of data.xlsx only including the US states. 

(3) The Merged.Data folder contains an R script label “merge.data” and two excel files labeled “us.stats.xlsx”, and "FinalData.xlsx". 
    Note, the "merge.data.r" file is a copy of the study's merge script. Do not run.  
    
   a) The R script labeled “merge.data.r” is a study material, used to merge the downloaded COVID-19 Community Mobility Report data in       “/data/data.us.xlsx” with the “us.stats.xlsx” and saved it as "FinalData.xlsx". To create a updated merged dataset with 
      "us.stats.xlsx" refer to the Modeling folder detailed in section (4). In section (4) a new script is provided to store a new file 
      labeled "NewData.xlsx". 
   
   b) The “us.stats.xlsx” contains the demographic data used in our study including the: average crime rate, Gini coefficient (income 
      inequality), percentage of population female, percentage of population infected with COVID-19, percentage of population under 25, 
      percentage of population with college degree, percentage of votes for republican gubernatorial candidates, overdose rate, 
      population, poverty rate, smoking rate, suicide rate, and the teen pregnancy rate. 

 (4) The Modeling folder contains three R scripts labeled “model_study.r”, "new.data.r", and "model_new.r" to conduct a Random 
     Forest (RF) to extract the most important predictors and plot the results and run an OLS regression using the three most
     predictive variables found in the RF results. 
      
   a) The R script "model.study.r" performs the above operations/analyses on the “FinalData.xlsx” created by the merge.data.r" script 
      stored in the Merged.Data folder. DO not run unless to replicate original modeling. 
     
   b) For extending the work on the study with new data use the R script labeled “model_new.r" which performs the above 
      operations/analyses on the “NewData.xlsx” file generated using the script labeled "new.data.r". Running the "new.data.r" script 
      will complete the same tasks as the "merge.data.r" script stored in the Merge.Data folder, but create the a file labeled 
      "NewData.xlsx" for extended work.


