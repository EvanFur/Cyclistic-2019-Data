getwd()
setwd("C:\\Users\\evanf\\Documents\\Data Analysis\\case_study_bike_trips")
install.packages("tidyverse")
install.packages("lubridate")
install.packages("ggplot2")

library(tidyverse)
library(lubridate)
library(ggplot2)

q1_2019 <- read.csv("Divvy_Trips_2019_Q1.csv")
q2_2019 <- read_csv("Divvy_Trips_2019_Q2.csv")
q3_2019 <- read_csv("Divvy_Trips_2019_Q3.csv")
q4_2019 <- read_csv("Divvy_Trips_2019_Q4.csv")

colnames(q3_2019)
colnames(q4_2019)
colnames(q2_2019)
colnames(q1_2019)

## Change the column names so that the data can be merged later

q2_2019 <- rename(q2_2019
                  ,trip_id = "01 - Rental Details Rental ID"
                  ,start_time = "01 - Rental Details Local Start Time"
                  ,end_time = "01 - Rental Details Local End Time"
                  ,bikeid = "01 - Rental Details Bike ID"
                  ,tripduration = "01 - Rental Details Duration In Seconds Uncapped"
                  ,from_station_id = "03 - Rental Start Station ID"
                  ,from_station_name = "03 - Rental Start Station Name"
                  ,to_station_id = "02 - Rental End Station ID"
                  ,to_station_name = "02 - Rental End Station Name"
                  ,usertype = "User Type"
                  ,gender = "Member Gender"
                  ,birthyear = "05 - Member Details Member Birthday Year")

str(q1_2019)
str(q2_2019)
str(q3_2019)
str(q4_2019)

## Change the trip_id and bikeid to be characters

q4_2019 <-  mutate(q4_2019, trip_id = as.character(trip_id)
                   ,bikeid = as.character(bikeid)) 
q3_2019 <-  mutate(q3_2019, trip_id = as.character(trip_id)
                   ,bikeid = as.character(bikeid)) 
q2_2019 <-  mutate(q2_2019, trip_id = as.character(trip_id)
                   ,bikeid = as.character(bikeid))
q1_2019 <-  mutate(q1_2019, trip_id =  as.character(trip_id)
                   ,bikeid = as.character(bikeid))

## Change column types to match the other quarters

q1_2019 <- mutate(q1_2019, start_time = as.POSIXct(start_time))
q1_2019 <- mutate(q1_2019, end_time = as.POSIXct(start_time))
q1_2019 <- mutate(q1_2019, tripduration = as.numeric(tripduration))
q1_2019 <- na.omit(q1_2019)

## Combine all the quarters together

all_trips <- bind_rows(q1_2019, q2_2019, q3_2019, q4_2019)

## Remove the birthyear and gender columns as these aren't relevant

all_trips <- all_trips %>%  
  select(-c(birthyear, gender))

colnames(all_trips)
nrow(all_trips)
dim(all_trips)
head(all_trips)
str(all_trips)
summary(all_trips)

## make sure the usertypes are the same throughout the year

categories <- unique(all_trips$usertype)

## add date, day, month, year, day_of_week columns

all_trips$date <- as.Date(all_trips$start_time) 
all_trips$month <- format(as.Date(all_trips$date), "%m")
all_trips$day <- format(as.Date(all_trips$date), "%d")
all_trips$year <- format(as.Date(all_trips$date), "%Y")
all_trips$day_of_week <- format(as.Date(all_trips$date), "%A")

## make tripduration numeric

is.factor(all_trips$tripduration)
all_trips$tripduration <- as.numeric(as.character(all_trips$tripduration))
is.numeric(all_trips$tripduration)

## remove trips from "HQ" and trips that have negative run time

all_trips_v2 <- all_trips[!(all_trips$from_station_name
                            == "HQ QR" | all_trips$tripduration < 0),]

## remove NA 

all_trips_v2 <- na.omit(all_trips_v2)
aggregate(all_trips_v2$tripduration ~ all_trips_v2$usertype, FUN = mean)
aggregate(all_trips_v2$tripduration ~ all_trips_v2$usertype, FUN = median)
aggregate(all_trips_v2$tripduration ~ all_trips_v2$usertype, FUN = max)
aggregate(all_trips_v2$tripduration ~ all_trips_v2$usertype, FUN = min)

aggregate(all_trips_v2$tripduration ~ all_trips_v2$usertype + all_trips_v2$day_of_week, FUN = mean)

## order days of the week

all_trips_v2$day_of_week <- ordered(all_trips_v2$day_of_week
                                    , levels=c("Sunday"
                                               , "Monday"
                                               , "Tuesday"
                                               , "Wednesday"
                                               , "Thursday"
                                               , "Friday"
                                               , "Saturday"))

aggregate(all_trips_v2$tripduration ~ all_trips_v2$usertype + all_trips_v2$day_of_week, FUN = mean)

## create plots and remove scientific notation

all_trips_v2 %>%
  mutate(weekday = wday(start_time, label = TRUE)) %>% 
  group_by(usertype, weekday) %>% 
  summarise(number_of_rides = n(),
            average_duration = mean(tripduration)) %>% 
  arrange(usertype, weekday) %>% 
  ggplot(aes(x = weekday, y = number_of_rides, fill = usertype)) +
  geom_col(position = "dodge") +
  scale_y_continuous(labels = scales::number)

all_trips_v2 %>% 
  mutate(weekday = wday(start_time, label = TRUE)) %>% 
  group_by(usertype, weekday) %>% 
  summarise(number_of_rides = n()
            ,average_duration = mean(tripduration)) %>% 
  arrange(usertype, weekday)  %>% 
  ggplot(aes(x = weekday, y = average_duration, fill = usertype)) +
  geom_col(position = "dodge")

all_trips_v2 %>%
  mutate(month = month(start_time, label = TRUE)) %>% 
  group_by(usertype, month) %>% 
  summarise(number_of_rides = n(),
            average_duration = mean(tripduration)) %>% 
  arrange(usertype, month) %>% 
  ggplot(aes(x = month, y = number_of_rides, fill = usertype)) +
  geom_col(position = "dodge") +
  scale_y_continuous(labels = scales::number)




