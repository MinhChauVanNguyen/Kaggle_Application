tabPanel("Distribution of Age",
         value = 3,
         hr(),
         "The Distribution of Age tab lets the users create a pie chart (based on the number of suicides) 
                and a scatter plot (based on the suicide rate) from the country input. The green rectangle on the
                scatter plot helps determining which age group has a high suicide rate (value between 2% and 2.5%)
                in the most recent years (more specifically 2011-2016).",
         br(),
         br(),
         uiOutput(outputId = "COUNTRY3"),                            # country input
         uiOutput(outputId ="CLICK"),                                # update input
         fluidRow(
           column(5, plotOutput(outputId = "BYE")),
           br(),
           br(),
           column(7, plotOutput(outputId = "CIAO"))
         )
)