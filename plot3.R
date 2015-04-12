dir.create("temp.jay")
setwd("temp.jay")

download.file("http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip","temp.zip")
unzip("temp.zip")

t <- read.csv("household_power_consumption.txt",sep=";",stringsAsFactors=FALSE, na.strings="?")
t2 <- t[t$Date=="1/2/2007" | t$Date=="2/2/2007",]
t2$date_and_time <- paste(t2$Date,t2$Time)
t2$date_class <- strptime(t2$date_and_time,format = "%d/%m/%Y %H:%M:%S")

png("plot3.png", width = 480, height=480, units="px")
plot(t2$date_class,t2$Sub_metering_1, type = "l", ylab="Energy sub metering")
lines(t2$date_class,t2$Sub_metering_2, col="red")
lines(t2$date_class,t2$Sub_metering_3, col="blue")
legend('topright', c("Sub_metering_1", "Sub_metering_2", "Sub_Metering_3"), lty=1, col=c("black", "red", "blue"))
dev.off()

file.copy("plot3.png","..")
setwd("..")
unlink("temp.jay", recursive= TRUE, force = TRUE)


