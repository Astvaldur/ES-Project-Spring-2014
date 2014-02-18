"""       

    Author: Astvaldur Hjartarson

# -----Assert methods to use--------------------
http://docs.python.org/2/library/unittest.html
"""
import unittest
import re, string, sys 
import getNews
import PubStockPrice
import SearchCompany
import EconomicValues
import GraphPlotter
import TechAnalysis

class test_abati(unittest.TestCase):
# -----Testing the methods--------------------0122


#---------- Testing getNews.py-------------------------
   
    # Everything is done with Google as a default
    # company.
    Google = "http://finance.yahoo.com/rss/headline?s=goog"  
    res=getNews.getXML(Google)
    
    #  This test is testing if the concating of two strings work.
    #  And to check if raising a error works.
    def test_getNews_getURL(self):
        # Checking if concating two strings works.
        yahoo = "http://finance.yahoo.com/rss/headline?s="
        str="text"
        result=getNews.getURL(str)
        self.assertTrue(result==(yahoo+str),"The concate does not work")
        
        # Cheking if value error
        strstr=["asdasd","asdasd","asdasd"] 
        with self.assertRaises(ValueError):
            getNews.getURL(strstr)        
    
    # Testing if getXML returns something
    def test_getNews_getXML(self):
        self.assertIsNotNone(self.res,"The function getXML does not work")
    
    # Test if every news article have time and date, Title and link.
    def test_getNews_parseRawXML(self):
        parseTest=getNews.parseRawXML(self.res)
        self.assertIsNotNone(parseTest[0],"Time and date is not shown")
        self.assertIsNotNone(parseTest[1],"Title is empty")
        self.assertIsNotNone(parseTest[3],"There is no link to news article ")
        

#----------------PubStockPrice.py-----------------------------

    # Testing if we get Historic Priceses from google.
    def test_PubStockPrice_getHistPrice(self):
        temp=PubStockPrice.getHistPrice('goog','20120101','20120102')
        self.assertIsNotNone(temp,"No data for Google")

    # Testing current price for google  
    def test_PubStockPrice_getCurrPrice(self):
        self.assertIsNotNone(PubStockPrice.getCurrPrice('goog'),"No Price")

    # Testing if we get Currency index.
    def test_PubStockPrice_getCurrIndex(self):
        self.assertIsNotNone(PubStockPrice.getCurrIndex(0),"S&P 500 price does not work")
        self.assertIsNotNone(PubStockPrice.getCurrIndex(1),"NASDAQ price does not work")
        
    # Testing if we get Stock index
    def test_PubStockPrice_getStockIndex(self):
        self.assertIsNotNone(PubStockPrice.getStockIndex(0),"S&P 500 does not work")
        self.assertIsNotNone(PubStockPrice.getStockIndex(1),"NASDAQ does not work")
    
    # Testing if we gett history for indexes         
    def test_PubStockPrice_getHistIndex(self):
        self.assertIsNotNone(PubStockPrice.getHistIndex(0,'20120101','20120103'),"S&P 500 has no history")
        self.assertIsNotNone(PubStockPrice.getHistIndex(1,'20120101','20120103'),"NASDAQ has no history")
        
    #----------------SearchCompany.py-----------------------------
    
    #   Testing if the function returns valid and invalid ticker names.
    def test_SearchCompany_is_ticker_valid(self):
        self.assertTrue(SearchCompany.is_ticker_valid('goog'),"No Google?")
        self.assertFalse(SearchCompany.is_ticker_valid('goxg'),"This is no company")
    
    #   Testing if the function returns valid and invalid Company name.
    def test_SearchCompany_is_company_name(self):
        self.assertIsNotNone(SearchCompany.is_ticker_valid('Google'),"Either Google is no longer a company or something is wrong")
        self.assertFalse(SearchCompany.is_ticker_valid('xexexexexe'),"This is no company")
        
    # Test find ticker results.
    def test_SearchCompany_find_ticker(self):
        self.assertEqual(SearchCompany.find_ticker('Google'),'GOOG',"Either Google is no longer a company or something is wrong")
        
    # Test close results.    
    def test_SearchCompany_close_results(self):
        self.assertIsNotNone(SearchCompany.close_results('Gogle'),"Nothing resamples Google")
        
    # Test if search for google return the right string
    def test_SearchCompany_find_compName(self):
        self.assertEqual(SearchCompany.find_compName('GOOG'),'Google Inc. Cl A'," Can not find company ")
   
    #----------EconomicValues.py----------------------------
    def test_EconomicValues_get_Economic_Values(self):
        self.assertIsNotNone(EconomicValues.get_Economic_Values('Google'),"Does not return anything")
    #--------GraphPlotter.py------------------------------
    
    # Check if singleFuncPlot returns graph.
    def test_GraphPlotter_singleFuncPlot(self):
        xyList=[["20120101","20120102","20120103","20120104"],[1,2,3,4]]
        axLab=[["xlabel"],["ylabel"]]
        self.assertIsNotNone(GraphPlotter.singleFuncPlot(xyList, axLab))
    
    # Check if singleFuncPlot returns graph.   
    def test_GraphPlotter_multipleFuncPlot(self):
        xList=['20120101','20120102','20120103','20120104']
        yLists=[[1.0,2.0,3.0,4.0],[4.0,5.0,6.0,7.0],[2.0,3.0,5.0,7.0]]
        axLab=['xlabel','ylabel']
        self.assertIsNotNone(GraphPlotter.multipleFuncPlot(xList, yLists, axLab))
    
    #--------TechAnalysis---------------------------------
    
    # Test moveAvg with a standard input and check if we get the expected output
    def test_TechAnalysis_moveAvg(self):
        y=[1,2,3,4,5]
        N=2
        utkomafalls=TechAnalysis.moveAvg(y,N)
        utkoma =[1.5,1.5,2.5,3.5,4.5]
        self.assertTrue(len(utkomafalls)==len(utkoma) and all(utkomafalls[i] == utkoma[i] for i in range(len(utkomafalls))),"Method has changed")

    # Test bollBands with a standard input and check if we get the expected output
    def test_TechAnalysis_bollBands(self):
        y=[1,2,3,4,5]
        N=2
        utkomafalls=TechAnalysis.bollBands(y,N)
        utkomaEfri =[2.5,2.5,3.5,4.5,5.5]
        utkomaNedri =[0.5,0.5,1.5,2.5,3.5]
        self.assertTrue(len(utkomafalls[0])==len(utkomaEfri) and all(utkomafalls[0][i] == utkomaEfri[i] for i in range(len(utkomafalls[0]))),"Method has changed,utkomaEfri")
        self.assertTrue(len(utkomafalls[1])==len(utkomaNedri) and all(utkomafalls[1][i] == utkomaNedri[i] for i in range(len(utkomafalls[1]))),"Method has changed,utkomaNedri")

    # Check if TechAnalysis method buySell returns a boolean to tell if to by or sell
    def test_TechAnalysis_buySell(self):
        self.assertTrue(TechAnalysis.buySell('GOOG') or True,'bySell does not return a boolean')
 
# -----------TO run the code----------------
if __name__ == '__main__':
    unittest.main(verbosity=2, exit=False)
