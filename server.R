library(shiny)
library(ggplot2)

shinyServer(
  function(input, output) {
    output$distPlot <- renderPlot({
      nosim = input$nrOfSim
      samples = input$sampleSize
      rate = input$rate
      overlay = input$checkbox
      
      mns = NULL
      for (i in 1 : nosim) mns = c(mns, mean(rexp(samples, rate)))
      
      dat <- data.frame(mns)
      g <- ggplot(dat, aes(x = mns)) + xlim(0, 10) +
        geom_histogram(alpha=0.4, binwidth=.1, colour = "black", 
                       aes(y = ..density..))
      if (overlay==TRUE)
        g <- g + stat_function(fun = dnorm, size = 2, colour="red", 
                      arg=list(mean=1/rate, sd=1/(rate*sqrt(samples))))
      g
    })
  }
)