##### Normally kept in the view folder, probably titled greeting. #####
library(shiny)

greeting_UI <- function(id, label) {
  ns <- NS(id)
  tagList(
    # Take a text input from the user
    textInput(ns("name_input"), label),

    # Make an action button that will delay action until it's hit
    actionButton(ns("submit_btn"), "Submit")
  )
}

greeting_Output <- function(id) {
  ns <- NS(id)
  tagList(
    # Output the greeting.
    textOutput(ns('greeting'))
  )

}

greeting_Server <- function(id) {
  moduleServer(
    id,
    function(input, output, session) {
      output$greeting <- renderText({
        paste0('Hello ', input$name_input, "!")
      }) |> bindEvent(input$submit_btn) # This prevents this from rendering until submit is pushed

    }

  )
}

#####

###### Normally kept in main.R. #####
# This is our "top level" app.
ui <- fluidPage(
  tabsetPanel(
    tabPanel("Panel 1",
      greeting_UI("name_module", "Enter your name:"),
      greeting_Output("name_module2")
    ), 
    tabPanel("Panel 2",
      greeting_UI("name_module2", "Who are you?"),
      greeting_Output("name_module")

    )
  )
)

server <- function(input, output, session) {
  greeting_Server('name_module')
  greeting_Server('name_module2')
}

#####

##### Normally kept in app.R #####
shinyApp(ui = ui, server = server)
##### 




#FIXME
# 1
# Make a modification to the module. Add some other welcome text to the greeting render. Does it apply to just one page or both?