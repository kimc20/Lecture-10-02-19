# Lecture Notes Thursday October 3rd

# Let's make a density distribution with the diamonds dataset from ggplot2. 

library(ggplot2)
View(diamonds)

ggplot(diamonds, aes(price, fill = clarity)) + geom_density()
ggplot(diamonds, aes(price, fill = clarity)) + geom_density(alpha = 0.2)

# Let's load the Shiny package
library(shiny)

# It's a good habit to start by making an outline of code that you're going to use
function(input, output) {
  
  fluidPage(
    
    title = "Diamonds Made Interactive",
    titlePanel("Diamonds"),
    sidebarLayout(
      sidebarPanel(
        selectInput(
          inputId = "priceGroupBy",
          label = "Group by",
          choices = list( Cut = "cut",
                          Color = "color",
                          Clarity = "clarity"
                          ),
          selected = "cut"
        ),
        selectizeInput(
          inputId = "priceIncludeCuts",
          label = "Include cuts",
          choices = unique(diamonds$cut),
          multiple = TRUE,
          selected = unique(diamonds$cut)
        )
      ),
      mainPanel(
        plotOutput("priceDensity")
      )
    )
  )
}

