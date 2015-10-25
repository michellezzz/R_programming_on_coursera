pollutantmean <- function(directory, pollutant, id = 1:332) {
    sum<-0
    counter<-0
    
    for(i in id)
    {
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
        
        test_data<-data[pollutant]
        test_data<-test_data[!is.na(test_data)]
        sum = sum(test_data) + sum
        counter = length(test_data) + counter
    }
    
    sum/counter
}