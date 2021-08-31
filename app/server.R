library(shiny)
library("nnet")

# create multinomial logit model for iris data set
model <- multinom(Species ~ ., data = iris)
coefs <- summary(model)$coefficients

shinyServer(function(input, output) {

    output$barPlot <- renderPlot({

        x <- c(input$slength, input$swidth, input$plength, input$pwidth)
        
        # based on inputs and model, calculate probability for each species
        setosa_num = 1
        versicolor_num = exp(coefs[1, 1] + coefs[1, 2:5] %*% x) 
        virginica_num = exp(coefs[2, 1] + coefs[2, 2:5] %*% x)
        den = 1 + versicolor_num + virginica_num
        p_setosa = setosa_num / den
        p_versicolor = versicolor_num / den
        p_virginica = virginica_num / den
        
        # create plot
        names <- c("Setosa", "Versicolor", "Virginica")
        probs <- c(p_setosa, p_versicolor, p_virginica)
        barplot(names.arg = names, 
                height = probs,
                ylim = c(0, 1),
                xlab = "Iris Species",
                ylab = "Probability",
                col = "blue")

    })

})
