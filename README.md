# NACCHO 2016 Profile Study Network Data

Of the 2533 LHDs surveyed, 1930 (76%) responded to the 2016 Profile Study. One of the questions in the study elicited network data from LHDS by asking:

In thinking about your peers who lead other local health departments in the U.S., list the five LHDs whose leaders you communicate with most frequently about administrative, professional, and leadership issues in public health. In each instance, please provide only the LHD name rather than the leader's name.

After removing LHDs that did not respond to the network question, NACCHO had responses from 1387 LHDs to the network question. The 1387 LHDs identified a total of 5893 connections. We noticed that some connections were health departments connected to themselves or to a non-health department. We removed these connections (n = 75) and were left with a total of 1347 health departments in 48 states with 5818 connections among them. 

This repository contains the a CSV file with the following variables:

- nacchoid: The unique identifier for the LHD that answered the question (NACCHO assigns this to each health dept)
- link.from: The name of the health department that answered the network question
- link.to: The unique identifier for the partner identified by the respondent 
- state: The state the responding LHD is in
- Notes: Notes about the link including whether the link.to value is valid

The repository also contains the R code to import and clean the CSV file so it contains only the 1347 health departments with 5818 links among them. The R code includes commands to plot the network with nodes colored by state.
