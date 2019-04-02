# source of function set or packages 

# °ò¥»®M¥ó => basic package 
options(prompt = "$ ")

suppressMessages(
  library(tidyverse) 
)
suppressMessages(
  require(rio) 
)
suppressMessages(
  require(magrittr)
)
# suppressMessages(
#   library(ggplot2)
# )

fc.load <- function(x){
  if (x == "fin"){
    suppressMessages(
      require(quantmod)
    )
    suppressMessages(
      require(lubridate)
    )
    suppressMessages(
      require(tseries)
    )
    suppressMessages(
      require(PerformanceAnalytics)
    )
    suppressMessages(
      require(dygraphs)
    )
    suppressMessages(
      library(tidyquant)  
    )
    suppressMessages(
      library(timetk)  
    )
    suppressMessages(
      library(highcharter)
    )
    suppressMessages(
      library(padr)
    )
    suppressMessages(
      library(padr)
    )
    print("loading financial package")
  }
  else if (x == ("text") ){
    suppressMessages(
      require(jiebaR)
    )
    suppressMessages(
      require(wordcloud)
    )
    suppressMessages(
      require(tm)
    )
    suppressMessages(
      library(janeaustenr)
    )
    suppressMessages(
      library(tidytext)
    )
    suppressMessages(
      library(widyr)
    )
    suppressMessages(
      library(igraph)
    )
    suppressMessages(
      library(ggraph)
    )
    suppressMessages(
      library(gutenbergr)
    )
    suppressMessages(
      library(topicmodels)
    )
    print("loading text mining package")
  }
  else if (x== ("web") ){
    suppressMessages(
      require(httr)
    )
    suppressMessages(
      require(rvest) # parser of web crawler
    )
    suppressMessages(
      require(RCurl)
    )
    suppressMessages(
      require(XML)
    )
    suppressMessages(
      require(jsonlite)
    )
    suppressMessages(
      require(jsonview)
    )
    print("loading web cralwer package")
    
  }
  else if (x == c("stat")){
    
    # stat.package <- c("car","e1071",
    #   "C50","party","rpart.plot",
    #   "rpart","rattle","randomForest")
    
    # if(!require(stat.package[2])) print("1")
    
    suppressMessages(
      require(car) # linear regression
    )
    suppressMessages(
      require(e1071)
    )
    suppressMessages(
      require(C50)
    )
    suppressPackageStartupMessages(
      library(party)
    )
    suppressPackageStartupMessages(
      library(rpart.plot)
    )
    suppressPackageStartupMessages(
      library(rpart)
    )
    suppressPackageStartupMessages(
      library(rattle)
    )
    suppressPackageStartupMessages(
      require(randomForest)
    )
    print("loading stat package")
  }
  else{
    print("no loading package")
  }
  
}
fc.show <- function(show=F){
  if(show==T){
    cat(
      "\n # time series # \n\n" ,
      "\n method -- package\n" ,
      "johansen => ", "urca\n" ,  
      "VECM model => " ,"tsDyn\n",
      "var models => ","vars \n" ,
      "engle and granger => ", "egcm\n\n"
    )
  }
}  
## function ##

# Multiple plot function
#
# ggplot objects can be passed in ..., or to plotlist (as a list of ggplot objects)
# - cols:   Number of columns in layout
# - layout: A matrix specifying the layout. If present, 'cols' is ignored.
#
# If the layout is something like matrix(c(1,2,3,3), nrow=2, byrow=TRUE),
# then plot 1 will go in the upper left, 2 will go in the upper right, and
# 3 will go all the way across the bottom.
#
fc.multiplot <- function(..., plotlist=NULL, file, cols=1, layout=NULL) {
  library(grid)
  
  # Make a list from the ... arguments and plotlist
  plots <- c(list(...), plotlist)
  
  numPlots = length(plots)
  
  # If layout is NULL, then use 'cols' to determine layout
  if (is.null(layout)) {
    # Make the panel
    # ncol: Number of columns of plots
    # nrow: Number of rows needed, calculated from # of cols
    layout <- matrix(seq(1, cols * ceiling(numPlots/cols)),
                     ncol = cols, nrow = ceiling(numPlots/cols))
  }
  
  if (numPlots==1) {
    print(plots[[1]])
    
  } else {
    # Set up the page
    grid.newpage()
    pushViewport(viewport(layout = grid.layout(nrow(layout), ncol(layout))))
    
    # Make each plot, in the correct location
    for (i in 1:numPlots) {
      # Get the i,j matrix positions of the regions that contain this subplot
      matchidx <- as.data.frame(which(layout == i, arr.ind = TRUE))
      
      print(plots[[i]], vp = viewport(layout.pos.row = matchidx$row,
                                      layout.pos.col = matchidx$col))
    }
  }
}


cat("update at 2019-02-09\n")
