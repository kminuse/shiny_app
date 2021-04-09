### Strava API ###

# This data set is loaded via csv. For API access, check:
# Documentation: https://bldavies.com/blog/accessing-strava-api/
# Read: https://github.com/fawda123/rStrava


# Loading packages
library(dplyr)

# load activity data
df <- read.csv("activities.csv", sep = ",", header = T)

# reduce complexity of data
df <- select(df, Activity.ID,
              Activity.Date,
              Elapsed.Time,
              Moving.Time,
              Max.Speed)

# 