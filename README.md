

A published PDF of the thesis can be downloaded from the repository. 

You can also try the problem set yourself on shinyapps.io. 
https://saschahsp.shinyapps.io/RTutorExpertReviewsWineDemand  

**In order to work with the project in the browser, follow the instructions.** 

This package constitutes an interactive R problem set based on the RTutor package (https://github.com/skranz/RTutor). 

In this paper **Do Expert Reviews Affect the Demand for Wine?** Richard Friberg and Erik Groenqvist examine if reviews effect the demand of wine by using the Swedish wine market. They use five years of weekly data on sales, advertising and expert reviews.

The public data as well as the article are provided on the website of the *American Economic Association*. You can simply click [here](https://www.aeaweb.org/articles?id=10.1257/app.4.1.193) to download it.

To be able to work through this problem set, follow the steps listed below.

## 1. Installation

RTutor and this package is hosted on Github. To install everything, run the following code in your R console.
```s
if (!require(devtools))
  install.packages("devtools")
source_gist("gist.github.com/skranz/fad6062e5462c9d0efe4")
install.rtutor(update.github=TRUE)
  
install_github("saschahsp/TutorExpertReviewsWineDemand")
```

## 2. Show and work on the problem set
To start the problem set first create a working directory in which files like the data sets and your solution will be stored. Then adapt and run the following code.
```s
library(TutorExpertReviewsWineDemand)

# Adapt your working directory to an existing folder
setwd("C:/problemsets/TutorExpertReviewsWineDemand")
# Adapt your user name
run.ps(user.name="Jon Doe", package="TutorExpertReviewsWineDemand",
       load.sav=TRUE, sample.solution=FALSE)
```
If everything works fine, a browser window should open, in which you can start exploring the problem set.


