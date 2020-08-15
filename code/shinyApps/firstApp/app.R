library(shiny)

ui<- fluidPage(

    sliderInput(inputId="num",
                label="Choose number",
                value=25, min=1, max=100),
    plotOutput("hist"),
    verbatimTextOutput("stats")
    
)

server<- function(input,output){
    data<- reactive({ set.seed(13)
                      rnorm(100,mean=input$num,sd=10)})
    
    output$hist<-renderPlot({
        
        
        hist(data(), 
             main="100 random normal values",
             xlab="somethig",
             xlim=range(0,100),
             breaks=10,
             freq=TRUE
            )
    })
    
    output$stats<-renderPrint({summary(data())})
    
}

shinyApp(ui=ui,server=server)
