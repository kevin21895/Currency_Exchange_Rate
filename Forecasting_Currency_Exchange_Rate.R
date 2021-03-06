install.packages("forecast") 
library(tseries) 
library(forecast) 
library(fpp) 
library(fpp2) 
data = read.csv("C:/Users/Kevin/Downloads/MIT/MIT Fall 2018/Final_Project1.csv") train = data[1:2140,2] test = data[2141:2331,2] data1 = data[,c(2)] data_ts = ts(data1,start = c(1973,1,1),frequency = 52) train_ts = ts(train,start = c(1973,01),frequency = 52) 
test_ts = ts(test,start = c(2014,1),frequency = 52) 
plot(data) 
plot(train_ts) 
plot(test_ts) 
x = stl(data_ts,s.window = "periodic") 
plot(x,main = "Sesonality Decomposition for US-INR Exchange Rate") 
plot(x$time.series[,"trend"],main = "Trend for US-INR Exchange Rate",ylab="Rate") 
monthplot(x$time.series[,"seasonal"],main = "Monthly Seasonality for US-INR Exchange Rate",ylab="Seasonality ") 
plot(naive(data_ts,h=52)) 
plot(meanf(data_ts,h=52))
acf(data_ts) 
adf.test(data_ts) 
y = diff(data_ts) 
adf.test(y) 
nsdiff(y) 
ndiff(y) 
acf(y) 
fit = auto.arima(train_ts, d=1, approximation=FALSE,trace=FALSE) 
forecast1 = forecast(fit,h=191) 
hist(forecast1$residuals) 
dnorms = dnorm(forecast1$residuals,mean=mean(forecast1$residuals),sd = sd(forecast1$residuals)) 
plot(forecast1$residuals,dnorms) 
accuracy(forecast1$mean,test_ts) 
accuracy(forecast1$fitted,train_ts) 
data2 = data.frame() 
fit1 = HoltWinters(train_ts,seasonal = "additive") 
forecast2 = forecast(fit1,h=191) 
forecast2 
accuracy(forecast2$mean,test_ts) 
plot(test_ts) 
lines(forecast1$mean) 
fit2 = auto.arima(data_ts, d=1, approximation=FALSE,trace=FALSE)
plot(forecast(fit2,h=52,method = "Arima"),ylab = "Exchange Rate", main = "USD to INR Exchange Rate Forecast") 
autoplot(data_ts) +
  autolayer(meanf(data_ts,h=52),series = "Mean", PI = FALSE) + 
  autolayer(naive(data_ts,h=52),series = "Naive",PI = FALSE) + 
  ggtitle("USD to INR Exchange Rate Forecast")+
  ylab("Exchange Rate") 
fit2 
checkresiduals(fit2$residuals) 
tsdisplays(data_ts)