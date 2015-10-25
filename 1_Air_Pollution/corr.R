corr <- function(directory, threshold = 0) {
    id<-1:332
    cor_list<-c(0)
        
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
        
        num_of_complete<-0
        complete_list<-data.frame("S"=numeric() , "N"=numeric())
        
        for(j in row.names(data))
            if(!is.na(data[j, "sulfate"]) & !is.na(data[j, "nitrate"])) 
            {
                num_of_complete = num_of_complete + 1
                complete_list<-rbind(complete_list, data.frame("S"=data[j, "sulfate"], "N"=data[j,"nitrate"]))
            }
        
        
        if(num_of_complete>threshold)
        {
            cor_list[i] = cor(complete_list["S"], complete_list["N"])
        }
    }
    cor_list
}