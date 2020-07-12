# TAB 4
# using suicide_by_age subset
output$COUNTRY4 <- renderUI({
  selectInput(inputId = "country4",
              label = "please choose a country", 
              selected = "New Zealand",
              choices = unique(suicide_by_age$country),
              selectize = FALSE)
})

datasub <- reactive({
  suicide_by_age[suicide_by_age$country == input$country4, ]
})

output$AGE <- renderUI({
  radioButtons(inputId = "age", 
               label = "please choose an Age Group",
               choices = unique(levels(suicide_by_age$age)))
})
output$UPDATE <- renderUI({
  actionButton(inputId = "go", label = "Update", icon("paper-plane"), style = "color: black")
})

datasub  <- eventReactive(input$go,{
  data <- suicide_by_age[suicide_by_age$country == input$country4, ]
  data <- data[data$age == input$age, ]
})

output$LATER <- renderPlot({
  ggplot(data = datasub(), aes(x = year)) + 
    geom_bar(aes(weight = suicide_no), color = "black", fill = "#FFCCFF") + 
    ggtitle(label = sprintf("Number of suicides of %s \n for %s age group", 
                            isolate(input$country4),
                            isolate(input$age))) +
    theme(plot.title = element_text(color = "black", size = 20, face = "bold.italic", hjust = 0.5),
          axis.title.x = element_text(color = "black", size = 12),
          axis.title.y = element_text(color = "black", size = 12))
})