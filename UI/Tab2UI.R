tabPanel("Country Comparison",
         hr(),
         "The Country Comparison tab compares two selected countries's 
             suicide rate adjusted for Age and Sex.",
         br(),
         br(),
         fluidRow(
           column(4, offset = 1, uiOutput(outputId = "COUNTRY1")),   # first country input
           column(4, offset = 2, uiOutput(outputId = "COUNTRY2"))    # second country input
         ),
         fluidRow(
           column(2, offset = 5, uiOutput(outputId = "CLICKME"))     # Update button
         ),
         br(),
         br(),
         fluidRow( 
           column(5, plotOutput(outputId = "SEEYA")),                # first country input's plot output
           column(6, plotOutput(outputId = "SOPRANOS"))              # second country input's plot output
         )
)