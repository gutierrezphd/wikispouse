### WIKISPOUSE FUNCTON ####
# ian.gutierrez.phd@gmail.com
# @ianagutierrez

.onAttach <- function(libname, pkgname) {
  message <- c("\n Thank you for using the {wikispouse} R package!",
               "\n \n Have fun looking up spouses of famous people, if that's your thing",
               "\n \n You can contact me at ian.gutierrez.phd@gmail.com or @ianagutierrez",
               "\n \n Happy searching!")
  packageStartupMessage(message)
}

wikispouse <- function() {
  require(rvest)
  require(stringi)
  require(tidyverse)
  require(magrittr)
  require(tools)
  name.space <- readline("Name: ")
  name.space %<>% tools::toTitleCase(.)
  name <- gsub(" ","_", name.space)
  url <- paste("https://en.wikipedia.org/wiki/", name, sep="")
  site <-  url %>%
    read_html() %>%
    html_nodes(xpath = '//*[@id="mw-content-text"]/div/table[1]') %>%
    html_table(fill = TRUE)
  site <- t(site[[1]])
  site %<>% as.data.frame
  ifelse(lapply(site[1,], function(x) grepl("Spouse", x)) %>%
           unlist %>%
           as.vector %>%
           any(.)==TRUE,
         spouses <- site[[lapply(site[1,], function(x) grepl("Spouse", x)) %>% unlist %>% grep("TRUE", .)]][2],
         stop("No spouses indexed for this wikipedia record")
  )
  spouses %<>% gsub("\\[[^\\]]*\\]", "NA", ., perl=TRUE) #remove footnotes in brackets, revisit this
  spouses %<>% strsplit(., '[();]')
  spouses %<>% unlist
  length(spouses) <- ceiling(length(spouses)/3)*3
  spouses %<>% split(., seq(1:3)) %>% as.data.frame
  names(spouses) <- c("spouse", "married", "divorce/death")
  spouses$spouse %<>% gsub("\n","",.)
  spouses$spouse %<>% gsub("^\\s+|\\s+$", "", .)
  spouses$spouse %<>% as.character(.)
  spouses$married %<>% gsub("[^0-9-]", "", .)
  spouses$`divorce/death` %<>% gsub("[^0-9-]", "", .)
  spouses$married %<>% as.numeric(.)
  spouses$`divorce/death` %<>% as.numeric(.)
  cat("\n", name.space, "\n", sep="")
  return(spouses)
} #create the function

#run this code, find some famous spouses
#wikispouse()


