# TAB 1
output$dataTable <- renderDT(
  rownames = FALSE,
  suicide,                              
  class = "display nowrap compact",     
  filter = "top",                      
)