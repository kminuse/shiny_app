
##### packages
library(shinydashboard)
library(rsconnect)
library(httr)
library(jsonlite)
library(shiny)
library(dplyr)

##### Connect to shinyapps.io #####
rsconnect::setAccountInfo(name='konstantinescher',
                          token='9A7B9EACF792362ABA2BC6CC1B142202',
                          secret='OuQZyC+iSZdkiZYyjEuC4/NZ2Pinjhs9RqYH2ns/')

##### Connect to Strava API #####

# Documentation
# https://bldavies.com/blog/accessing-strava-api/
# https://github.com/fawda123/rStrava

client_id <- 64440
secret <- "47eed8919dd33ea8ca853f85f6137ef9c4d15a76"

app <- oauth_app("strava", client_id, secret)
endpoint <- oauth_endpoint(
  request = NULL,
  authorize = "https://www.strava.com/oauth/authorize",
  access = "https://www.strava.com/oauth/token"
)

token <- oauth2.0_token(endpoint, app, as_header = FALSE, scope = "activity:read_all")

#### Data Access #####

df_list <- list()
i <- 1
done <- FALSE
while (!done) {
  req <- GET(
    url = "https://www.strava.com/api/v3/athlete/activities",
    config = token,
    query = list(per_page = 200, page = i)
  )
  df_list[[i]] <- fromJSON(content(req, as = "text"), flatten = TRUE)
  if (length(content(req)) < 200) {
    done <- TRUE
  } else {
    i <- i + 1
  }
}

df <- rbind_pages(df_list)

df <- df %>% select("id",
              "start_date",
              "distance",
              "moving_time",
              "average_speed",
              "max_speed")
write.table(df, file = "df.csv", sep = ";")
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#