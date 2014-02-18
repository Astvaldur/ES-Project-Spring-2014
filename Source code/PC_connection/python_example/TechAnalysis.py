# Author: Haraldur Tomas Hallgrimsson, haraldurt@gmail.com

import numpy
import datetime
import ystockquote

# Usage:  sma = moveAvg(y,N)
# Before: y is a list of numbers
#         N is a moving average length
# After: sma is an array, full of the N-point moving averages for y
#        sma is the same length as y. Boundary affect is resolved by mirroring
#        N/2 points on either end
def moveAvg(y,N):
    window = numpy.ones(int(N))/float(N)
    yy = y[N/2:0:-1]
    yy.extend(y)
    yy.extend(y[-1:-N/2:-1])
    rslt = numpy.convolve(yy,window,'valid')
    return rslt
    
    

# Usage:  BB = bollBands(y,N)
# Before: y is a list of floats
#         N is a moving average length
# After:  BB[0] is the upper Bollinger band, list of floats of same length as y
#         BB[1] is the lower Bollinger band, list of floats of same length as y
#         Use moveAvg(y,N) for the middle Bollinger band
def bollBands(y,N):
    deviation = []
    Y = len(y)
    sma = moveAvg(y,N)
    
    for i in range(0,Y):
        if i-N/2<0:
            start = 0
        else:
            start = i-N/2
        if i+N/2>Y:
            end = Y
        else:
            end = i+N/2
        dev = y[start:end]
        averages = numpy.zeros(len(dev))
        averages.fill(sma[i])
        dev = dev - averages
        dev = dev ** 2
        dev = numpy.sqrt(numpy.mean(dev))
        deviation.append(dev)
    deviation = 2*numpy.array(deviation)
    upperBB = sma + deviation
    lowerBB = sma - deviation
    return [upperBB,lowerBB]
    
    
# Usage: buySell(ticker)
# Before: SearchCompany.is_ticker_valid(ticker) is true
# After: True if ticker is likely to experience short term increase, False otherwise
def buySell(ticker):
    # Method: True if price is accelerating upwards/convex upwards on average the last week, False otherwise. 
    today = datetime.date.today()
    enddate = today.strftime("%Y%m%d")
    weeksAgo = today - datetime.timedelta(weeks=1)
    startdate = weeksAgo.strftime("%Y%m%d")
    histPrice = ystockquote.get_historical_prices(ticker, startdate, enddate)
    del histPrice[0]
    histPrice = [float(x[6]) for x in histPrice]
    delta = numpy.diff(histPrice)
    deltadelta = numpy.diff(delta)
    return numpy.mean(deltadelta) > 0.1
    
def main():
    ticker = raw_input("Enter valid ticker: ")
    print buySell(ticker)

if __name__ == "__main__":
    main()