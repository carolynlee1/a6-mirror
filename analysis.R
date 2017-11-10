library(dplyr)
library(ggplot2)
library(plotly)
library(stringr)

setwd("~/info201/a6-carolynlee1/")
shootings.data <- read.csv("./data/shootings-2017.csv")

num.shootings <- count(shootings.data)

num.killed <- shootings.data %>%
  summarise(
    sum = sum(killed)
  )

num <- 5

most.impacted <- shootings.data %>%
  filter(killed > num) %>%
  select(city)

shootings.per.state <- shootings.data%>%
  group_by(state) %>%
  count() 

impacted.list <- paste0(most.impacted$city)

most.killed <- shootings.data %>% 
  filter(killed == max(killed)) 

killed.and.injured <- shootings.data %>%
  group_by(state) %>%
  summarise( 
    sum.killed = sum(killed), 
    sum.injured = sum(injured)
  )

s.table <- left_join(shootings.per.state, killed.and.injured)

incident <- shootings.data %>%
  filter(city == "Las Vegas")
incident.city <- incident %>% select(city)
incident.state <- incident %>% select(state)
incident.date <- incident %>% select(date)
incident.killed <- incident %>% select(killed)
incident.injured <- incident %>% select(injured)

