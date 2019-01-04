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
suppressMessages(
  library(ggplot2)
)
`load pg` <- function(x){
  if (x == "fin" ){
    suppressMessages(
      require(quantmod)
    )
    suppressMessages(
      require(lubridate)
    )
    suppressMessages(
      require(tseries)
    )
    cat(
      "\n # time series # \n\n" ,
      "johansen => ", "urca\n" ,  
      "var models => ","vars \n" ,
      "engle and granger => ", "egcm\n\n"
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

