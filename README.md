# Predicting-the-efficacy-of-COVID-19-social-distancing-advisories-

The first dataset is collected from Google's Community Mobiltiy Reports at https://www.google.com/covid19/mobility/. The Github contains three main folders labeled Google.Report.Extraction, Merged.Data, Modeling. Google.Report.Extraction folder contains folders labeled code, data, and two generated xlsx files containing the extracted data from Google's reports. Within the code folder is two R scripts to conduct two tasks. The first is completed by the R script labeled pdf.download, which downloads the current Google Community Mobility Reports pdf files from the website and stores them in your local machine in a directory labeled /data. The second task is completed by the R script labeled pdf.import which imports the pdf files, converts them into a list of texts, and then uses regular expressions to extract various data points from the texts to create the two generated xlsx files labeled data.xlsx and data.us.xlsx. 

        - data.xlsx contains all countries and US states. 
        - data.us.xlsx is a subset of data.xlsx only including the US states. 

The final dataset is created by merging data.us.xlsx with various other US reports including the CDC, FBI, etc. Merged.Data folder contains code and xlsx or csv files of for the final merged data utilized for modeling. Sources of the data include:

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

Modeling contains a folder labeled code containing R scripts to perform OLS and Random Forest on the final dataset and recreate the results from the study. 
