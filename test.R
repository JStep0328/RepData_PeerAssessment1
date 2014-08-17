#data
raw <- read.csv("activity.csv", na.strings="NA", colClasses=c("integer","Date","integer"))
data <- raw[!is.na(raw$steps), ]
total_steps <- aggregate(steps ~ date, data = data, sum, na.rm = T)
interval_steps <- aggregate(steps ~ interval, data = data, mean, na.rm = T)

#test
clean <- raw
for (i in 1:nrow(clean)){
    if (is.na(clean[i, ]$steps)) {
        clean[i,]$steps <- interval_steps[interval_steps$interval == clean[i,]$interval,]$steps
    }
}
head(clean)
tail(clean)

clean[1, ]$steps
clean[1,]$interval

raw[716,]
clean[716,]
#saving for later
is.na(raw[1,]$steps)
raw[2,]$interval
clean[clean[1,] == 1, ]
interval_steps[ interval == clean[i, ]$interal,]$steps
data$date
data[1,2]
weekdays(data[1,2])
if(weekdays(data[1,2]) %in% c("Saturday", "Sunday")) {"weekend"} else {"weekday"}

weekdays(data[1500,2])



data[1500,]

, levels = c("Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday")

data$day <- weekdays(data$date)
for (i in 1:nrow(data)){
    if(data[i,4] %in% c("Saturday", "Sunday"))
        {data$weekday[[i]] <- "weekend"}
            else {data$weekday[[i]] <- "weekday"}
}
data$weekday <- factor(data$weekday, levels = c("weekend", "weekday"))

data

#head(data)
#tail(data)
#weekdays(as.Date("2012-11-29"))  Thursday is a weekday, OK

View(data)

interval_stepsday <- aggregate(steps ~ interval + weekday, data, mean)
library(lattice)
xyplot(steps ~ interval | factor(weekday), data = interval_stepsday, aspect = 1/2, 
       type = "l")
str(interval_stepsday$day)
summary(interval_stepsday$day)
