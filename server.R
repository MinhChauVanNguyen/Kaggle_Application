MAIN_PATH <- paste0(getwd(), "/")

source("global.R", local = TRUE)

source( "ui.R", local = TRUE)

server <- function(input, output, session){
  
  source(paste0(MAIN_PATH, "/SERVER/Tab1server.R"), local = TRUE)$value
  
  source(paste0(MAIN_PATH, "/SERVER/Tab2server.R"), local = TRUE)$value
  
  source(paste0(MAIN_PATH, "/SERVER/Tab3server.R"), local = TRUE)$value
  
  source(paste0(MAIN_PATH, "/SERVER/Tab4server.R"), local = TRUE)$value
  
  source(paste0(MAIN_PATH, "/SERVER/Tab5server.R"), local = TRUE)$value
}