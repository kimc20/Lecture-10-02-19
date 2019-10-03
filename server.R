# To open Dr. Whitworth's files, go to File -> Open -> type in "/home"

library(shiny)
library(ggplot2)
library(tidyverse)

function(input, output) {
  
  output$priceDensity <- renderPlot({
    
    diamonds %>% 
      filter(cut %in% input$priceIncludeCuts) %>% 
      ggplot(aes_string("price", fill = input$priceGroupBy)) + 
      geom_density(alpha = 0.2)
    
  })
}


# A vertical bar " | " means "or"
