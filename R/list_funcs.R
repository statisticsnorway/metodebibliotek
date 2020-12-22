create_text <- function(ssblist, tag){
  for (i in 1:nrow(ssblist)){
    if (any(sapply(tag, grepl, ssblist$tags[i],fixed = T))){
      cat(paste0("The [", ssblist$function_name[i], "](", 
                 ssblist$url[i], ") function is written in ", 
                 ssblist$language[i], ". ", ssblist$description[i],"  \n"))
      
    }
  }
}

