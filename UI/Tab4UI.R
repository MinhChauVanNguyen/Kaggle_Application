tabPanel("Difference between Age groups",
         value = 4, 
         hr(),
         "The Difference between Age groups tab creates a histogram of the number of suicides
                for a country input and an age group input.",
         br(),
         br(),
         fluidRow(
           column(3, offset = 1,
                  fluidRow(uiOutput(outputId = "COUNTRY4")),         # country input
                  fluidRow(uiOutput(outputId = "AGE")),              # age group input
                  br(),
                  fluidRow(uiOutput(outputId = "UPDATE"))),          # update button
           column(7, plotOutput(outputId = "LATER"))                 # plot output
         )
)