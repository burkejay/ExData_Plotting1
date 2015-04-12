dir.create("temp.jay")
setwd("temp.jay")

download.file("http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip","temp.zip")
unzip("temp.zip")

t <- read.csv("household_power_consumption.txt",sep=";",stringsAsFactors=FALSE, na.strings="?")
t2 <- t[t$Date=="1/2/2007" | t$Date=="2/2/2007",]

t2$date_and_time <- paste(t2$Date,t2$Time)
t2$date_class <- strptime(t2$date_and_time,format = "%d/%m/%Y %H:%M:%S")

png("plot2.png", width = 480, height=480, units="px")
plot(t2$date_class,t2$Global_active_power, type = "l", ylab="Global Active Power (kilowatts)", xlab="")
dev.off()

file.copy("plot2.png","..")
setwd("..")
unlink("temp.jay", recursive= TRUE, force = TRUE)
