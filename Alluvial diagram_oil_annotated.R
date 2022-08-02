
###########load packages ############################

#for data manipulation, if needed
library(plyr)
library(reshape)

#for plotting:
library(ggplot2)
library(gridExtra)
library(mgcv)
library(ggalluvial)
library(ggrepel)


#some reference material on alluvial plot construction and options:

# https://cran.r-project.org/web/packages/ggalluvial/vignettes/ggalluvial.html
# https://corybrunson.github.io/ggalluvial/
#comparison of two approaches (including ggalluvial) in terms of options & syntax:
  # https://www.r-bloggers.com/2019/06/data-flow-visuals-alluvial-vs-ggalluvial-in-r/


##################### Load data ##################################
### load revised data containing goal, status, monitoring, targets, habitat:
oildata <- read.csv("C:\\Users\\Stephanie Green\\Dropbox\\oil and fishing communities\\alluvial_oil_data.csv")


##################### Plots ##################################
#Plot #1
### plot updated Feb 11 for MS revision
#greyscale
#plot has three columns (i.e.axes):
#axis 1 (left side) = type of stressor (ordered by type 1->4),
#axis 2 (middle) = temporal scale (coded numerically for order in data frame)
#axis 3 (right) = type of effect on fishery; ordered alphabetically by default
#geom_alluvium fill (i.e. colour of lines) = type of stressor
TempScaleOrderPlotGrey <- ggplot(oildata,
                             aes(y = ,
                                 axis1 = StressorOrder, axis2 = Temporal.extent, axis3 = Impact)) +
  #change options for alluvial plot appearance:
  geom_alluvium(aes(fill = StressorOrder),
                width = 1/8, knot.pos = 0.5, show.legend = FALSE) +
  guides(fill = FALSE) +
  #change width of column boxes:
  geom_stratum(width = 1/3, reverse = TRUE) +
  #change options for alluvial plot appearance:
  geom_flow(aes(fill = StressorOrder), stat = "alluvium") +
  #change size of text in columns 1->3
  geom_text(stat = "stratum", label.strata = TRUE, reverse = TRUE, size =3) +
  scale_x_continuous(breaks = 1:3, labels = c("Stressor", "Certainty of effect", "Impact")) +
  #change pangel background and border
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        panel.background = element_blank(), axis.line = element_line(colour = "black"))+
  theme(axis.text.x = element_text(colour = 'black', angle = 0, size = 0, hjust = 0.4, vjust = -0.3))+
  theme(axis.text.y = element_text(colour = 'black', angle = 0, size = 24, hjust = 0.4, vjust = -0.3))+
  theme(axis.title.y = element_text(colour = 'black', angle = 90, size = 20, hjust = 0.5 , vjust = 0.2))+
  #change line colour between panels:
  scale_fill_grey() 
#display
TempScaleOrderPlotGrey
#export 1200x900


#Plot #2
### plot updated Feb 11 for MS revision
#colour
#plot by stressor type, temporal scale, type of effect
# same as plot above except omit 'scale_fill_grey()'
TempScaleOrderPlotColour <- ggplot(oildata,
                                 aes(y = ,
                                     axis1 = StressorOrder, axis2 = Temporal.extent, axis3 = Impact)) +
  #change options for alluvial plot appearance:
  geom_alluvium(aes(fill = StressorOrder),
                width = 1/8, knot.pos = 0.5, show.legend = FALSE) +
  guides(fill = FALSE) +
  #change width of column boxes:
  geom_stratum(width = 1/3, reverse = TRUE) +
  #change options for alluvial plot appearance:
  geom_flow(aes(fill = StressorOrder), stat = "alluvium") +
  #change size of text in columns 1->3
  geom_text(stat = "stratum", label.strata = TRUE, reverse = TRUE, size =3) +
  scale_x_continuous(breaks = 1:3, labels = c("Stressor", "Certainty of effect", "Impact")) +
  #change pangel background and border
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        panel.background = element_blank(), axis.line = element_line(colour = "black"))+
  theme(axis.text.x = element_text(colour = 'black', angle = 0, size = 0, hjust = 0.4, vjust = -0.3))+
  theme(axis.text.y = element_text(colour = 'black', angle = 0, size = 24, hjust = 0.4, vjust = -0.3))+
  theme(axis.title.y = element_text(colour = 'black', angle = 90, size = 20, hjust = 0.5 , vjust = 0.2))

#display
TempScaleOrderPlotColour1
#export 1200x900



