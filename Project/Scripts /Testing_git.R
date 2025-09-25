#Hello Git
#Hello Git 2

a <- numeric(10)
b <- c(10)
c <- rep(4, 5)

#1) 
d <- c(4, 12, 3, 6, 5)
d_double <- numeric(length(d))

for (i in seq_along(d)) {
  d_double[i] <- d[i]*2
}

d_double

#2) 
names_vec <- c("Anna","Vincent")
greeting <- character(length(names_vec))

for (i in seq_along(names_vec)) {
  greeting[i] <- (paste("Hallo", names_vec[i]))
}

## Example: anonymous functions in a pipeline: mean() ##
values <- c(4,6,8,10) 
values |> (\(x) sum(x)/length(x))()

#equivalent to

values |> 
  mean()


## . . . argument ##

# Without ...
calculate_price <- function(quantity, price_per_unit) {
  price <- quantity * price_per_unit
  return(price)
}

calculate_price(30,5)

# Now say we want to refine the way prices are calculated, so we define another 
# function which takes the price and tax rate as an input: 

price_adjustments <- function (price, tax) {
  final_price <- price+(price*tax)
  return(final_price)
}

# now we re-write the price calculation function: 

calculate_price <- function(quantity, price_per_unit,...) {
  price <- quantity * price_per_unit
  price_adjustments(price, ...)
}

calculate_price(quantity = 30, price_per_unit = 5, tax = 0.07)





