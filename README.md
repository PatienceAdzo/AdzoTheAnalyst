# Patience Anipa - Data Analytics Portfolio


## About Me

Hi, I am Patience! This is a repository that I created to showcase my skills, share projects, and track my progress in Data Analytics/Data Science-related topics.
However, before delving into the contents of this portfolio, I would like to introduce myself.

I have an analytical background in Actuarial Science, and I am currently pursuing a master's degree in Applied Mathematics with a minor in Analytics and Data Science. I have a solid understanding of data analysis and a strong desire to use data to uncover meaningful insights. As an entry-level data analyst, I am excited to apply my technical and analytical skills in the field of data science.

Throughout my studies, I improved my ability to work with complex data and developed a keen eye for detecting patterns and trends. I also gained experience in data management, and statistical analysis, which I believe will be useful in my future role as a data analyst.

In my free time, I enjoy exploring new data analysis tools and techniques, update myself on current trends in data analysis and always look for opportunities to expand my knowledge and skills. Whether working on a team or independently, I am driven by the thrill of discovering new insights and the satisfaction of using data to solve complex problems. 


## About The Projects

The projects in this repository are a combination of personal projects I have done to advance my knowledge and improve my skills with various programming languages, and projects on specific topics which are the conerstone of many data analysis applications. I have done some of these projects as part of my masters studies at Aalto University.

## Table of Contents
- [About Me](https://github.com/PatienceAdzo/AdzoTheAnalyst/tree/main#about-me)
- [About The Projects](https://github.com/PatienceAdzo/AdzoTheAnalyst/tree/main#about-the-projects)
- [Data Analysis Portfolio Projects](https://github.com/PatienceAdzo/AdzoTheAnalyst/blob/main/README.md#portfolio-projects-by-programming-language)
  - Python
    - [Movie Industry Performance Correlation Analysis](https://github.com/PatienceAdzo/AdzoTheAnalyst#movie-industry-performance-correlation-analysis)
    - [Google Stock Market Analysis](https://github.com/PatienceAdzo/AdzoTheAnalyst/tree/main?tab=readme-ov-file#google-stock-market-analysis)
    - [Analysis of Bike Store Sales](https://github.com/PatienceAdzo/AdzoTheAnalyst/tree/main?tab=readme-ov-file#analysis-of-bike-store-sales)
  - SQL
    - [Covid-19 Pandemic Data Exploration](https://github.com/PatienceAdzo/AdzoTheAnalyst/tree/main#covid-19-pandemic-data-exploration)
    - [Nashville Housing Data Cleaning](https://github.com/PatienceAdzo/AdzoTheAnalyst/tree/main#nashville-housing-data-cleaning)
  - Tableau
    - [Link to Tableau Dashboard](https://public.tableau.com/app/profile/patience.anipa/vizzes)
  - Microsoft Power BI
    - [Data Professions Breakdown](https://github.com/PatienceAdzo/AdzoTheAnalyst#data-professions-breakdown)
    - [Hospital Patients Wait List Report](https://github.com/PatienceAdzo/AdzoTheAnalyst#hospital-patients-wait-list-report)
  - Excel
    - [Social Media Content Creation Strategy - Accenture Job Simulation](https://github.com/PatienceAdzo/AdzoTheAnalyst/blob/main/README.md#social-media-content-creation-strategyaccenture)
    
- [Topics in Data Science/Analytics](https://github.com/PatienceAdzo/AdzoTheAnalyst/blob/main/README.md#portfolio-projects-by-topic)
  
  - [Machine Learning in Python](https://github.com/PatienceAdzo/AdzoTheAnalyst#machine-learning-in-python)
    - [Stress Detection Model](https://github.com/PatienceAdzo/AdzoTheAnalyst/tree/main#stress-detection-model)
   
      
  - [Multivariate Statistical Data Analysis in R](https://github.com/PatienceAdzo/AdzoTheAnalyst#multivariate-statistical-data-analysis-in-r)
    - [Covariance Matrix Based Principal Component Analysis(PCA) of Decathletes](https://github.com/PatienceAdzo/AdzoTheAnalyst#covariance-matrix-based-principal-component-analysispca-of-decathletes)
    - [Correlation Matrix Based Principal Component Analysis(PCA) of Decathletes](https://github.com/PatienceAdzo/AdzoTheAnalyst#correlation-matrix-based-principal-component-analysispca-of-decathletes)
    - [Principal Component Analysis(PCA) of Simulated Data](https://github.com/PatienceAdzo/AdzoTheAnalyst#principal-component-analysispca-of-simulated-data)
    - [PCA and K-Means Clustering](https://github.com/PatienceAdzo/AdzoTheAnalyst/blob/main/Country%20Profiling%20Using%20PCA%20and%20K-Means%20Clustering.pdf)

- [Education](https://github.com/PatienceAdzo/AdzoTheAnalyst#education)
- [Contact](https://github.com/PatienceAdzo/AdzoTheAnalyst#contact)



# Data Analysis Portfolio Projects

In this section I list the data analytics projects, briefly describing the technology stack used to solve the cases.

## Movie Industry Performance Correlation Analysis
**Code:** [`Movie Industry Performance Correlation Analysis.ipynb`](https://github.com/PatienceAdzo/AdzoTheAnalyst/blob/main/Movie%20Industry%20Performance%20Correlation%20Analysis.ipynb)

**Dataset:** [`movies.csv`](https://github.com/PatienceAdzo/AdzoTheAnalyst/blob/main/movies.csv)

**Goal:** To determine what factors contribute the most to a movie's success.

**Description:** The project focused on analyzing a dataset of movies released between 1980 and 2022. The dataset included movie titles, ratings, genres, release dates, budgets, gross earnings, and other relevant information. The project involved loading the data, cleaning and preprocessing it, performing exploratory data analysis (EDA), analyzing the correlation between movie features and gross earnings, and implemented Pearson’s correlation statistical analysis.

**Skills:** data cleaning, data analysis, correlation matrices, data visualization

**Technology stack:** Python, Pandas, Numpy, Seaborn, Matplotlib, SciPy.

**Results:** The analysis revealed that votes and budget have the highest correlation with gross earnings of movies. The ideal runtime of the movies was between 160 and 190 minutes. Also, the action and animation genres of movies produced tended to be more successful than other genres. 


## Google Stock Market Analysis
**Code:** [`Google Stock Market Analysis.html`](https://github.com/PatienceAdzo/AdzoTheAnalyst/blob/main/Google%20Stock%20Market%20Analysis.html)

**Dataset:** The stock price data of Google was downloaded using the Yahoo Finance API.

**Goal:** To analyze the stock market interactively using the Python programming language.

**Description:** Stock Market Analysis refers to analyzing the current and historical trends in the stock market to make future buying and selling decisions. The analysis done in this notebook serves this purpose using valuable visualization tools such as candlestick charts, line charts, bar plots and rangesliders.

**Skills:** stock price data analysis, trend analysis, data visualization, interactive plots

**Technology stack:** Python, Pandas, Numpy, Seaborn, Matplotlib, SciPy, yfinance, plotly, datetime


## Analysis of Bike Store Sales
**Code:** [`Bike Store Sales Data Analysis.ipynb`](https://github.com/PatienceAdzo/AdzoTheAnalyst/blob/main/Bike%20Store%20Sales%20Data%20Analysis.ipynb)

**Dataset:** [`Excel Bike Sales Project Dataset.xlsx`](https://github.com/PatienceAdzo/AdzoTheAnalyst/blob/main/Excel%20Bike%20Sales%20Project%20Dataset.xlsx)

**Goal:** To examine the sales history of a bike store and extract insights on its performance, as well as to identify potential improvements that can be implemented.

**Description:** The dataset contains a list of sales records. The records include the products for sale and order information. The project includes the following steps: data loading, data cleaning and preprocessing and analyzing sales data.

**Skills:** Numerical Analysis, Data wrangling, Categorical analysis, Data visualization, Selection and sorting, Data analysis

**Technology stack:** Python, Pandas, Numpy, Matplotlib


## Covid-19 Pandemic Data Exploration
**Code:** [`Covid-19 Pandemic Analysis.sql`](https://github.com/PatienceAdzo/AdzoTheAnalyst/blob/main/Covid-19%20SQL%20Query.sql)

**Dataset:** [`Link to Covid_Data`](https://ourworldindata.org/covid-deaths)

**Goal:** To analyse the impact of the Covid-19 pandemic.

**Description:** The dataset, downloaded from 'Our World in Data' website contains records of the Coronavirus cases by country from 2020-2024. The dataset was split into deaths and vaccination records before being analyzed in the SQL server. This project includes loading the data into SQL, data cleaning and preprocessing, and EDA (Exploratory Data Analysis).

**Skills:** Joins, CTEs, Temp Tables, Windows Functions, Aggregate Functions, Creating Views, Converting Data Types

**Technology stack:** Microsoft SQL Server Management Studio


## Nashville Housing Data Cleaning
**Code:** [`Nashville Housing Data Cleaning.sql`](https://github.com/PatienceAdzo/AdzoTheAnalyst/blob/main/Nashville%20Housing%20Data%20Cleaning.sql)

**Dataset:** [`Nashville Housing Data.xlsx`](https://github.com/PatienceAdzo/AdzoTheAnalyst/blob/main/NashvilleHousing.xlsx)

**Goal:** To go through the data cleaning process before further analysis of the data.

**Description:** The dataset contains a list of houses that have been sold in Nashville between 2013 and 2019. This project includes the following steps: data loading, data cleaning and preprocessing.

**Skills:** DML(Data Manipulation Language), DQL (Data Query Language), DDL (Data Definition Language).

**Technology stack:** Microsoft SQL Server Management Studio


## Data Professions Breakdown

**File:** [`Data Professions Breakdown.pbix`](https://github.com/PatienceAdzo/AdzoTheAnalyst/blob/main/Data%20Professions%20Breakdown.pbix)

**Dataset:** [`Data Survey.xlsx`](https://github.com/PatienceAdzo/AdzoTheAnalyst/blob/main/Data_Survey.xlsx)

**Goal:** To analyse survey data collected from various data professionals.

**Description:** The dataset contains the results from a survey conducted on various data professionals. This project includes the following steps: data loading, data cleaning and preprocessing and visualization. The analysis detailed the average wages of different professions, their happiness with work/life balance, their favourite programming language, amongst others.

**Skills:** Data Collection, Data Transformation and Modelling, Visualization

**Technology stack:** Power BI Desktop



## Hospital Patients Wait List Report

**File:** [`Hospital Patients Wait List.pbix`](https://github.com/PatienceAdzo/AdzoTheAnalyst/blob/main/Hospital%20Patients%20Data%20Analysis.pbix)

**Dataset I:** [`Inpatients Data.xlsx`](https://github.com/PatienceAdzo/AdzoTheAnalyst/blob/main/In_Patients.xlsx)

**Dataset II:** [`Outpatients Data.xlsx`](https://github.com/PatienceAdzo/AdzoTheAnalyst/blob/main/Out_Patients.xlsx)

**Dataset III:** [`Specialty Mapping.csv`](https://github.com/PatienceAdzo/AdzoTheAnalyst/blob/main/Mapping_Specialty.csv)

**Goal:** To showcase a granular analysis of the wait list of hospital patients.

**Description:** The datasets contain information from 2018 to 2021 about outpatients and inpatients of a hospital including the related medical cases and age profiles. The two datasets were merged for further transformation. This project tracked the current status of patient waiting list, analysed historical monthly trend of waiting list in inpatient and outpatient categories. Some metrics used are the average and median waiting list and the current total waitlist.

**Skills:** Data Collection, Data Transformation and Modelling, Data Merging, Data Analysis Expressions(DAX), Visualization

**Technology stack:** Power BI Desktop


## Social Media Content Creation Strategy(Accenture)

**Presentation:** [`Presentation on Findings.pptx`](https://github.com/PatienceAdzo/AdzoTheAnalyst/blob/main/Accenture%20Presentation.pptx)

**Datasets:** [`Cleaned and Merged Datasets.xlsx`](https://github.com/PatienceAdzo/AdzoTheAnalyst/blob/main/Accenture_Cleaned%20and%20Merged%20Data.xlsx)

**Goal:** To analyse content data for a social media client

**Description:** This project, which is originally a job simulation by Accenture, focused on the application of data analytics and visualization skills to advice a social media client on their content creation strategy. Before beginning the analysis, the client's problem was first highlighted by reviewing the client's brief. Thereafter, the datasets needed to adress the client's issue were selected from a pool of datasets for the data modelling process. The datasets were then cleaned, merged and analysed to provide insights. The final stage of the process involved creating a PowePoint presentation and presenting the findings of the analysis.

**Skills:** Data understanding, data cleaning, data modeling, visualization, connecting the business and data through storytelling, communication

**Tools:** Excel, PowerPoint



# Topics in Data Science/Analytics

## Machine Learning in Python

### Stress Detection Model
**Code:** [`Stress Detection Model.ipynb`](https://github.com/PatienceAdzo/AdzoTheAnalyst/blob/main/Stress%20Detection%20Model.ipynb)

**Dataset:** [`Stress Data.csv`](https://raw.githubusercontent.com/amankharwal/Website-data/master/stress.csv)

**Goal:** To build a trained model which detects whether a person is stressed.

**Description:** The model is trained using data posted on 'subreddits' related to mental health. This dataset contains various mental health problems shared by people about their life. The data is first cleaned from words with no meaning or unnecessary characters. The data is then split into a training set and a testing set and finally trained using the Bernoulli Naive Bayes algorithm.

**Skills:** Natural Language Processing, Data training, Data cleaning, Data visualization

**Technology stack:** Python, scikit-learn, nltk, re, pandas, Numpy, Matplotlib


 
      
## Multivariate Statistical Data Analysis in R

### Principal Component Analysis(PCA)
Principal Component Analysis (PCA) is a dimensionality reduction technique commonly used in multivariate statistical analysis. Its primary purpose is to transform a set of correlated variables into a new set of uncorrelated variables, known as principal components. These principal components capture the most significant variance in the data. The projects below showcase some applications of PCA in various contexts.

#### Covariance Matrix Based Principal Component Analysis(PCA) of Decathletes
**Code:** [`Covariance Matrix Based Principal Component Analysis(PCA).pdf`](https://github.com/PatienceAdzo/AdzoTheAnalyst/blob/main/PCA-1-rmd_file.pdf)

**Dataset:** [`Decatheletes.txt`](https://github.com/PatienceAdzo/AdzoTheAnalyst/blob/main/decathlon.txt)

#### Correlation Matrix Based Principal Component Analysis(PCA) of Decathletes
**Code:** [`Correlation Matrix Based Principal Component Analysis(PCA).pdf`](https://github.com/PatienceAdzo/AdzoTheAnalyst/blob/main/PCA-3-rmd_file.pdf)

**Dataset:** [`Decatheletes.txt`](https://github.com/PatienceAdzo/AdzoTheAnalyst/blob/main/decathlon.txt)

#### Principal Component Analysis(PCA) of Simulated Data
**Code:** [`Principal Component Analysis(PCA).pdf`](https://github.com/PatienceAdzo/AdzoTheAnalyst/blob/main/PCA-2-rmd_file.pdf)

#### PCA and K-Means Clustering
**Project:** [`Principal Component Analysis(PCA) and K-Means Clustering.pdf`](https://github.com/PatienceAdzo/AdzoTheAnalyst/blob/main/Country%20Profiling%20Using%20PCA%20and%20K-Means%20Clustering.pdf)


## Operations Research

#### Nonlinear Programming and Dynamic Optimization
**Project:** [`Optimal Flight with a Glider.pdf`](https://github.com/PatienceAdzo/AdzoTheAnalyst/blob/main/Optimal_Flight_with_a_Glider.pdf)




## Education

Aalto University, Finland:
Master of Science in Technology - MS, Mathematics and Operations Research,
August 2023 - August 2025

KNUST, Ghana:
Bachelor of Science - BSc, Actuarial Science,
2018 - 2022

## Contact
- LinkedIn : [@patienceanipa](https://www.linkedin.com/in/anipa18/)
- E-mail   : patienceanipa18@outlook.com
