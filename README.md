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

        - 1. Coronavirus Disease 2019 (COVID-19) in the U.S. [Internet]. Centers for Disease Control and Prevention. 2020 [cited 5 
             April 2020]. Available from: https://www.cdc.gov/coronavirus/2019-ncov/cases-updates/cases-in-us.html
        - 2. Map of Cigarette Use Among Adults | STATE System | CDC [Internet]. Cdc.gov. 2020 [cited 5 April 2020]. Available from: 
             https://www.cdc.gov/statesystem/cigaretteuseadult.html
        - 3. Stats of the State - Suicide Mortality [Internet]. Cdc.gov. 2020 [cited 5 April 2020]. Available from: 
             https://www.cdc.gov/nchs/pressroom/sosmap/suicide-mortality/suicide.htm
        - 4. Drug Overdose Mortality by State [Internet]. Cdc.gov. 2020 [cited 5 April 2020]. Available from: 
             https://www.cdc.gov/nchs/pressroom/sosmap/drug_poisoning_mortality/drug_poisoning.htm
        - 5. Stats of the State - Teen Birth Rates [Internet]. Cdc.gov. 2020 [cited 5 April 2020]. Available from: 
             https://www.cdc.gov/nchs/pressroom/sosmap/teen-births/teenbirths.htm
        - 6. Table 4 [Internet]. FBI. 2020 [cited 5 April 2020]. Available from: https://ucr.fbi.gov/crime-in-the-
              u.s/2017/crime-in-the-u.s.-2017/topic-pages/tables/table-4
        - 7. Education [Internet]. Data.ers.usda.gov. 2020 [cited 5 April 2020]. Available from: 
             https://data.ers.usda.gov/reports.aspx?ID=17829
        - 8. Population Distribution by Age [Internet]. The Henry J. Kaiser Family Foundation. 2020 [cited 5 April 2020]. Available 
             from: https://www.kff.org/other/state-indicator/distribution-by-age/?
             currentTimeframe=0&sortModel=%7B%22colId%22:%22Location%22,%22sort%22:%22asc%22%7D#notes
        - 9. Population Distribution by Gender [Internet]. The Henry J. Kaiser Family Foundation. 2020 [cited 5 April 2020]. Available 
             from: https://www.kff.org/other/state-indicator/distribution-by-gender/?
             currentTimeframe=0&sortModel=%7B%22colId%22:%22Location%22,%22sort%22:%22asc%22%7D
        - 10. Income and Poverty in the United States: 2018 [Internet]. The United States Census Bureau. 2020 [cited 5 April 2020]. 
              Available from: https://www.census.gov/data/tables/2019/demo/income-poverty/p60-266.html
        - 11. Bureau U. State Population Totals: 2010-2019 [Internet]. The United States Census Bureau. 2020 [cited 5 April 2020]. 
              Available from: https://www.census.gov/data/tables/time-series/demo/popest/2010s-state-
              total.html#par_textimage_1574439295
        - 12. Data Center: US Data – Population Reference Bureau [Internet]. Prb.org. 2020 [cited 5 April 2020]. Available from: 
              https://www.prb.org/usdata/indicator/gini/table
              
The R script labeled “merge.data” merges the downloaded COVID-19 Community Mobility Report data in “/data/data.us.xlsx” with the “us.stats.xlsx” and saves it as Final.Data.xlsx. To add additional variables to the data add an additional merge() function to merge FinalData.xlsx with any data sharing a foriegn key. 

The Modeling folder contains a data set labeled “FinalData.xlsx” which is the complete data set used in our study and two R scripts to conduct a Random Forest (RF) to extract the most important predictors and plot the results and run an OLS regression using the three most predictive variables found in the RF.

The R script labeled “xxxx” performs the above operations/analyses on the “FinalData.xlsx”.

