library(shiny)
options(RCHART_WIDTH = 800)
dt <- read.table("precipitation_temperature_data.txt", header = TRUE, dec = ".")

shinyServer(function(input, output) {
})
