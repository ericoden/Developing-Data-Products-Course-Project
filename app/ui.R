#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(

    # Application title
    titlePanel("Iris Identifier"),

    # Sidebar with a slider input for number of bins
    sidebarLayout(
        sidebarPanel(
            sliderInput("slength",
                        "Sepal Length (cm):",
                        min = 4,
                        max = 8,
                        step = 0.1,
                        value = 6),
            sliderInput("swidth",
                        "Sepal Width (cm):",
                        min = 2,
                        max = 5,
                        step = 0.1,
                        value = 3.5),
            sliderInput("plength",
                        "Petal Length (cm):",
                        min = 1,
                        max = 7,
                        step = 0.1,
                        value = 4),
            sliderInput("pwidth",
                        "Petal Width (cm):",
                        min = 0,
                        max = 2.5,
                        step = 0.1,
                        value = 1.25)
        ),

        # Show a plot of the generated distribution
        mainPanel(
            plotOutput("barPlot")
        )
    )
))
