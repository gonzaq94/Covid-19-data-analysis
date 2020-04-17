# Load packages
library(shiny)
library(shinythemes)
library(dplyr)
#library(readr)
source("countries_comparisons.R")

# Load data

#devtools::install_github("covid19r/coronavirus", force=TRUE)
data = coronavirus::coronavirus
data <- data %>% group_by(Country.Region,Province.State,type) %>% mutate(cumsum = cumsum(cases))

# Define UI
source("ui.R")

# Define server function
source("server.R")

# Create Shiny object
shinyApp(ui = ui, server = server)