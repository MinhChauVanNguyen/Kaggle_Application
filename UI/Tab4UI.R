tabPanel("Difference between Age groups",
         value = 4, 
         br(),
         br(),
         sidebarPanel(
         "The Difference between Age groups tab creates a histogram of the number of suicides
                for a country input and an age group input.",
         br(),
         br(),
         fluidRow(
           column(7, offset = 1,
                  fluidRow(
                    selectInput(inputId = "country4",
                                label = "please choose a country", 
                                selected = "New Zealand",
                                choices = unique(suicide_by_age$country),
                                selectize = FALSE)
                  ),
                  fluidRow(
                    radioButtons(inputId = "age", 
                                 label = "please choose an Age Group",
                                 choices = unique(levels(suicide_by_age$age)))
                  ),             
                  br(),
                  fluidRow(
                    actionButton(inputId = "go", label = "Update", icon("paper-plane"))
                  )
         ))),
         fluidRow(
           column(5, uiOutput(outputId = "BARPLOT"))                 
         )
)