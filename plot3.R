## Assignment 1 of EDA
## use data household_power_consumption.txt
## This assignment uses data from the UC Irvine Machine Learning Repository
## start work from "Thu Nov 05 13:40:56 2015"

##read data
##missing values are coded as ?
##convert the Date and Time variables to Date/Time classes 
##subset data to "plotdata" 
household_power_consumption <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE, na.strings = "?")

x <- paste(household_power_consumption$Date, household_power_consumption$Time)
Date_Time <-strptime(x, "%d/%m/%Y %H:%M:%S")
household_power_consumption <- cbind(Date_Time, household_power_consumption)
datastart <- "2007-02-01 00:00:00"
dataend <- "2007-02-02 23:59:60"
attach(household_power_consumption)
dataplot <- subset(household_power_consumption, Date_Time >= datastart & Date_Time <= dataend, select =c(Date_Time, Global_active_power:Sub_metering_3))
detach(household_power_consumption)

##using data from the dates 2007-02-01 and 2007-02-02
##makeing plots
##save it to a PNG file with a width of 480 pixels and a height of 480 pixels
##Name each of the plot files as plot1.png, plot2.png, etc.
##Create a separate R code file
###plot3
png("plot3.png", width = 480, height = 480)
plot(dataplot$Date_Time, dataplot$Sub_metering_1, type = "l", xlab = "", ylab = "Engrgy sub metering")
legend("topright", cex = 0.75,legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd = c(0.01,1,0.5),col = c("black", "red", "blue"))
lines(dataplot$Date_Time, dataplot$Sub_metering_2, type = "l",col = ("red"))
lines(dataplot$Date_Time, dataplot$Sub_metering_3, type = "l",col = ("blue"))
dev.off()