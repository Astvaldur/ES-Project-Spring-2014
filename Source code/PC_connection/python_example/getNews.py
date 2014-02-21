# -*- coding: utf-8 -*-
#Author : Unnsteinn Barkarson
#Created: 3. feb 2013

import urllib2

yahoo = "http://finance.yahoo.com/rss/headline?s="

#Usage : url = getURL(tick)
#Before: tick is a valid stock ticker name 
#After : url is a string that can be used by getXML(url) to fetch the news XML.
def getURL(ticker):
    if isinstance(ticker, str):
        resVal = yahoo+ticker
    else:
        raise ValueError('Too any tickers')
    return resVal
    

#Usage : raw = getXML(url)
#Before: url is a valid url created with getURL(ticker) 
#After : raw is a list containing every source line from url
def getXML(url):
    f = urllib2.urlopen(url)
    resVal = []
    while 1:
        x = f.readline()
        if x ==  "":
            break
        resVal.append(x)
    return resVal


#Usage : news = parseRawXML(rawXML)
#Before: rawXML is the raw xml created using getXML(url)
#After : news is a list of lists containing the news items for the chosen ticker.
#        The info in news is ordered as follows:
#           for every n in range(0,len(news))
#                news[n][0] is the publishing date and time
#                news[n][1] is the news title
#                news[n][2] is the news description (may be empty)
#                news[n][3] is the link to the news article
def parseRawXML(rawXML):
    rawXML = rawXML[1].replace('&apos;','\'').replace('&amp;','&').replace('ion></d','ion> </d').replace('><','>-**-<').split('-**-')
    resVal = []
    for n in range(0,len(rawXML)):
        if rawXML[n] == '<item>':
            tmp = []
            tmp.append(rawXML[n+5].replace('<pubDate>','').replace('</pubDate>',''))
            tmp.append(rawXML[n+1].replace('<title>','').replace('</title>',''))
            tmp.append(rawXML[n+3].replace('<description>','').replace('</description>',''))
            tmp.append(rawXML[n+2].replace('<link>','').replace('</link>','').split('*')[1])
            resVal.append(tmp)
    return resVal
    
    
#Usage : news = getNewsList(ticker)
#Before: ticker is a valid company ticker.
#After : news is a list of lists containing the news items for the chosen ticker.
#        The info in news is ordered as follows:
#           for every n in range(0,len(news))
#                news[n][0] is the publishing date and time
#                news[n][1] is the news title
#                news[n][2] is the news description (may be empty)
#                news[n][3] is the link to the news article
def getNewsList(ticker):
    url = getURL(ticker)
    raw = getXML(url)
    resVal = parseRawXML(raw)
    
    return resVal
