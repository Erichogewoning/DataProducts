library(shiny)
shinyUI(pageWithSidebar(
  headerPanel("Visual Regression Lite"),
  sidebarPanel(
    uiOutput("initvars"),
	h3("Usage"),
	"This application uses the MT Cars dataset. We try to predict the Miles per Gallon (MPG) in this dataset using the other variables, shown on the left hand side. Upon selecting these variables, they are included in the regression model that tries to predict the MPG. On default, the weight (wt) variable is selected. In the Graph on the right the actual MPG values are displayed as black dots. The predicted values are red dots and the regression line is also displayed in red. At the bottom, the R-squared value shows how much variation is explained by the model (closer to 1 is better). In the table at the bottom the coefficients of the model are shown, including the signifance (p value) of the selected variables."
    
  ),
  mainPanel(
        plotOutput("fit"),
		tags$b('Regression model: '), textOutput("modelformula"),
		tags$b('R Squared: '), textOutput("rsquared"),
		tags$b('Coefficients: '), tableOutput("coef")
  )
))
