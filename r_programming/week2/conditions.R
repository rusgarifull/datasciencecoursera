
# condtions

# for loop
x <- c('a', 'b', 'c', 'd')
for (i in seq_along(x)) {
  print(x[i])
}


# while loop
x <- 5
while (x < 15 && x >-5) {
    shift <- sample(-1:1, 1)
    x <- x-shift
    #print(c(shift,x))
    print(x)
}

# if else

if (x>3) {
    y <- 10
} else {
    y <- 0
} 