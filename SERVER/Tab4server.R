# TAB 4
# using suicide_by_age subset

output$BARPLOT <- renderUI({
  imageOutput(outputId = "bar_plot")
})

output$bar_plot <- renderImage({
  list(src = "./www/barchart.png")
}, deleteFile = FALSE) 

observeEvent(input$go, {
  output$BARPLOT <- renderUI({
    plotOutput("dynamic_bar")
  })
  
  output$dynamic_bar <- renderPlot({
    data <- suicide_by_age[suicide_by_age$country == input$country4, ]
    data <- data[data$age == input$age, ]
    
    ggplot(data = data, aes(x = year)) + 
    geom_bar(aes(weight = suicide_no), color = "black", fill = "#FFCCFF") + 
    ggtitle(label = sprintf("Number of suicides of %s \n for %s age group", 
                            isolate(input$country4),
                            isolate(input$age))) +
    my_theme()
  })
})
