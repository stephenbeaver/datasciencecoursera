complete <- function(directory, id=1:332){
 
        #list of file in dir
        files_list <- list.files(directory, pattern="*.csv", full.names=TRUE)
        data <- data.frame()
        
        for( i in id){
                #read files
                file_data <- read.csv(files_list[i])
                
                #number of complete cases from file
                nobs <- sum(complete.cases(file_data))
                
                #adds nobs to data.frame
                data <- rbind(data, c(i,nobs))
        }
        #set columns names
        colnames(data) <- c('id','nobs')
        
        #returns data.framed
        data
}