complete <- function(directory, id = 1:332) {
    complete_info<-data.frame("id" = id, "nobs" = c(0))
    num_of_file<-0
    
    for(i in id)
    {
        num_of_file = num_of_file + 1
        filename<-as.character(i)
        filename<-
            if(nchar(filename) == 1)
                paste("00", filename, sep="")
        else 
            if(nchar(filename) == 2)
                paste("0", filename, sep="")
        else
            filename
        filename<-paste("./", directory, "/", filename, ".csv", sep ='')
        data<-read.csv(filename)
        
        num_of_complete<-0
        for(j in row.names(data))
            if(!is.na(data[j, "sulfate"]) & !is.na(data[j, "nitrate"])) 
                num_of_complete = num_of_complete + 1
    
        complete_info[num_of_file, "nobs"] = num_of_complete
    }
    complete_info
}