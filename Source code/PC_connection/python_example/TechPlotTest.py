import PubStockPrice
import TechAnalysis
import matplotlib.pylab as plt
import GraphPlotter
import SearchCompany as SC

ticker = SC.search()
data = PubStockPrice.getHistPrice(ticker,'20130101','20130130')
y = data[1]
sma = TechAnalysis.moveAvg(y,20)
BB = TechAnalysis.bollBands(y,20)

print data[0]
print y
print sma
print BB[0]

GraphPlotter.multipleFuncPlot(data[0], [y,sma,BB[0],BB[1]], ['Times','Prices'])
plt.show()