tabPanel("Poisson regression",
         value = 5,
         br(),
         sidebarPanel(
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
         fluidRow(div(style= "display:inline-block; vertical-align:top;",
                      column(7, selectInput(inputId = "country5",
                                            label = "please choose a country", 
                                            selected = "New Zealand", 
                                            choices = unique(suicide_by_sex_age$country),
                                            selectize = FALSE)),
                      column(2, style = "margin-top:25px;", actionButton(inputId = "ick", label = "Update", icon("paper-plane"))))
         ),
         br(),
         fluidRow(column(12, uiOutput(outputId = "INTERACTION")))
         ),                       
         fluidRow(column(6, style = "margin-left:80px;",
           div(style = "margin-left:35px;",
             fluidRow(h3(textOutput(outputId = "TITLE", container = span))),
             fluidRow(uiOutput(outputId = "SUMMARY"))
           ), 
           br(),
           br(),
           fluidRow(uiOutput(outputId = "POISSON"))       
         ))
)


