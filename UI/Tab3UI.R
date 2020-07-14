tabPanel("Distribution of Age",
         value = 3,
         br(),
         br(),
         sidebarPanel(width = 12, 
         div(style = "margin-left:20px;", 
         "The", tags$b("Distribution of Age"), "tab lets the users create a pie chart (based on the number of suicides) 
          and a scatter plot (based on the suicide rate) from the country input. The green rectangle shown on the
          scatter plot helps determining which age group has an extreme suicide rate (value between 2% and 2.5%)
          in the most recent years (more specifically 2011-2016)."),
         br(),
         br(),
         fluidRow(div(style= "display:inline-block; vertical-align:top;margin-left:20px;",
           column(7, selectInput(inputId = "country3",
                     label = "please choose a country", 
                     selected = "New Zealand", 
                     choices = unique(suicide_by_age$country),
                     selectize = FALSE)),
           column(2, style = "margin-top:25px;", actionButton(inputId = "tock", label = "Update", icon("paper-plane"), style = "color:black")))
         )),
         br(),
         fluidRow(
           column(5, uiOutput(outputId = "PIECHART")),
           column(7, uiOutput(outputId = "SCATTER"))
         )
)