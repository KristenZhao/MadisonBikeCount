#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#
# ----- Shiny App -----
# Jianting Zhao
# May 9th, 2017

library(shiny)
library(dplyr)
library(leaflet)
library(ggplot2)
library(plotly)
library(lubridate)

#checkboxgroupinput()
#plotOutput()
# server: need a render object, e.g. renderPlot()

# read rds files
capital_hourly <- readRDS('capital_hourly.rds')
capital_groupByHour <- readRDS("capital_groupByHour.rds")
# Define server logic required to draw a histogram
shinyServer(function(input, output, session) {
  # bikeCount <- reactive({
  #   input$hour
  #   input$hourOfDay
  #   #isolate({
  #   capital_hourly %>%
  #     subset(hour >= as.POSIXlt(input$hour[1])) %>%
  #     subset(hour <= as.POSIXlt(input$hour[2]))
  #   #})
  # })
  # 
  # observe({
  #   #input$hour # any change on map will update in ggplot
  #   
  #   updateDateRangeInput(session, "hour",
  #                        "Select dates to visualize.",
  #                        start = input$hour[1],
  #                        end = input$hour[2],
  #                        min = min(capital_hourly$hour), max = max(capital_hourly$hour))
  # })
  # 
  # # observe({
  # #   input$month #any change in ggplot will reflect on map
  # #   
  # #   updateDateRangeInput(session, "date2",
  # #                        "Select dates to visualize.",
  # #                        start = input$date2[1],
  # #                        end = input$date2[2],
  # #                        min = min(bike_philly$UPDATED), max = max(bike_philly$UPDATED))
  # # })
  # 
  # # observe({
  # #   input$CNTDIR
  # #   updateSelectInput(session,'CNTDIR','Choose a direction',
  # #                     choices = c('all','both','east','north','south','west'))
  # # })
  # 
  # output$bike_count_map <- renderLeaflet({
  #   bikeCount() %>%
  #     leaflet() %>%
  #     setView(lng = "-89.384661", lat = "43.076569", zoom = 11) %>% 
  #     addTiles() %>%
  #     addMarkers(clusterOptions = markerClusterOptions(),
  #                popup = ~popinfo) #~ is a leaflet syntax for column
  # })
  # 
  # output$count_by_muni <- renderPlotly({
  #   count_per_muni <- filtered_bike() %>%
  #     select(-UPDATED) %>%
  #     group_by(MUN_NAME) %>%
  #     summarize(count_sum = sum(AADB))
  #   # use plotly to plot. 
  #   plot1 <- ggplot(count_per_muni, aes(x=reorder(MUN_NAME,-count_sum), y=count_sum, text = paste('count:',count_sum))) + 
  #     geom_bar(stat = 'identity',aes(fill=MUN_NAME)) +
  #     labs(title = 'Bike Counts per Municipalities', x="Municipality names",y="Bike counts") +
  #     theme_gray() + theme(axis.text.x = element_text(angle = 45, hjust = 1),legend.position="none")
  #   ggplotly(plot1) %>%
  #     layout(annotations = 'good')
  # })
  #plotlyOutput('count_by_muni')
  
  # output$count_by_muni_per_dir <- renderPlot({
  #   count_per_muni2 <- filtered_bike() %>%
  #     select(-UPDATED) %>%
  #     group_by(MUN_NAME) %>%
  #     summarize(count_sum2 = sum(AADB))
  # 
  #   ggplot(count_per_muni2, aes(reorder(MUN_NAME,-count_sum), count_sum)) + 
  #     geom_bar(stat = 'identity',aes(fill=MUN_NAME)) +
  #     labs(title = 'Bike Counts per Municipalities', x="Municipality names",y="Bike counts") +
  #     theme_gray() + theme(axis.text.x = element_text(angle = 45, hjust = 1),legend.position="none")
  # })
  # 
  # output$total_count <- renderText({
  #   as.character(sum(filtered_bike()$AADB))
  # })
  # 
  # output$popular_area <- renderText({
  #   names(tail(sort(table(filtered_bike()$TOLMT)), 1))
  #   #filtered_bike()$MUN_NAME[which(filtered_bike()$),]
  # })
  # 
  # output$muni <- renderText({
  #   names(tail(sort(table(filtered_bike()$MUN_NAME)), 1))
  # })
})
