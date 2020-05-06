## CWRU Data Analytics Boot Camp 
Spring 2020
Project-II Report
Debra Fenty, Ibrahim Oumar, Ben Snyder, Suraj Thyagaraj

# Covid Data Dashboard
## Introduction
Covid-19 has taken over the world unlike any other global pandemic has ever done in the past. The flow and access of information is absolutely critical now more than any time before, for people all over the world to be informed about the most up-to-date stats and findings about the disease, in order to be prepared and alert. There has been no dearth in information sources regarding COVID-19, some that are easy to access and understand, and many that are either too complicated for the majority of internet users to access, or are intended to spread fake information and propaganda. The aim of this project is to provide a dashboard-like utility for day-by-day COVID related information broken down by each state in the United States. Using data available publicly, COVID related information will be scraped and transformed to build a data dashboard that provides useful information such as total number of people that are tested, infected, deceased, etc. for each state in an easy to understand, decluttered fashion. 
## Methods:
### Extracting data
There are numerous data outlets that provide free, unlimited access to COVID-19 related data. We chose the outlet https://covidtracking.com/ for ease of access and unbiased reporting. Also, this source is one of the few ones that accurately report testing information, which is essential to make informed decisions or accurately communicate risks. Next, we chose the census information available at data.world (https://data.world/mgecmen/covid-19/workspace/file?filename=US+State+Population) for obtaining population info for each state. Both sources provide information in CSV format that can be easily read into python/Jupyter Notebook and has appropriate header information that is descriptive. 



### Transforming data
The first step in transforming the data was to read both CSV files in to a jupyter notebook as separate dataframes. After dropping the columns that were irrelevant from both dataframes, the next step was to combine them. Although both dataframes included state as a field, one of them had state names while the other had state abbreviations. To account for this mismatch, we created a state abbreviation column on the first dataframe and joined the two using an inner merge so that state names and population were padded to every column of the COVID dataframe. The main value added feature that we are proposing in our project is the tested/positive/deceased information as a percent of the total population. One of the metric that is frequently touted as a measure of the efficiency of the government as related to the extent of testing it does is not just the total number of tests but the total number of tests done per million people. We computed this number by combining the COVID testing info from the first dataframe and the population info from the second, using an inner join on the state abbreviation field as shown in the ER diagram below.  

![ER_Diagram](/Final_ERD.PNG)


### Loading the dashboard
The final version of the transformed data frame was initially saved into an easily downloadable CSV file. In addition, the data was imported to a PostgreSQL database called covid_db. It contains the data found in the CSV files as three separate tables, created using the schema from the ER Diagram. The databases can be queried to provide many different search options. We established a connection to the postgres database on the Jupyter Notebook to load the data.

## Summary:
Using freely available data on the internet, we have built a tool that provides day-to-day COVID testing data for each state within continental United States and Alaska. Using an easy to access dashboard, this data provides relevant information pertaining to the amount of testing that was done by each state which can be used to correlate against the extent of disease spread and mitigation efforts. While we chose to extract data from the first 8 weeks, our data source, www.covidtracking.com, provides daily updates for each state’s COVID-19 tracking. We could easily keep our databases up to date with current data.
    Our created database provides a more informative dataset for the average user. They can use the postgreSQL database to query multiple sets of data. If they wanted to see how the total confirmed cases and deaths grew within a certain state as the outbreak continued, they could run a query.

![state_data](/Output/state_test.PNG)

If they only wanted to see the most recent percentage of population tested in each state for our dataset, they could filter by date.

![pct_test](/Output/daily_pct_test.PNG)

If they wanted to compare two states to see how COVID-19 is affecting each state differently, they could run a query like this:

![comparison_test](/Output/state_comparison_test.PNG)


We wanted our database to contain some of the most sought-after information, such as the percentage of each state’s population that have been tested for COVID-19, and have it easily accessible via database queries and a downloadable CSV file.
