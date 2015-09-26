---
title       : Visual Regression Lite
subtitle    : 
author      : Eric Hogewoning
job         : 
framework   : io2012   # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : []            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
---

## What is Visual Regression Lite?

Visual Regression Lite is a tool that:
- was created in R using Shiny
- shows the predicted values of a regression model visually
- allows you to try out different model parameters in a GUI
- displays the (R-squared) variation explained by your model
- shows the (selected) parameter significance

--- .class #id 

## Save on writing code

Sometimes you want to explore a lot of different linear models fast and see which predictors are significant and explain a lot of the variation. You are probably writing and changing a lot of code like the fit1, fit2, fit3 etc lines below.

```r
data(mtcars)
fit1 <- lm(mpg ~ am, data=mtcars)
fit2 <- lm(mpg ~ hp, data=mtcars)
fit3 <- lm(mpg ~ hp + wt, data=mtcars) # fit4, fit5, fit6 etc.
summary(fit1)$coef
summary(fit1)$r.squared
```

---

## Save on creating lots of plots

Besided models, you are also making quite a few plots to figure out what's going on. With Visual Regression Lite you save on writing code and making plots and can now build your model visually and interactively.

![plot of chunk unnamed-chunk-2](assets/fig/unnamed-chunk-2-1.png) 

---

## Try Visual Regression Lite right here

Try it out below! or [Click here](https://erich-ds.shinyapps.io/Shiny) to run it full screen.

<iframe width='800' height='580' src='https://erich-ds.shinyapps.io/Shiny' frameborder='0'></iframe>




