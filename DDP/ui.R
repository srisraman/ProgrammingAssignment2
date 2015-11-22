#ui.R
library(shiny)
shinyUI(fluidPage(
  title="Trump's Image Among Republicans Slips",
  plotOutput('favorability'),
  h6("Source: http://www.gallup.com/opinion/polling-matters/186572/trump-image-among-republicans-slips-again-eve-debate.aspx?g_source=POLITICS&g_medium=topic&g_campaign=tiles"),
  hr(),
  fluidRow(
    column(4, 
           h5("Week Since July"),
           sliderInput('q', 'Week', value=10, min=1, max=23, step=1),
           h6("Use the slider to choose the Week since July of Trump's Favorability Rating"),
           h6("The marker lines on the graph will change to follow your pick")
    ),
    column(8,
           h5("Mean favorability rating to date: ", textOutput("mean")),
           h5("Selected Week ", textOutput("q")),
           h5("Favorability Rating: ", textOutput("Percentage"))
    )
  )
))