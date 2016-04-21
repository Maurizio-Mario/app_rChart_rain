library(shiny)
library(rCharts)
options(RCHART_LIB = 'nvd3')

dt <- read.table("precipitation_temperature_data.txt", header = TRUE, dec = ".", stringsAsFactors = FALSE)
        
shinyServer(function(input, output) {
    dt3 <- reactive({                   
        range <- input$year[1] : input$year[2]
        station2 <- input$station
        dt2 <- dt[dt$Weather_station %in% unlist(station2) & dt$Year %in% range, ]
        dt2 <- as.data.frame(dt2)
        dt2
    })
    
    output$chart1 <- renderChart({
        validate(
            need(input$data != "", "Please select your data.")
        )
        
        if(input$data == "precipitation"){
        n2 <- nPlot(Precipitation ~ Year, data = dt3(), group = "Weather_station", type = 'multiBarChart')
        n2$chart(forceY = c(0, 2000))
        }else if(input$data == "meanTemp"){
            n2 <- nPlot(Mean_temperature ~ Year, data = dt3(), group = "Weather_station", type = 'multiBarChart')
            n2$chart(forceY = c(0, 15))
        }
        n2$set(dom = 'chart1')
        n2

        
})
   
})
