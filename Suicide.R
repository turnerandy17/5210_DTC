library(readxl)
library(tidyverse)
library(vtable)
library(ggplot2)
suicide_data <- read.csv('Rawdata/master.csv')
sumtable(suicide_data)


suicide_data <- suicide_data %>% 
  select(-country.year, -HDI.for.year) #remove HDI and Country.Year columns

suicide_yearly_sex_combine <- suicide_data %>% 
  group_by(year, sex) %>% 
  summarize(suicide_number = sum(suicides_no))

ggplot(suicide_yearly_sex_combine, aes(x = year, y = suicide_number, fill = sex)) + 
  geom_line(aes(color = sex)) +
  scale_x_continuous(breaks = seq(1985, 2016, 5)) +
  scale_y_continuous(breaks = seq(0, 200000, 25000))

suicide_per_country_by_age <- suicide_data %>% 
  group_by(X...country, age) %>% 
  summarize(suicide_number = sum(suicides_no))

suicide_sex <- suicide_data %>% 
  group_by(X...country, sex) %>% 
  summarize(suicide_number = sum(suicides_no))

suicide_gdp <- suicide_data %>% 
  group_by(X...country, year, gdp_for_year....) %>% 
  summarize(suicide_number = sum(suicides_no))

