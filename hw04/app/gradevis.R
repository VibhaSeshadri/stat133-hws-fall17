###########################################################
# Title: 
#
# Description: FINISH
#   This shiny app contains two tabs; see tabsetPanel()
#   Each tab shows a different sidebar panel.
#   The sibar bar panels are handled with 'conditionalPanel()'
#
# Details:
#   The graphics in each tab are obtained with ggvis
#
# Author: Vibha Seshadri
###########################################################

library(shiny)
library(readr)
library(ggplot2)
library(ggvis)
library(dplyr)

# Data set cleanscores which will be used in this app
cleanscores <- read_csv('../data/cleandata/cleanscores.csv')

# Data frame of just grades and their frequency and proportion
tbl <- table(cleanscores$Grade)
prop_tbl <- prop.table(tbl)
grd <- c("A+", "A", "A-", "B+", "B", "B-", "C+", "C", "C-", "D", "F")
tbl_ordered <- c()
prop_ordered <- c()
for (g in grd) {
  tbl_ordered <- c(tbl_ordered, as.integer(tbl[g]))
  prop_ordered <- c(prop_ordered, round(as.numeric(prop_tbl[g]), 2))
}
grades <- data.frame(Grade = grd,
                     Freq = tbl_ordered,
                     Prop = prop_ordered,
                     stringsAsFactors = FALSE)

# Define UI for application that draws a histogram
ui <- fluidPage(
   
   # Application title
   titlePanel("Grade Visualizer"),
   
   # Sidebar with a slider input for number of bins 
   sidebarLayout(
      sidebarPanel(
        conditionalPanel(condition = "input.tabselected==1",
                         h3("Grades Distribution"),
                         tableOutput("grade_table")
                         ),
        conditionalPanel(condition = "input.tabselected==2",
                         selectInput("histx", label =  h3("X-Axis Variable"),
                                     choices = attributes(cleanscores)$names[1:22]),
                         sliderInput("histbin", label = h3("Bin Width"), min = 1, 
                                     max = 10, value = 10)),
        conditionalPanel(condition = "input.tabselected==3",
                         selectInput("scatx", label =  h3("X-Axis Variable"),
                                     choices = attributes(cleanscores)$names[1:22]),
                         selectInput("scaty", label =  h3("Y-Axis Variable"),
                                     choices = attributes(cleanscores)$names[1:22]),
                         sliderInput("scatOpacity", label = h3("Opacity"), min = 0, 
                                     max = 1, value = 1),
                         radioButtons("radio", label = h3("Show Line"),
                                       choices = list("None" = 0, "lm" = 1, "loess" = 2), 
                                       selected = 0))
      ),
      
      # Show a plot of the generated distribution
      mainPanel(
        tabsetPanel(type = "tabs",
                    tabPanel("Barchart", value = 1,
                             ggvisOutput("barchart")),
                    tabPanel("Histogram", value = 2,
                             ggvisOutput("hist"),
                             h2("Summary Statistics"),
                             verbatimTextOutput("summary")),
                    tabPanel("Scatterplot", value = 3,
                             ggvisOutput("scatterplot")),
                    id = "tabselected")
      )
   )
)

# Define server logic required to draw a histogram
server <- function(input, output) {
  # Creating the grades table for the conditional panel that goes with tab1
  output$grade_table <- renderTable({
    grades
  })
  
  # Creating the barchart that goes with tab1
  vis_barchart <- reactive({
    grade <- prop("x", as.symbol("Grade"))
    frequency <- prop("y", as.symbol("Freq"))
    grades %>%
      ggvis(x = grade, y = frequency, fill := "#439aca") %>% 
      scale_ordinal('x', domain = grd) %>%
      layer_bars(stroke := '#439aca', width = input$width,
                 fillOpacity := 0.8, fillOpacity.hover := 1) %>%
      add_axis("y", title = "frequency")
  })
  
  vis_barchart %>% bind_shiny("barchart")
  
  # Creating histogram that goes with tab2
  vis_histogram <- reactive({
    category <- prop("x", as.symbol(input$histx))
    cleanscores %>% 
      ggvis(x = category, fill := "#439aca") %>% 
      layer_histograms(stroke := '#439aca', width = input$histbin,
                       fillOpacity := 0.8, fillOpacity.hover := 1)
  })
  
  vis_histogram %>% bind_shiny("hist")
  
  # Creating Summary Statistics for chosen x axis
  output$summary <- renderPrint({
    switch(input$histx,
           "HW1" = print_stats(summary_stats(cleanscores$HW1)),
           "HW2" = print_stats(summary_stats(cleanscores$HW2)),
           "HW3" = print_stats(summary_stats(cleanscores$HW3)),
           "HW4" = print_stats(summary_stats(cleanscores$HW4)),
           "HW5" = print_stats(summary_stats(cleanscores$HW5)),
           "HW6" = print_stats(summary_stats(cleanscores$HW6)),
           "HW7" = print_stats(summary_stats(cleanscores$HW7)),
           "HW8" = print_stats(summary_stats(cleanscores$HW8)),
           "HW9" = print_stats(summary_stats(cleanscores$HW9)),
           "ATT" = print_stats(summary_stats(cleanscores$ATT)),
           "QZ1" = print_stats(summary_stats(cleanscores$QZ1)),
           "QZ2" = print_stats(summary_stats(cleanscores$QZ2)),
           "QZ3" = print_stats(summary_stats(cleanscores$QZ3)),
           "QZ4" = print_stats(summary_stats(cleanscores$QZ4)),
           "EX1" = print_stats(summary_stats(cleanscores$EX1)),
           "EX2" = print_stats(summary_stats(cleanscores$EX2)),
           "Test1" = print_stats(summary_stats(cleanscores$Test1)),
           "Test2" = print_stats(summary_stats(cleanscores$Test2)),
           "Homework" = print_stats(summary_stats(cleanscores$Homework)),
           "Quiz" = print_stats(summary_stats(cleanscores$Quiz)),
           "Lab" = print_stats(summary_stats(cleanscores$Lab)),
           "Overall" = print_stats(summary_stats(cleanscores$Overall))
    )
  })
  
  # Creating scatterplot that goes with tab3
  vis_scatterplot <- reactive({
    xvar <- prop("x", as.symbol(input$scatx))
    yvar <- prop("y", as.symbol(input$scaty))
    if (input$radio == 0) {
      cleanscores %>% 
        ggvis(x = xvar, y = yvar,  fill := "#439aca") %>% 
        layer_points(stroke := '#439aca', fillOpacity := input$scatOpacity)
    } else if (input$radio == 1) {
      cleanscores %>% 
        ggvis(x = xvar, y = yvar,  fill := "#439aca") %>% 
        layer_points(stroke := '#439aca', fillOpacity := input$scatOpacity) %>%
        layer_model_predictions(stroke := "black", model = "lm")
    } else {
      cleanscores %>% 
        ggvis(x = xvar, y = yvar,  fill := "#439aca") %>% 
        layer_points(stroke := '#439aca', fillOpacity := input$scatOpacity) %>%
        layer_smooths()
    }
  })
  
  vis_scatterplot %>% bind_shiny("scatterplot")
  
  
}

# Run the application 
shinyApp(ui = ui, server = server)

