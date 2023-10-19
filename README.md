# Cyclistic-2019-Data
#### Google Data Analytics Capstone Project

# Intro
In this project I will perform real-world tasks of a junior data analyst working at the fictional company, Cyclistic. I will follow the steps of the data analysis process: **Ask**, **Prepare**, **Process**, **Analyse**, **Share**, and **Act**.

# Goal
The goal of this analysis is to **understand how casual riders and annual members use Cyclistic bikes differently**. With this information the team can design a new marketing strategy to convert casual riders into annual members. 

## Ask 
- How do casual riders and annual members use cyclisitc differently
- What benefits would incentivise casual riders to buy annual memberships?
- Is there a difference in the type of bike used by casual vs. annual members?
- What is the peak time of year for bike use?

## Prepare
The data has been made available by Motivate International Inc. and is available [here.](https://divvy-tripdata.s3.amazonaws.com/index.html) The data has been organised into smaller time periods, however, I will aim to analyse an entire year in order to see seasonal trends in the data. The user license agreement is available to view [here.](https://divvybikes.com/data-license-agreement) 

The data will showcase a year of Cyclistic user activity an hopefully paint a clear picture of the differences between its users.

## Process 
The data was stored on an SSD and analysed using R Studio. I chose R studio because it was straight forward enough to install and has a pleasing user interface. I also chose to use R because I was analysing an entire year of data and I wanted to be able to use every piece of that data, rather than choosing only a small sample. R has the capability to both clean and visualise data which is yet another reason to choose it. 


In order to collate the data later on, I began by creating 4 data frames, 1 for each quarter of 2019, and made sure that each of these data frames used the same schema.
- This makes it seem like this worked flawlessly for me the first time. I promise you this was lots of trial and error -

After doing a lot of tidying up of the data, I combined the 4 dataframes into 1 large data frame, and then refined that dataframe to remove any trips that were taken by cycistic themselves and any trips that had negative run time. 

After this I generated 3 visualisations.

[You can check out my code here](https://github.com/EvanFur/Cyclistic-2019-Data/blob/main/case_study_bike_trips.R)

## Analyse

From Fig. 1 we can see that there is a large difference in usage during the week. When subsciber usage hits its peak, customer usage is at its lowest. This is likely due to subscribers using Cycclistic bikes for their work commute while customers are using it in their leisure time, i.e at the weekend. (This hypothesis is backed by the jump in customer usage at the weekends). With this in mind, Cyclistic could incentivise its "customers" to change to a subscription by offering a free-trial during the weekdays. 
We can see from Fig. 2 that there are similar usage trends for both user types throughout the year. This can be useful when creating targeted campaigns. For example the marketing budget would be best spent trying to convert casual users during the summer months whe they are most actve. 



## Fig. 1 - Number of Rides per Customer Type

![number_of_rides](https://github.com/EvanFur/Cyclistic-2019-Data/assets/148148604/cd17b1ad-efbb-4567-8bc3-f44287fcd547)

## Fig. 2 - Number of Rides Monthly Breakdown

![number_of_rides_monthly](https://github.com/EvanFur/Cyclistic-2019-Data/assets/148148604/4142ef86-6763-4934-b858-41ef17927deb)

## Fig. 3 - Average Duration

![average_duration](https://github.com/EvanFur/Cyclistic-2019-Data/assets/148148604/3c89d8a8-899d-4a23-a8f3-6c18489fc618)





