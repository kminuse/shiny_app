### Strava API ###

# This data set is loaded via csv. For API access, check:
# Documentation: https://bldavies.com/blog/accessing-strava-api/
# Read: https://github.com/fawda123/rStrava








# Loading packages
library(ggplot2)
library(dplyr)
library(tidyr)


Sys.setlocale("LC_TIME", "en_US.UTF-8")

# load activity data
setwd("~/Sh/portfolio")
df <- read.csv("./data/activities.csv", header=T, sep=",")

# reduce complexity of data
df <- select(df, Activity.ID,
              Activity.Date,
              Distance,
              Moving.Time,
              Max.Speed)


# formatting data
df$Activity.Date <- as.POSIXct(df$Activity.Date,format="%b %d, %Y, %H:%M:%S %p")
df$Moving.Time <- df$Moving.Time/60

# qdding weekdays
df$weekday <- weekdays(df$Activity.Date)
df$weekday <- as.factor(df$weekday)

days <- table(df$weekday)/length(df$weekday)*100

# plot weekdays

list <- c("Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday")

weekday_runs <- df %>%
  group_by(weekday) %>%
  summarize(Activity.ID = length(Activity.ID),
            run = sum(Distance)) %>%
  as.data.frame()

weekday_runs$weekday <- factor(weekday_runs$weekday, levels=c("Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"))
weekday_runs <- weekday_runs[order(weekday_runs$weekday), ]

weekday_runs_plot <- ggplot(weekday_runs, aes(x=weekday, y=Activity.ID)) +
  geom_bar(stat="identity", fill="#A6CEE3", position="dodge", width = 0.3) +
  theme_bw() +
  xlab(" ") +
  ylab(" ") +
  scale_x_discrete(limits = rev(levels(weekday_runs$weekday))) +
  geom_text(aes(label=Activity.ID), position=position_dodge(width=0.6),vjust=0.3, hjust=-0.3) +
  scale_fill_viridis_d(breaks = rev, direction = -1) +
  # scale_fill_brewer(name="",
  #                   breaks=c("disp"),
  #                   labels=c("disp")) +
  theme(legend.position="bottom",
        axis.title.x = element_blank(),
        axis.text.x = element_blank(),
        axis.ticks.x = element_blank(),
        legend.text = element_text(size = 5)) +
  coord_flip() +
  ylim(0,45)


#########

weekday_runs_long <- gather(weekday_runs, key = "day", value = "value", -weekday)

weekday_runs_distance_plot <- ggplot(data=weekday_runs_long, aes(fill=day, x=weekday, y=value)) +
  geom_bar(stat="identity", position="dodge", width = 0.6) +
  theme_bw() +
  coord_flip() +
  xlab("") +
  ylab("") +
  scale_x_discrete(limits = rev(levels(weekday_runs$weekday))) +
  geom_text(aes(label=value), position=position_dodge(width=0.6),vjust=0.4, hjust=-0.1) +
  scale_fill_viridis_d(breaks = rev, direction = -1) +
  scale_fill_brewer(name="",
                    breaks=c("no of runs", "total distance"),
                    labels=c("no of runs", "total distance")) +
  theme(legend.position="bottom",
        legend.text = element_text(size = 7)) +
  ylim(0,700)

#############

# average distance over time

distances_time_plot <- ggplot(df, aes(x=Activity.Date, y=Distance)) +
  geom_bar(stat="identity", fill="#A6CEE3", position="dodge", width = 2.6) +
  theme_bw() +
  xlab(" ") +
  ylab(" ") +
  #scale_x_discrete(limits = rev(levels(weekday_runs$weekday))) +
  #geom_text(aes(label=ID), position=position_dodge(width=0.6),vjust=0.3, hjust=-0.3) +
  scale_fill_viridis_d(breaks = rev, direction = -1) +
  geom_smooth(method='lm', formula= y~x) +
  # scale_fill_brewer(name="",
  #                   breaks=c("disp"),
  #                   labels=c("disp")) +
  theme(legend.position="bottom",
        axis.title.x = element_blank(),
        axis.text.x = element_blank(),
        axis.ticks.x = element_blank(),
        axis.title.y = element_blank(),
        axis.text.y = element_blank(),
        axis.ticks.y = element_blank(),
        legend.text = element_text(size = 5)) +
  #coord_flip() +
  ylim(0,35)

# average pace over time

df$Moving.Time <- df$Moving.Time/60
df$speed <- df$Distance/df$Moving.Time

speed_time_plot <- ggplot(df, aes(x=Activity.Date, y=speed)) +
  geom_bar(stat="identity", fill="#A6CEE3", position="dodge", width = 2.6) +
  theme_bw() +
  xlab(" ") +
  ylab(" ") +
  #scale_x_discrete(limits = rev(levels(weekday_runs$weekday))) +
  #geom_text(aes(label=ID), position=position_dodge(width=0.6),vjust=0.3, hjust=-0.3) +
  scale_fill_viridis_d(breaks = rev, direction = -1) +
  geom_smooth(method='lm', formula= y~x) +
  # scale_fill_brewer(name="",
  #                   breaks=c("disp"),
  #                   labels=c("disp")) +
  theme(legend.position="bottom",
        axis.title.x = element_blank(),
        axis.text.x = element_blank(),
        axis.ticks.x = element_blank(),
        axis.title.y = element_blank(),
        axis.text.y = element_blank(),
        axis.ticks.y = element_blank(),
        legend.text = element_text(size = 5)) +
  #coord_flip() +
  ylim(0,0.2)

######

df$month <- month(df$Activity.Date)


month_runs <- df %>%
  group_by(month) %>%
  summarize(distance = sum(Distance)) %>%
  as.data.frame()

months_run <- ggplot(month_runs, aes(x=month, y=distance)) +
  geom_bar(stat="identity", fill="#A6CEE3", position="dodge", width = 0.5) +
  theme_bw() +
  xlab(" ") +
  ylab(" ") +
  #scale_x_discrete(limits = rev(levels(weekday_runs$weekday))) +
  geom_text(aes(label=distance), position=position_dodge(width=0.1),size=2,vjust=-0.5, hjust=0.5) +
  scale_fill_viridis_d(breaks = rev, direction = -1) +
  geom_smooth(method='lm', formula= y~x) +
  # scale_fill_brewer(name="",
  #                   breaks=c("disp"),
  #                   labels=c("disp")) +
  theme(legend.position="bottom",
        #       axis.title.x = element_blank(),
        #       axis.text.x = element_blank(),
        #       axis.ticks.x = element_blank(),
        axis.title.y = element_blank(),
        axis.text.y = element_blank(),
        axis.ticks.y = element_blank(),
        legend.text = element_text(size = 5)) +
  #coord_flip() +
  scale_x_continuous(breaks=seq(1, 12, 1)) +
  ylim(0,300)


######
#hours of the day
install.packages("chron")
library(chron)


df$Time4 <- as.POSIXct(df$Time, tz = "", format = "%I:%M %p", usetz = FALSE)

df$Time3 <- times(df$Time2)

df$Time2 <- format(strptime(df$Time, "%I:%M:%S %p"), "%H:%M:%S")

?chron

head(df)

time_runs <- df %>%
  group_by(weekday) %>%
  summarise(time = length(Time2)) %>%
  as.data.frame()

ggplot(data=df, aes(x=weekday, y=Time3)) +
  geom_point(stat="identity", color="#A6CEE3") +
  theme_bw() +
  coord_flip() +
  xlab("") +
  theme(legend.position="bottom",
        axis.title.x = element_blank(),
        axis.text.x = element_blank(),
        axis.ticks.x = element_blank()) +
  scale_x_discrete(limits = rev(levels(weekday_runs$weekday)))

#ylab("Percentage") +
#geom_text(aes(label=weekday), position=position_dodge(width=0.6),vjust=0.4, hjust=-0.1) +
#scale_fill_viridis_d(breaks = rev, direction = -1) +
# scale_fill_brewer(name="",
#                   breaks=c("disp"),
#                   labels=c("disp")) +
#scale_x_continuous(breaks=seq(1, 24, 1))

#ylim(0,400)

# PLOTS
weekday_runs_plot
weekday_runs_distance_plot
distances_time_plot
months_run









