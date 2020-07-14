tabPanel("Poisson regression",
         value = 5,
         br(),
         sidebarPanel(
         tags$b("Poisson regression"),
         "was used to predict the number of suicides and interpret the results by using
          the coefficients as shown in the model summary statistics.", 
          tags$b("Interaction plot"),
          "(interaction term included) is another important output in this tab, used 
          to visualize the interaction between Sex and Age. By using the interaction 
          plot, the users will be able to find out which age group and sex has a significantly
          high or low predicted number of suicides. The",
          tags$b("scatter plot"), "on the other hand
          does not take Sex into account, it is only looking at the predicted 
          probability of the", tags$b("expected number of suicides"), 
          "plotted against", tags$b("year"), "Each line represents an age group's
          suicide rate, where they can be a positive or a negative slope showing 
          increasesing/decreasing predicted probability over the years.",
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


