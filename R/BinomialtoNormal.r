x <- 0:100
#pmf of binomal
y_binom <- dbinom(x, size=100, prob=0.6)
#pdf or normal
y_normal <- dnorm(x, mean=60, sd=sqrt(24))

plot(x, y_binom, type="s, col="blue)
par(new=TRUE)
plot(x, y_normal, type = "l",col="red")