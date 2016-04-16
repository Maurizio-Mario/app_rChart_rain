library(shiny)
library(xtable)
library(lattice)
dt <- read.table("precipitation_temperature_data.txt", header = TRUE, dec = ".", stringsAsFactors = FALSE)



shinyServer(function(input, output) {
    output$chart1 <- renderPlot({
        range <- input$year[1] : input$year[2]
        station2 <- input$station
        dt2 <- dt[dt$Weather_station == station2 & dt$Year %in% range, ]
        if(input$data=="meanTemp"){
            xyplot(Mean_temperature ~ Year, data = dt2, type = "l")
        }else if(input$data == "precipitation"){
            xyplot(Precipitation ~ Year, data = dt2, type = "l")
            }
    })

    11
})
