# TAB 5
# using suicide_by_sex_age subset


output$INTERACTION <- renderUI({
  div(imageOutput(outputId = "inter_plot"), style = "margin-bottom:-200px;")
})

output$inter_plot <- renderImage({
  list(src = "./www/interaction.png")
}, deleteFile = FALSE) 

observeEvent(input$ick, {
  output$INTERACTION <- renderUI({
   plotOutput("dynamic_inter", height = "200px")
  })
  
  output$dynamic_inter <- renderPlot({
    data <- suicide_by_sex_age[suicide_by_sex_age$country == input$country5, ]
    fit <- glm(suicide_no ~ sex + age + sex*age, family = poisson(link = "log"), data = data)
    ggplot(data = data, aes(x = factor(sex), y = predict(fit, type = "response"), colour = age)) + 
      geom_point(data = data, aes(y = predict(fit, type = "response"))) +
      geom_line(data = data, aes(y = predict(fit, type = "response"), group = age)) + 
      ggtitle(label = sprintf("Interactiton plot for %s", isolate(input$country5))) +
      labs(x = "Sex", y = "PredictedProb") +
      theme(plot.background = element_rect(fill = "#ecf0f1"),
            plot.title = element_text(color = "black", size = 13, face = "bold.italic", hjust = 0.5),
            axis.title.x = element_text(color = "black", size = 12),
            axis.title.y = element_text(color = "black", size = 12),
            legend.key=element_rect(fill=NA), 
            legend.background = element_rect(fill = "#ecf0f1", color = "#ecf0f1"))
  })
})

output$SUMMARY <- renderUI({
  imageOutput(outputId = "img_model")
})

output$img_model <- renderImage({
  list(src = "./www/poisson.png")
}, deleteFile = FALSE) 

observeEvent(input$ick, {
  output$SUMMARY <- renderUI({
    verbatimTextOutput("dynamic_summary")
  })
  
  output$TITLE <- renderText({
    paste("Summary Poisson statistics for", isolate(toupper(input$country5)))
  })
  
  output$dynamic_summary <- renderPrint({
    data <- suicide_by_sex_age[suicide_by_sex_age$country == req(input$country5), ]
    fitted <- glm(suicide_no ~ sex + age + sex*age, family = poisson(link = "log"), data = data)
    fitted
  })
})

output$POISSON <- renderUI({
  div(imageOutput(outputId = "pois_plot"), style = "margin-top:-90px;")
})

output$pois_plot <- renderImage({
  list(src = "./www/poissonplot.png")
}, deleteFile = FALSE) 


observeEvent(input$ick, {
  output$POISSON <- renderUI({
    plotOutput("dynamic_pois", width = "90%", height = "350px")
  })
  
  output$dynamic_pois <- renderPlot({
    data <- suicide_by_sex_age[suicide_by_sex_age$country == input$country5, ]
    fit <- glm(suicide_no ~ sex + age + sex*age, family = poisson(link = "log"), data = data)
    
    ggplot(data = data, aes(x = year, y = predict(fit, type = "response"), colour = age)) +
      geom_point(aes(y = suicide_no), size = 3) +
      stat_smooth(aes(y = suicide_no), method = "loess", se = FALSE) +
      labs(x = "Year", y = "PredictedProb") +
      ggtitle(label = sprintf("Suicide Rate for %s by Age group", isolate(input$country5))) +
      theme(plot.title = element_text(color = "black", size = 20, face = "bold.italic", hjust = 0.5),
            axis.title.x = element_text(color = "black", size = 12),
            axis.title.y = element_text(color = "black", size = 12))
  })
})

