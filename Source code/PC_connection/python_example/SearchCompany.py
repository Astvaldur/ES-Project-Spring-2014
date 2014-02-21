"""
Author: Haraldur Tomas Hallgrimsson, haraldurt@gmail.com

Functions included:

Usage:  is_ticker_valid(symbol)
Before: symbol is string
After:  returns True if symbol is valid ticker name, else False

Usage:  is_company_name(CompName)
Before: CompName is a string
After:  Returns True if CompName has an associated ticker name, False otherwise

Usage:  find_ticker(CompName)
Before: is_company_name(CompName) is True
After:  Return associated ticker name of company named CompName 

Usage: close_results(CompName)
Before: is_company_name(CompName) is False
After:  Prints out list of close matches to CompName

Useage: compName = find_compName(ticker)
Before: is_ticker_valid(ticker) is true
After:  compName is string, contains company name of ticker


Also included are 3 examples to how to implement the four functions above to retrieve valid ticker names, search(), search2(CompName), and find_symbol(CompName). If called as a script, search() is used as the main function:

SearchCompany finds a company ticker name/symbol name.
It first checks to see if it's input is a valid ticker name already, and returns it if so.
If not, it checks to see if the input is a valid company name, if so it finds and returns its ticker name.
If not, it creates a list of close matches, and displays both ticker and company names for those results.

To populate the list of close matches I search marketwatch.com for the input and scrape the results page.
"""

import ystockquote
import urllib
import urllib2
import re
from bs4 import BeautifulSoup

#Usage:  is_ticker_valid(symbol)
#Before: symbol is string
#After:  returns True if symbol is valid ticker name, else False
def is_ticker_valid(symbol):
    if symbol == "":
        return False
    if re.search(' .*',symbol):
        #symmbol may not include space
        return False
    #bug: get_price uses spaces as deliminator, returns with \r\n as delimiator
    price = float(ystockquote.get_price(symbol))
    if price > 0.000001: #get_price returns 0 if no ticker exists.
        return True
    else:
        return False
        
#Usage:  is_company_name(CompName)
#Before: CompName is a string
#After:  Returns True if CompName has an associated ticker name, False otherwise
def is_company_name(CompName):
    base_url = 'http://www.marketwatch.com/tools/quotes/lookup.asp?siteID=mktw&Lookup='
    end_url = '&Country=us&Type=All'
    content = urllib.urlopen(base_url + CompName + end_url).geturl()
    last_part = content.rsplit('/',1)[-1]
    return len(last_part) < 5

#Usage:  find_ticker(CompName)
#Before: is_company_name(CompName) is True
#After:  Return associated ticker name of company named CompName 
def find_ticker(CompName):
    CompName = re.sub("\d+", "", CompName) #Remove digits from CompName
    base_url = 'http://www.marketwatch.com/tools/quotes/lookup.asp?siteID=mktw&Lookup='
    end_url = '&Country=us&Type=All'
    content = urllib.urlopen(base_url + CompName + end_url).geturl()
    return content.rsplit('/',1)[-1]

#Usage: close_results(CompName)
#Before: is_company_name(CompName) is False
#After:  Returns string containing close matches to CompName
def close_results(CompName):
    base_url = 'http://www.marketwatch.com/tools/quotes/lookup.asp?siteID=mktw&Lookup='
    end_url = '&Country=us&Type=All'
    CompName.replace(' ','+')
    htmlSource = urllib.urlopen(base_url + CompName + end_url).read()
    soup = BeautifulSoup(htmlSource)
    tmp = soup.find('div','results')
    if tmp is None:
        return 'No close matches found'
    tmp = tmp.find_all('a')
    rslt = ""
    for line in set(tmp):
        rslt += line.get('href').rsplit('/',1)[-1] + '\t' + line.get('title').rsplit('"',1)[-1] + "\n"
    return rslt
    
#Useage: compName = find_compName(ticker)
#Before: is_ticker_valid(ticker) is true
#After:  compName is string, contains company name of ticker
def find_compName(ticker):
    base_url = 'http://www.marketwatch.com/tools/quotes/lookup.asp?siteID=mktw&Lookup='
    end_url = '&Country=us&Type=All'
    #CompName.replace(' ','+')
    htmlSource = urllib.urlopen(base_url + ticker + end_url).read()
    soup = BeautifulSoup(htmlSource)
    for line in soup.title:
        tmp = line.rsplit(',')[0]
        return tmp[10:].encode('ascii','ignore')
    

        
# Example uses of functions above:

        
#Usage: search()
#       Asks for text input
#After: If text input is valid ticker name, returns text input
#       If text input is valid company name, returns associated ticker name
#       Otherwise, returns list of close matches and asks to run again
def search():
    CompName = raw_input("\nEnter company ticker name: ")
    return search2(CompName)

#Usage: search2(Name)
#       Same as search, except Name is used instead of asking for text input
def search2(CompName):
    ystockquote.get_price(CompName)
    if is_ticker_valid(CompName):
        return CompName
    return find_symbol(CompName)

#Usage:  find_symbol(CompName)
#Before: CompName is a string
#After:   Returns either valid ticker name or prints out list of close matches to input and asks to run again.s
def find_symbol(CompName):
#Checks if input has an associated ticker name, if not populates list of close results.
    if is_company_name(CompName):
        ticker = find_ticker(CompName)
        if is_ticker_valid(ticker):
            return ticker
        else:
            print 'It seems the ticker might be ' + ticker + ' but Yahoo! Finance does not seem to recognize that.'
    else:
        print '\nNot a valid company name, searching for close results...'
        print close_results(CompName)
        ans = raw_input('\n\nDo you want to search again? (y/n)  ')
        if ans.lower() == 'y':
            return search()
            
if __name__ == "__main__":
    print find_compName('f')
    #search()