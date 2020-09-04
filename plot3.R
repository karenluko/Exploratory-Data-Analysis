energy_data <- read.csv("household_power_consumption.txt", na.strings="?", header=T, sep = ";", quote = "")

energy_data <- subset(energy_data, Date %in% c("1/2/2007","2/2/2007"))
library(tidyr)
energy_data<- unite(energy_data, Date_Time, c(Date,Time), sep = " ", remove=F)
energy_data$Date_Time <- as.POSIXct(energy_data$Date_Time, format= "%d/%m/%Y %H:%M:%S") #it won't work with strptime()

par(mar=c(4,4,2,2))

plot(Sub_metering_1~Date_Time, energy_data, type="l",ylab="Global Active Power (kilowatts)", xlab="")
lines(Sub_metering_2~Date_Time,energy_data,type="l",col="red")
lines(Sub_metering_3~Date_Time,energy_data,type="l", col="blue")
legend(legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),"topright", col=c("black", "red", "blue"), lty=1, xjust = 0.5, yjust = 0.5)

dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()
