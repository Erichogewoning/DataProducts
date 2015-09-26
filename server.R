library(shiny)
library(datasets)
library(ggplot2)

data(mtcars)
mtcars$cyl <- factor(mtcars$cyl)
mtcars$vs <- factor(mtcars$vs)
mtcars$am <- factor(mtcars$am,labels=c("Automatic","Manual"))
mtcars$gear <- factor(mtcars$gear)
mtcars$carb <- factor(mtcars$carb)

shinyServer(
  function(input, output) 
  {
	mpgData <- data.frame(mtcars)
	
	output$initvars <- renderUI({
	checkboxGroupInput("idvar", "Select variables", names(mtcars[-1]), selected="wt")
	})

	selectedvars <- reactive({
		selectedvar <- "wt"
		if (!is.null(input$idvar)){
			selectedvar <- input$idvar
		}
		vars <- paste(selectedvar, collapse="+")
	})
	
	fit <- reactive({	
		formulatext <- paste("mpg ~ ", selectedvars(), sep="")
		lm(as.formula(formulatext),data=mtcars)
	})
	

	output$fit <- renderPlot(
	{		
		mpgData$pred <- predict(fit()) 
		p <- ggplot() + geom_point(aes(y=mpg, x=wt), mpgData) + geom_point(aes(y=pred, x=wt), color="red", mpgData) + geom_smooth(method='lm',formula=y ~ x+I(x^2), se=T, aes(y=pred, x=wt), color="red", data=mpgData) + labs(title="Mpg predictions based on selected variables") 
                    
		print(p)    
	})
	
	output$rsquared <- renderPrint({summary(fit())$r.squared})	
	output$modelformula <- renderPrint({paste("mpg ~ ", selectedvars(), sep="")})
	output$coef <- renderTable({summary(fit())$coef})
	
  }  
)
