library(shiny)

library(ggplot2)

resData<- residuals
projectdata$Sex<- factor(projectdata$Sex, labels = c("Female", "Male"))

shinyServer(function(input, output) {
  
  # Create a reactive text
  text <- reactive({paste(input$variable, 'versus', input$response)
  })
  text2 <- reactive({paste(input$variable2, 'versus', input$response2)
  })
  
  # Return as text the selected variables
  output$caption <- renderText({ text()
  })
  
  output$caption2 <- renderText({ text2()
  })
  
  # Generate a plot of the requested variables
  output$plot <- renderPlot({
    p <- ggplot(projectdata, aes_string(x=input$variable, y=input$response)) + geom_point(aes(colour=factor(Sex)),size=4)+geom_point(colour="grey90",size=1.5)
    print(p)
  })
   
  output$plot2 <- renderPlot(function(){
    if(input$gender == "Male"){
      plotData <- maledata
    }
    else{
      plotData <- femaledata
    }
    
    p <- ggplot(plotData, aes(Height,MRI_Count)) + geom_point(aes(colour=factor(Sex),size=4))+geom_point(colour="grey90",size=1.5)
    print(p)
  })
  
  output$summ<-renderPrint({plot(fitted(projectlm),residuals(projectlm),pch=16,xlab="Fitted Values",ylab="Residuals",main="Residual Plot for the Model")
    summary(projectlm.2)
  })
})








  


