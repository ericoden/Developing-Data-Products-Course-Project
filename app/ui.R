library(shiny)

shinyUI(fluidPage(
    titlePanel("Iris Identifier"),
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
        mainPanel(
            plotOutput("barPlot")
        )
    )
))
