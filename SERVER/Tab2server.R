# TAB 2
# using suicide_by_age_sex subset
output$COUNTRY1 <- renderUI({
  selectInput(inputId = "country1",
              label = "please choose a country", 
              selected = "New Zealand",
              choices = unique(suicide_by_age_sex$country), 
              selectize = FALSE)
})

output$COUNTRY2 <- renderUI({
  selectInput(inputId = "country2",
              label = "please choose a country", 
              selected = "Australia",
              choices = unique(suicide_by_age_sex$country), 
              selectize = FALSE)
})

output$CLICKME <- renderUI({
  actionButton(inputId = "tick", label = "Update", icon("paper-plane"), style = "color: black")
})

output$SEEYA <- renderPlot({
  dasetInput <- eventReactive(input$tick,{
    suicide_by_age_sex[suicide_by_age_sex$country == input$country1, ]
  })
  ggplot(data = dasetInput(), aes(x = sex, y = suicide_rate, fill = age)) + 
    geom_bar(position = "dodge", stat = "identity") +
    ggtitle(label = sprintf("Suicide Rate for %s \n adjusted for Age & Sex", 
                            isolate(input$country1))) +
    theme(legend.position = "none") + 
    theme(plot.title = element_text(color = "black", size = 20, face = "bold.italic", hjust = 0.5),
          axis.title.x = element_text(color = "black", size = 12),
          axis.title.y = element_text(color = "black", size = 12)) +
    scale_fill_manual(values = c("pink", "tomato", "light blue", "darkorchid1", "yellow", "greenyellow")) 
})

output$SOPRANOS <- renderPlot({
  daasetInput <- eventReactive(input$tick,{
    suicide_by_age_sex[suicide_by_age_sex$country == input$country2, ]
  })
  ggplot(data = daasetInput(), aes(x = sex, y = suicide_rate, fill = age)) + 
    geom_bar(position = "dodge", stat = "identity") +
    theme(legend.position = "left") +
    ggtitle(label = sprintf("Suicide Rate for %s \n adjusted for Age & Sex", 
                            isolate(input$country2))) +
    theme(plot.title = element_text(color = "black", size = 20, face = "bold.italic", hjust = 0.5),
          axis.title.x = element_text(color = "black", size = 12),
          axis.title.y = element_text(color = "black", size = 12)) + 
    scale_fill_manual(values = c("pink", "tomato", "light blue", "darkorchid1", "yellow", "greenyellow")) 
})