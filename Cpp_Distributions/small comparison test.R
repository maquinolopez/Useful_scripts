## Testing speeds
library(microbenchmark)



Rcpp::sourceCpp("~/GitHub/Useful_scripts/Cpp_Distributions/Distributions.cpp")


data <- rnorm(n = 1e+5)


cppversion <- microbenchmark(ll_normal(4,data ,rep(1,length(data)) ) ,times=1e+3,unit = 's')


rversion <- microbenchmark(sum(dnorm(4,data,1,log = T))  ,times=1e+3,unit = 's')

summary(cppversion)

summary(rversion)



