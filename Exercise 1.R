##### Normally kept in the view folder, probably titled greeting. #####
library(shiny)

greeting_UI <- function(id) {
  ns <- NS(id)
  tagList(
    # Take a text input from the user
    textInput(ns("name_input"), "Enter your name:"),

    # Make an action button that will delay action until it's hit
    actionButton(ns("submit_btn"), "Submit"),

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
  greeting_UI("name_module")
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
# What happens if you try to split the output into it's own thing? (take the outputText and put it in it's own greeting_Output)?
# If it doesn't show up, what can you do in the main UI to make it show up?
# 
# 2
# Try changing the greeting_UI to have something else display on the text input. Make this a part of the function.
# (HINT: You need to pass an additional argument to the greeting_UI function)

# BONUSE
# What happens if you remove "|> bindEvent(input$submit_btn)"