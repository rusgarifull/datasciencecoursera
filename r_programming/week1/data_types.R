# vectors
vector_1 <- c(1,5)
vector_2 <- 1:6
print(vector_1)
print(vector_2)

# lists
list_1 <- list(1, "2", "a")
print(list_1)

# matrices
m_1 <- matrix(vector_2,2,3)
print(m_1)
print(dim(m_1))

print(dim(vector_2))
dim(vector_2) <- c(2,3)
print(vector_2)

# factors
x <- factor(c("yes", "yes", "no", "yes"))
print(x)
print(table(x)) # gives count 
print(unclass(x)) # underlying integers

x <- factor(c("yes", "yes", "no", "yes"),levels = c("yes", "no")) # set levels order 
print(x)

# missing values
x <- c(1,2, NaN, NA, 3)
print(is.na(x)) # checks for both NaN and NA
print(is.nan(x)) # checks for both NaN only

# data frames
x <- data.frame(foo = 1:4, bar = c(T,T,F,F))
print(x)


# reading data
#data <- read.table() # or read.csv()

# subsetting
x <- c("a", "b", "c", "a")
x[1] # returns first element as a VECTOR
x[1:3]
x[x>"a"]


x <- list(foo=1:4, bar=0.6)
x["foo"] # returns a list
x[["foo"]] # returns a vector

class(x["foo"])
class(x[["foo"]])

# subsetting matrices
x <- matrix(1:6,2,3)
x
x[1,2]
x[2,1]
x[1, ]


# dropping missing values
x <- c(1,2, NA, 4, NA, 5)
x[!is.na(x)]

x <- airquality[1:6,]
x

good <- complete.cases(x)
good
x[good,]

# slicing by condition
x[(x['Wind']>10) & (good),]