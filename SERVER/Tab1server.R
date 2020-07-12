# TAB 1
output$dataTable <- renderDT(
  suicide,                              # data
  class = "display nowrap compact",     # style
  filter = "top",                       # location of column filters
)