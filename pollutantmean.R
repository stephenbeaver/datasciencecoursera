pollutantmean <- function(directory, pollutant, id=1:332){
        ## 'directory' is a character vector of lenght 1 indicating
        ##the location of the CSV files
        
        ## 'pollutant' is a char vector of lenght 1 indicating the name
        ## of the pollutant for which we will calc the mean; either
        ## "sulfate" or "nitrate"
        
        ## 'id' is an integer vector indicating the monitor ID numbers to be used
        
        ##Return the mean of the pollutant across all monitors list
        ## in the 'id' vector (ignoring NA values)
        ## NOTE: DO not round the result!
        
        #Prompts for dir
        #directory <-choose.dir(default = "", caption = "Select folder")
        
        #list of file in dir
        files_list <- list.files(directory, pattern="*.csv", full.names=TRUE)
        data <- data.frame()
        
        
        for( i in id){
                #read files
                file_data <- read.csv(files_list[i])
                
                #add file to data
                data <- rbind(data,file_data)
                
        }
        #calc mean
        mean(data[[pollutant]],na.rm=TRUE)
}        
        
