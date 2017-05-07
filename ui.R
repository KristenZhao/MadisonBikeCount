#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(shinydashboard)
library(leaflet)
library(shinythemes)
library(shinytoastr)
library(plotly)

# Define UI for application that draws a histogram
dashboardPage(
  skin = 'blue',
  dashboardHeader(title = "Madison Bike Count", titleWidth = 230),
  dashboardSidebar(
    sidebarMenu(
      menuItem("Map of Madison", tabName = "map", icon = icon("map")),
      menuItem("Graphs", tabName = "graphs", icon = icon("signal", lib = "glyphicon")),
      menuItem("About", tabName = "about", icon = icon("question-circle")),
      menuItem("Source Code", href = "https://github.com/KristenZhao/Philadelphia-Bike-Count", icon = icon("github-alt"))
    )
  ),
  dashboardBody(
    tabItems(
      tabItem(tabName = "map",
              fluidRow(
                column(width = 8,
                       box(width = NULL,
                           leafletOutput("bike_count_map", height = 500))
                ),
                column(width = 3,
                       box(width = NULL,
                           dateRangeInput("date1", "Select dates to visualize.",
                                          start = min(bike_philly$UPDATED), end = max(bike_philly$UPDATED),
                                          min = min(bike_philly$UPDATED), max = max(bike_philly$UPDATED))
                       ),
                       box(width = NULL,
                           h3('Bike Counts'),
                           h4(textOutput("total_count"))),
                       box(width = NULL,
                           h3("Most Popular Biking Area"),
                           h4(textOutput("popular_area"))),
                       box(width = NULL,
                           h3("Most Popular Biking Municipality"),
                           h4(textOutput("muni")))
                )
              )
      ),
      tabItem(tabName = "graphs",
              fluidRow(
                column(width = 12,
                       box(width = NULL,
                           plotlyOutput("count_by_muni")))
                # column(width = 6,
                #        box(width = NULL,
                #            plotOutput("count_by_muni_per_dir")))
              ),
              fluidRow(
                column(width = 12,
                       box(width = NULL,
                           dateRangeInput("date2", "Select dates to visualize.",
                                          start = min(bike_philly$UPDATED), end = max(bike_philly$UPDATED),
                                          min = min(bike_philly$UPDATED), max = max(bike_philly$UPDATED))
                       )
                )
              ),
              fluidRow(
                column(width = 12,
                       box(width = NULL,
                           plotlyOutput()))
              )
            ),
      tabItem(tabName = "about",
              fluidRow(
                column(width = 12,
                       box(width = NULL,
                           includeMarkdown("about.md")))
              )
      )
    )
  )
)
