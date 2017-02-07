#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(dplyr)
library(ggplot2)

source("prepare.R")

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  
  output$dalc_plot <- renderPlot({
    #Dalc <- as.numeric(unlist(select(filter(student_por,student_por$sex==input$sex),Dalc)))
    #hist(Dalc)
    Dalc <- filter(student_por,student_por$sex==input$sex)
    ggplot(Dalc, aes(factor(Dalc))) +
      geom_bar() + 
      ggtitle(paste("Daily Alcohol Conumption Levels Where Sex is:",input$sex)) +
      xlab("Daily Consumption Category") +
      ylab("Count") +
      coord_cartesian(ylim = c(0, 350))
  })
  
  output$age_plot <- renderPlot({
    #Dalc <- as.numeric(unlist(select(filter(student_por,student_por$sex==input$sex),Dalc)))
    #hist(Dalc)
    age_grp <- filter(student_por,student_por$age >= input$age[1], student_por$age <= input$age[2])
    ggplot(age_grp, aes(factor(age))) +
      geom_bar() + 
      ggtitle(paste("Daily Alcohol Conumption Levels Where Age is Between:"
                    ,input$age[1]," - ",input$age[2])) +
      xlab("Daily Consumption Age Group") +
      ylab("Count") +
      coord_cartesian(ylim = c(0, 200))
  })
  
})
