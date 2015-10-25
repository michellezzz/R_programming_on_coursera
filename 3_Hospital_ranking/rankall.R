rankall <- function(outcome, num = "best") 
{
    ## Read outcome data
    data<-read.csv("rprog-data-ProgAssignment3-data/outcome-of-care-measures.csv", colClasses = "character")
    
    ## Check that state and outcome are valid
    if (!(outcome %in% c("heart attack", "heart failure", "pneumonia"))) 
    {
        stop("invalid outcome")
    }
    
    
    ## Return hospital name in that state with the given rank
    ## 30-day death rate
    column <- 
        if (outcome == "heart attack") 11 
    else if (outcome == "heart failure") 17
    else 23
    
    result = data.frame("hospital" = character(), "state" = character())
    
    for (state in data$State)
    {
        print("this")
        if (num == "best")  
        {
            num = 1
        }
        else if (num == "worst") 
        {
            num = nrow(focus)
        }
        else if (num>nrow(focus))
        {
            #result <- rbind(result, data.frame("hospital" = NA, "state" = state))
            continue
        }
        
        
        focus = data[data$State == state & data[, column] != "Not Available", c(2,column)]
        
        order = order(focus[,2]) 
        hos = focus[order, ][num, 1]
        result <<- rbind(result, data.frame("hospital" = hos, "state" = state))
    }
    result
}