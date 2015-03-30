m <- c(2e31, 2e32, 4e32, 5e32, 6e32, 8e32)
v <-  c(0.424e5, 1.34e5,1.90e5,2.12e5,2.32e5,2.68e5)
result<-lm(v ~ sqrt(m))
b <- result$coefficients[1]
a <- result$coefficients[2]
sprintf("%1.0e", a * sqrt(4e33) + b)
