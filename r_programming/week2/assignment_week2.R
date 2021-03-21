## uncomment next line to change WD 
# setwd('r_programming/week2/')

# Function to return a df from a file number
return_df_from_a_file <- function(directory, file_number) {
    # get number of leading zeroes 
    # E.G. "00" for 1-9, "0" for 10-99, else ""
    number_leading_zeroes = 2 - floor(log10(file_number))
    leading_zeroes = strrep("0", number_leading_zeroes)
    
    # read a file 
    file_name <- paste(leading_zeroes, file_number, ".csv", sep = '')
    file_path <- file.path(directory, file_name)
    df <- read.csv(file_path)
    df
}

# Part 1
pollutantmean <- function(directory, pollutant, id=1:332) {
    pollutant_data = numeric()
    for (i in id) {
        # read a file
        df <- return_df_from_a_file(directory, i)
        
        # get pollutant info
        record <- df[!is.na(df[pollutant]), ][[pollutant]]
        pollutant_data <- c(pollutant_data, record)
    }
    #print(length(pollutant_data))
    
    # calculate mean
    mean_v = mean(pollutant_data)
    mean_v
}

# Part 2
complete <- function(directory, id=1:332) {
    nobs = numeric()
    for (i in id) {
        # read a file
        df <- return_df_from_a_file(directory, i)
        
        # get count of complete rows
        df_not_null <- df[(!is.na(df['sulfate'])) & (!is.na(df['nitrate'])),]
        not_null_size <- dim(df_not_null)[1]
        nobs <- c(nobs, not_null_size)
    }
    
    # create dataframe with file name and row count
    output_df = data.frame(id,nobs)
    output_df
}


# Part 3
corr <- function(directory, threshold) {
    correlations = numeric()
    for (i in 1:332) {
        # read a file
        df <- return_df_from_a_file(directory, i)
        
        # get count of complete rows
        df_not_null <- df[(!is.na(df['sulfate'])) & (!is.na(df['nitrate'])),]
        not_null_size <- dim(df_not_null)[1]
        
        # if df size >= threshold then add to a list of correlations 
        if (not_null_size >= threshold) {
            corr_value <- cor(df_not_null['sulfate'],df_not_null['nitrate'])
            correlations <- c(correlations, corr_value)
        }
    }

    # return a list of correlations 
    correlations
}

### TESTING

# test pollutantmean function
pollutantmean("specdata", "sulfate", 1:10)
pollutantmean("specdata", "nitrate", 70:72)
pollutantmean("specdata", "nitrate", 23)

# test complete function
complete("specdata", 1)
complete("specdata", c(2, 4, 8, 10, 12))
complete("specdata", 30:25)

# test corr function
cr <- corr("specdata", 150)
head(cr)
summary(cr)

cr <- corr("specdata", 5000)
summary(cr)
length(cr)


### QUIZ

pollutantmean("specdata", "sulfate", 1:10)
pollutantmean("specdata", "nitrate", 70:72)
pollutantmean("specdata", "sulfate", 34)
pollutantmean("specdata", "nitrate")

cc <- complete("specdata", c(6, 10, 20, 34, 100, 200, 310))
print(cc$nobs)

cc <- complete("specdata", 54)
print(cc$nobs)

RNGversion("3.5.1")  
set.seed(42)
cc <- complete("specdata", 332:1)
use <- sample(332, 10)
print(cc[use, "nobs"])

cr <- corr("specdata", 129)                
cr <- sort(cr)                
n <- length(cr)    
RNGversion("3.5.1")
set.seed(197)                
out <- c(n, round(cr[sample(n, 5)], 4))
print(out)

cr <- corr("specdata", 2000)                
n <- length(cr)                
cr <- corr("specdata", 1000)                
cr <- sort(cr)
print(c(n, round(cr, 4)))
