# Forecasting Currency Exchange Rate 
## 1.	Dataset Description: - 

Our dataset is pulled from Kaggle.com which had many country’s exchange rates with base rate to compare being United States Dollars (USD). Out of this we chose exchange rate of Indian National Rupees (INR) for forecasting. The dataset had 16308 records spread across January 1973 to August 2017. It also had over 5000 missing records. These values were replaced by the previous day’s value. The daily data was converted to weekly data by taking the mean of the exchange rates for the entire week. Data transformation and cleaning was done using excel and then it was imported to R for further analysis.

![Time Series Plot] (https://github.com/kevin21895/Currency_Exchange_Rate/blob/master/Data_Description.png)

 
## 2.	Dataset Decomposition: -

In our dataset, in order to perform analysis, we decompose our dataset into the above mentioned 3 components. They are shown in the graphs as below:-

 ![Decomposition of Data] (https://github.com/kevin21895/Currency_Exchange_Rate/blob/master/Seasonal_Decompostion.png)
 
From the above graphs, we conclude there is upward trend in the data, with a significant rise in early 1990s, then a slight dip in late 2000s. To understand the seasonal pattern of our data we plotted a monthly seasonality for the data. As seen from the graph below, there is a sharp dip in the months of May and June and steep rise in the months of September and October.

![Weekly Seasonality] (https://github.com/kevin21895/Currency_Exchange_Rate/blob/master/Seasonal_Decompostion.png)

 
3.	Forecasting Models:
a. Mean 
In this method, to forecast the values we take the mean of the entire dataset. The mean value calculated was Rs.31.06, hence, the forecasting value will be Rs.31.06. 

b. Naïve 
In this method, to forecast the values we take last value of the dataset for forecasting. The last value in our case is Rs.64.03, hence, the forecasting value will be Rs.64.03. 

 




c. Seasonal ARIMA:
ARIMA stands for Autoregressive Integrated Moving Average. It is one of the most widely used forecasting technique. Its main requirement is that the time series data must be stationary. Stationary means that the mean and variance across entire is constant. To check if our dataset is stationary, we performed Augmented Dickey-Fuller test. Since, our dataset was non-stationary we differentiated our data with order 1.
 

As seen from the above graph, ACF is exponentially decaying for seasonal lags while PACF has significant spikes for second seasonal lag. 

Using auto.arima function in R, we get the best possible seasonal ARIMA model which is of the order (1, 1, 0) (2, 0, 0) [52].

 

To validate the model, we perform cross validation by dividing the dataset into training and test dataset. Training dataset is between January 1973 and December 2013. Test dataset starts from January 2014 till the end. From the snapshot below, RMSE value is 1.78.

 

 
We can also validate the model using the residuals. If the residuals look like white noise and they are normally distributed, the model has a good fit. In our case, the residuals are zero at most points and are normally distributed, their ACFs are not significant for most lags, this shows that the model is a good fit for the dataset. As seen from the graph below, the forecasted value lies in the range of Rs.64.03 to Rs.67.8.
 
We used multiple models for forecasting the future values of exchange rates out of which the best model was the seasonal ARIMA model as its RMSE value very low. Auto.arima gives the best fit model (1, 1, 0) (2, 0, 0) [52]. So, it is advisable to buy rupees in the month of May and sell in the month of September or October.
