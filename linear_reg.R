box::use(
  shiny[...],
  stats[...],
  graphics[...],
)

UI <- function(id) {
  ns <- NS(id)
  tagList(
    numericInput(ns('m'), "Slope", 1, 1, 3, step = 0.25),
    numericInput(ns('b'), "Intercept", 0, -5, 5),
    numericInput(ns('j'), "Noise", 0, 0, 5)
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
        # browser()

        # Generate data
        x <- seq(0, 10, length.out = 100)
        y <- input$m * x + input$b + rnorm(100, mean = 0, sd = input$j)  # Add jitter

        # Fit a linear model
        model <- lm(y ~ x)

        # Plot the data and regression line
        plot(x, y, main = "Linear Regression with Jitter",
             xlab = "X", ylab = "Y")
        abline(model, col = "blue", lwd = 2)  # Regression line
        abline(a = input$b, b = input$m, col = "red", lwd = 2, lty = 2)  # Original line
        legend("topleft", legend = c("Original Line", "Fitted Line"),
               col = c("red", "blue"), lty = c(2, 1), lwd = 2)
      })
      
    }

  )
}