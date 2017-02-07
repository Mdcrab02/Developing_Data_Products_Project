#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)


shinyUI(fluidPage(
  
  # Application title
  titlePanel("Student Alcohol Consumption"),
  
  
  
  navbarPage(
    title = 'Navigation',
    tabPanel("Home",
             mainPanel(
               includeMarkdown("home.md")
             )
    ),
    tabPanel("About the Data",
             mainPanel(
               includeMarkdown("about.md")
             )
    ),
    tabPanel("Daily Consumption by Sex",
             selectInput("sex", label="Select a Sex"
                         ,choices = c("M","F")),
             plotOutput("dalc_plot")
             ),
    tabPanel("Daily Consumption by Age",
             sliderInput("age",
                         "Age:",
                         min = 15,
                         max = 22,
                         value = c(15,18)),
             plotOutput("age_plot")
    ),
    tabPanel('Display Raw Data',     DT::dataTableOutput('raw'))
  )
  
))
