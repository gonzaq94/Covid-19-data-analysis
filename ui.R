ui <- fluidPage(navlistPanel(
  tabPanel("New cases analysis",
           verticalLayout(
              titlePanel("Covid-19 Data Analysis"),

               selectInput(inputId = "countries", label = strong("Select the countries or territories to analyze"),
                           choices = sort(unique(data$Country.Region)),
                           multiple = TRUE, width = "100%", selected = 'France'),
               
               plotOutput(outputId = "exp_plot", height = "600px", width = "100%")
             )
  ),
  tabPanel("Temporal plot",

          verticalLayout(
            
              titlePanel("Covid-19 Data Analysis"),
            
              plotOutput(outputId = "time_plot",height = "500px",width = "100%")

          )
  ),
  widths = c(2,10)

))
