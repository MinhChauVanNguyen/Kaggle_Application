# TAB 3
# using suicide_by_age subset 
output$COUNTRY3 <- renderUI({
  selectInput(inputId = "country3",
              label = "please choose a country", 
              selected = "New Zealand", 
              choices = unique(suicide_by_age$country),
              selectize = FALSE)
})
output$CLICK <- renderUI({
  actionButton(inputId = "tock", label = "Update", icon("paper-plane"), style = "color: black")
})
output$BYE <- renderPlot({
  df <- eventReactive(input$tock,{
    suicide_by_age[suicide_by_age$country == input$country3, ]
  })
  ggplot(data = df(), aes(x = "", y = suicide_no, fill = age)) +
    geom_bar(stat = "identity") +
    coord_polar("y", start = 0) +
    ggtitle(label = sprintf("Pie Chart of Age \n Variable for %s", 
                            isolate(input$country3))) +
    theme(plot.title = element_text(color = "black", size = 20, face = "bold.italic", hjust = 0.5),
          axis.title.x = element_text(color = "black", size = 12),
          axis.title.y = element_text(color = "black", size = 12))
})
output$CIAO <- renderPlot({
  dtInput <- eventReactive(input$tock,{
    suicide_by_age[suicide_by_age$country == input$country3, ]
  })
  ggplot(data = dtInput(), mapping = aes(x = year, 
                                         y = suicide_rate, 
                                         color = age)) + 
    geom_jitter(alpha = 1) +
    geom_encircle(aes(x = year, y = suicide_rate), 
                  data = suicide_select, 
                  color = "green", 
                  size = 2, 
                  expand = 0.01) +
    ggtitle(label = sprintf("Scatter plot of different \n Age groups for %s", isolate(input$country3))) +
    theme(plot.title = element_text(color = "black", size = 20, face = "bold.italic", hjust = 0.5),
          axis.title.x = element_text(color = "black", size = 12),
          axis.title.y = element_text(color = "black", size = 12))
})