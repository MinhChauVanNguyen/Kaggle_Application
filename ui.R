MAIN_PATH <- paste0(getwd(), "/")

# application
theme_set(theme_bw())

ui <- fluidPage(
  tags$link(rel = "stylesheet", type = "text/css", href = "my.css"),
  # .selectize-input doesn't work
  tags$head(
    tags$style(
      "#country1 {border:2px solid #787878;}
       #country2 {border:2px solid #787878;}
       #country3 {border:2px solid #787878;}
       #country4 {border:2px solid #787878;}
       #country5 {border:2px solid #787878;}"
    )
  ),
  headerPanel(
    fluidRow( 
      column(5, h1(span(class = "highlight", "Suicide data by country"))),
      column(5, offset = 2, h1(class = "hightlight", "Lifeline NZ 0800 543 354"))
    )
  ),
  br(),
  tabsetPanel(id = "tabs", 
          source(paste0(MAIN_PATH,"/UI/Tab1UI.R"),local=TRUE)$value,
          source(paste0(MAIN_PATH,"/UI/Tab2UI.R"),local=TRUE)$value,
          source(paste0(MAIN_PATH,"/UI/Tab3UI.R"),local=TRUE)$value,
          source(paste0(MAIN_PATH,"/UI/Tab4UI.R"),local=TRUE)$value,
          source(paste0(MAIN_PATH,"/UI/Tab5UI.R"),local=TRUE)$value
  ),
  br()
)
