# TAB 5
# using suicide_by_sex_age subset
output$COUNTRY5 <- renderUI({
  selectInput(inputId = "country5",
              label = "please choose a country", 
              selected = "New Zealand",
              choices = unique(suicide_by_sex_age$country),
              selectize = FALSE)
})

output$ENTER <- renderUI({
  actionButton(inputId = "ick", label = "Update", icon("paper-plane"), style = "color: black")
})

observeEvent(input$ick, {
  output$TITLE <- renderText({
      paste("Summary Poisson statistics for", isolate(toupper(input$country5)))
  })
})

data5 <- eventReactive(input$ick,{
  suicide_by_sex_age[suicide_by_sex_age$country == req(input$country5), ]
})

output$SUMARY <- renderPrint({
  data <- data5()
  fitted <- glm(suicide_no ~ sex + age + sex*age, family = poisson(link = "log"), data = data)
  summary(fitted)
})

# use predicted probability of y to produce the interaction plot 
output$NAME <- renderPlot({
  m1 <- eventReactive(input$ick,{
    suicide_by_sex_age[suicide_by_sex_age$country == input$country5, ]
  })
  fit1 <- glm(suicide_no ~ sex + age + sex*age, family = poisson(link = "log"), data = m1())
  ggplot(data = m1(), aes(x = factor(sex), y = predict(fit1, type = "response"), colour = age)) + 
    # geom_boxplot() + 
    geom_point(data = m1(), aes(y = predict(fit1, type = "response"))) +
    geom_line(data = m1(), aes(y = predict(fit1, type = "response"), group = age)) + 
    ggtitle(label = sprintf("Interactiton plot of Sex & Age for %s", 
                            isolate(input$country5))) +
    labs(x = "Sex", y = "PredictedProb") +
    theme(plot.title = element_text(color = "black", size = 20, face = "bold.italic", hjust = 0.5),
          axis.title.x = element_text(color = "black", size = 12),
          axis.title.y = element_text(color = "black", size = 12))
})
# use predicted probability of y to produce the scatter plot
output$SELF <- renderPlot({
  m2 <- eventReactive(input$ick,{
    suicide_by_sex_age[suicide_by_sex_age$country == input$country5, ]
  })
  fit2 <- glm(suicide_no ~ sex + age + sex*age, family = poisson(link = "log"), data = m2())
  ggplot(data = m2(), aes(x = year, y = predict(fit2, type = "response"), colour = age)) +
    geom_point(aes(y = suicide_no), size = 3) +
    stat_smooth(aes(y = suicide_no), method = "loess", se = FALSE) +
    labs(x = "Year", y = "PredictedProb") +
    ggtitle(label = sprintf("Suicide Rate for %s by Age group", 
                            isolate(input$country5))) +
    theme(plot.title = element_text(color = "black", size = 20, face = "bold.italic", hjust = 0.5),
          axis.title.x = element_text(color = "black", size = 12),
          axis.title.y = element_text(color = "black", size = 12))
})