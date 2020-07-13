# TAB 2

output$PLOT1 <- renderUI({
  imageOutput(outputId = "img_plot")
})

output$img_plot <- renderImage({
  list(src = "./www/plot1.png")
}, deleteFile = FALSE) 


observeEvent(input$tick, {
  output$PLOT1 <- renderUI({
    plotOutput("dynamic_plot")
  })
  
  output$dynamic_plot <- renderPlot({
    data <- suicide_by_age_sex[suicide_by_age_sex$country == input$country1, ]
    ggplot(data = data, aes(x = sex, y = suicide_rate, fill = age)) + 
      geom_bar(position = "dodge", stat = "identity") +
      ggtitle(label = sprintf("Suicide Rate for %s \n adjusted for Age & Sex", 
                              isolate(input$country1))) +
      theme(legend.position = "none") + 
      theme(plot.title = element_text(color = "black", size = 20, face = "bold.italic", hjust = 0.5),
            axis.title.x = element_text(color = "black", size = 12),
            axis.title.y = element_text(color = "black", size = 12)) +
      scale_fill_manual(values = c("pink", "tomato", "light blue", "darkorchid1", "yellow", "greenyellow")) 
  })
})

output$PLOT2 <- renderUI({
  imageOutput(outputId = "img_plot2")
})

output$img_plot2 <- renderImage({
  list(src = "./www/plot2.png")
}, deleteFile = FALSE) 


observeEvent(input$tick, {
  output$PLOT2 <- renderUI({
    plotOutput("dynamic_plot2")
  })
  
  output$dynamic_plot2 <- renderPlot({
    data <- suicide_by_age_sex[suicide_by_age_sex$country == input$country2, ]
    ggplot(data = data, aes(x = sex, y = suicide_rate, fill = age)) + 
      geom_bar(position = "dodge", stat = "identity") +
      ggtitle(label = sprintf("Suicide Rate for %s \n adjusted for Age & Sex", 
                              isolate(input$country1))) +
      theme(legend.position = "none") + 
      theme(plot.title = element_text(color = "black", size = 20, face = "bold.italic", hjust = 0.5),
            axis.title.x = element_text(color = "black", size = 12),
            axis.title.y = element_text(color = "black", size = 12)) +
      scale_fill_manual(values = c("pink", "tomato", "light blue", "darkorchid1", "yellow", "greenyellow")) 
  })
})


