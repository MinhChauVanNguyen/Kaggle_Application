require(DT)                          
require(tidyverse)
require(dplyr) 
require(formattable)
require(shiny)                         
require(shinyWidgets)
require(shinythemes)
require(viridis)
require(hrbrthemes)
require(ggalt)
require(aod)
require(sandwich)
require(msm)
require(caret)
require(ggstance)
require(jtools)
require(broom)
require(interactions)

### Read in the data
suicide <- read.csv("who.csv", header = TRUE, stringsAsFactors = FALSE)

### Data cleaning
# drop all NA in suicides_no & population columns
suicide <- suicide[!is.na(suicide$suicides_no),] 
suicide <- suicide[!is.na(suicide$population),] 


### Data processing
# convert variable age & sex into factor
suicide$age <- factor(suicide$age, levels = c("5-14 years", "15-24 years",
                                              "25-34 years", "35-54 years", "55-74 years", "75+ years"))

suicide$sex <- as.factor(suicide$sex)

# calculate Suicide Rate per year on different levels (Age, Sex) for each country
suicide$population <- as.numeric(suicide$population)
suicide$suicides_no <- as.numeric(suicide$suicides_no)

# grouped by year
suicide_by_year <- group_by(suicide, country, year) %>% 
  summarise(population = sum(population), suicide_no = sum(suicides_no)) %>%
  mutate(suicide_rate = (suicide_no/population)*100)

# grouped by year w.r.t age
suicide_by_age <- group_by(suicide, country, year, age) %>%
  summarise(population = sum(population), suicide_no = sum(suicides_no)) %>%
  mutate(suicide_rate = (suicide_no/population)*100)

# grouped by year w.r.t sex
suicide_by_sex <- group_by(suicide, country, year, sex) %>%
  summarise(population = sum(population), suicide_no = sum(suicides_no)) %>%
  mutate(suicide_rate = (suicide_no/population)*100)

# grouped by year w.r.t sex & age
suicide_by_sex_age <- group_by(suicide, country, year, sex, age) %>%
  summarise(population = sum(population), suicide_no = sum(suicides_no)) %>%
  mutate(suicide_rate = (suicide_no/population)*100)

# grouped by year w.rt. age & sex
suicide_by_age_sex <- group_by(suicide, country, year, age, sex) %>%
  summarise(population = sum(population), suicide_no = sum(suicides_no)) %>%
  mutate(suicide_rate = (suicide_no/population)*100)

# looking at the extreme group
suicide_select <- suicide_by_age[suicide_by_age$suicide_rate > 0.020 & 
                                   suicide_by_age$suicide_rate <= 0.025 & 
                                   suicide_by_age$year > 2011 & 
                                   suicide_by_age$year < 2016, ]
