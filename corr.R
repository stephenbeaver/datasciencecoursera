source("complete.R")

corr <- function(directory, threshold = 0){
        
        #list of file in dir
        files_list <- list.files(directory, pattern="*.csv", full.names=TRUE)
        
        #creates data.frame
        data <- data.frame()
        
        #creates vector
        correlation <- vector('numeric')
        
        #filter obs by thres
        obs <- complete(directory)
        filtered_obs = subset(obs,obs$nobs >= threshold)
        
        
        for (i in filtered_obs$id){
                data <- read.csv(files_list[i])
                #data <- subset(data,complete.cases(data))
                data <- data[complete.cases(data),]
                correlation <- c(correlation,cor(data$nitrate,data$sulfate))
        }
        correlation
}

#another way to filter the number of complete cases by the threshold

#data <- dat[complete.cases(dat),]
#if (nrow(data) > threshold) {
#        corr_vect <- c(corr_vect, cor(data[,"sulfate"], data[, "nitrate"]))
#       }