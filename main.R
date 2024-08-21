# This is telling our app where to find the modules we made
box::use(
  ./normal_hist,
  ./linear_reg,
)

# In modularized apps, you don't library functions, you box::use them
box::use(
  bslib[...],
)


# This is our "top level" app.
ui <- bslib::page_fillable(
  bslib::layout_columns(
    bslib::card(
      bslib::card_title('Normal Histogram Inputs'),
      normal_hist$UI("hist")
    ),

    bslib::card(
      bslib::card_title("Normal Histogram"),
      normal_hist$Output('hist')
    ),

    bslib::card(
      bslib::card_title("Regression Inputs"),
      linear_reg$UI('reg')
    ),

    bslib::card(
      bslib::card_title("Regression"),
      linear_reg$Output('reg')
    ),


    col_widths = c(3,9),
    row_heights = c(1,1)
  )
)

server <- function(input, output, session) {
  normal_hist$Server('hist')

  linear_reg$Server('reg')
}

#####

##### Normally kept in app.R #####
shiny::shinyApp(ui = ui, server = server)
