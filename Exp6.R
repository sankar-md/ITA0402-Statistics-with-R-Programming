sieve_of_eratosthenes <- function(limit) {
  is_prime <- rep(TRUE, limit + 1)
  is_prime[1] <- FALSE
  
  p <- 2
  while (p^2 <= limit) {
    if (is_prime[p]) {
      for (i in seq(p^2, limit + 1, by = p)) {
        is_prime[i] <- FALSE
      }
    }
    p <- p + 1
  }
  
  primes <- which(is_prime)
  return(primes)
}

# Get all prime numbers up to a given limit
limit <- as.numeric(readline("Enter the limit: "))
prime_numbers <- sieve_of_eratosthenes(limit)

# Display the prime numbers
cat("Prime numbers up to", limit, ":", prime_numbers, "\n")