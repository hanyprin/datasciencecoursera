library(Quandl)
Quandl("NSE/OIL")

# Find permalink, should be only capital letters
# numbers and underscores
twitter<-Quandl("GOOG/NYSE_TWTR")
PragueStockExchange =Quandl("PRAGUESE/PX")
# Quandl returns data in 4 formats:
# 'raw'(data frame), 'ts', 'zoo' or 'xts'
library(quantmod)
# Load the Facebook data with the help of Quandl
Facebook<-Quandl("GOOG/NASDAQ_FB","xts")
# Plot the chart with the help of candleChart()
candleChart(Facebook)
# Search for Bitcoin instead of search on the page
Quandl.search(query="Bitcoin",page=3,silent=FALSE)
BitCoin = Quandl("BITCOIN/BTC24USD")
# Assign to the variable Exchange
Exchange = Quandl("QUANDL/USDEUR",
                  start_date="2013-01-01",
                  end_date="2013-12-01")
# Canadian GDP annual percent change
# rdiff: row-on-row % change
GDP_Change =Quandl("FRED/CANRGDPR",transformation="rdiff")
# crude oil prices on a quarterly basis
eiaQuarterly = Quandl("DOE/RWTC",collapse="quarterly")
# Assign to TruSo the last 5 observations of the crude oil prices
TruSo = Quandl("DOE/RWTC",sort="asc",rows=5)
# Daily percent change in oil prices from  
# January 2005 to March 2010, in ascending order
Final = Quandl("DOE/RWTC",transformation="rdiff",
               sort="asc",start_date="2005-01-01",
               end_date="2010-03-01")
