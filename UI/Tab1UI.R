tabPanel("Data Overview",
         hr(),
         # Introduction of the application
         h3("Introduction"),
         "This dataset was obtained with permission from Szamil, a user on Kaggle. 
             It contains WHO suicide statistics determined by country, year (from 1979 to 2016), age groups and sex. 
             The purpose of my application is to allow users (who might have an interest in suicide data as well as having a statistical background) 
             to have a better experience in observing and learning more about the statistics. The raw dataset as shown 
             below has 6 columns (Country, Year, Sex, Age, Suicides_no, Population).",
         tags$b("Country"),
         "has data on almost every country in the world (118 in total) and each country has
             a different year range. For example, some countries has data from 1987 to 2009 and some countries
             has data from 1999 to 2016",
         tags$b("Number of Suicides"),
         "and",
         tags$b("Population"),
         "are measured in persons,", 
         tags$b("Sex"),
         "consists of female and male and Age has 6 categories: 5-14 yrs, 15-24 yrs, 25-35 yrs, 35-54 yrs, 55-74 yrs, 75+ yrs.
             A column called",
         tags$b("Suicide Rate"),
         "was added to the dataset (post data cleaning and data processing) for the main functionality of the application,
             that is to analyze the number of suicides and the suicide rate based on the Age variable.",
         hr(),
         # Table of the raw data
         h3("Summary of raw data"),
         br(),
         fluidRow(
           column(12, div(dataTableOutput("dataTable")))
         )
)