# Predicting-the-efficacy-of-COVID-19-social-distancing-advisories-

This Github repository provides materials needed to replicate the results reported in, “Predicting the efficacy of COVID-19 social distancing advisories”. It also provides the flexibility to extend them by adding additional variables of interest and by updating the data from Google’s COVID-19 Community Mobility Report – which can be found at https://www.google.com/covid19/mobility/. There are three main folders: Google.Report.Extraction, Merged.Data, and Modeling.

**Note(s) for Section (1):** 

   * To replicate the original results skip to section (3a) for more details. The R script will execute the study's operations/analysis 
     on the the dataset used in the study labeled "FinalData.xlsx", located in the Merged.Data folder. 
   * To extend on the work with newly updated data start at section (1) to download and pre-process the Google COVID-19 reports. This        is required only if you are extending the work. Replicating the study does not require any steps in section (1) to be performed. 

**(1)** The Google.Report.Extraction folder contains two R scripts used to download and extract the data from the COVID-19 Community 
    Mobility Report. The original /.pdf files are not stored on the Github repository and require the two following R scripts to 
    be executed to download the /.pdf files.  

   **a)** The R script labeled “pdf.download” downloads the current COVID-19 Community Mobility Report .pdf files from the website and 
      stores them on your machine in a directory labeled “/data”. A folder labeled "/data" must be created within the working 
      directory. Run the script to store the updated .pdf reports into the folder "/data". 
      
   **b)** Next run, the R script labeled “pdf.import” to import the pdf files into your local enviroment. Once imported the pdf files 
      are converted into a list of texts, and then uses regular expressions to extract various data points from the texts to create two 
      generated /.xlsx files that are also saved in “/data”:  
       
       - data.xlsx contains all countries and US states. 
       - data.us.xlsx is a subset of data.xlsx only including the US states. 

**Note(s) for Section (2):** 

   - Section (2) details the process for merging the data utilized for the study. Do not run.  

**(2)** The Merged.Data folder contains an R script label “merge.data” and two excel files labeled “us.stats.xlsx”, and "FinalData.xlsx". 
    Note, the "merge.data.r" file is a copy of the study's merge script. Do not run.  
    
   **a)** The R script labeled “merge.data.r” is a study material, used to merge the downloaded COVID-19 Community Mobility Report data 
        in “/data/data.us.xlsx” with the “us.stats.xlsx” and saved it as "FinalData.xlsx". To create a updated merged dataset with 
      "us.stats.xlsx" and current Google COVID-19 reports refer to the Modeling folder detailed in section (3b). In section (3b) a new       script labeled "new.data.r" is provided to merge the updated "data.us.xlsx" and the "us.stats.xlsx" and store the new file 
      labeled "NewData.xlsx". The "NewData.xlsx" is only processed for modeling if section (3b) is executed.  
   
   The “us.stats.xlsx” contains the demographic data used in our study including the: average crime rate, Gini coefficient (income 
   inequality), percentage of population female, percentage of population infected with COVID-19, percentage of population under 25, 
   percentage of population with college degree, percentage of votes for republican gubernatorial candidates, overdose rate, 
   population, poverty rate, smoking rate, suicide rate, and the teen pregnancy rate. 

**Note(s) for Section 3:**

   - Section (3) details the process for replicating the model from the study (3a) and also provides resources to extend on the work        (3b).   

 **(3)** The Modeling folder contains three R scripts labeled “model_study.r”, "new.data.r", and "model_new.r". The main purpose of section 
     (3) is to conduct a Random Forest (RF) to extract the most important predictors, plot the results, and run an OLS regression using      the three most predictive variables found in the RF results. 
      
   **a)** Replicating the Study:
   
   - The R script "model.study.r" performs the above operations/analyses on the “FinalData.xlsx” created by the merge.data.r"       
     script, which is stored in the Merged.Data folder. Do not run unless to replicate original modeling. 
     
   **b)** Extending the Work:
   
   - To generate "NewData.xlsx", run the "new.data.r" script to merge the updated "data.us.xlsx" from completing section (1) 
     and the "us.stats.xlsx" dataset located in the Merged.Data folder. The script will store and label the resulting dataframe 
     "NewData.xlsx". Add dataframes by including additional syntax to "new_data.r" to import/merge datasets that have the same foreign 
     keys as "data.us.xlsx" and "us.stats.xlsx". A foreign key is a variable that matches other datasets. The variables need to match 
     header names and the unique values of the variables need to match. For instance, in the study the dataset "data.us.xlsx" and 
     "us.stats.xlsx" were mereged using the variable "location", which both contained as the names of the US states. 
   
   - For extending the work on the study with the "NewData.xlsx" use the R script labeled “model_new.r" which performs the above 
     operations/analyses on the “NewData.xlsx”, the same as in the study using "model.study.r". 
     
        



