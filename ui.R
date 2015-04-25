library(shiny)
shinyUI(pageWithSidebar(
  headerPanel("Demonstration of the Central Limit Theorem"),
  sidebarPanel(
    p('Sample size: controls how many samples to average. The variance of the
      sample average depends on this value.'),
    p('Number of simulation: controls how many times the sample average shall 
      be calculated with independent runs.'),
    p('Exponential rate: is the rate parameter for the exponential distribution.
      The expectation and standard deviation of an exponential are 1/rate.'),
    
    numericInput('sampleSize', 'Sample size (1-100)', 25, min=1, max=100, step=1),
    numericInput('nrOfSim', 'Number of simulation (100-5k)', 1000, min=100, max=5000, step=100),
    numericInput('rate', 'Exponential rate (0.2-0.5)', 0.2, min=0.2, max=0.5, step=0.1),
    checkboxInput("checkbox", label = "Overlay normal density", value = TRUE),
    submitButton('Simulate')
  ),
  
  mainPanel(
    p('One variant of the central limit theorem (CLT) states that, given  
      certain conditions, the arithmetic mean of a sufficiently large number of 
      independent, identically distributed random variables, with a 
      well-defined expected value and well-defined variance, will be 
      approximately normally distributed, regardless of the underlying 
      distribution (see wikipedia).'),
    
    p('For an exponential distribution with rate r, both the expectation and
      standard deviation are 1/r. The CLT says that the average of n 
      exponentials is approximately normally distributed, with a mean 1/r and
      standard deviation 1/(r sqrt(n)).'),
    
    p('Change the three parameters to the left, click on Simulate and see how 
      the curve changes. You have the option to overlay the normal density on the 
      simulated density'),
    
    h3('Results of simulation'),
    plotOutput('distPlot')
  )
))