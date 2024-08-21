# Pretend this is one of your module files stored in the view folder. Do the following:
# Rename this file to normal_hist.R
# Add two numerical inputs, one called n and the other called m.
# Add a renderPlot that plots a normal distribtuion with n observations and mean m.
# Display that plot in the output.
# When done, go to main.R

# Hints are at the bottom if you get stuck.

box::use(
  shiny[...],
  stats[...],
  graphics[...],
)

UI <- function(id) {
  ns <- NS(id)
  tagList(
    numericInput(ns('n'), "N", 30, 1, 50),
    numericInput(ns('m'), "M", 0, -5, 5)
  )
}

Output <- function(id) {
  ns <- NS(id)
  tagList(
    plotOutput(ns('my_plot'))
  )
}

Server <- function(id) {
  moduleServer(
    id,
    function(input, output, session) {
      output$my_plot <- renderPlot({
        sample <- rnorm(input$n, input$m, 1)

        hist(sample)
      })
      
    }

  )
}









# For your inputs, use numericInput()
# For your render, use renderPlot()
# Use rnorm to generate your normal distribution
# For your output, use plotOutput()