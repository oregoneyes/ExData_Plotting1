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

# # plot 2
# 
# plot(red_elec$Time, as.numeric(red_elec$Global_active_power), type = 'l', xlab = '', ylab = 'Global Active Power (kilowatts)',
#      font = 4)
# 
# # plot 3
# plot(red_elec$Time, as.numeric(red_elec$Sub_metering_1), type = 'n', xlab = '', ylab = 'Energy sub metering')
# points(red_elec$Time, as.numeric(red_elec$Sub_metering_1), type = 'l')
# points(red_elec$Time, as.numeric(red_elec$Sub_metering_2), type = 'l', col = 'red')
# points(red_elec$Time, as.numeric(red_elec$Sub_metering_3), type = 'l', col = 'blue')
# legend('topright', legend = c('Submetering_1', 'Submetering_2', 'Submetering_3' ), lty = 1, col = c('black', 'red', 'blue'))     
# 
# # plot 4
# par(mfrow = c(2,2))
# plot(red_elec$Time, as.numeric(red_elec$Global_active_power), type = 'l', xlab = '', ylab = 'Global Active Power (kilowatts)',
#      font = 4)
# plot(red_elec$Time, as.numeric(red_elec$Voltage), type = 'l', xlab = 'datetime', ylab = 'Voltage',
#      font = 4)
# 
# plot(red_elec$Time, as.numeric(red_elec$Sub_metering_1), type = 'n', xlab = '', ylab = 'Energy sub metering')
# points(red_elec$Time, as.numeric(red_elec$Sub_metering_1), type = 'l')
# points(red_elec$Time, as.numeric(red_elec$Sub_metering_2), type = 'l', col = 'red')
# points(red_elec$Time, as.numeric(red_elec$Sub_metering_3), type = 'l', col = 'blue')
# legend('topright', legend = c('Submetering_1', 'Submetering_2', 'Submetering_3' ), lty = 1, col = c('black', 'red', 'blue'))     
# 
# plot(red_elec$Time, as.numeric(red_elec$Global_reactive_power), type = 'l', xlab = 'datetime', ylab = 'Gobal_reactive_power',
#      font = 4)
