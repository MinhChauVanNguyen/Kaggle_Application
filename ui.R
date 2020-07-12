MAIN_PATH <- paste0(getwd(), "/")

# application
theme_set(theme_bw())

ui <- fluidPage(
  theme = shinytheme("flatly"),
  ## CSS
  tags$link(rel = "stylesheet", type = "text/css", href = "my.css"),
  tags$head(
    tags$style("#country1{border:2px solid #00FFCC;}"),
    tags$style("#country2{border:2px solid #00FFCC;}"),
    tags$style("#country3{border:2px solid #00FFCC;}"),
    tags$style("#country4{border:2px solid #00FFCC;}"),
    tags$style("#country5{border:2px solid #00FFCC;}"),
    tags$a(href="https://www.kaggle.com/szamil/who-suicide-statistics", "please click here to obtain the WHO suicide data set used in this application")
  ),
  headerPanel(
    fluidRow( 
      column(5, h1("Suicide data by country")),
      column(5, offset = 2, h1("Lifeline NZ 0800 543 354"))
    )
  ),
  br(),
  tabsetPanel(
    tabsetPanel(id = "tabs",
          source(paste0(MAIN_PATH,"/UI/Tab1UI.R"),local=TRUE)$value,
          source(paste0(MAIN_PATH,"/UI/Tab2UI.R"),local=TRUE)$value,
          source(paste0(MAIN_PATH,"/UI/Tab3UI.R"),local=TRUE)$value,
          source(paste0(MAIN_PATH,"/UI/Tab4UI.R"),local=TRUE)$value,
          source(paste0(MAIN_PATH,"/UI/Tab5UI.R"),local=TRUE)$value
    )
  )
)
