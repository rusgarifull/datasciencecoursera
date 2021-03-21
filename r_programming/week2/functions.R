add <- function(x,y) {
    x+y
}

above <- function(x, n=10) {
    x[x>n]
}

colmean <- function(df, remove_NA= TRUE) {
    ncolumns <- ncol(df)
    columns <- colnames(df)
    values <- numeric()
    for (i in 1:ncolumns) {
      values[i] <- mean(df[,i], na.rm=remove_NA)
    }
    print(values)
    summary <- data.frame(columns,values)
    summary
}

print(add(2,4))

c<-1:20
print(above(c))

colmean(airquality)
### to double check correctness of the previous function
colMeans(airquality, na.rm=TRUE)
