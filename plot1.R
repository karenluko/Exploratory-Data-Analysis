energy_data <- read.csv("household_power_consumption.txt", na.strings="?", header=T, sep = ";", quote = "")

energy_data <- subset(energy_data, Date %in% c("1/2/2007","2/2/2007"))
library(tidyr)
energy_data<- unite(energy_data, Date_Time, c(Date,Time), sep = " ", remove=F)
energy_data$Date_Time <- as.POSIXct(energy_data$Date_Time, format= "%d/%m/%Y %H:%M:%S") #it won't work with strptime()

hist(energy_data$Global_active_power,ylim=c(0,1200), breaks= 15,col="red", main="Global Active Power", xlab= "Global Active Power (kilowatts)")

dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()
