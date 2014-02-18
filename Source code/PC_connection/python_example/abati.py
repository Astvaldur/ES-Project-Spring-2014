# -*- coding: utf8 -*-
# Author: Heimir Þór Kjartansson
#         Unnsteinn Barkarson

# TODO:
#   Find out what is still running after frame Abati has been destroyed.
#   Add interactivity to the frames

import wx
import GraphPlotter
import PubStockPrice
from matplotlib.backends.backend_wxagg import FigureCanvasWxAgg as FigCanvas
import wx.lib.scrolledpanel as scrolled

class Abati(wx.Frame):
    
    """
    #Frame that is used for looking up company tickers.
    """
    class SearchFrame(wx.Frame):
        def __init__(self,parent, title):
            super(Abati.SearchFrame, self).__init__(parent, title=title, size=(300,200))
            
            FramePanel = wx.Panel(self)
            
            VertBox = wx.BoxSizer(wx.VERTICAL)
            HorBox = wx.BoxSizer(wx.HORIZONTAL)
            
            self.SearchBox = wx.TextCtrl(FramePanel, size = (200,-1), style= wx.TE_PROCESS_ENTER)
            self.SearchBox.Bind(wx.EVT_TEXT_ENTER, self.SearchButtonClicked)
            
            self.SearchButton = wx.Button(FramePanel, label='Search')
            self.SearchButton.Bind(wx.EVT_BUTTON, self.SearchButtonClicked)
            self.Results = Abati.NewsPanel(FramePanel, 100)
            self.Results.desc.SetLabel("")
           
            HorBox.Add(self.SearchBox,1, wx.GROW)
            HorBox.Add(self.SearchButton, 0, wx.GROW)
            
            VertBox.Add(wx.StaticText(FramePanel,-1,label="Company name"))
            VertBox.Add(HorBox)
            VertBox.Add(self.Results,1,wx.GROW)
            FramePanel.SetSizer(VertBox)
            
            self.Show()
        #End INIT
        
        
        def SearchButtonClicked(self,event):
            import SearchCompany as SC
            res = self.Results.desc
            searchString = str(self.GetSearchText())
            
            if SC.is_company_name(searchString):
                companies = SC.find_ticker(searchString)+'\t'+searchString
            else:
                companies = SC.close_results(searchString)
            
            res.SetLabel(str(companies))
            
            #Jiggle the panel in order for the scrollbars to refresh
            tmpSize = self.GetSize()
            self.SetSize((tmpSize[0],tmpSize[1]+1))
            self.SetSize(tmpSize)
            
        #End SearchButtonClicked
        
        
        def GetSearchText(self):
            return self.SearchBox.GetValue()
        #End GetSearchText
    #End SearchFrame
    
    
    
    class NewsPanel(scrolled.ScrolledPanel):
        def __init__(self, parent, ysize):
            scrolled.ScrolledPanel.__init__(self, parent, size=(200,ysize))
            vbox = wx.BoxSizer(wx.VERTICAL)
            self.desc = wx.StaticText(self, -1,
                ""
                )
            
            vbox.Add(self.desc, 0, wx.ALIGN_LEFT|wx.ALL, 5)
            self.SetSizer(vbox)
            self.SetAutoLayout(1)
            self.SetupScrolling()
        #End INIT
    #End NewsPanel
        
        
    class PlotPanel(wx.Panel):
        def __init__(self,parent):
            wx.Panel.__init__(self,parent,id=-1)
            advise = ""

            self.validTicker = False
            self.data = []
            self.figs = []
            self.canvasPanel = wx.Panel(self) 
            # Second level, middle
            belowPlot = wx.Panel(self)
            # Canvas object with plot created
            indices = [['2013-01-02','2013-01-03'],[0.0,1.0]]
            fig = GraphPlotter.singleFuncPlot(indices,['dates','stock index'])
            self.canvas = FigCanvas(self.canvasPanel, -1, fig)
                
            # Second level, middle, layout
            PlotSizer = wx.BoxSizer(wx.VERTICAL)
            PlotSizer.Add(self.canvasPanel, 1, wx.GROW)
            PlotSizer.Add((-1,6))
            PlotSizer.Add(belowPlot, 0, wx.GROW)
            PlotSizer.Add((-1,6))
            self.SetSizer(PlotSizer)

            # Third level
            Dates_Button = wx.Panel(belowPlot)
            pnl3_2 = wx.Panel(belowPlot)
            pnl3_3 = wx.Panel(belowPlot)

            # Third level, layout
            pnlSzr4 = wx.BoxSizer(wx.HORIZONTAL)
            pnlSzr4.Add(Dates_Button, 0, wx.GROW)
            pnlSzr4.Add((10,-1))
            pnlSzr4.Add(pnl3_2, 0, wx.GROW)
            pnlSzr4.Add((10,-1))
            pnlSzr4.Add(pnl3_3, 0, wx.GROW)
            belowPlot.SetSizer(pnlSzr4)

            # Fourth level, left
            self.normViewRB   = wx.RadioButton(Dates_Button, label="Simple Prices",style = wx.RB_GROUP)
            self.movAvg20RB   = wx.RadioButton(Dates_Button, label="20 day Moving Average")
            self.movAvg200RB  = wx.RadioButton(Dates_Button, label="200 day Moving Average")
            self.Boll20RB     = wx.RadioButton(Dates_Button, label="20 day Bollinger Bands")
            self.Boll200RB    = wx.RadioButton(Dates_Button, label="200 day Bollinger Bands")
            self.sp500     = wx.RadioButton(Dates_Button, label="S&P500 Stock Index")
            self.nasdaq    = wx.RadioButton(Dates_Button, label="Nasdaq Stock Index")

            # Radio button bindings
            self.normViewRB.Bind(wx.EVT_RADIOBUTTON, self.onRadioButton)
            self.movAvg20RB.Bind(wx.EVT_RADIOBUTTON, self.onRadioButton) 
            self.movAvg200RB.Bind(wx.EVT_RADIOBUTTON, self.onRadioButton)
            self.Boll20RB.Bind(wx.EVT_RADIOBUTTON, self.onRadioButton) 
            self.Boll200RB.Bind(wx.EVT_RADIOBUTTON, self.onRadioButton)
            self.sp500.Bind(wx.EVT_RADIOBUTTON, self.onRadioButton)
            self.nasdaq.Bind(wx.EVT_RADIOBUTTON, self.onRadioButton) 

            # Fourth level, left, layout
            pnlSzr5 = wx.BoxSizer(wx.VERTICAL)
            pnlSzr5.Add(wx.StaticText(Dates_Button,label="Stock Price Analysis Mode:"))
            pnlSzr5.Add((-1,3))
            pnlSzr5.Add(self.normViewRB)
            pnlSzr5.Add(self.movAvg20RB)
            pnlSzr5.Add(self.movAvg200RB)
            pnlSzr5.Add(self.Boll20RB)
            pnlSzr5.Add(self.Boll200RB)
            pnlSzr5.Add((-1,3))
            pnlSzr5.Add(wx.StaticText(Dates_Button, label="Stock Index Analysis Mode:"))
            pnlSzr5.Add((-1,3))
            pnlSzr5.Add(self.sp500)
            pnlSzr5.Add(self.nasdaq)
            Dates_Button.SetSizer(pnlSzr5)

            # Fourth level, middle
            self.Advice = wx.TextCtrl(pnl3_3,style= wx.TE_READONLY,size=(70,-1))
            self.Advice.SetValue(advise)

            # Fourth level, middle, layout
            pnlSzr6 = wx.BoxSizer(wx.VERTICAL)
            pnl3_2.SetSizer(pnlSzr6)

            # Fourth level, right, layout
            pnlSzr7 = wx.BoxSizer(wx.VERTICAL)
            pnlSzr7.Add(wx.StaticText(pnl3_3, label="Buy/Sell Recommendation:"))
            pnlSzr7.Add((-1,3))
            pnlSzr7.Add(self.Advice,0,wx.GROW)
            pnl3_3.SetSizer(pnlSzr7)
        #End INIT

        def SetValid(self, tString, dates):
            import PubStockPrice as PSP
            import TechAnalysis as TA
            import GraphPlotter as GP
            self.validTicker = True
            datar = PSP.getHistPrice(tString, dates[0], dates[1])
            self.data = datar
            self.data.append(TA.moveAvg(datar[1],20))
            self.data.append(TA.moveAvg(datar[1],200))
            self.data.append(TA.bollBands(datar[1],20))
            self.data.append(TA.bollBands(datar[1],200))
            drasl,tmpIndex = PSP.getHistIndex('0',dates[0],dates[1])
            self.data.append(tmpIndex)
            drasl,tmpIndex = PSP.getHistIndex('1',dates[0],dates[1])
            self.data.append(tmpIndex)
            labels = ['dates','index']
            
            self.figs = []
            for n in range(1,4):
                self.figs.append(GP.multipleFuncPlot(self.data[0],[self.data[n]],labels))
        
            for n in range(4,6):
                self.figs.append(GP.multipleFuncPlot(self.data[0],[self.data[1],self.data[n][0],self.data[n][1]],labels))

            for n in range(6,8):
                self.figs.append(GP.multipleFuncPlot(self.data[0], [self.data[n]], labels))

            if TA.buySell(tString):        
                self.Advice.SetValue("Buy Stocks")
                self.Advice.SetBackgroundColour("Green")        
            else:
                self.Advice.SetValue("Sell stocks")
                self.Advice.SetBackgroundColour("Red")
            self.plot()

        def onRadioButton(self, event):
            if self.validTicker:
                self.plot()

        def plot(self):
            if self.normViewRB.GetValue():
                self.canvas = FigCanvas(self.canvasPanel,-1,self.figs[0])
            if self.movAvg20RB.GetValue():
                self.canvas = FigCanvas(self.canvasPanel,-1,self.figs[1])
            if self.movAvg200RB.GetValue():
                self.canvas = FigCanvas(self.canvasPanel,-1,self.figs[2])
            if self.Boll20RB.GetValue():
                self.canvas = FigCanvas(self.canvasPanel,-1,self.figs[3])
            if self.Boll200RB.GetValue():
                self.canvas = FigCanvas(self.canvasPanel,-1,self.figs[4])
            if self.sp500.GetValue():
                self.canvas = FigCanvas(self.canvasPanel,-1,self.figs[5])
            if self.nasdaq.GetValue():
                self.canvas = FigCanvas(self.canvasPanel,-1,self.figs[6])
    #End PlotPanel
    
    
    class OptionsPanel(wx.Panel):
        def __init__(self,parent,ysize, framePanel):
            from datetime import date,timedelta
            
            wx.Panel.__init__(self,parent,id=-1, size=(120,ysize))
            
            self.parentPanel = framePanel
            
            tickerLabel = wx.StaticText(self, label="Enter Stock Ticker")
            self.ticker = wx.TextCtrl(self,style=wx.TE_PROCESS_ENTER)
            self.ticker.Bind(wx.EVT_TEXT_ENTER, self.PlotButtonClick)
            
            tickerSearch = wx.Button(self, label="Search")
            tickerSearch.Bind(wx.EVT_BUTTON, self.TickerButtonClick)
            
            SearchSizer = wx.BoxSizer(wx.HORIZONTAL)
            SearchSizer.Add((4,-1))
            SearchSizer.Add(self.ticker)
            SearchSizer.Add(tickerSearch)
            
            self.VariousThings= Abati.NewsPanel(self,150)
            self.StartDatePicker = wx.DatePickerCtrl(self,style=wx.DP_DROPDOWN)
            today = date.today()-timedelta(weeks =104)
            
            displayDate = wx.DateTimeFromDMY(int(today.day),int(today.month)-1,int(today.year))
            
            self.StartDatePicker.SetValue(displayDate)
            self.EndDatePicker = wx.DatePickerCtrl(self, style=wx.DP_DROPDOWN)
            
            StartDSizer = wx.BoxSizer(wx.HORIZONTAL)
            StartDSizer.Add((4,-1))
            StartDSizer.Add(wx.StaticText(self,label="Start Date"))
            StartDSizer.Add((4,-1))
            StartDSizer.Add(self.StartDatePicker)
            
            EndDSizer = wx.BoxSizer(wx.HORIZONTAL)
            EndDSizer.Add((4,-1))
            EndDSizer.Add(wx.StaticText(self,label="End Date"))
            EndDSizer.Add((10,-1))
            EndDSizer.Add(self.EndDatePicker)
            
            btnPlot = wx.Button(self, label='Fetch Data')
            btnPlot.Bind(wx.EVT_BUTTON,self.PlotButtonClick)
            
            optionSizer = wx.BoxSizer(wx.VERTICAL)
            optionSizer.Add((-1,5))
            optionSizer.Add(tickerLabel)
            optionSizer.Add((-1,2))
            optionSizer.Add(SearchSizer)
            optionSizer.Add((-1,10))
            optionSizer.Add(StartDSizer)
            optionSizer.Add(EndDSizer)
            optionSizer.Add(btnPlot)
            optionSizer.Add((-1,20))
            optionSizer.Add(wx.StaticText(self,label="Economic information"))
            optionSizer.Add((-1,3))
            optionSizer.Add(self.VariousThings,1, wx.GROW)
            
            self.SetSizer(optionSizer)
            
        #End INIT
        
        def PlotButtonClick(self,event):
            import SearchCompany as SC
            import getNews
            import EconomicValues as EC
            
            tickerString = str(self.ticker.GetValue())
            if not SC.is_ticker_valid(tickerString):
                wx.MessageBox('Invalid Ticker', 'Ticker', wx.OK | wx.ICON_ERROR)
                return
                
            #Get the company news
            newsString = ""
            news = getNews.getNewsList(tickerString)
            for n in range(0,len(news)-2):
                newsString = newsString+str(news[n][1])+'\n\n'
            newsString = newsString+str(news[len(news)-1][1])
            
            #Get the company economic information
            ECvalues = ""
            for value in EC.get_Economic_Values(tickerString):
                ECvalues = ECvalues + value[0] + ':\n\t ' + value[1] + '\n'
            
            
            self.VariousThings.desc.SetLabel(ECvalues)
            self.parentPanel.news.desc.SetLabel(newsString)
            
            startDate = self.DatePickerToString(self.StartDatePicker)
            endDate = self.DatePickerToString(self.EndDatePicker)
            dates = [startDate,endDate]
            self.parentPanel.plot.SetValid(tickerString,dates)
            
            #Jiggle the panel in order for the scrollbars to refresh
            tmpSize = self.parentPanel.GetSize()
            self.parentPanel.SetSize((tmpSize[0],tmpSize[1]+1))
            self.parentPanel.SetSize(tmpSize)
        #End PlotButtonClick
        
        def DatePickerToString(self,picker):
            date_str = "%04d%02d%02d" % (picker.GetValue().Year,picker.GetValue().Month+1,picker.GetValue().Day)
            
            return date_str
        #End DatePickerToString
        
        
        def TickerButtonClick(self,event):
            Abati.SearchFrame(None, title = 'Ticker lookup')
        #End TickerButtonClick
            
    #End OptionsPanel

    def __init__(self, parent, title):
        height = 768
        super(Abati, self).__init__(parent, title=title, size=(1024,height))

        
        # Top level
        FramePanel = wx.Panel(self)
        
        vertBox = wx.BoxSizer(wx.VERTICAL)
        vertBox.Add(wx.StaticText(FramePanel,label="Company News!"))
        vertBox.Add((-1,10))
        self.news = Abati.NewsPanel(FramePanel, height-35)
        self.options = Abati.OptionsPanel(FramePanel, height,self)
        self.plot = Abati.PlotPanel(FramePanel)

        
        vertBox.Add(self.news,1,wx.GROW)
        # Top level, layout
        FrameSizer = wx.BoxSizer(wx.HORIZONTAL)
        FrameSizer.Add(self.options,0, wx.GROW)
        FrameSizer.Add(self.plot, 1, wx.GROW)
        FrameSizer.Add(vertBox,0,wx.GROW)
        FramePanel.SetSizer(FrameSizer)
        
        # Draw all
        self.Show()

# Run
app = wx.App()
Abati(None, title='Abati')
app.MainLoop()
