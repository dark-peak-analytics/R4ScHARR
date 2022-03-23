# EXERCISE 4: Create a probabilistic function -------
# hint: use the 'sample' function with replace = T)
# have a look at the help file:# ?sample

# 4 a) Create a function 'flipCoin' that takes 'n' as an argument and# simulates 
#      flipping a coin n times. Document using Roxygen comments.

#' flipCoin
#' 
#' Simulate flipping a fair coin n times, returning a vector of results
#'
#' @param n number of times to flip the coin
#'
#' @return a character vector containing the results of the coinflips.
#'
#' @examples
#' flipCoin(9)
#' "heads" "heads" "tails" "tails" "tails" "heads" "tails" "heads" "heads"
flipCoin = function(n) {
  # sample from heads and tails n times with replacement.
  res = sample(x = c("heads", "tails"),
               size = n,
               replace = T)
  # internal test to ensure vector length matches n.
  stopifnot(length(res) == n)
  # return the resulting vector.
  return(res)
  
}

# 4 b) create a function 'throwDice' that takes 'k' and 'n' as arguments and
#      simulates throwing a dice with k sides n times. Document using Roxygen comments.

#' throwDice
#' 
#' Simulate rolling a fair k sided dice n times. Return a vector of results
#'
#' @param n number of times to flip the coin
#' @param k number of sides on the dice, default 6.
#'
#' @return a character vector containing the results of the dice rolls
#'
#' @examples
#' throwDice(n = 10)
#' 1 4 3 1 5 3 3 2 2 3
throwDice = function(k = 6, n) {
  # sample n times from vector from 1 to k
  res = sample(x = 1:k,
               size = n,
               replace = T)
  # internal test to ensure vector length matches n.
  stopifnot(length(res) == n)
  # return the resulting vector
  return(res)
}
