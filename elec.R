library(tidyverse)
library(purrr)
library(readr)
library(tibble)
library(lubridate)


# read electric consumption data into elec variable

file <- "./household_power_consumption.txt"

elec <- read.csv(file, sep = ';')
elec <- tibble(elec)

# convert Date and Time to actual R date and time objects.



form <- '%d/%m/%Y'
elec$Date <- as.Date(elec$Date, format = form)



# filter for dates of interest

red_elec <- elec %>% filter(Date == '2007-02-01' | Date == '2007-02-02')

red_elec$Time <- paste(red_elec$Date, red_elec$Time)

x <- red_elec
x$Time <- strptime(x$Time, format = tim)

tim <- '%Y-%m-%d %H:%M:%S'
red_elec$Time <- strptime(red_elec$Time, format = tim)


# Plot 1

plot1 <- hist(as.numeric(red_elec$Global_active_power), main = 'Global Active Power', xlab = 'Global Active Power (kilowatts)',
                         ylab = 'Frequency', col = 'red')

# plot 2

plot(red_elec$Time, as.numeric(red_elec$Global_active_power), type = 'l')

     