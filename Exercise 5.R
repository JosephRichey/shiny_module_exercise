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
    ### YOUR CODE HERE ###
  )
}

Output <- function(id) {
  ns <- NS(id)
  tagList(
    ### YOUR CODE HERE ###
  )
}

Server <- function(id) {
  moduleServer(
    id,
    function(input, output, session) {
      ### YOUR CODE HERE ###
      
    }

  )
}









# For your inputs, use numericInput(). Don't forget to wrap your input name in ns()
# For your render, use renderPlot()
# Use rnorm to generate your normal distribution
# For your output, use plotOutput()