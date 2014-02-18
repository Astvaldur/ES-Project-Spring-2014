# -*- coding: utf8 -*-
# Author: Heimir Þór Kjartansson

# Assumptions:
#   wxPython is able to recieve a ready made figure
#       object.
#   wxPython will handle the scaling of the figure
#       (in size).

import matplotlib
#matplotlib.use('WXAgg')
from matplotlib.figure import Figure
import matplotlib.pyplot as plt
from dateutil import parser

# N: fig = GraphPlotter.singleFuncPlot(xyList, axLab)
# F: xyList is a list of lists where xyList[0] is
#       a list of date values (YYYYMMDD) and xyList[1] is a list
#       of y values.
#    axLab is a list of labels where axLab[0] is the
#       x label and axLab[1] is the y label.
# E: fig is a Figure object (from matplotlib.figure)
#       with the x and y values plotted.
def singleFuncPlot(xyList, axLab):
    f, ax = plt.subplots()
    dates = [parser.parse(day,yearfirst=True,ignoretz=True) for day in xyList[0]]
    dates = matplotlib.dates.date2num(dates)
    ax.plot_date(dates,xyList[1],'-',xdate=True,ydate=False)
    ax.set_xlabel(axLab[0])
    ax.set_ylabel(axLab[1])
    labels = ax.get_xticklabels()
    for label in labels:
        label.set_rotation(30)
    return f

# N: fig = GraphPlotter.multipleFuncPlot(
#                               xList, yLists, axLab)
# F: xList is a list of date values (YYYYMMDD), yLists is a list
#       [ylist1, ylist2, ..., ylistn] where each ylistk,
#       0 <= k <= n, is a list of y values.
#    axLab is a list of labels where axLab[0] is the
#       x label and axLab[1] is the y label.
# E: fig is  Figure object (from matplotlib.figure)
#       with the x values from xList and y values from
#       the lists in yLists plotted on the same figure 
#       such that every path formed by the pair of xList
#       and a ylistk is in fig.
def multipleFuncPlot(xList, yLists, axLab):
    f, ax = plt.subplots()
    dates = [parser.parse(day,yearfirst=True,ignoretz=True) for day in xList]
    dates = matplotlib.dates.date2num(dates)
    for yList in yLists:
        ax.plot_date(dates,yList,'-',xdate=True,ydate=False)
    ax.set_xlabel(axLab[0])
    ax.set_ylabel(axLab[1])
    labels = ax.get_xticklabels()
    for label in labels:
        label.set_rotation(30)
    return f
