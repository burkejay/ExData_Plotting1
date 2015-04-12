dir.create("temp.jay")
setwd("temp.jay")

download.file("http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip","temp.zip")
unzip("temp.zip")

t <- read.csv("household_power_consumption.txt",sep=";",stringsAsFactors=FALSE, na.strings="?")
t2 <- t[t$Date=="1/2/2007" | t$Date=="2/2/2007",]
t2$date_and_time <- paste(t2$Date,t2$Time)
t2$date_class <- strptime(t2$date_and_time,format = "%d/%m/%Y %H:%M:%S")

png("plot4.png", width = 480, height=480, units="px")
par(mfrow = c(2,2))
plot(t2$date_class,t2$Global_active_power, type = "l", ylab="Global Active Power", xlab="")
plot(t2$date_class,t2$Voltage, type = "l", ylab="Voltage", xlab="datetime")
plot(t2$date_class,t2$Sub_metering_1, type = "l", ylab="Energy sub metering", xlab="")
lines(t2$date_class,t2$Sub_metering_2, col="red")
lines(t2$date_class,t2$Sub_metering_2, col="blue")
legend('topright', c("Sub_metering_1", "Sub_metering_2", "Sub_Metering_3"), lty=1, col=c("black", "red", "blue"), bty="o")
plot(t2$date_class,t2$Global_reactive_power, type = "l", xlab = "datetime")
dev.off()

file.copy("plot4.png","..")
setwd("..")
unlink("temp.jay", recursive= TRUE, force = TRUE)
