
dir.create("temp.jay")
setwd("temp.jay")

download.file("http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip","temp.zip")
unzip("temp.zip")

t <- read.csv("household_power_consumption.txt",sep=";",stringsAsFactors=FALSE, na.strings="?")
t2 <- t[t$Date=="1/2/2007" | t$Date=="2/2/2007",]

png("plot1.png", width = 480, height=480, units="px")
hist(t2$Global_active_power, col="red", main="Global Active Power", xlab= "Global Active Power (kilowatts)")
dev.off()

file.copy("plot1.png","..")
setwd("..")
unlink("temp.jay", recursive= TRUE, force = TRUE)