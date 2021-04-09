### Strava API ###

# This data set is loaded via csv. For API access, check:
# Documentation: https://bldavies.com/blog/accessing-strava-api/
# Read: https://github.com/fawda123/rStrava


# Loading packages
library(dplyr)

# load activity data
setwd("~/Sh/portfolio")
df <- read.csv("./data/activities.csv", sep = ",", header = T)

# reduce complexity of data
df <- select(df, Activity.ID,
              Activity.Date,
              Distance,
              Moving.Time,
              Max.Speed)


# formatting data
df$Activity.Date <- as.POSIXct(df$Activity.Date,format="%b %d, %Y, %H:%M:%S %p")
df$Moving.Time <- df$Moving.Time/60
