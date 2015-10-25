best <- function(state, outcome) 
{
    ## Read outcome data
    data<-read.csv("rprog-data-ProgAssignment3-data/outcome-of-care-measures.csv", colClasses = "character")
    
    ## Check that state and outcome are valid
    if (!(state %in% data[["State"]])) 
    {
        stop("invalid state")
    }
    
    if (!(outcome %in% c("heart attack", "heart failure", "pneumonia"))) 
    {
        stop("invalid state")
    }
    
    ## Return hospital name in that state with lowest 30-day death
    ## rate
    column <- 
    if (outcome == "heart attack") 11 
    else if (outcome == "heart failure") 17
    else 23
    
    focus = data[data$State == state & data[, column] != "Not Available", c(2,column)]
    focus[which.min(focus[,2]), 1]
    
    
    
}