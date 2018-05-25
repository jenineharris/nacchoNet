'# PROLOG   ################################################################'

'# PROJECT: 2016 NACCHO PROFILE STUDY NETWORK DATA #'
'# PURPOSE: CLEANING AND COERCING NETWORK DATA INTO NETWORK OBJECT #'
'# DIR:     https://github.com/jenineharris/nacchoNet #'
'# DATA:    naccho2016.csv #'
'# AUTHOR:  Jenine Harris harrisj@wustl.edu #'
'# CREATED: May 25 2018 #'
'# LATEST:  May 25 2018 #'
'# NOTES:   Network data cleaned and prepared for analyses, #'
'#          from 2016 NACCHO Profile Study  #'

'# PROLOG   ###############################################################'

# open naccho network data csv file from github
library(tidyverse)
naccho <- read_csv("https://raw.githubusercontent.com/jenineharris/nacchoNet/master/naccho2016.csv")
names(naccho) <- c("nacchoid", "link.from", "link.to", "state", "Notes")

# delete messy state variable and sub truncated naccho id for state variable
naccho <- naccho[-4]
naccho$state <- strtrim(naccho$nacchoid, 2)

# check state variable for unusual values
table(naccho$state)

# remove nodes left with questions from file development
naccho_remove <- naccho[!is.na(naccho$Notes) | naccho$nacchoid == naccho$link.to, ]
naccho_net <- naccho[!(!is.na(naccho$Notes) | naccho$nacchoid == naccho$link.to), ]

# 48 states HI and RI missing
unique(naccho_net$state) %>% length() 

# 1347 unique departments 
unique(naccho_net$nacchoid) %>% length()

# network plot
# install statnet package if you don't have it already
# install.packages("statnet")
library(statnet)

# coerce edgelist into network object
naccho_net_obj <- network(naccho_net[, c(1,3)], matrix.type = "edgelist", directed = FALSE)
plot(naccho_net_obj)

# add state as a node characteristic
naccho_net_obj %v% "state" <- naccho_net$state

# plot network with nodes colored by state
# use par to make margins smaller
par( mar = c(0, 0, 0, 0) )
plot(naccho_net_obj, vertex.col = "state")

# network density is .003
network.density(naccho_net_obj)
