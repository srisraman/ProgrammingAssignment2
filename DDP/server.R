#server.R
library(shiny)

#Trump's Image Among Republicans Slips
#Source: http://www.gallup.com/opinion/polling-matters/186572/trump-image-among-republicans-slips-again-eve-debate.aspx?g_source=POLITICS&g_medium=topic&g_campaign=tiles
#
Trump <- c(20,19,14,18,20,21,17,21,29,31,27,25,24,19,18,18,24,28,27,28,20,19,16)
Week <- c(rep("N/A", length(Trump)))

shinyServer(
  function(input, output) {
    op <- renderPlot({
      plot(Trump, 
           type="l",
           col="green",
           lwd=5,
           main="Trump's Favorability Rating",
           sub="Two-week rolling averages, among Republicans/leaners",
           xlab="Week since July",
           ylab="Favorability Rating")
      q <- input$q
      abline(v=q, lwd=1, col="black")
      a <- Trump[q]
      col <- "blue"
      if(a < 25) col <- "red"
      abline(h=Trump[q], lwd=1, col=col)
      abline(h=mean(Trump), lwd=1, lty=2, col="black")
      
    })
    output$favorability <- op
    output$mean     <- renderText({round(mean(Trump),1)})
    output$q        <- renderText({input$q})
    output$Percentage  <- renderText({Trump[input$q]})
  }
)