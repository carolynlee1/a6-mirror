library(dplyr)

library(ggplot2)

library(plotly)

setwd("~/info201/a6-carolynlee1/")
shootings.data <- read.csv("./data/shootings-2017.csv")



num.shootings <- count(shootings.data)

num.killed <- shootings.data %>%
  summarise(
    sum = sum(killed)
  )

most.impacted <- shootings.data %>%
  filter(killed > 5) %>%
  select(city)

shootings.per.state <- shootings.data%>%
  group_by(state) %>%
  count() 


impacted.list <- paste0(most.impacted$city)
