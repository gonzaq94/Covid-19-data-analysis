server <- function(input, output) {
  
  output$exp_plot <- renderPlot({
        rate_vs_cases_plot(data,input$countries, xlabel = 'active cases', ylabel = 'new cases')
    
  })
  
  output$time_plot <- renderPlot({
    temporal_plot(data,input$countries, xlabel = 'date', ylabel = 'active cases')
    
  })
  
}