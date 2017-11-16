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
grades <- data.frame("Grade" = grd,
                     "Freq" = tbl_ordered,
                     "Prop" = prop_ordered,
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
                                     choices = attributes(cleanscores)$names),
                         sliderInput("histbin", label = h3("Bin Width"), min = 0, 
                                     max = 10, value = 10))
      ),
      
      # Show a plot of the generated distribution
      mainPanel(
        tabsetPanel(type = "tabs",
                    tabPanel("Barchart", value = 1,
                             plotOutput("vis_barchart")),
                    tabPanel("Histogram", value = 2,
                             plotOutput("vis_histogram")),
                    tabPanel("Scatterplot", value = 3),
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
  output$vis_barchart <- renderPlot({
    ggplot() + 
      geom_bar(data = grades, aes(x = Grade, y = Freq), stat = "identity") +
      scale_x_discrete(limits = grd)
  })
  
  # Creating histogram that goes with tab2
  output$vis_histogram <- renderPlot({
    ggplot(data = cleanscores, aes_string(x = input$histx)) + 
      geom_histogram(binwidth = 10, stat = "count")
  })
  
  
}

# Run the application 
shinyApp(ui = ui, server = server)

