library(shiny)
library(datasets)

mpgData <- mtcars
mpgData$am <- factor(mpgData$am, labels = c("Automatic", "Manual"))


ui <- fluidPage(
  
  titlePanel("Miles Per Gallon"),
  
  sidebarLayout(
    
    sidebarPanel(
      
      textInput("text","input your text") , 
      
      selectInput("select", "select your data set : ",
                  list("mtcars" ,
                       "cars" ,
                       "rock"
                  )
      ) ,
      
      
      selectInput("x","select your x variable of rock data :",
                  c("area","peri","shape","perm") , selected = "shape"
      ) , 
      
      selectInput("y","select your y variable of rock data :" ,
                  list("area","peri","shape","perm") , selected = "peri") ,
      
      sliderInput("slider", "select your n :",
                  min = 1, max = 10, value = 5) ,
      
      sliderInput("color" , "select your color :" ,
                  min = 1 , max = 20 , value = 7) ,
      
      # img(src="i.jpg",weight="100",height="100")
      HTML("<img src='i.jpg',height='200px' , width='200px'>")
      
      
    ),
    
    mainPanel(
      
      textOutput("view") , 
      
      verbatimTextOutput("data") , 
      
      verbatimTextOutput("head") ,
      
      plotOutput("plot")
      
    ) # end of main panel
  ) # end of sidebar layout 
) # end of fluid page

server <- function(input, output) {
  
  datax <- reactive({
    switch (input$x,
            "area" = "area" ,
            "peri" = "peri" ,
            "shape" = "shape",
            "perm"= "perm"
    )
  })
  
  datay <- reactive({
    switch (input$y,
            "area" = "area" ,
            "peri" = "peri" ,
            "shape" = "shape",
            "perm"= "perm"
    )
  })
  
  selectdata <- reactive({
    switch (input$select,
            "mtcars" = mtcars ,
            "cars" = cars,
            "rock" = rock
    )
  })
  output$view <- renderText({
    paste("Hello" , input$text)
  })
  
  output$data <- renderPrint({
    summary(selectdata())
    
  })
  
  output$plot <- renderPlot({
    plot(rock[,datax()] , rock[,datay()],col=rainbow(input$color))
  })
  
  
  output$head <- renderPrint({
    n <- input$slider
    head(selectdata(),n)
  })
}

shinyApp(ui, server)

# rnorm(10) %>% 
# plot(col = 5)
