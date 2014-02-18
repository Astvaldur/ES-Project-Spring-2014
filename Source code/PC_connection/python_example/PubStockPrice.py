# -*- coding: utf8 -*-
# Author: Heimir Þór Kjartansson

# ASSUMPTIONS:
# Customer wants market closing stock prices.
# The S&P 500 stock index is sufficient.

# ASSUMPTIONS challanged by customer:
#   Customer wants adjusted closing prices.
#   The S&P 500 is barely sufficient but the program
#   needs options for other indexes as well.

import ystockquote

# N: y = PubStockPrice.getHistPrice(comp, 
#               startdate, enddate)
# F: comp is a stock symbol for a valid comany on
#       yahoo.finance.com. startdate and enddate are
#       of the form yyyymmdd.
# E: y = [d, v] where d is a list of dates and v is a
#       list of values. v[i] is the adjusted closing price
#       for comp at d[i].
def getHistPrice(comp, startdate, enddate):
    histPrice = ystockquote.get_historical_prices(
            comp, startdate, enddate)
    redHistPrice = []
    for item in histPrice:
        redHistPrice.append([item[0], item[6]])
    redHistPrice.reverse()
    redHistPrice.pop()
    redHistPrice = xyArrange(redHistPrice)
    redHistPrice[1] = map(float, redHistPrice[1])
    return redHistPrice

# N: y = PubStockPrice.getCurrPrice(comp)
# F: comp is a valid stock symbol according to
#       finance.yahoo.com
# E: y is a single value with the current stock price
#       of comp.
def getCurrPrice(comp):
    return ystockquote.get_price(comp)

# N: y = PubStockPrice.getCurrIndex(index)
# F: index is a string 0 or 1. Stock indexes are coded
#       and available as follows.
#       index : stock index symbol : stock index
#       0     : GSPC               : S&P 500
#       1     : IXIC               : NASDAQ
# E: y is a single value with the stock index selected
#       by index.
def getCurrIndex(index):
    if(index == '1'):
        return ystockquote.get_price('^IXIC')
    else:
        return ystockquote.get_price('^GSPC')

# N: y = PubStockPrice.getStockIndex(index)
# F: index is a string 0 or 1. Stock indexes are coded
#       and available as follows.
#       index : stock index symbol : stock index
#       0     : GSPC               : S&P 500
#       1     : IXIC               : NASDAQ
# E: y is the name of the stock index selected by index.
def getStockIndex(index):
    if(index == '1'):
        return 'Nasdaq'
    else:
        return 'S&P 500'

# N: y = PubStockPrice.getHistIndex(index, startdate, enddate)
# F: startdate and enddate are of the form yyyymmdd. 
#       index is a string 0 or 1. Stock indexes are coded
#       and available as follows.
#       index : stock index symbol : stock index
#       0     : GSPC               : S&P 500
#       1     : IXIC               : NASDAQ
# E: y = [d, v] where d is a list of dates and
#       v is a list of values. v[i] is the adjusted 
#       closing market stock index for d[i] for 
#       the market selected by index. Default index
#       is S&P 500.
def getHistIndex(index, startdate, enddate):
    sIndex = "^GSPC"
    if(index == '1'):
        sIndex = '^IXIC'
    histPrice = ystockquote.get_historical_prices(
            sIndex, startdate, enddate)
    redHistPrice = []
    for item in histPrice:
        redHistPrice.append([item[0], item[6]])
    redHistPrice.reverse()
    redHistPrice.pop()
    redHistPrice = xyArrange(redHistPrice)
    redHistPrice[1] = map(float, redHistPrice[1])
    return redHistPrice

# N: newList = xyArrange(oldList)
# F: oldList is a list of lists where every
#       contained list is of the form [d_i, v_i] so that 
#       oldList = [[d_1, v_1], [d_2, v_2], ..., [d_n, v_n]]
# E: newList is a list of lists of the form
#       newList = [[d1, d2, ..., dn], [v1, v2, ..., vn]]
def xyArrange(oldList):
    xList = []
    yList = []
    for item in oldList:
        xList.append(item[0])
        yList.append(item[1])
    return [xList, yList]

