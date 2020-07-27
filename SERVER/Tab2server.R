# TAB 2

output$PLOT1 <- renderUI({
  imageOutput(outputId = "img_plot")
})

output$img_plot <- renderImage({
  list(src = "./www/plot1.png")
}, deleteFile = FALSE) 

dat1 <- eventReactive(input$tick, {
  data <- suicide_by_age_sex[suicide_by_age_sex$country == input$country1, ]
  ggplot(data = data, aes(x = sex, y = suicide_rate, fill = age)) + 
    geom_bar(position = "dodge", stat = "identity", alpha = 0.3) +
    ggtitle(label = sprintf("Suicide Rate for %s \n adjusted for Age & Sex", 
                            isolate(input$country1))) +
    scale_fill_manual(values = c("#FFC0CB", "#ff6347", "#add8e6", "#bf3eff", "#FFFF00", "#adff2f")) +
    my_theme()
})

observeEvent(input$tick, {
  output$PLOT1 <- renderUI({
    plotOutput("dynamic_plot")
  })
  
  output$dynamic_plot <- renderPlot({
    dat1()
  })
})

output$PLOT2 <- renderUI({
  imageOutput(outputId = "img_plot2")
})

output$img_plot2 <- renderImage({
  list(src = "./www/plot2.png")
}, deleteFile = FALSE) 

dat2 <- eventReactive(input$tick,{
  data <- suicide_by_age_sex[suicide_by_age_sex$country == input$country2, ]
  ggplot(data = data, aes(x = sex, y = suicide_rate, fill = age)) + 
    geom_bar(position = "dodge", stat = "identity", alpha = 0.3) +
    ggtitle(label = sprintf("Suicide Rate for %s \n adjusted for Age & Sex", 
                            isolate(input$country2))) +
    scale_fill_manual(values = c("#FFC0CB", "#ff6347", "#add8e6", "#bf3eff", "#FFFF00", "#adff2f")) +
    my_theme()
})

observeEvent(input$tick, {
  output$PLOT2 <- renderUI({
    plotOutput("dynamic_plot2")
  })
  
  output$dynamic_plot2 <- renderPlot({
    dat2()
  })
})


