library(shiny)
library(xtable)
library(lattice)
dt <- read.table("precipitation_temperature_data.txt", header = TRUE, dec = ".", stringsAsFactors = FALSE)



shinyServer(function(input, output) {
        output$chart1 <- renderPlot({
            validate(
                need(input$data != "", "Please select your data.")
            )
        range <- input$year[1] : input$year[2]
        station2 <- input$station
        dt2 <- dt[dt$Weather_station == station2 & dt$Year %in% range, ]
        
        if(input$data=="meanTemp"){
            p1 <- xyplot(Mean_temperature ~ Year, data = dt2, ylab = "C°", type = "h", lwd = 10)
            plot(p1)
            
        }else if(input$data == "precipitation"){
            p2 <- xyplot(Precipitation ~ Year, data = dt2, ylab = "Millimeters", type = "h", lwd = 10)
            plot(p2)
            
        }
    })
})
