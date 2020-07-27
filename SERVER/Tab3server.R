# TAB 3
# using suicide_by_age subset 

output$PIECHART <- renderUI({
  div(imageOutput(outputId = "pie_plot"), style = "margin-left:30px; padding:0;")
})

output$pie_plot <- renderImage({
  list(src = "./www/piechart.png")
}, deleteFile = FALSE) 

dat3 <- eventReactive(input$tock, {
  data <- suicide_by_age[suicide_by_age$country == input$country3, ]
  ggplot(data = data, aes(x = "", y = suicide_no, fill = age)) +
    geom_bar(stat = "identity") +
    coord_polar("y", start = 0) +
    ggtitle(label = sprintf("Pie Chart of Age \n Variable for %s", 
                            isolate(input$country3))) +
    my_theme()
})

observeEvent(input$tock, {
  output$PIECHART <- renderUI({
    plotOutput("plot")
  })
  
  output$plot <- renderPlot({
    dat3()
  })
})

output$SCATTER <- renderUI({
  div(imageOutput(outputId = "scatter_plot"), style = "margin-right:20px;")
})

output$scatter_plot <- renderImage({
  list(src = "./www/scatterplot.png")
}, deleteFile = FALSE) 


dat4 <- eventReactive(input$tock,{
  data <- suicide_by_age[suicide_by_age$country == input$country3, ]
  ggplot(data = data, mapping = aes(x = year, 
                                    y = suicide_rate, 
                                    color = age)) + 
    geom_jitter(alpha = 1) +
    geom_encircle(aes(x = year, y = suicide_rate), 
                  data = suicide_select, 
                  color = "green", 
                  size = 2, 
                  expand = 0.01) +
    ggtitle(label = sprintf("Scatter plot of different \n Age groups for %s", isolate(input$country3))) +
    my_theme()
})

observeEvent(input$tock, {
  
  output$SCATTER <- renderUI({
    plotOutput("plot2")
  })
  
  output$plot2 <- renderPlot({
   dat4()
  })
})

