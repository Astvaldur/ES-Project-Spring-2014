# Author: Astvaldur Hjartarson
# Edited by: Heimir Þór Kjartansson

import urllib2
def __request(symbol, stat):
    url ='http://finance.yahoo.com/d/quotes.csv?s=%s&f=%s' % (symbol, stat)
    return urllib2.urlopen(url).read().strip().strip('"')

# N: retList = EconomicValues.get_Economic_Values(comp)
# F: comp is a valid stock symbol according to finance.yahoo.com
# E: retList is a list of various economic values regarding the company 
#       with comp as a stock symbol.
#       retList is of the form:
#           len(retList) > i >= 0
#           retList[i] is a tuple of the form (s, v) such that:
#               v is a value
#               s is a string describing the value that v stands.
#                   It is a sentance followed by a colon for easy printing.
def get_Economic_Values(symbol):
    values = __request(symbol,'l1c1va2xj1b4j4dyekjm3m4rr5p5p6s7').split(',')
    retList = []
    retList.append(('Price', values[0]))
    retList.append(('Change', values[1]))
    retList.append(('Volume', values[2]))
    retList.append(('Average Daily Volume', values[3]))
    retList.append(('Stock exchange', values[4]))
    retList.append(('Market cap', values[5]))
    retList.append(('Book value', values[6]))
    retList.append(('Ebitda', values[7]))
    retList.append(('Dividend per share', values[8]))
    retList.append(('Dividend yield', values[9]))
    retList.append(('earnings per share', values[10])) 
    retList.append(('52 week high', values[11]))
    retList.append(('52 week low', values[12]))
    retList.append(('50 day moving avg', values[13]))
    retList.append(('200 day moving avg', values[14]))
    retList.append(('price earnings ratio', values[15]))
    retList.append(('price earnings growth ratio', values[16]))
    retList.append(('price sales ratio', values[17]))
    retList.append(('price book ratio', values[18]))
    retList.append(('short ratio', values[19]))
    return retList
