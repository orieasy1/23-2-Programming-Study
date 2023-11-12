x <- 0:100
y_binom <- dbinom(x, size=100, prob=0.6) #pmf of binomal
y_normal <-dnorm(x, mean = 60, sd=sqrt(24)) #pdf of normal
plot(x, y_binom, type="s", col="blue") #draw in stair steo
par(new=TRUE)
plot(x, y_normal, type="l", col="red") #draw in line