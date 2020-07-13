tabPanel("Country Comparison",
         value = 2,
         hr(),
         "The Country Comparison tab compares two selected countries's 
             suicide rate adjusted for Age and Sex.",
         br(),
         br(),
         fluidRow(
           column(4, offset = 1,
                  selectInput(inputId = "country1",
                              label = "please choose a country", 
                              selected = "New Zealand",
                              choices = unique(suicide_by_age_sex$country), 
                              selectize = FALSE)),   
           column(4, offset = 2,
                  selectInput(inputId = "country2",
                              label = "please choose a country", 
                              selected = "Australia",
                              choices = unique(suicide_by_age_sex$country), 
                              selectize = FALSE))    
         ),
         fluidRow(
           column(2, offset = 5,
                  actionButton(inputId = "tick", label = "Update", icon("paper-plane"), style = "color: black"))
         ),
         br(),
         br(),
         fluidRow( 
           column(5, uiOutput(outputId = "PLOT1")),               
           column(6, uiOutput(outputId = "PLOT2"))         
         )
)