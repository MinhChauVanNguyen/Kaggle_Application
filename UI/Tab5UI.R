tabPanel("Poisson regression",
         hr(),
         "Poisson regression was used to predict the number of suicides based on the country input
                and to interpret the data using the exponent of the coefficients as shown in the summary statistics.
                Interaction plot (interaction term included) is another important output in this tab, it was used 
                to visualize the interaction between Sex and Age. Using the interaction plot, the users will be able
                to find out which age group and sex has a significantly high or low predicted number of suicides.
                The scatter plot on the other hand does not take Sex into account, it is only looking at the predicted 
                probability of the expected number of suicides plotted against year. The lines represents each age group's
                predicted probability of committing suicide. The positive/negative slope shows the predicted probability
                increases/decreases as the year goes by.",
         br(),
         br(),
         uiOutput(outputId = "COUNTRY5"),                     # country input
         uiOutput(outputId = "ENTER"),                        # update button
         br(), 
         h3(textOutput(outputId = "TITLE", container = span)),
         fluidRow(
           column(5, verbatimTextOutput(outputId = "SUMARY")),         # summary statistic
           column(6, offset = 1, plotOutput(outputId = "NAME"))),      # interaction plot
         br(),
         fluidRow(
           column(6, offset = 3, plotOutput(outputId = "SELF"))        # scatter plot
         ) 
)


