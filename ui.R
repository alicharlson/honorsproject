library(shiny)
library(shinythemes)

shinyUI(fluidPage(theme=shinytheme("journal"),
  headerPanel("What factors can explain brain size?"),
  fluidRow(
    titlePanel("Introduction"),
    column(12,
           includeText("test.txt"),
  fluidRow(
    titlePanel("Variable Selection"),
    column(12,
           sidebarPanel(
             selectInput("variable", "Select an X variable:",
                         list("FSIQ" = "FSIQ",
                              "VIQ"  = "VIQ",
                              "Weight (lbs.)" = "Weight",
                              "Height (in.)"  = "Height",
                              "PIQ" = "PIQ")),
             
             selectInput("response", "The Y response variable:",
                         list("MRI Count in 100,000 Pixels" = "MRI_Count"
                             ))
           ),
           mainPanel(
             h3(textOutput("caption")),
             plotOutput("plot")
           
  ))),
  
  
  fluidRow(
    titlePanel("Model Selection"),
    column(12,
           includeText("selection.txt"),
           tags$br(),
           tags$br(),
           includeText("selectiontest.txt"),
           tags$br(),
           tags$br(),
           includeText("selection2.txt")
  )),
  
  fluidRow(
    titlePanel("Final Model"),
    column(12,
           includeText("summary.txt"),
           tags$br(),
           tags$br(),
           includeText("summary2.txt")
    )),
  
  fluidRow(
    titlePanel("Model Display"),
    column(12,
           sidebarPanel(
             selectInput("variable2", "The most important X variable:",
                         list("Height"  = "Height"
                         )),
             selectInput("response2", "The Y response variable:",
                         list("MRI Count in 100,000 Pixels" = "MRI_Count"
                         )),
             radioButtons("gender", "Select:", c("Male" = "Male", "Female" = "Female"))
           ),
              mainPanel(
                tabsetPanel(
               tabPanel("Plot",h3(textOutput("caption2")),plotOutput("plot2")),
              tabPanel("Summary", verbatimTextOutput("summ")),
              tabPanel("Residual Plot",img(src="resplot.png", height = 500, width = 500))
               )
             ),
  
    fluidRow(
    titlePanel("Conclusion"),
    column(12,
           includeText("conclusion.txt"),
          tags$br(),
          tags$br()
    )))
           
)))))


