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


In order to collate the data later on, I began by ensuring that each file used the same schema. I created 4 data frames, 1 for each quarter of 2019, and made sure that each of these data frames used the same schema. - This makes it seem like this worked flawlessly for me the first time. I promise you this was lots of trial and error -

I combined the 4 dataframes into 1 large data frame, and then refined that dataframe to remove any trips that were taken by cycistic themselves and any trips that had negative run time. 

After this I generated 2 visualisations:

## Number of Rides per Customer Type

![number_of_rides](https://github.com/EvanFur/Cyclistic-2019-Data/assets/148148604/cd17b1ad-efbb-4567-8bc3-f44287fcd547)

## Average Duration

![average_duration](https://github.com/EvanFur/Cyclistic-2019-Data/assets/148148604/94176f4c-b124-4091-b287-751085cba55b)




