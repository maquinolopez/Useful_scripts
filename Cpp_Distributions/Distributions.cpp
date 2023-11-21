#include <Rcpp.h>
#include <cstdio>
#include <math.h>
using namespace Rcpp;

double LogNormalDensity(double x, double mean, double std_dev) {
    // Sample from normal distribution
    double nx = (x - mean)/std_dev;
    double log_sig = log(std_dev * std_dev);
    double sqr_x = nx *nx;
    double densi = -log_sig - .5 * sqr_x ;
    return densi;
    
}


// T-Distribution Log Density (placeholder)
// [[Rcpp::export]]
double LogTDensity(double x, double mu, double sigma, double a, double b) {
  // Placeholder: Implement using a library like Boost or write the formula
  return 0.0; // Replace with actual implementation
}

// Gamma Distribution Log Density
// [[Rcpp::export]]
double gammaLogDensity(double x, double a, double b) {
  return a * log(b) - lgamma(a) + (a - 1) * log(x) - b * x;
}

// Log Likelihood of a Normal Distribution given a single x
// [[Rcpp::export]]
double ll_normal( double x, NumericVector data , NumericVector sigma){
	long double sumll = 0; 
	for(int i = 0; i < data.length(); i++) {
    	sumll += LogNormalDensity(x,data[i],sigma[i]);
	}
	return sumll;
	}

// Log Likelihood of a Normal Distribution given a single x
// [[Rcpp::export]]
double ll_tdis( double x, NumericVector data , NumericVector sigma,double a, double b){
	long double sumll = 0; 
	for(int i = 0; i < data.length(); i++) {
    	sumll += LogTDensity(x,data[i],sigma[i],a,b);
	}
	return sumll;
	}
