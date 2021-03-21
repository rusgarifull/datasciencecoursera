# read_file
file_name <- "hw1_data.csv" 
x <- read.csv(file_name)

# columns
print(names(x))

# Extract the first 2 rows of the data frame and print them to the console.
print(x[1:2,])

# How many observations (i.e. rows) are in this data frame?
dim(x)[1]

# Extract the last 2 rows of the data frame and print them to the console.
tail(x, 2)

# Question 15. What is the value of Ozone in the 47th row?
x[47,]['Ozone']

# 16.How many missing values are in the Ozone column of this data frame?
sum(is.na(x['Ozone']))

#17.What is the mean of the Ozone column in this dataset? Exclude missing values (coded as NA) from this calculation.
mean(x['Ozone'][!is.na(x['Ozone'])])

#18. Extract the subset of rows of the data frame where Ozone values are above 31 and Temp values are above 90. What is the mean of Solar.R in this subset?
#subs = x[(x['Ozone']>31) & (x['Temp']>90) & (!is.na(x['Solar.R'])),]
subs = subset(x, (x['Ozone']>31) & (x['Temp']>90))
mean(subs[['Solar.R']])

#19. What is the mean of "Temp" when "Month" is equal to 6? 
subs = subset(x, x['Month']==6)
subs
mean(subs[['Temp']])

#20.What was the maximum ozone value in the month of May (i.e. Month is equal to 5)?

subs = subset(x, (x['Month']==5) & (!is.na(x['Ozone'])))
subs
max(subs[['Ozone']])

