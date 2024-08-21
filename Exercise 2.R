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
  greeting_UI("name_module", "Enter your name:"),
  greeting_Output("name_module")
)

server <- function(input, output, session) {
  greeting_Server('name_module')
}

#####

##### Normally kept in app.R #####
shinyApp(ui = ui, server = server)
##### 




#FIXME
# 1
# What happens if you add another set of UI, Output, and Server? Add one of each below the existing ones. Instead of passing it "name_module", call it "name_module2". 
# Have the input text for the second text input be something different.
# 
# 2
# This will give you a change to experiment with layouts. Try putting the new input and output on a different page.

# 3
# Finally, switch the output so the input from the first page prints out on the second page, and the input from the second page outputs on the first page